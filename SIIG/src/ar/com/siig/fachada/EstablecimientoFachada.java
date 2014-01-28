package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.EntidadDAO;
import ar.com.siig.dao.EstablecimientoDAO;
import ar.com.siig.dao.LocalidadDAO;
import ar.com.siig.dto.EstablecimientoDTO;
import ar.com.siig.enums.SuperCategoriaTipoAnimal;
import ar.com.siig.enums.TipoMarcaSenial;
import ar.com.siig.negocio.AnimalEnEstablecimiento;
import ar.com.siig.negocio.Establecimiento;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.ProductorEnEstablecimiento;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;
import ar.com.siig.utils.MyLogger;

@Transactional(rollbackFor = { Throwable.class })
public class EstablecimientoFachada {

	private EstablecimientoDAO establecimientoDAO;
	private LocalidadDAO localidadDAO;
	private EntidadDAO entidadDAO;

	public EstablecimientoFachada() {
	}

	public EstablecimientoFachada(EstablecimientoDAO elEstablecimientoDAO,
			LocalidadDAO laLocalidadDAO, EntidadDAO pEntidadDAO) {
		
		this.establecimientoDAO = elEstablecimientoDAO;
		this.localidadDAO = laLocalidadDAO;
		this.entidadDAO = pEntidadDAO;
	}

	public List<Establecimiento> getEstablecimientos() {
		return establecimientoDAO.getEstablecimientos();
	}

	public Establecimiento getEstablecimientoPorId(Long id) {
		return establecimientoDAO.getEstablecimientoPorId(id);
	}

	public boolean existeEstablecimiento(EstablecimientoDTO establecimiento) {

		return establecimientoDAO.existeEstablecimiento(
				establecimiento.getNombre(), establecimiento.getId(),
				establecimiento.getLocalidadDTO().getId());
	}

	public void altaEstablecimiento(EstablecimientoDTO establecimientoDTO)
			throws NegocioException {
		Localidad localidad = localidadDAO.getLocalidadPorId(establecimientoDTO
				.getLocalidadDTO().getId());
		establecimientoDAO.alta_modficacion_Establecimiento(ProviderDominio
				.getEstablecimiento(establecimientoDTO, localidad));
	}

	public List<EstablecimientoDTO> getEstablecimientosDTO() {
		List<EstablecimientoDTO> establecimientosDTO = new ArrayList<EstablecimientoDTO>();
		List<Establecimiento> establecimientos = establecimientoDAO
				.getEstablecimientos();
		for (Establecimiento establecimiento : establecimientos) {
			establecimientosDTO.add(ProviderDTO
					.getEstablecimientoDTO(establecimiento));
		}
		return establecimientosDTO;
	}

	public EstablecimientoDTO getEstablecimientoDTOPorId(Long id) {
		Establecimiento establecimiento = establecimientoDAO
				.getEstablecimientoPorId(id);
		return ProviderDTO.getEstablecimientoDTO(establecimiento);
	}

	
	
	public List<EstablecimientoDTO> getEstablecimientosDTODeLocalidad(Long idLocalidad)
			throws NegocioException {
		try {
			List<EstablecimientoDTO> establecimientosDTO = new ArrayList<EstablecimientoDTO>();
			List<Establecimiento> establecimientos = establecimientoDAO
					.getEstablecimientosDeLocalidad(idLocalidad);

			for (Establecimiento establecimiento : establecimientos) {
				establecimientosDTO.add(ProviderDTO.getEstablecimientoDTO(establecimiento));
			}
			return establecimientosDTO;

		} catch (Throwable t) {
			MyLogger.logError(t);
			throw new NegocioException("Error Inesperado");
		}
	}
	
	public void modificacionEstablecimiento(
			EstablecimientoDTO establecimientoDTO) throws NegocioException {

		Establecimiento establecimiento = establecimientoDAO
				.getEstablecimientoPorId(establecimientoDTO.getId());
		Localidad localidad = localidadDAO.getLocalidadPorId(establecimientoDTO
				.getLocalidadDTO().getId());
		establecimientoDAO.alta_modficacion_Establecimiento(ProviderDominio
				.getEstablecimiento(establecimientoDTO,establecimiento, localidad));
	}

	public List<EstablecimientoDTO> getEstablecimientosDTODeProductor(Long idProductor){
		
		Productor productor = entidadDAO.getProductor(idProductor); 
		List<EstablecimientoDTO> listaEstablecimientos = new ArrayList<EstablecimientoDTO>();
		
		for (ProductorEnEstablecimiento prodEnEst : productor.getProductorEnEstablecimiento()) {
			listaEstablecimientos.add(ProviderDTO.getEstablecimientoDTO(prodEnEst.getEstablecimiento()));			
		}
		
		return listaEstablecimientos;
	}
	
	public List<EstablecimientoDTO> getEstablecimientosDTODeProductor2(Long idProductor, String tipo){
		
		Productor productor = entidadDAO.getProductor(idProductor); 
		List<EstablecimientoDTO> listaEstablecimientos = new ArrayList<EstablecimientoDTO>();
		
		for (ProductorEnEstablecimiento prodEnEst : productor.getProductorEnEstablecimiento()) {
			listaEstablecimientos.add(ProviderDTO.getEstablecimientoDTO(prodEnEst.getEstablecimiento()));						
		}
				
		return listaEstablecimientos;
	}
	
	public boolean validarCantAnimalesEnEstablecimiento(Long idEstablecimiento, Long idProductor, Long idTipoAnimal, int cantidad){
		
		Productor productor = entidadDAO.getProductor(idProductor); 
		
		for (ProductorEnEstablecimiento prodEnEst : productor.getProductorEnEstablecimiento()) {
			
			if(prodEnEst.getEstablecimiento().getId().equals(idEstablecimiento)){
				
				for (AnimalEnEstablecimiento animEnEst : prodEnEst.getAnimalesEnEstablecimiento()) {
					
					if(animEnEst.getTipoAnimal().getId().equals(idTipoAnimal)){
						return (animEnEst.getStock()>= cantidad);
					}
				}
			}
		}
		return false;
	}
}
