package ar.com.siig.dto;

import java.util.Date;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import ar.com.siig.enums.TipoDocumento;
import ar.com.siig.enums.TipoEstadoGuia;
import ar.com.siig.enums.TipoFinalidad;

public class GuiaDTO {

	private Long id;

	private Long numero;

	private EntidadDTO productor;
	
	private MarcaSenialDTO marcaSenial;
	
	private String numeroInterno;
	
	private String fechaLegalizacion;

	private String periodo;
	
	/*DATOS DE GUIA DEVUELTA*/
	private EstablecimientoDTO establecimientoOrigen;
	
	private EstablecimientoDTO establecimientoDestino;
	
	private String nroDTA;
	
	private TipoFinalidad finalidad;
	
	private String fechaTransito;
	
	private String medioTransporte;
	
	private String trasporteACargo;
	
	private String patente;
	
	private String patenteAcoplado;	
	
	private TipoAnimalDTO tipoAnimal;
	
	private int cantidad;
	
	private double canon;
	
	private double monto;
	
	private double interes;
	
	private TipoEstadoGuia tipoEstadoGuia;
	
	private BoletaDepositoDTO boletaDeposito;
	
	public GuiaDTO(){
		
		productor = new EntidadDTO();
		marcaSenial = new MarcaSenialDTO();
		establecimientoOrigen = new EstablecimientoDTO();
		establecimientoDestino = new EstablecimientoDTO();
		tipoAnimal = new TipoAnimalDTO();
		boletaDeposito = new BoletaDepositoDTO();
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

	public EntidadDTO getProductor() {
		return productor;
	}

	public void setProductor(EntidadDTO productor) {
		this.productor = productor;
	}

	public MarcaSenialDTO getMarcaSenial() {
		return marcaSenial;
	}

	public void setMarcaSenial(MarcaSenialDTO marcaSenial) {
		this.marcaSenial = marcaSenial;
	}

	public String getNumeroInterno() {
		return numeroInterno;
	}

	public void setNumeroInterno(String numeroInterno) {
		this.numeroInterno = numeroInterno;
	}

	public String getFechaLegalizacion() {
		return fechaLegalizacion;
	}

	public void setFechaLegalizacion(String fechaLegalizacion) {
		this.fechaLegalizacion = fechaLegalizacion;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public EstablecimientoDTO getEstablecimientoOrigen() {
		return establecimientoOrigen;
	}

	public void setEstablecimientoOrigen(EstablecimientoDTO establecimientoOrigen) {
		this.establecimientoOrigen = establecimientoOrigen;
	}

	public EstablecimientoDTO getEstablecimientoDestino() {
		return establecimientoDestino;
	}

	public void setEstablecimientoDestino(EstablecimientoDTO establecimientoDestino) {
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

	public String getFinalidadStr(){
		return (this.finalidad == null)?"":this.finalidad.getDescripcion();
	}
	
	public void setFinalidadStr(String finalidad){
		this.finalidad = TipoFinalidad.valueOf(finalidad);
	}	
	
	public String getFechaTransito() {
		return fechaTransito;
	}

	public void setFechaTransito(String fechaTransito) {
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

	public TipoAnimalDTO getTipoAnimal() {
		return tipoAnimal;
	}

	public void setTipoAnimal(TipoAnimalDTO tipoAnimal) {
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

	public double getMontoTotal(){
		
		return this.getMonto()+this.getInteres();
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

	public BoletaDepositoDTO getBoletaDeposito() {
		return boletaDeposito;
	}

	public void setBoletaDeposito(BoletaDepositoDTO boletaDeposito) {
		this.boletaDeposito = boletaDeposito;
	}	

}
