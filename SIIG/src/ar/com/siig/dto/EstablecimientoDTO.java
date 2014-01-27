package ar.com.siig.dto;

public class EstablecimientoDTO{

	private Long id;
	private String nombre;
	private LocalidadDTO localidadDTO;

	public EstablecimientoDTO() {

		localidadDTO = new LocalidadDTO();
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

	public LocalidadDTO getLocalidadDTO() {
		return localidadDTO;
	}

	public void setLocalidadDTO(LocalidadDTO localidadDTO) {
		this.localidadDTO = localidadDTO;
	}
}
