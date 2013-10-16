package ar.com.siig.enums;

import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.RecursosNaturales;

public enum TipoDeEntidad {
	PRD("Productor",Productor.class), RN("Recursos Naturales",RecursosNaturales.class);

	private String descripcion;
	private Class clase;
	
	TipoDeEntidad(String pDescripcion,Class pClass) {
		this.descripcion = pDescripcion;
		this.clase = pClass;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public String getName() {
		return name();
	}
	
	public Class getClase() {
		return clase;
	}

	public void setClase(Class clase) {
		this.clase = clase;
	}	
}