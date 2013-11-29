package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.dto.AutorizacionDTO;
import ar.com.siig.negocio.Autorizacion;

public class AutorizacionDAO extends HibernateDaoSupport {

	public void altaAutorizacion(Autorizacion autorizacion) {
		this.getHibernateTemplate().saveOrUpdate(autorizacion);
	}

	public boolean existeAutorizacion(AutorizacionDTO autorizacionDTO) {
		Criteria criteria = getSession().createCriteria(Autorizacion.class);
		/*
		 * criteria.createAlias("tiposDeAutorizacion", "ta"); List<Long>
		 * tiposDeAutorizacionIds = new ArrayList<Long>(); for
		 * (TipoAutorizacionDTO dto : autorizacionDTO.getTiposDeAutorizacion())
		 * { if (dto != null) { tiposDeAutorizacionIds.add(dto.getId()); } }
		 */

		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("productor.id", autorizacionDTO.getProductor()
				.getId()));
		conj.add(Restrictions.eq("autorizado.id", autorizacionDTO
				.getAutorizado().getId()));
		// conj.add(Restrictions.in("ta.id", tiposDeAutorizacionIds));
		criteria.add(conj);

		List<Autorizacion> autorizaciones = criteria.list();
		return autorizaciones.size() > 0;
	}
}
