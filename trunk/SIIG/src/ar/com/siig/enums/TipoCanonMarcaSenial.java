package ar.com.siig.enums;

public enum TipoCanonMarcaSenial {

	AltaMarca("Alta-Marca"), AltaSenial("Alta-Señal"), RenovacionMarca(
			"Renovación-Marca"), RenovacionSenial("Renovación-Señal");

	private String descripcion;

	TipoCanonMarcaSenial(String pDescripcion) {
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
