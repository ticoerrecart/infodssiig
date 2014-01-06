package ar.com.siig.dto;

public class GuiaDTO {

	private Long id;

	private Long numero;

	private EntidadDTO productor;
	
	private MarcaSenialDTO marcaSenial;
	
	private String numeroInterno;
	
	private String fechaLegalizacion;

	private String periodo;
	
	public GuiaDTO(){
		
		productor = new EntidadDTO();
		marcaSenial = new MarcaSenialDTO();
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
	
}
