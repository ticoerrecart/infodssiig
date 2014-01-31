package ar.com.siig.negocio;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import ar.com.siig.enums.TipoEstadoGuia;
import ar.com.siig.enums.TipoFinalidad;

@Entity
public class Guia {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)	
	private Long id;
	
	@Column(nullable = false)
	private Long numero;
	
	private String numeroInterno;
	
	private String periodo;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "productor_fk")
	private Productor productor;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "marca_fk")
	private Marca marca;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "senial_fk")
	private Senial senial;
	
	@Column(nullable = false)
	private Date fechaLegalizacion;

	/*DATOS DE GUIA DEVUELTA*/
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "estOrigen_fk")
	private Establecimiento establecimientoOrigen;	

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "estDestino_fk")
	private Establecimiento establecimientoDestino;	
	
	private String nroDTA;
	
	@Enumerated(EnumType.STRING)	
	private TipoFinalidad finalidad;
	
	private Date fechaTransito;
	
	private String medioTransporte;
	
	private String trasporteACargo;
	
	private String patente;
	
	private String patenteAcoplado;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "tipoProducto_fk")	
	private TipoAnimal tipoAnimal;
	
	private int cantidad;
	
	private double canon;
	
	private double monto;
	
	private double interes;
	
	@Enumerated(EnumType.STRING)
	private TipoEstadoGuia tipoEstadoGuia;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "boletaDeposito_fk")
	private BoletaDeposito boletaDeposito;	
	
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

	public String getNumeroInterno() {
		return numeroInterno;
	}

	public void setNumeroInterno(String numeroInterno) {
		this.numeroInterno = numeroInterno;
	}

	public Productor getProductor() {
		return productor;
	}

	public void setProductor(Productor productor) {
		this.productor = productor;
	}

	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	public Senial getSenial() {
		return senial;
	}

	public void setSenial(Senial senial) {
		this.senial = senial;
	}

	public Date getFechaLegalizacion() {
		return fechaLegalizacion;
	}

	public void setFechaLegalizacion(Date fechaLegalizacion) {
		this.fechaLegalizacion = fechaLegalizacion;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public Establecimiento getEstablecimientoOrigen() {
		return establecimientoOrigen;
	}

	public void setEstablecimientoOrigen(Establecimiento establecimientoOrigen) {
		this.establecimientoOrigen = establecimientoOrigen;
	}

	public Establecimiento getEstablecimientoDestino() {
		return establecimientoDestino;
	}

	public void setEstablecimientoDestino(Establecimiento establecimientoDestino) {
		this.establecimientoDestino = establecimientoDestino;
	}

	public String getNroDTA() {
		return nroDTA;
	}

	public void setNroDTA(String nroDTA) {
		this.nroDTA = nroDTA;
	}

	public TipoFinalidad getFinalidad() {
		return finalidad;
	}

	public void setFinalidad(TipoFinalidad finalidad) {
		this.finalidad = finalidad;
	}

	public Date getFechaTransito() {
		return fechaTransito;
	}

	public void setFechaTransito(Date fechaTransito) {
		this.fechaTransito = fechaTransito;
	}

	public String getMedioTransporte() {
		return medioTransporte;
	}

	public void setMedioTransporte(String medioTransporte) {
		this.medioTransporte = medioTransporte;
	}

	public String getTrasporteACargo() {
		return trasporteACargo;
	}

	public void setTrasporteACargo(String trasporteACargo) {
		this.trasporteACargo = trasporteACargo;
	}

	public String getPatente() {
		return patente;
	}

	public void setPatente(String patente) {
		this.patente = patente;
	}

	public String getPatenteAcoplado() {
		return patenteAcoplado;
	}

	public void setPatenteAcoplado(String patenteAcoplado) {
		this.patenteAcoplado = patenteAcoplado;
	}

	public TipoAnimal getTipoAnimal() {
		return tipoAnimal;
	}

	public void setTipoAnimal(TipoAnimal tipoAnimal) {
		this.tipoAnimal = tipoAnimal;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getCanon() {
		return canon;
	}

	public void setCanon(double canon) {
		this.canon = canon;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}

	public double getInteres() {
		return interes;
	}

	public void setInteres(double interes) {
		this.interes = interes;
	}

	public TipoEstadoGuia getTipoEstadoGuia() {
		return tipoEstadoGuia;
	}

	public void setTipoEstadoGuia(TipoEstadoGuia tipoEstadoGuia) {
		this.tipoEstadoGuia = tipoEstadoGuia;
	}
	
	public double getMontoTotal(){
		
		return this.getMonto()+this.getInteres();
	}

	public BoletaDeposito getBoletaDeposito() {
		return boletaDeposito;
	}

	public void setBoletaDeposito(BoletaDeposito boletaDeposito) {
		this.boletaDeposito = boletaDeposito;
	}
}
