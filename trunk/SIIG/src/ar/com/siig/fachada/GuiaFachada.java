package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.EntidadDAO;
import ar.com.siig.dao.EstablecimientoDAO;
import ar.com.siig.dao.GuiaDAO;
import ar.com.siig.dao.TipoAnimalDAO;
import ar.com.siig.dao.UsuarioDAO;
import ar.com.siig.dto.BoletaDepositoDTO;
import ar.com.siig.dto.GuiaDTO;
import ar.com.siig.enums.TipoEstadoGuia;
import ar.com.siig.enums.TipoFinalidad;
import ar.com.siig.enums.TipoMarcaSenial;
import ar.com.siig.negocio.AnimalEnEstablecimiento;
import ar.com.siig.negocio.BoletaDeposito;
import ar.com.siig.negocio.Establecimiento;
import ar.com.siig.negocio.Guia;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.ProductorEnEstablecimiento;
import ar.com.siig.negocio.TipoAnimal;
import ar.com.siig.negocio.Usuario;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;
import ar.com.siig.utils.Fecha;

@Transactional(rollbackFor = { Throwable.class })
public class GuiaFachada {

	private GuiaDAO guiaDAO;
	private EntidadDAO entidadDAO;
	private EstablecimientoDAO establecimientoDAO;
	private TipoAnimalDAO tipoAnimalDAO;
	private UsuarioDAO usuarioDAO;
	private PeriodoFachada periodoFachada;
	
	public GuiaFachada(){}
	
	public GuiaFachada(GuiaDAO pGuiaDAO, EntidadDAO pEntidadDAO, EstablecimientoDAO pEstablecimientoDAO, 
						TipoAnimalDAO pTipoAnimalDAO, UsuarioDAO pUsuarioDAO){
		
		this.guiaDAO = pGuiaDAO;
		this.entidadDAO = pEntidadDAO;
		this.establecimientoDAO = pEstablecimientoDAO;
		this.tipoAnimalDAO = pTipoAnimalDAO;
		this.usuarioDAO = pUsuarioDAO;
	}
	
	public void setPeriodoFachada(PeriodoFachada periodoFachada) {
		this.periodoFachada = periodoFachada;
	}

	public boolean existeGuia(long nroGuia) {
		return guiaDAO.existeGuia(nroGuia);
	}
	
	public void altaLegalizacionGuia(GuiaDTO guiaDTO){
		
		Guia guia;
		Productor productor = entidadDAO.getProductor(guiaDTO.getProductor().getId());
		Usuario agenteFirmante = usuarioDAO.getUsuario(guiaDTO.getAgenteFirmante().getId()); 
		if(guiaDTO.getMarcaSenial().getTipo().equals(TipoMarcaSenial.Marca.getName())){
			guia = ProviderDominio.getGuiaLegalizada(guiaDTO,productor.getUltimaMarca(),productor,null,agenteFirmante);
		}else{
			guia = ProviderDominio.getGuiaLegalizada(guiaDTO,null,productor,productor.getUltimaSenial(),agenteFirmante);
		}
		
		guiaDAO.altaLegalizacionGuia(guia);
	}
	
	public void altaDevolucionGuia(GuiaDTO guiaDTO){
		
		Guia guia = this.recuperarGuia(guiaDTO.getId());
		Establecimiento establecimientoOrigen = establecimientoDAO.getEstablecimientoPorId(
													guiaDTO.getEstablecimientoOrigen().getId()) ;
		Establecimiento establecimientoDestino = establecimientoDAO.getEstablecimientoPorId(
				guiaDTO.getEstablecimientoDestino().getId()) ;
		
		TipoAnimal tipoAnimal = tipoAnimalDAO.getTipoAnimal(guiaDTO.getTipoAnimal().getId());
		
		ProviderDominio.getGuiaDevuelta(guia,guiaDTO,establecimientoOrigen, establecimientoDestino, tipoAnimal);
		
		actualizarCantAnimalesEnEstablecimiento(establecimientoOrigen.getId(),guiaDTO.getProductor().getId(),
												tipoAnimal.getId(),guiaDTO.getCantidad());
	}
	
	private void actualizarCantAnimalesEnEstablecimiento(Long idEstablecimiento, Long idProductor, Long idTipoAnimal, int cantidad){
		
		Productor productor = entidadDAO.getProductor(idProductor); 
		
		for (ProductorEnEstablecimiento prodEnEst : productor.getProductorEnEstablecimiento()) {
			
			if(prodEnEst.getEstablecimiento().getId().equals(idEstablecimiento)){
				
				for (AnimalEnEstablecimiento animEnEst : prodEnEst.getAnimalesEnEstablecimiento()) {
					
					if(animEnEst.getTipoAnimal().getId().equals(idTipoAnimal)){
						animEnEst.setStock(animEnEst.getStock() - cantidad);
					}
				}
			}
		}
	}	
	
	public List<Guia> recuperarLegalizacionGuias(Long idProductor, String periodo){
		
		//return guiaDAO.recuperarLegalizacionGuias(idProductor,periodo);
		return guiaDAO.recuperarGuias(idProductor,periodo,TipoEstadoGuia.LEGALIZADA,false);		
	}

	
	/*OJO IMPAGAS O PAGAS SE REFIERE A QUE SE LE GENERO LA BOLETA NO QUE LA HAYA CANCELADO*/
	public List<Guia> recuperarGuiasDevueltasImpagas(Long idProductor, String periodo){
		return guiaDAO.recuperarGuias(idProductor,periodo,TipoEstadoGuia.DEVUELTA,false);
	}

