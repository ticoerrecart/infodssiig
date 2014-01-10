package ar.com.siig.dto;

import ar.com.siig.enums.SuperCategoriaTipoAnimal;

public class TipoAnimalDTO {

	private Long id;

	private String descripcion;

	private Long idCategoria;

	private String descripcionCategoria;

	private SuperCategoriaTipoAnimal superCategoriaTipoAnimal;

	private String valor;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Long getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(Long idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getDescripcionCategoria() {
		return descripcionCategoria;
	}

	public void setDescripcionCategoria(String descripcionCategoria) {
		this.descripcionCategoria = descripcionCategoria;
	}

	public SuperCategoriaTipoAnimal getSuperCategoriaTipoAnimal() {
		return superCategoriaTipoAnimal;
	}

	public void setSuperCategoriaTipoAnimal(
			SuperCategoriaTipoAnimal superCategoriaTipoAnimal) {
		this.superCategoriaTipoAnimal = superCategoriaTipoAnimal;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}
