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
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;
import ar.com.siig.utils.Fecha;

@Transactional(rollbackFor = { Throwable.class })
public class GuiaFachada {

	private GuiaDAO guiaDAO;
	private EntidadDAO entidadDAO;
	private EstablecimientoDAO establecimientoDAO;
	private TipoAnimalDAO tipoAnimalDAO;
	
	public GuiaFachada(){}
	
	public GuiaFachada(GuiaDAO pGuiaDAO, EntidadDAO pEntidadDAO, EstablecimientoDAO pEstablecimientoDAO, TipoAnimalDAO pTipoAnimalDAO){
		
		this.guiaDAO = pGuiaDAO;
		this.entidadDAO = pEntidadDAO;
		this.establecimientoDAO = pEstablecimientoDAO;
		this.tipoAnimalDAO = pTipoAnimalDAO;
	}
	
	public boolean existeGuia(long nroGuia) {
		return guiaDAO.existeGuia(nroGuia);
	}
	
	public void altaLegalizacionGuia(GuiaDTO guiaDTO){
		
		Guia guia;
		Productor productor = entidadDAO.getProductor(guiaDTO.getProductor().getId());
		if(guiaDTO.getMarcaSenial().getTipo().equals(TipoMarcaSenial.Marca.getName())){
			guia = ProviderDominio.getGuiaLegalizada(guiaDTO,productor.getUltimaMarca(),productor,null);
		}else{
			guia = ProviderDominio.getGuiaLegalizada(guiaDTO,null,productor,productor.getUltimaSenial());
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
			listaGuias.add(guiaDAO.recuperarGuia(guiaDTO.getId()));
		}
		BoletaDeposito boleta = ProviderDominio.getBoletaDepositoParaGuias(boletaDTO,listaGuias,productor);
		
		//Seteo la boleta generada en el productor
		productor.getBoletasDeposito().add(boleta);
		
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
	
	public void registrarPagoBoleta(Long idBoleta, String fechaPago){
		
		BoletaDeposito boleta = guiaDAO.recuperarBoleta(idBoleta);
		boleta.setFechaPago(Fecha
				.stringDDMMAAAAToUtilDate(fechaPago));
	}
}
