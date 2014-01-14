package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.DenunciaDTO;
import ar.com.siig.struts.utils.Validator;

public class DenunciaForm extends ActionForm {

	private DenunciaDTO denunciaDTO;

	public DenunciaForm() {
		denunciaDTO = new DenunciaDTO();
	}

	public boolean validar(StringBuffer error) {
		return Validator.requerido(this.getDenunciaDTO().getNumeroDeDenuncia(),
				"Numero de Denuncia", error);
	}

	public DenunciaDTO getDenunciaDTO() {
		return denunciaDTO;
	}

	public void setDenunciaDTO(DenunciaDTO denunciaDTO) {
		this.denunciaDTO = denunciaDTO;
	}

}
