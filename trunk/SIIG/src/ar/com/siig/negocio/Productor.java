package ar.com.siig.negocio;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import ar.com.siig.enums.TipoDeEntidad;

@Entity
@DiscriminatorValue("PRD")
public class Productor extends Entidad {

	@OneToMany(mappedBy = "productor")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<Autorizacion> autorizaciones;

	public String getTipoEntidad() {
		return TipoDeEntidad.PRD.getDescripcion();
	}

	public String getIdTipoEntidad() {
		// return "RN";
		return TipoDeEntidad.PRD.getName();
	}

	public List<Autorizacion> getAutorizaciones() {
		return autorizaciones;
	}

	public void addAutorizacion(Autorizacion autorizacion) {
		if (this.autorizaciones == null) {
			this.autorizaciones = new ArrayList<Autorizacion>();
		}

		this.autorizaciones.add(autorizacion);
	}

	public Marca getUltimaMarca(){
		
		if(this.getMarcas() != null && !this.getMarcas().isEmpty()){
			Collections.sort(this.getMarcas());
			return this.getMarcas().get(this.getMarcas().size()-1);
		}	
		return null;
	}

	public Senial getUltimaSenial(){
		
		if(this.getSeniales() != null && !this.getSeniales().isEmpty()){
			Collections.sort(this.getSeniales());
			return this.getSeniales().get(this.getSeniales().size()-1);
		}	
		return null;
	}	
}