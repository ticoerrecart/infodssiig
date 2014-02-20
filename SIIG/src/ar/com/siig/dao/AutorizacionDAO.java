package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.dto.AutorizacionDTO;
import ar.com.siig.negocio.Autorizacion;
import ar.com.siig.negocio.TipoAutorizacion;

public class AutorizacionDAO extends HibernateDaoSupport {

	public void altaAutorizacion(Autorizacion autorizacion) {
		this.getHibernateTemplate().saveOrUpdate(autorizacion);
	}

	public boolean existeAutorizacion(AutorizacionDTO autorizacionDTO) {
		Criteria criteria = getSession().createCriteria(Autorizacion.class);

		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("productor.id", autorizacionDTO.getProductor()
				.getId()));
		conj.add(Restrictions.eq("autorizado.id", autorizacionDTO
				.getAutorizado().getId()));

		if (autorizacionDTO.getId() != null) {
			conj.add(Restrictions.ne("id", autorizacionDTO.getId()));
		}
		criteria.add(conj);

		List<Autorizacion> autorizaciones = criteria.list();
		return autorizaciones.size() > 0;
	}

	public List<Autorizacion> getAutorizaciones() {
		return getHibernateTemplate().loadAll(Autorizacion.class);
	}

	public Autorizacion getAutorizacion(Long id) {
		return (Autorizacion) getHibernateTemplate()
				.get(Autorizacion.class, id);
	}

	public void modificacionAutorizacion(AutorizacionDTO autorizacionDTO,
			List<TipoAutorizacion> autorizaciones) {
		// recupero la autorizacion
		Autorizacion autorizacion = this.getAutorizacion(autorizacionDTO
				.getId());

		// elimino TODOS los tipos de autorizaciones que existen
		autorizacion.getTiposDeAutorizacion().removeAll(
				autorizacion.getTiposDeAutorizacion());
		/*
		 * for (TipoAutorizacion tipoAutorizacion : autorizacion
		 * .getTiposDeAutorizacion()) {
		 * autorizacion.removeTipoDeAutorizacion(tipoAutorizacion);
		 * //this.getHibernateTemplate().delete(tipoAutorizacion); }
		 */

		// agrego los nuevos tipos de autorizaciones
		for (TipoAutorizacion tipoAutorizacion2 : autorizaciones) {
			autorizacion.addTipoDeAutorizacion(tipoAutorizacion2);
		}

		autorizacion.setObservacion(autorizacionDTO.getObservacion());
		// this.getHibernateTemplate().saveOrUpdate(autorizacion);
	}
}
