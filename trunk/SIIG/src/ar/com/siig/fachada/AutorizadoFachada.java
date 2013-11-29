package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.AutorizadoDAO;
import ar.com.siig.dto.AutorizadoDTO;
import ar.com.siig.negocio.Autorizado;
import ar.com.siig.providers.ProviderDTO;

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
	
	public List<AutorizadoDTO> getAutorizadosDTO(){
		List<AutorizadoDTO> autorizadosDTO = new ArrayList<AutorizadoDTO>();
		List<Autorizado> autorizados = this.getAutorizados();
		for (Autorizado autorizado : autorizados) {
			autorizadosDTO.add(ProviderDTO.getAutorizadoDTO(autorizado));
		}
		
		return autorizadosDTO;
		
	}

}
