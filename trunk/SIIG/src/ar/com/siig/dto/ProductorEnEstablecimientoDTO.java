package ar.com.siig.dto;

import java.util.ArrayList;
import java.util.List;


public class ProductorEnEstablecimientoDTO {

	private Long id;
	private EntidadDTO productor;
	private EstablecimientoDTO establecimiento;
	private List<AnimalEnEstablecimientoDTO> animalesEnEstablecimiento;
	
	public ProductorEnEstablecimientoDTO(){
		
		productor = new EntidadDTO();
		establecimiento = new EstablecimientoDTO();
		animalesEnEstablecimiento = new ArrayList<AnimalEnEstablecimientoDTO>();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public EntidadDTO getProductor() {
		return productor;
	}

	public void setProductor(EntidadDTO productor) {
		this.productor = productor;
	}

	public EstablecimientoDTO getEstablecimiento() {
		return establecimiento;
	}

	public void setEstablecimiento(EstablecimientoDTO establecimiento) {
		this.establecimiento = establecimiento;
	}

	public List<AnimalEnEstablecimientoDTO> getAnimalesEnEstablecimiento() {
		return animalesEnEstablecimiento;
	}

	public void setAnimalesEnEstablecimiento(
			List<AnimalEnEstablecimientoDTO> animalesEnEstablecimiento) {
		this.animalesEnEstablecimiento = animalesEnEstablecimiento;
	}
	
}
