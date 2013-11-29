package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.AutorizacionDTO;

public class AutorizacionForm extends ActionForm {

	private AutorizacionDTO autorizacion;

	public AutorizacionForm() {
		autorizacion = new AutorizacionDTO();
	}

	public AutorizacionDTO getAutorizacion() {
		return autorizacion;
	}

	public void setAutorizacion(AutorizacionDTO autorizacion) {
		this.autorizacion = autorizacion;
	}

}
