package ar.com.siig.negocio;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class DenunciaPerros {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "denuncia_fk")	
	private Denuncia denuncia;

	@Column
	private Integer cantidad;
	
	@Column
	private String señas;
	
	@Column
	private String sexo;
	
	@Column
	private Integer edad;
	
	@Column
	private String tamaño;
	
	@Column
	private String veniaDe;
	
	@Column
	private String ibaHacia;

	@Column
	private String capturaAvistaje;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Denuncia getDenuncia() {
		return denuncia;
	}

	public void setDenuncia(Denuncia denuncia) {
		this.denuncia = denuncia;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public String getSeñas() {
		return señas;
	}

	public void setSeñas(String señas) {
		this.señas = señas;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	public String getTamaño() {
		return tamaño;
	}

	public void setTamaño(String tamaño) {
		this.tamaño = tamaño;
	}

	public String getVeniaDe() {
		return veniaDe;
	}

	public void setVeniaDe(String veniaDe) {
		this.veniaDe = veniaDe;
	}

	public String getIbaHacia() {
		return ibaHacia;
	}

	public void setIbaHacia(String ibaHacia) {
		this.ibaHacia = ibaHacia;
	}

	public String getCapturaAvistaje() {
		return capturaAvistaje;
	}

	public void setCapturaAvistaje(String capturaAvistaje) {
		this.capturaAvistaje = capturaAvistaje;
	}	
	
	
}
