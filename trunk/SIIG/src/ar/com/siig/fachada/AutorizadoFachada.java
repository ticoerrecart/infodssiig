package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.AutorizadoDAO;
import ar.com.siig.dto.AutorizadoDTO;
import ar.com.siig.negocio.Autorizado;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class AutorizadoFachada {
	private AutorizadoDAO autorizadoDAO;

	public AutorizadoFachada() {

	}

	public AutorizadoFachada(AutorizadoDAO autorizadoDAO) {
		this.autorizadoDAO = autorizadoDAO;
	}

	public List<Autorizado> getAutorizados() {
		return autorizadoDAO.getAutorizados();
	}

	public List<AutorizadoDTO> getAutorizadosDTO() {
		List<AutorizadoDTO> autorizadosDTO = new ArrayList<AutorizadoDTO>();
		List<Autorizado> autorizados = this.getAutorizados();
		for (Autorizado autorizado : autorizados) {
			autorizadosDTO.add(ProviderDTO.getAutorizadoDTO(autorizado));
		}

		return autorizadosDTO;

	}

	public AutorizadoDTO getAutorizadoDTO(Long id) {
		Autorizado autorizado = autorizadoDAO.getAutorizado(id);
		AutorizadoDTO autorizadoDTO = ProviderDTO.getAutorizadoDTO(autorizado);
		return autorizadoDTO;
	}

	public boolean existeAutorizado(String nombre, Integer dni, Long id) {
		return autorizadoDAO.existeAutorizado(nombre, dni, id);
	}

	public void altaAutorizado(AutorizadoDTO autorizadoDTO)
			throws NegocioException {
		Autorizado autorizado = ProviderDominio.getAutorizado(autorizadoDTO);
		autorizadoDAO.altaAutorizado(autorizado);
	}

	public void modificacionAutorizado(AutorizadoDTO autorizadoDTO)
			throws NegocioException {
		Autorizado autorizado = autorizadoDAO.getAutorizado(autorizadoDTO
				.getId());
		autorizado.setNombre(autorizadoDTO.getNombre());
		autorizado.setDni(autorizadoDTO.getDni());
		autorizadoDAO.altaAutorizado(autorizado);
	}
}
