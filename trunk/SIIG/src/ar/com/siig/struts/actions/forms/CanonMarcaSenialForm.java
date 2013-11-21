package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.siig.negocio.CanonMarcaSenial;

public class CanonMarcaSenialForm extends ActionForm {

	private CanonMarcaSenial canonMarcaSenial;
	
	public CanonMarcaSenialForm(){
		
		canonMarcaSenial = new CanonMarcaSenial();
	}

	public CanonMarcaSenial getCanonMarcaSenial() {
		return canonMarcaSenial;
	}

	public void setCanonMarcaSenial(CanonMarcaSenial canonMarcaSenial) {
		this.canonMarcaSenial = canonMarcaSenial;
	}
}
