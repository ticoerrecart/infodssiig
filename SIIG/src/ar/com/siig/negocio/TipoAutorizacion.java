package ar.com.siig.negocio;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TipoAutorizacion {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String campania;
	
	private String renovacion;
	
	private String libre;

	public String getCampania() {
		return campania;
	}

	public void setCampania(String campania) {
		this.campania = campania;
	}

	public String getRenovacion() {
		return renovacion;
	}

	public void setRenovacion(String renovacion) {
		this.renovacion = renovacion;
	}

	public String getLibre() {
		return libre;
	}

	public void setLibre(String libre) {
		this.libre = libre;
	}

	public Long getId() {
		return id;
	}
	
	
}
