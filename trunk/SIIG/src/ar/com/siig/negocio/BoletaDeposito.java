package ar.com.siig.negocio;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class BoletaDeposito {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false)
	private Long numero;
	
	@Column(nullable = false)
	private double monto;

	private Date fechaPago;

	@Column(nullable = false)
	private Date fechaVencimiento;

	@OneToMany(mappedBy = "boletaDeposito")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<Guia> guias;	
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "productor_fk")
	private Productor productor;	
	
	/*Campos utilizados para intereses*/
	@Column(nullable = false)
	private Date fechaGeneracion;
	
	/*Es el debito que se puede generar al pagar la boleta en una fecha posterior a la fecha de Vencimiento*/ 
	@Column(nullable = false)
	private double debitoGeneradoPorPagoAtrasado;
	
	/*Es el credito que se puede generar al pagar la boleta en una fecha anterior a la fecha de Vencimiento*/	
	@Column(nullable = false)
	private double creditoGeneradoPorPagoAdelantado;
	
	/*Es el debito o credito que tiene el productor en su saldo (cuenta corriente) que se puede utilizar para restar o sumar 
	 * en el monto de la boleta, al generar la misma*/	
	@Column(nullable = false)
	private double debitoCreditoUsado;	
	
	
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

	public Date getFechaPago() {
		return fechaPago;
	}

	public void setFechaPago(Date fechaPago) {
		this.fechaPago = fechaPago;
	}

	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public List<Guia> getGuias() {
		return guias;
	}

	public void setGuias(List<Guia> guias) {
		this.guias = guias;
	}

	public Productor getProductor() {
		return productor;
	}

	public void setProductor(Productor productor) {
		this.productor = productor;
	}

	public Date getFechaGeneracion() {
		return fechaGeneracion;
	}

	public void setFechaGeneracion(Date fechaGeneracion) {
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
	
	public double getMontoTotalGuias(){
		
		double montoTotalGuias = 0.00;
		for (Guia guia : this.getGuias()) {
			montoTotalGuias = montoTotalGuias + guia.getMontoTotal();
		}
		
		DecimalFormat df = new DecimalFormat("#.00");
		return new Double(df.format(montoTotalGuias).replace(",", "."));
	}
}
