package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import ar.com.siig.dto.MarcaSenialDTO;

public class MarcaSenialForm extends ActionForm {

	private MarcaSenialDTO marcaSenial;
	
	private FormFile imagen;

	private String nombreImagen;
	
	public MarcaSenialForm(){
		
		marcaSenial = new MarcaSenialDTO();
	}
	
	public MarcaSenialDTO getMarcaSenial() {
		return marcaSenial;
	}

	public void setMarcaSenial(MarcaSenialDTO marcaSenial) {
		this.marcaSenial = marcaSenial;
	}

	public FormFile getImagen() {
		return imagen;
	}

	public void setImagen(FormFile imagen) {
		this.imagen = imagen;
	}

	public String getNombreImagen() {
		return nombreImagen;
	}

	public void setNombreImagen(String nombreImagen) {
		this.nombreImagen = nombreImagen;
	}
}
