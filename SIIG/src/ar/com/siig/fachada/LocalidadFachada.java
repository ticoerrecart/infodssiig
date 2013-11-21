package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.LocalidadDAO;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.dto.ProvinciaDTO;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.Provincia;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;
import ar.com.siig.utils.MyLogger;

@Transactional(rollbackFor = { Throwable.class })
public class LocalidadFachada {

	private LocalidadDAO localidadDAO;

	public LocalidadFachada() {
	}

	public LocalidadFachada(LocalidadDAO laLocalidaDAO) {
		this.localidadDAO = laLocalidaDAO;
	}

	public List<Localidad> getLocalidades() {

		return localidadDAO.getLocalidades();
	}

	public Localidad getLocalidadPorId(Long id) {
		return localidadDAO.getLocalidadPorId(id);
	}

	public boolean existeLocalidad(LocalidadDTO localidad) {

		return localidadDAO.existeLocalidad(localidad.getNombre(),
				localidad.getId(), localidad.getProvinciaDTO().getId());
	}

	public void altaLocalidad(LocalidadDTO localidadDTO)
			throws NegocioException {

		Provincia provincia = localidadDAO.getProvinciaPorId(localidadDTO
				.getProvinciaDTO().getId());
		localidadDAO.alta_modficacion_Localidad(ProviderDominio.getLocalidad(
				localidadDTO, provincia));
	}

	public List<LocalidadDTO> getLocalidadesDTO() {

		List<LocalidadDTO> localidadesDTO = new ArrayList<LocalidadDTO>();
		List<Localidad> localidades = localidadDAO.getLocalidades();

		for (Localidad localidad : localidades) {
			localidadesDTO.add(ProviderDTO.getLocalidadDTO(localidad));
		}

		return localidadesDTO;
	}

	public LocalidadDTO getLocalidadDTOPorId(Long id) {

		Localidad localidad = localidadDAO.getLocalidadPorId(id);
		return ProviderDTO.getLocalidadDTO(localidad);
	}

	public void modificacionLocalidad(LocalidadDTO localidadDTO)
			throws NegocioException {

		Localidad localidad = localidadDAO.getLocalidadPorId(localidadDTO
				.getId());
		Provincia provincia = localidadDAO.getProvinciaPorId(localidadDTO
				.getProvinciaDTO().getId());
		localidadDAO.alta_modficacion_Localidad(ProviderDominio.getLocalidad(
				localidadDTO, localidad, provincia));
	}

	public boolean existeProvincia(ProvinciaDTO provincia) {

		return localidadDAO.existeProvincia(provincia.getNombre(),
				provincia.getId());
	}

	public void altaProvincia(ProvinciaDTO provinciaDTO)
			throws NegocioException {

		localidadDAO.alta_modficacion_Provincia(ProviderDominio
				.getProvincia(provinciaDTO));
	}

	public List<ProvinciaDTO> getProvinciasDTO() {

		List<ProvinciaDTO> provinciasDTO = new ArrayList<ProvinciaDTO>();
		List<Provincia> provincias = localidadDAO.getProvincias();

		for (Provincia provincia : provincias) {
			provinciasDTO.add(ProviderDTO.getProvinciaDTO(provincia));
		}

		return provinciasDTO;
	}

	public ProvinciaDTO getProvinciaDTOPorId(Long id) {

		Provincia provincia = localidadDAO.getProvinciaPorId(id);
		return ProviderDTO.getProvinciaDTO(provincia);
	}

	public void modificacionProvincia(ProvinciaDTO provinciaDTO)
			throws NegocioException {

		Provincia provincia = localidadDAO.getProvinciaPorId(provinciaDTO
				.getId());
		localidadDAO.alta_modficacion_Provincia(ProviderDominio.getProvincia(
				provincia, provinciaDTO));
	}

	public List<LocalidadDTO> getLocalidadesDTODeProvincia(Long idProvincia)
			throws NegocioException {
		try {
			List<LocalidadDTO> localidadesDTO = new ArrayList<LocalidadDTO>();
			List<Localidad> localidades = localidadDAO
					.getLocalidadesDeProvincia(idProvincia);

			for (Localidad localidad : localidades) {
				localidadesDTO.add(ProviderDTO.getLocalidadDTO(localidad));
			}
			return localidadesDTO;

		} catch (Throwable t) {
			MyLogger.logError(t);
			throw new NegocioException("Error Inesperado");
		}
	}

}
