package ar.com.siig.enums;

public enum TipoMarcaSenial {

	Marca("Marca"), Senial("Señal");
	
	private String descripcion;

	TipoMarcaSenial(String pDescripcion) {
		this.descripcion = pDescripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getName() {
		return name();
	}	
}
