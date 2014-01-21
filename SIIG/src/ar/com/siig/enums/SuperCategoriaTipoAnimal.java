package ar.com.siig.enums;

public enum SuperCategoriaTipoAnimal {
	GMAYOR("Ganado Mayor"), GMENOR("Ganado Menor");

	private String descripcion;

	SuperCategoriaTipoAnimal(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}
	
	public String getName() {
		return name();
	}	
}
