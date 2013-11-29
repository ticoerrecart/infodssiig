package ar.com.siig.dto;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class AutorizacionDTO {

	private Long id;

	private AutorizadoDTO autorizado;

	private List<TipoAutorizacionDTO> tiposDeAutorizacion = new ArrayList<TipoAutorizacionDTO>();

	private EntidadDTO productor;

	public AutorizacionDTO() {
		 autorizado = new AutorizadoDTO();
		tiposDeAutorizacion = (List<TipoAutorizacionDTO>) LazyList.decorate(
				new ArrayList(),
				FactoryUtils.instantiateFactory(TipoAutorizacionDTO.class));
		 productor = new EntidadDTO();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public AutorizadoDTO getAutorizado() {
		return autorizado;
	}

	public void setAutorizado(AutorizadoDTO autorizado) {
		this.autorizado = autorizado;
	}

	public List<TipoAutorizacionDTO> getTiposDeAutorizacion() {
		return tiposDeAutorizacion;
	}

	public void setTiposDeAutorizacion(
			List<TipoAutorizacionDTO> tiposDeAutorizacion) {
		this.tiposDeAutorizacion = tiposDeAutorizacion;
	}

	public EntidadDTO getProductor() {
		return productor;
	}

	public void setProductor(EntidadDTO productor) {
		this.productor = productor;
	}

}
