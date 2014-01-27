package ar.com.siig.enums;

public enum TipoEstadoGuia {

	LEGALIZADA("Legalizada"), DEVUELTA("Devuelta");
	
	private String descripcion;

	TipoEstadoGuia(String pDescripcion) {
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
