package ar.com.siig.dto;

import java.util.ArrayList;
import java.util.List;

public class BoletaDepositoDTO {

	private Long id;

	private Long numero;
	
	private double monto;

	private String fechaPago;

	private String fechaVencimiento;

	private List<GuiaDTO> guias;
	
	private ProductorDTO productor;
	
	public BoletaDepositoDTO(){
		
		guias = new ArrayList<GuiaDTO>();
		productor = new ProductorDTO();
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getNumero() {
		return numero;
	}

	public void setNumero(Long numero) {
		this.numero = numero;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}

	public String getFechaPago() {
		return fechaPago;
	}

	public void setFechaPago(String fechaPago) {
		this.fechaPago = fechaPago;
	}

	public String getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(String fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public List<GuiaDTO> getGuias() {
		return guias;
	}

	public void setGuias(List<GuiaDTO> guias) {
		this.guias = guias;
	}

	public ProductorDTO getProductor() {
		return productor;
	}

	public void setProductor(ProductorDTO productor) {
		this.productor = productor;
	}
}
