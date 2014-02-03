package ar.com.siig.negocio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class Autorizacion {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "autorizado_fk")
	private Autorizado autorizado;

	@ManyToMany
	@JoinTable(name = "autorizacion_tipodeautorizacion", joinColumns = @JoinColumn(name = "autorizacion_fk"), inverseJoinColumns = { @JoinColumn(name = "tipo_autorizacion_fk") })
	@Cascade({ CascadeType.ALL })
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<TipoAutorizacion> tiposDeAutorizacion;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "productor_fk")
	private Productor productor;

	public void addTipoDeAutorizacion(TipoAutorizacion tipoAutorizacion) {
		if (tiposDeAutorizacion == null) {
			tiposDeAutorizacion = new ArrayList<TipoAutorizacion>();
		}

		tiposDeAutorizacion.add(tipoAutorizacion);
	}

	public Autorizado getAutorizado() {
		return autorizado;
	}

	public void setAutorizado(Autorizado autorizado) {
		this.autorizado = autorizado;
	}

	public Long getId() {
		return id;
	}

	public Productor getProductor() {
		return productor;
	}

	public void setProductor(Productor productor) {
		this.productor = productor;
	}

	public List<TipoAutorizacion> getTiposDeAutorizacion() {
		return tiposDeAutorizacion;
	}

}
