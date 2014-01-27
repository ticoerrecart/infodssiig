package ar.com.siig.negocio;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import ar.com.siig.enums.SuperCategoriaTipoAnimal;

@Entity
public class Categoria {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false)
	private String descripcion;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private SuperCategoriaTipoAnimal superCategoriaTipoAnimal;

	@OneToMany(mappedBy = "categoria")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<TipoAnimal> tipoAnimales;

	public String getDescripcion() {
		return descripcion + " | " + superCategoriaTipoAnimal.getDescripcion();
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Long getId() {
		return id;
	}

	public SuperCategoriaTipoAnimal getSuperCategoriaTipoAnimal() {
		return superCategoriaTipoAnimal;
	}

	public void setSuperCategoriaTipoAnimal(
			SuperCategoriaTipoAnimal superCategoriaTipoAnimal) {
		this.superCategoriaTipoAnimal = superCategoriaTipoAnimal;
	}

	public List<TipoAnimal> getTipoAnimales() {
		return tipoAnimales;
	}

	@Override
	public boolean equals(Object obj) {

		Categoria c = (Categoria)obj;
		return c.getId().equals(this.getId());
	}
}
