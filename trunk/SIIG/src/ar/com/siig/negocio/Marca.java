package ar.com.siig.negocio;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import ar.com.siig.enums.TipoMarcaSenial;

@Entity
@DiscriminatorValue("Marca")
public class Marca extends MarcaSenial {

	public String getTipoMarcaSenial() {
		return TipoMarcaSenial.Marca.getDescripcion();
	}

	public String getIdTipoMarcaSenial() {

		return TipoMarcaSenial.Marca.getName();
	}
	
}
