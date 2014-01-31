package ar.com.siig.struts.actions.forms;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.BoletaDepositoDTO;
import ar.com.siig.dto.GuiaDTO;

public class BoletaDepositoForm extends ActionForm {

	private BoletaDepositoDTO boletaDeposito;
	private List<GuiaDTO> listaGuias;
	
	public BoletaDepositoForm(){
		
		boletaDeposito = new BoletaDepositoDTO();
		
		listaGuias = (List<GuiaDTO>) LazyList.decorate(new ArrayList(),
				  FactoryUtils.instantiateFactory(GuiaDTO.class));
	}	
	

	public BoletaDepositoDTO getBoletaDeposito() {
		return boletaDeposito;
	}
	
	public void setBoletaDeposito(BoletaDepositoDTO boletaDeposito) {
		this.boletaDeposito = boletaDeposito;
	}

	public List<GuiaDTO> getListaGuias() {
		return listaGuias;
	}

	public void setListaGuias(List<GuiaDTO> listaGuias) {
		this.listaGuias = listaGuias;
	}
	
	public void normalizarListaGuias() {

		List<GuiaDTO> listaEliminar = new ArrayList<GuiaDTO>();
		for (GuiaDTO guia : listaGuias) {
			if (guia != null && guia.getId() == 0) {
				listaEliminar.add(guia);
			}
		}
		listaGuias.removeAll(listaEliminar);
	}	
}
