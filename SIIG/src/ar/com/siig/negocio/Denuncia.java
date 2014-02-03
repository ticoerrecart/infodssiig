package ar.com.siig.negocio;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.CollectionOfElements;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class Denuncia {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "productor_fk")
	private Entidad productor;

	@Column(nullable = false)
	private Integer numeroDeDenuncia;

	@Column(nullable = false)
	private Integer numeroDeLlamado;

	@Column(nullable = false)
	private Date desde;

	@Column(nullable = false)
	private Date hasta;

	@Column(nullable = false)
	private String lugar;

	

	@ManyToMany
	@JoinTable(name = "denuncia_tipodedenuncia", joinColumns = @JoinColumn(name = "id"), inverseJoinColumns = { @JoinColumn(name = "tipo_denuncia_fk") })
	@Cascade({ CascadeType.ALL })
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<TipoDeDenuncia> tipoDeDenuncias;

	@OneToMany(mappedBy = "denuncia")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<DenunciaPerros> avistajeDePerros;

	@OneToMany(mappedBy = "denuncia")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<DenunciaPerros> capturaDePerros;

	@OneToMany(mappedBy = "denuncia")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<DenunciaHacienda> dañoEnHacienda;

	@OneToMany(mappedBy = "denuncia")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<DenunciaHacienda> muerteEnHacienda;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Entidad getProductor() {
		return productor;
	}

	public void setProductor(Entidad productor) {
		this.productor = productor;
	}

	public Integer getNumeroDeDenuncia() {
		return numeroDeDenuncia;
	}

	public void setNumeroDeDenuncia(Integer numeroDeDenuncia) {
		this.numeroDeDenuncia = numeroDeDenuncia;
	}

	public Integer getNumeroDeLlamado() {
		return numeroDeLlamado;
	}

	public void setNumeroDeLlamado(Integer numeroDeLlamado) {
		this.numeroDeLlamado = numeroDeLlamado;
	}

	public Date getDesde() {
		return desde;
	}

	public void setDesde(Date desde) {
		this.desde = desde;
	}

	public Date getHasta() {
		return hasta;
	}

	public void setHasta(Date hasta) {
		this.hasta = hasta;
	}

	public String getLugar() {
		return lugar;
	}

	public void setLugar(String lugar) {
		this.lugar = lugar;
	}

	public List<DenunciaPerros> getAvistajeDePerros() {
		return avistajeDePerros;
	}

	public void setAvistajeDePerros(List<DenunciaPerros> avistajeDePerros) {
		this.avistajeDePerros = avistajeDePerros;
	}

	public List<DenunciaPerros> getCapturaDePerros() {
		return capturaDePerros;
	}

	public void setCapturaDePerros(List<DenunciaPerros> capturaDePerros) {
		this.capturaDePerros = capturaDePerros;
	}

	public List<DenunciaHacienda> getDañoEnHacienda() {
		return dañoEnHacienda;
	}

	public void setDañoEnHacienda(List<DenunciaHacienda> dañoEnHacienda) {
		this.dañoEnHacienda = dañoEnHacienda;
	}

	public List<DenunciaHacienda> getMuerteEnHacienda() {
		return muerteEnHacienda;
	}

	public void setMuerteEnHacienda(List<DenunciaHacienda> muerteEnHacienda) {
		this.muerteEnHacienda = muerteEnHacienda;
	}

	public List<TipoDeDenuncia> getTipoDeDenuncias() {
		return tipoDeDenuncias;
	}

	public void setTipoDeDenuncias(List<TipoDeDenuncia> tipoDeDenuncias) {
		this.tipoDeDenuncias = tipoDeDenuncias;
	}


	
}
