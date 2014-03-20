package ar.com.siig.enums;

public enum TipoBoletaDeposito {
	PAGO_GUIAS("Pago Guias"), PAGO_INTERESES("Pago Intereses");

	private String descripcion;

	TipoBoletaDeposito(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}
	
	public String getName() {
		return name();
	}
}
