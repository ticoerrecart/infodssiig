package ar.com.siig.dto;

public class LocalidadDTO {

	private Long id;
	private String nombre;
	private ProvinciaDTO provinciaDTO;

	public LocalidadDTO() {

		provinciaDTO = new ProvinciaDTO();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public ProvinciaDTO getProvinciaDTO() {
		return provinciaDTO;
	}

	public void setProvinciaDTO(ProvinciaDTO provinciaDTO) {
		this.provinciaDTO = provinciaDTO;
	}
}
