package ar.com.siig.negocio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class ProductorEnEstablecimiento {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "productor_fk")
	private Productor productor;	
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "establecimiento_fk")
	private Establecimiento establecimiento;
	
	@OneToMany(mappedBy = "productorEnEstablecimiento")
	@Cascade(value = {CascadeType.SAVE_UPDATE,CascadeType.DELETE_ORPHAN })
	private List<AnimalEnEstablecimiento> animalesEnEstablecimiento = 
								new ArrayList<AnimalEnEstablecimiento>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Productor getProductor() {
		return productor;
	}

	public void setProductor(Productor productor) {
		this.productor = productor;
	}

	public Establecimiento getEstablecimiento() {
		return establecimiento;
	}

	public void setEstablecimiento(Establecimiento establecimiento) {
		this.establecimiento = establecimiento;
	}

	public List<AnimalEnEstablecimiento> getAnimalesEnEstablecimiento() {
		return animalesEnEstablecimiento;
	}

	public void setAnimalesEnEstablecimiento(
			List<AnimalEnEstablecimiento> animalesEnEstablecimiento) {
		this.animalesEnEstablecimiento = animalesEnEstablecimiento;
	}
	
}
