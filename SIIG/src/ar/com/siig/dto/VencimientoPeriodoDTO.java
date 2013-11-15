package ar.com.siig.dto;

public class VencimientoPeriodoDTO {

	private Long id;
	private String fecha;
	private PeriodoDTO periodoDTO;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public PeriodoDTO getPeriodoDTO() {
		return periodoDTO;
	}
	public void setPeriodoDTO(PeriodoDTO periodoDTO) {
		this.periodoDTO = periodoDTO;
	}
	
	
}
