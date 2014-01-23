package ar.com.siig.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.AnimalEnEstablecimientoDTO;
import ar.com.siig.dto.ProductorEnEstablecimientoDTO;

public class AnimalEnEstablecimientoForm extends ActionForm {

	private ProductorEnEstablecimientoDTO productorEnEstablecimiento;
	private AnimalEnEstablecimientoDTO animalEnEstablecimiento;
	
	public AnimalEnEstablecimientoForm(){
		
		productorEnEstablecimiento = new ProductorEnEstablecimientoDTO();
		animalEnEstablecimiento = new AnimalEnEstablecimientoDTO();
	}

	public ProductorEnEstablecimientoDTO getProductorEnEstablecimiento() {
		return productorEnEstablecimiento;
	}

	public void setProductorEnEstablecimiento(
			ProductorEnEstablecimientoDTO productorEnEstablecimiento) {
		this.productorEnEstablecimiento = productorEnEstablecimiento;
	}

	public AnimalEnEstablecimientoDTO getAnimalEnEstablecimiento() {
		return animalEnEstablecimiento;
	}

	public void setAnimalEnEstablecimiento(
			AnimalEnEstablecimientoDTO animalEnEstablecimiento) {
		this.animalEnEstablecimiento = animalEnEstablecimiento;
	}
	
}
