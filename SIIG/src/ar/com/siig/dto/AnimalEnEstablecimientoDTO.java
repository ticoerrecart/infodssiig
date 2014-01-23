package ar.com.siig.dto;

public class AnimalEnEstablecimientoDTO {

	private Long id;	
	private int stock;
	private TipoAnimalDTO tipoAnimal;
	
	public AnimalEnEstablecimientoDTO(){
		
		tipoAnimal = new TipoAnimalDTO();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public TipoAnimalDTO getTipoAnimal() {
		return tipoAnimal;
	}

	public void setTipoAnimal(TipoAnimalDTO tipoAnimal) {
		this.tipoAnimal = tipoAnimal;
	}
	
}
