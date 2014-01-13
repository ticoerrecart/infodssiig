package ar.com.siig.negocio;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@MappedSuperclass
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@DiscriminatorColumn(name = "tipoMarcaSenial", discriminatorType = DiscriminatorType.STRING)
@DiscriminatorValue("MarcaSenial")
public abstract class MarcaSenial implements Comparable<MarcaSenial>{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String numero;
	
	private Date fechaVencimiento;
	
	private Blob imagen;

	private String nombreImagen;
	
	@ManyToOne()
	@JoinColumn(name = "boletaDeposito_fk")
	@Cascade(value = {CascadeType.SAVE_UPDATE,CascadeType.DELETE_ORPHAN })
	private BoletaDeposito boletaDeposito;		
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "productor_fk")	
	private Entidad productor;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public Blob getImagen() {
		return imagen;
	}

	public void setImagen(Blob imagen) {
		this.imagen = imagen;
	}

	public BoletaDeposito getBoletaDeposito() {
		return boletaDeposito;
	}

	public void setBoletaDeposito(BoletaDeposito boletaDeposito) {
		this.boletaDeposito = boletaDeposito;
	}

	public Entidad getProductor() {
		return productor;
	}

	public void setProductor(Entidad productor) {
		this.productor = productor;
	}

	@Override
	public int compareTo(MarcaSenial o) {
		
		// Lo multiplico por -1 para que ordene de mayor a menor
		return this.getFechaVencimiento().compareTo(o.getFechaVencimiento())*-1;
	}
	
	public abstract String getIdTipoMarcaSenial();
	
	public abstract String getTipoMarcaSenial();

	public String getNombreImagen() {
		return nombreImagen;
	}

	public void setNombreImagen(String nombreImagen) {
		this.nombreImagen = nombreImagen;
	}
	
}
