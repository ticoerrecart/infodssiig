package ar.com.siig.struts.actions.forms;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.GuiaDTO;

public class GuiaForm extends ActionForm {

	private GuiaDTO guia;
	
	public GuiaForm(){
		
		guia = new GuiaDTO();
	}

	public GuiaDTO getGuia() {
		return guia;
	}

	public void setGuia(GuiaDTO guia) {
		this.guia = guia;
	}	
}
