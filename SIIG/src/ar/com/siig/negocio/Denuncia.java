package ar.com.siig.negocio;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import ar.com.siig.enums.TipoDeDenunciaEnum;

@Entity
public class Denuncia {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "productor_fk")
	private Entidad productor;

	@Column
	private Integer numeroDeDenuncia;

	@Column
	private Integer numeroDeLlamado;

	@Column(nullable = false)
	private Date desde;

	@Column(nullable = false)
	private Date hasta;

	@Column(nullable = false)
	private String lugar;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private TipoDeDenunciaEnum tipoDeDenuncia;

	@Column
	private String observaciones;

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

	@OneToMany(mappedBy = "denuncia")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<Robo> robo;

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

	public TipoDeDenunciaEnum getTipoDeDenuncia() {
		return tipoDeDenuncia;
	}

	public void setTipoDeDenuncia(TipoDeDenunciaEnum tipoDeDenuncia) {
		this.tipoDeDenuncia = tipoDeDenuncia;
	}

	public List<Robo> getRobo() {
		return robo;
	}

	public void setRobo(List<Robo> robo) {
		this.robo = robo;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

}
