package ar.com.siig.negocio;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class MarcaSenial {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String numero;
	
	private Date fechaVencimiento;
	
	private Blob imagen;

	@ManyToOne()
	@JoinColumn(name = "boletaDeposito_fk")
	@Cascade(value = CascadeType.ALL)
	private BoletaDeposito boletaDeposito;		
	
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
}
