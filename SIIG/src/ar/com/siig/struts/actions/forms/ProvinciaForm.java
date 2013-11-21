package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.ProvinciaDTO;
import ar.com.siig.struts.utils.Validator;

public class ProvinciaForm extends ActionForm {

	private ProvinciaDTO provinciaDTO;

	public ProvinciaForm() {

		provinciaDTO = new ProvinciaDTO();
	}

	public boolean validar(StringBuffer error) {
		return Validator.requerido(this.getProvinciaDTO().getNombre(),
				"Nombre", error);
	}

	public ProvinciaDTO getProvinciaDTO() {
		return provinciaDTO;
	}

	public void setProvinciaDTO(ProvinciaDTO provinciaDTO) {
		this.provinciaDTO = provinciaDTO;
	}

}
