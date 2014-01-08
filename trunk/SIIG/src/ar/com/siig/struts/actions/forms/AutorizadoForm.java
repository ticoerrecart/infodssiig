package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.AutorizadoDTO;

public class AutorizadoForm extends ActionForm {

	private AutorizadoDTO autorizado;

	public AutorizadoForm() {
		autorizado = new AutorizadoDTO();
	}

	public AutorizadoDTO getAutorizado() {
		return autorizado;
	}

	public void setAutorizado(AutorizadoDTO autorizado) {
		this.autorizado = autorizado;
	}

}
