package ar.com.siig.dto;

import java.sql.Blob;

import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.Productor;

public class MarcaSenialDTO {

	private Long id;
	
	private String tipo;
	
	private String numero;
	
	private String fechaVencimiento;
	
	private Blob imagen;

	private String nombreImagen;
	
	private BoletaDepositoDTO boletaDeposito;
	
	private EntidadDTO productor;
	
	public MarcaSenialDTO(){
		
		boletaDeposito = new BoletaDepositoDTO();
		productor = new EntidadDTO();
	}
	
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

	public BoletaDepositoDTO getBoletaDeposito() {
		return boletaDeposito;
	}

	public void setBoletaDeposito(BoletaDepositoDTO boletaDeposito) {
		this.boletaDeposito = boletaDeposito;
	}

	public EntidadDTO getProductor() {
		return productor;
	}

	public void setProductor(EntidadDTO productor) {
		this.productor = productor;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getNombreImagen() {
		return nombreImagen;
	}

	public void setNombreImagen(String nombreImagen) {
		this.nombreImagen = nombreImagen;
	}
}
