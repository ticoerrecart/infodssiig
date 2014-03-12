package ar.com.siig.enums;

public enum TipoDeDenunciaEnum {

	PERROS("Perros"), ROBO("Robo o Abigeato"), OTRO("Otro");

	private String descripcion;

	TipoDeDenunciaEnum(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}

}
