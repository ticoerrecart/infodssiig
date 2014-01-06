package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.AutorizacionDAO;
import ar.com.siig.dao.AutorizadoDAO;
import ar.com.siig.dao.EntidadDAO;
import ar.com.siig.dao.TipoAutorizacionDAO;
import ar.com.siig.dto.AutorizacionDTO;
import ar.com.siig.dto.TipoAutorizacionDTO;
import ar.com.siig.negocio.Autorizacion;
import ar.com.siig.negocio.Autorizado;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.TipoAutorizacion;

@Transactional(rollbackFor = { Throwable.class })
public class AutorizacionFachada {

	private AutorizacionDAO autorizacionDAO;
	private EntidadDAO entidadDAO;
	private AutorizadoDAO autorizadoDAO;
	private TipoAutorizacionDAO tipoAutorizacionDAO;

	public AutorizacionFachada() {
	}

	public AutorizacionFachada(AutorizacionDAO autorizacionDAO,
			EntidadDAO entidadDAO, AutorizadoDAO autorizadoDAO,
			TipoAutorizacionDAO tipoAutorizacionDAO) {
		this.autorizacionDAO = autorizacionDAO;
		this.entidadDAO = entidadDAO;
		this.autorizadoDAO = autorizadoDAO;
		this.tipoAutorizacionDAO = tipoAutorizacionDAO;

	}

	public void altaAutorizacion(AutorizacionDTO autorizacionDTO) {
		Autorizacion autorizacion = new Autorizacion();
		Productor productor = entidadDAO.getProductor(autorizacionDTO
				.getProductor().getId());
		autorizacion.setProductor(productor);
		Autorizado autorizado = autorizadoDAO.getAutorizado(autorizacionDTO
				.getAutorizado().getId());
		autorizacion.setAutorizado(autorizado);
		for (TipoAutorizacionDTO dto : autorizacionDTO.getTiposDeAutorizacion()) {
			if (dto != null) {
				TipoAutorizacion tipoAutorizacion = tipoAutorizacionDAO
						.getTipoAutorizacion(dto.getId());
				autorizacion.addTipoDeAutorizacion(tipoAutorizacion);
			}
		}

		autorizacionDAO.altaAutorizacion(autorizacion);
	}

	public boolean existeAutorizacion(AutorizacionDTO autorizacionDTO) {
		return autorizacionDAO.existeAutorizacion(autorizacionDTO);
	}

	public List<Autorizacion> getAutorizaciones() {
		return autorizacionDAO.getAutorizaciones();
	}

	public Autorizacion getAutorizacion(Long id) {
		return autorizacionDAO.getAutorizacion(id);
	}

	public void modificacionAutorizacion(AutorizacionDTO autorizacionDTO) {
		List<TipoAutorizacion> autorizaciones = new ArrayList<TipoAutorizacion>();
		for (TipoAutorizacionDTO dto : autorizacionDTO.getTiposDeAutorizacion()) {
			if (dto != null) {
				TipoAutorizacion tipoAutorizacion = tipoAutorizacionDAO
						.getTipoAutorizacion(dto.getId());
				autorizaciones.add(tipoAutorizacion);
			}
		}

		autorizacionDAO.modificacionAutorizacion(autorizacionDTO, autorizaciones);
	}
}
