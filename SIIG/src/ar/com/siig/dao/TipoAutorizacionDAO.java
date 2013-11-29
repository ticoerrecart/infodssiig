package ar.com.siig.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.TipoAutorizacion;

public class TipoAutorizacionDAO extends HibernateDaoSupport {

	public List<TipoAutorizacion> getTiposAutorizacion() {
		return getHibernateTemplate().loadAll(TipoAutorizacion.class);
	}

	public TipoAutorizacion getTipoAutorizacion(Long id) {
		return (TipoAutorizacion) getHibernateTemplate().get(
				TipoAutorizacion.class, id);
	}
}
