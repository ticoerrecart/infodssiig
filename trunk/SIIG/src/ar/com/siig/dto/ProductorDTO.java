package ar.com.siig.dto;

import java.util.ArrayList;
import java.util.List;

import ar.com.siig.enums.TipoDeEntidad;


public class ProductorDTO extends EntidadDTO {

	private List<AutorizacionDTO> autorizaciones;
	
	private List<ProductorEnEstablecimientoDTO> productorEnEstablecimiento;
	
	private List<BoletaDepositoDTO> boletasDeposito;
	
	public ProductorDTO(){
		
		autorizaciones = new ArrayList<AutorizacionDTO>();
		productorEnEstablecimiento = new ArrayList<ProductorEnEstablecimientoDTO>();
		boletasDeposito = new ArrayList<BoletaDepositoDTO>();
	}
	
	public String getTipoEntidad() {
		return TipoDeEntidad.PRD.getDescripcion();
	}

	public String getIdTipoEntidad() {	
		return TipoDeEntidad.PRD.getName();
	}

	public List<AutorizacionDTO> getAutorizaciones() {
		return autorizaciones;
	}

	public void setAutorizaciones(List<AutorizacionDTO> autorizaciones) {
		this.autorizaciones = autorizaciones;
	}

	public List<ProductorEnEstablecimientoDTO> getProductorEnEstablecimiento() {
		return productorEnEstablecimiento;
	}

	public void setProductorEnEstablecimiento(
			List<ProductorEnEstablecimientoDTO> productorEnEstablecimiento) {
		this.productorEnEstablecimiento = productorEnEstablecimiento;
	}

	public List<BoletaDepositoDTO> getBoletasDeposito() {
		return boletasDeposito;
	}

	public void setBoletasDeposito(List<BoletaDepositoDTO> boletasDeposito) {
		this.boletasDeposito = boletasDeposito;
	}	
	
}
