package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.EstablecimientoDAO;
import ar.com.siig.dao.LocalidadDAO;
import ar.com.siig.dto.EstablecimientoDTO;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.negocio.Establecimiento;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;
import ar.com.siig.utils.MyLogger;

@Transactional(rollbackFor = { Throwable.class })
public class EstablecimientoFachada {

	private EstablecimientoDAO establecimientoDAO;
	private LocalidadDAO localidadDAO;

	public EstablecimientoFachada() {
	}

	public EstablecimientoFachada(EstablecimientoDAO elEstablecimientoDAO,
			LocalidadDAO laLocalidadDAO) {
		this.establecimientoDAO = elEstablecimientoDAO;
		this.localidadDAO = laLocalidadDAO;
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

}
