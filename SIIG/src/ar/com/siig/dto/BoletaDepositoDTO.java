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
	
	private String fechaGeneracion;
	
	/*Es el debito que se puede generar al pagar la boleta en una fecha posterior a la fecha de Vencimiento*/ 
	private double debitoGeneradoPorPagoAtrasado;
	
	/*Es el credito que se puede generar al pagar la boleta en una fecha anterior a la fecha de Vencimiento*/	
	private double creditoGeneradoPorPagoAdelantado;
	
	/*Es el debito o credito que tiene el productor en su saldo (cuenta corriente) que se puede utilizar para restar o sumar 
	 * en el monto de la boleta, al generar la misma*/	
	private double debitoCreditoUsado;	
	
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

	public String getFechaGeneracion() {
		return fechaGeneracion;
	}

	public void setFechaGeneracion(String fechaGeneracion) {
		this.fechaGeneracion = fechaGeneracion;
	}

	public double getDebitoGeneradoPorPagoAtrasado() {
		return debitoGeneradoPorPagoAtrasado;
	}

	public void setDebitoGeneradoPorPagoAtrasado(
			double debitoGeneradoPorPagoAtrasado) {
		this.debitoGeneradoPorPagoAtrasado = debitoGeneradoPorPagoAtrasado;
	}

	public double getCreditoGeneradoPorPagoAdelantado() {
		return creditoGeneradoPorPagoAdelantado;
	}

	public void setCreditoGeneradoPorPagoAdelantado(
			double creditoGeneradoPorPagoAdelantado) {
		this.creditoGeneradoPorPagoAdelantado = creditoGeneradoPorPagoAdelantado;
	}

	public double getDebitoCreditoUsado() {
		return debitoCreditoUsado;
	}

	public void setDebitoCreditoUsado(double debitoCreditoUsado) {
		this.debitoCreditoUsado = debitoCreditoUsado;
	}
}
