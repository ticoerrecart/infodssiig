package ar.com.siig.fachada;

import ar.com.siig.dao.AnimalEnEstablecimientoDAO;

public class AnimalEnEstablecimientoFachada {

	private AnimalEnEstablecimientoDAO animalEnEstablecimientoDAO;
	
	public AnimalEnEstablecimientoFachada(){}
	
	public AnimalEnEstablecimientoFachada(AnimalEnEstablecimientoDAO pAnimalEnEstablecimientoDAO){
		
		this.animalEnEstablecimientoDAO = pAnimalEnEstablecimientoDAO;
	}
}
