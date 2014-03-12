package ar.com.siig.negocio;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import ar.com.siig.utils.DateUtils;

@Entity
public class Robo {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "denuncia_fk")
	private Denuncia denuncia;

	@Column
	private String producto;

	@Column
	private Integer cantidad;

	@Column
	private Date fecha;

	@Column
	private String observaciones;

	public String getProducto() {
		return producto;
	}

	public void setProducto(String producto) {
		this.producto = producto;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public Long getId() {
		return id;
	}

	public Denuncia getDenuncia() {
		return denuncia;
	}

	public void setDenuncia(Denuncia denuncia) {
		this.denuncia = denuncia;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setFechaStr(String fecha) {
		this.fecha = DateUtils.dateFromString(fecha, "dd/MM/yyyy");
	}

	public String getFechaStr() {
		String fechaStr = "";
		if (fecha != null) {
			fechaStr = ar.com.siig.utils.DateUtils.stringFromDate(fecha,
					"dd/MM/yyyy");
		}

		return fechaStr;
	}
}
