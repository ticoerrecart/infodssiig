package ar.com.siig.enums;

public enum TipoFinalidad {

	VentaAFaena("Venta a Faena"), VentaAProduccion("Venta a Producción"),
	PastoreoCapitalizacion("Pastoreo/Capitalización"), Exposicion("Exposición"),
	Barraca("Barraca");
	
	private String descripcion;

	TipoFinalidad(String pDescripcion) {
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
