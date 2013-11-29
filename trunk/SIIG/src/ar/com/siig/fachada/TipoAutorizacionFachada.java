package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.TipoAutorizacionDAO;
import ar.com.siig.dto.TipoAutorizacionDTO;
import ar.com.siig.negocio.TipoAutorizacion;
import ar.com.siig.providers.ProviderDTO;

@Transactional(rollbackFor = { Throwable.class })
public class TipoAutorizacionFachada {

	private TipoAutorizacionDAO tipoAutorizacionDAO;

	public TipoAutorizacionFachada() {

	}

	public TipoAutorizacionFachada(TipoAutorizacionDAO tipoAutorizacionDAO) {
		this.tipoAutorizacionDAO = tipoAutorizacionDAO;
	}

	public List<TipoAutorizacion> getTiposAutorizacion() {
		return tipoAutorizacionDAO.getTiposAutorizacion();
	}

	public List<TipoAutorizacionDTO> getTiposAutorizacionDTO() {
		List<TipoAutorizacionDTO> tiposAutorizacionDTO = new ArrayList<TipoAutorizacionDTO>();
		List<TipoAutorizacion> tiposAutorizacion = this.getTiposAutorizacion();
		for (TipoAutorizacion tipoAutorizacion : tiposAutorizacion) {
			tiposAutorizacionDTO.add(ProviderDTO
					.getTipoAutorizacionDTO(tipoAutorizacion));
		}

		return tiposAutorizacionDTO;
	}
}
