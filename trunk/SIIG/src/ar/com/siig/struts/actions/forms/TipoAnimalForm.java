package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.TipoAnimalDTO;

public class TipoAnimalForm extends ActionForm {

	private TipoAnimalDTO tipoAnimal;

	public TipoAnimalForm() {
		tipoAnimal = new TipoAnimalDTO();
	}

	public TipoAnimalDTO getTipoAnimal() {
		return tipoAnimal;
	}

	public void setTipoAnimal(TipoAnimalDTO tipoAnimal) {
		this.tipoAnimal = tipoAnimal;
	}

}
