package ar.com.siig.negocio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
public class Periodo {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false)
	private String periodo;

	@OneToMany(mappedBy = "periodo")
	@Cascade(value = {CascadeType.SAVE_UPDATE,CascadeType.DELETE_ORPHAN })
	private List<VencimientoPeriodo> vencimientoPeriodo = new ArrayList<VencimientoPeriodo>();	
	
	public String getPeriodo() {
		return periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<VencimientoPeriodo> getVencimientoPeriodo() {
		return vencimientoPeriodo;
	}

	public void setVencimientoPeriodo(List<VencimientoPeriodo> vencimientoPeriodo) {
		this.vencimientoPeriodo = vencimientoPeriodo;
	}
	
}