package ar.com.siig.fachada;

import ar.com.siig.dao.LoginDAO;
import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.negocio.Usuario;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.providers.ProviderDTO;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class LoginFachada{

	private LoginDAO loginDAO;

	public LoginFachada() {
	}

	public LoginFachada(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}

	public UsuarioDTO login(String usuario, String password) throws NegocioException {

		Usuario usr = loginDAO.login(usuario, password);
		UsuarioDTO usrDTO = ProviderDTO.getUsuarioDTO(usr);
			
		return usrDTO;	
	}

	public Usuario getUsuario(Long id){

		return loginDAO.getUsuario(id);
	}
}
