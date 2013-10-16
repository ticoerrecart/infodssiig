package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import ar.com.siig.dao.LocalidadDAO;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class LocalidadFachada {

	private LocalidadDAO localidadDAO;

	public LocalidadFachada() {
	}

	public LocalidadFachada(LocalidadDAO laLocalidaDAO) {
		this.localidadDAO = laLocalidaDAO;
	}

	public List<Localidad> getLocalidades(){

		return localidadDAO.getLocalidades();	
	}

	public Localidad getLocalidadPorId(Long id){
		return localidadDAO.getLocalidadPorId(id);
	}
	
	public boolean existeLocalidad(LocalidadDTO localidad) {
		return localidadDAO.existeLocalidad(localidad.getNombre(),localidad.getId());
	}

	public void altaLocalidad(LocalidadDTO localidadDTO) throws NegocioException {

		localidadDAO.alta_modficacion_Localidad(ProviderDominio.getLocalidad(localidadDTO));	
	}
	
	public List<LocalidadDTO> getLocalidadesDTO(){

		List<LocalidadDTO> localidadesDTO = new ArrayList<LocalidadDTO>();
		List<Localidad> localidades = localidadDAO.getLocalidades();
		
		for (Localidad localidad : localidades) {
			localidadesDTO.add(ProviderDTO.getLocalidadDTO(localidad));
		}
		
		return localidadesDTO;		
	}	
	
	public LocalidadDTO getLocalidadDTOPorId(Long id){

		Localidad localidad = localidadDAO.getLocalidadPorId(id);	
		return ProviderDTO.getLocalidadDTO(localidad);			
	}
	
	public void modificacionLocalidad(LocalidadDTO localidadDTO) throws NegocioException{
		
		Localidad localidad = localidadDAO.getLocalidadPorId(localidadDTO.getId());	
		localidadDAO.alta_modficacion_Localidad(ProviderDominio.getLocalidad(localidad,localidadDTO));
	}	
}
