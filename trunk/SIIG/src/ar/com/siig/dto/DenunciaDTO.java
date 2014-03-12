package ar.com.siig.dto;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.GrowthList;
import org.apache.commons.collections.list.LazyList;

import ar.com.siig.negocio.DenunciaHacienda;
import ar.com.siig.negocio.DenunciaPerros;
import ar.com.siig.negocio.Robo;

public class DenunciaDTO {

	private Long id;
	private Long productorId;
	private Integer numeroDeDenuncia;
	private Integer numeroDeLlamado;
	private String desde;
	private String hasta;
	private String lugar;
	private List<String> tiposDeDenuncia;
	private List<DenunciaPerros> avistajePerros;
	private List<DenunciaPerros> capturaPerros;
	private List<DenunciaHacienda> dañosHacienda;
	private List<DenunciaHacienda> muertesHacienda;
	private List<Robo> robos;
	private String observaciones;
	private String tipoDeDenuncia;

	@SuppressWarnings("unchecked")
	public DenunciaDTO() {
		tiposDeDenuncia = (List<String>) GrowthList.decorate(LazyList.decorate(
				new ArrayList<Long>(),
				FactoryUtils.instantiateFactory(String.class)));
		avistajePerros = (List<DenunciaPerros>) LazyList.decorate(
				new ArrayList<DenunciaPerros>(),
				FactoryUtils.instantiateFactory(DenunciaPerros.class));
		capturaPerros = (List<DenunciaPerros>) LazyList.decorate(
				new ArrayList<DenunciaPerros>(),
				FactoryUtils.instantiateFactory(DenunciaPerros.class));
		dañosHacienda = (List<DenunciaHacienda>) LazyList.decorate(
				new ArrayList<DenunciaHacienda>(),
				FactoryUtils.instantiateFactory(DenunciaHacienda.class));
		muertesHacienda = (List<DenunciaHacienda>) LazyList.decorate(
				new ArrayList<DenunciaHacienda>(),
				FactoryUtils.instantiateFactory(DenunciaHacienda.class));
		robos = (List<Robo>) LazyList.decorate(new ArrayList<Robo>(),
				FactoryUtils.instantiateFactory(Robo.class));

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getLugar() {
		return lugar;
	}

	public void setLugar(String lugar) {
		this.lugar = lugar;
	}

	public String getDesde() {
		return desde;
	}

	public void setDesde(String desde) {
		this.desde = desde;
	}

	public String getHasta() {
		return hasta;
	}

	public void setHasta(String hasta) {
		this.hasta = hasta;
	}

	public List<String> getTiposDeDenuncia() {
		return tiposDeDenuncia;
	}

	public void setTiposDeDenuncia(List<String> tiposDeDenuncia) {
		this.tiposDeDenuncia = tiposDeDenuncia;
	}

	public List<DenunciaPerros> getAvistajePerros() {
		return avistajePerros;
	}

	public void setAvistajePerros(List<DenunciaPerros> avistajePerros) {
		this.avistajePerros = avistajePerros;
	}

	public List<DenunciaPerros> getCapturaPerros() {
		return capturaPerros;
	}

	public void setCapturaPerros(List<DenunciaPerros> capturaPerros) {
		this.capturaPerros = capturaPerros;
	}

	public List<DenunciaHacienda> getDañosHacienda() {
		return dañosHacienda;
	}

	public void setDañosHacienda(List<DenunciaHacienda> dañosHacienda) {
		this.dañosHacienda = dañosHacienda;
	}

	public List<DenunciaHacienda> getMuertesHacienda() {
		return muertesHacienda;
	}

	public void setMuertesHacienda(List<DenunciaHacienda> muertesHacienda) {
		this.muertesHacienda = muertesHacienda;
	}

	public List<Robo> getRobos() {
		return robos;
	}

	public void setRobos(List<Robo> robos) {
		this.robos = robos;
	}

	public Long getProductorId() {
		return productorId;
	}

	public void setProductorId(Long productorId) {
		this.productorId = productorId;
	}

	public void normalizarCollections() {
		List<DenunciaPerros> borrarPerros = new ArrayList<DenunciaPerros>();
		List<Robo> borrarRobos = new ArrayList<Robo>();

		for (DenunciaPerros denunciaPerros : this.getAvistajePerros()) {
			if (denunciaPerros.getCantidad() == 0) {
				borrarPerros.add(denunciaPerros);
			}
		}
		this.getAvistajePerros().removeAll(borrarPerros);

		borrarPerros = new ArrayList<DenunciaPerros>();
		for (DenunciaPerros denunciaPerros : this.getCapturaPerros()) {
			if (denunciaPerros.getCantidad() == 0) {
				borrarPerros.add(denunciaPerros);
			}
		}
		this.getCapturaPerros().removeAll(borrarPerros);

		List<DenunciaHacienda> borrar = new ArrayList<DenunciaHacienda>();
		for (DenunciaHacienda dañosHacienda : this.getDañosHacienda()) {
			if (dañosHacienda.getEspecie() == ""
					&& dañosHacienda.getCategoria() == "") {
				borrar.add(dañosHacienda);
			}
		}
		this.getDañosHacienda().removeAll(borrar);

		borrar = new ArrayList<DenunciaHacienda>();
		for (DenunciaHacienda muerteHacienda : this.getMuertesHacienda()) {
			if (muerteHacienda.getCantidad() == 0) {
				borrar.add(muerteHacienda);
			}
		}
		this.getMuertesHacienda().removeAll(borrar);

		borrarRobos = new ArrayList<Robo>();
		for (Robo robo : this.getRobos()) {
			if ("".equals(robo.getProducto()) && "".equals(robo.getCantidad())
					&& "".equalsIgnoreCase(robo.getFechaStr())) {
				borrarRobos.add(robo);
			}
		}

		this.getRobos().removeAll(borrarRobos);
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getTipoDeDenuncia() {
		return tipoDeDenuncia;
	}

	public void setTipoDeDenuncia(String tipoDeDenuncia) {
		this.tipoDeDenuncia = tipoDeDenuncia;
	}

}
