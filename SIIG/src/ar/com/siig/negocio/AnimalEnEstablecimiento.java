package ar.com.siig.negocio;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class AnimalEnEstablecimiento {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private int stock;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "tipoAnimal_fk")
	private TipoAnimal tipoAnimal;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "productorEnEstablecimiento_fk")	
	private ProductorEnEstablecimiento productorEnEstablecimiento;
	
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

	public TipoAnimal getTipoAnimal() {
		return tipoAnimal;
	}

	public void setTipoAnimal(TipoAnimal tipoAnimal) {
		this.tipoAnimal = tipoAnimal;
	}

	public ProductorEnEstablecimiento getProductorEnEstablecimiento() {
		return productorEnEstablecimiento;
	}

	public void setProductorEnEstablecimiento(
			ProductorEnEstablecimiento productorEnEstablecimiento) {
		this.productorEnEstablecimiento = productorEnEstablecimiento;
	}

}