	public List<GuiaDTO> recuperarGuiasDevueltasImpagasDTO(Long idProductor, String periodo){
		List<Guia> lista = guiaDAO.recuperarGuias(idProductor,periodo,TipoEstadoGuia.DEVUELTA,false);
		List<GuiaDTO> listaDTO = new ArrayList<GuiaDTO>();
		for (Guia guia : lista) {
			listaDTO.add(ProviderDTO.getGuiaDTO(guia));
		}

		return listaDTO;
	}	
	
	public List<Guia> recuperarGuiasDevueltas(Long idProductor, String periodo){
		List<Guia> list = new ArrayList<Guia>();
		list.addAll(guiaDAO.recuperarGuias(idProductor,periodo,TipoEstadoGuia.DEVUELTA,false));
		list.addAll(guiaDAO.recuperarGuias(idProductor,periodo,TipoEstadoGuia.DEVUELTA,true));
		return list;
	}	

	public List<Guia> recuperarGuiasCanceladas(Long idProductor, String periodo){
		return guiaDAO.recuperarGuiasCanceladas(idProductor,periodo);
	}
	
	
	public Guia recuperarGuia(Long idGuia){
		
		return guiaDAO.recuperarGuia(idGuia);
	}
	
	public GuiaDTO recuperarGuiaDTO(Long idGuia){
		
		Guia guia = guiaDAO.recuperarGuia(idGuia);
		return ProviderDTO.getGuiaDTO(guia);
	}
	
	public List<TipoFinalidad> recuperarFinalidades(){
		return Arrays.asList(TipoFinalidad.values());
	}
	
	public void generarBoletaGuias(BoletaDepositoDTO boletaDTO, List<GuiaDTO> listaGuiasDTO){
		
		Productor productor = entidadDAO.getProductor(boletaDTO.getProductor().getId());
		List<Guia> listaGuias = new ArrayList<Guia>();
		for (GuiaDTO guiaDTO : listaGuiasDTO) {
			Guia guia = guiaDAO.recuperarGuia(guiaDTO.getId());
			guia.setInteres(guiaDTO.getInteres());//Seteo el interes que se pudo haber generado en cada guia.
			listaGuias.add(guia);
		}

		boletaDTO.setFechaGeneracion(Fecha.getFechaDDMMAAAASlash(
				Fecha.dateToStringDDMMAAAA(Fecha.getFechaHoy())));
		
		BoletaDeposito boleta = ProviderDominio.getBoletaDepositoParaGuias(boletaDTO,listaGuias,productor);
		
		//Seteo la boleta generada en el productor
		productor.getBoletasDeposito().add(boleta);
		
		//Actualizo el saldo de la cuenta corriente del productor, con lo que use en la boleta de pago 
		productor.setSaldoCuentaCorriente(productor.getSaldoCuentaCorriente()-boletaDTO.getDebitoCreditoUsado());
		
		//Seteo la boleta generada en cada una de las guias que componen la boleta		
		for (Guia guia : listaGuias) {
			guia.setBoletaDeposito(boleta);
		}		
	}	
	
	public List<BoletaDeposito> recuperarBoletasImpagas(Long idProductor){
		
		return guiaDAO.recuperarBoletasImpagas(idProductor);
	}
	
	public BoletaDeposito recuperarBoleta(Long idBoleta){
		
		return guiaDAO.recuperarBoleta(idBoleta);
	}
	
	public double registrarPagoBoleta(Long idBoleta, String pFechaPago){
		
		BoletaDeposito boleta = guiaDAO.recuperarBoleta(idBoleta);
		Productor productor = entidadDAO.getProductor(boleta.getProductor().getId());
		Date fechaPago = Fecha.stringDDMMAAAAToUtilDate(pFechaPago);
		double montoInteresDiferencia = 0.00;
		
		for (Guia guia : boleta.getGuias()) {
			
			String fechaTransito = Fecha.getFechaDDMMAAAASlash(Fecha.dateToStringDDMMAAAA(guia.getFechaTransito()));
			
			double interes = periodoFachada.calcularInteres(pFechaPago, fechaTransito, guia.getPeriodo());
			
			double montoInteresReal = guia.getMonto()*interes;
			
			montoInteresDiferencia = montoInteresDiferencia + guia.getMontoInteres()-montoInteresReal;
		}
		
		boleta.setFechaPago(fechaPago);
		productor.setSaldoCuentaCorriente(productor.getSaldoCuentaCorriente()+montoInteresDiferencia);
		
		if(montoInteresDiferencia < 0){
			boleta.setDebitoGeneradoPorPagoAtrasado(montoInteresDiferencia);
		}
		if(montoInteresDiferencia > 0){
			boleta.setCreditoGeneradoPorPagoAdelantado(montoInteresDiferencia);
		}
		
		return montoInteresDiferencia;
	}
	
	public List<BoletaDeposito> recuperarBoletas(Long idProductor){
		
		return guiaDAO.recuperarBoletas(idProductor);
	}	
}
