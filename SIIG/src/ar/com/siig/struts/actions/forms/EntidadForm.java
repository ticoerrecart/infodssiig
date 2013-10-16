package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.struts.utils.Validator;

public class EntidadForm extends ActionForm {

	private Entidad entidad;

	private Long idLocalidad;

	private String tipoEntidad;

	private String confirmacionEmail;

	private EntidadDTO entidadDTO;

	public EntidadForm() {
		this.entidad = new Entidad();
		this.entidadDTO = new EntidadDTO();
	}

	public Entidad getEntidad() {
		return entidad;
	}

	public void setEntidad(Entidad entidad) {
		this.entidad = entidad;
	}

	public Long getIdLocalidad() {
		return idLocalidad;
	}

	public void setIdLocalidad(Long idLocalidad) {
		this.idLocalidad = idLocalidad;
	}

	public String getTipoEntidad() {
		return tipoEntidad;
	}

	public void setTipoEntidad(String tipoEntidad) {
		this.tipoEntidad = tipoEntidad;
	}

	public String getConfirmacionEmail() {
		return confirmacionEmail;
	}

	public void setConfirmacionEmail(String confirmacionEmail) {
		this.confirmacionEmail = confirmacionEmail;
	}

	public EntidadDTO getEntidadDTO() {
		return entidadDTO;
	}

	public void setEntidadDTO(EntidadDTO entidadDTO) {
		this.entidadDTO = entidadDTO;
	}

}
