package ar.com.siig.dto;

import java.sql.Blob;

public class MarcaSenialDTO {

	private Long id;
	
	private String numero;
	
	private String fechaVencimiento;
	
	private Blob imagen;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(String fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public Blob getImagen() {
		return imagen;
	}

	public void setImagen(Blob imagen) {
		this.imagen = imagen;
	}
}
