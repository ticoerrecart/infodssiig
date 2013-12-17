package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.EstablecimientoDTO;
import ar.com.siig.negocio.Establecimiento;
import ar.com.siig.struts.utils.Validator;

public class EstablecimientoForm extends ActionForm {
	private Establecimiento establecimiento;
	private EstablecimientoDTO establecimientoDTO;

	public EstablecimientoForm() {
		establecimiento = new Establecimiento();
		establecimientoDTO = new EstablecimientoDTO();
	}

	public boolean validar(StringBuffer error) {
		return Validator.requerido(this.getEstablecimientoDTO().getNombre(),
				"Nombre", error);
	}

	public Establecimiento getEstablecimiento() {
		return establecimiento;
	}

	public void setEstablecimiento(Establecimiento establecimiento) {
		this.establecimiento = establecimiento;
	}

	public EstablecimientoDTO getEstablecimientoDTO() {
		return establecimientoDTO;
	}

	public void setEstablecimientoDTO(EstablecimientoDTO establecimientoDTO) {
		this.establecimientoDTO = establecimientoDTO;
	}

}
