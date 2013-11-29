package ar.com.siig.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.Autorizado;

public class AutorizadoDAO extends HibernateDaoSupport {

	public List<Autorizado> getAutorizados() {
		return getHibernateTemplate().loadAll(Autorizado.class);
	}

	public Autorizado getAutorizado(Long id) {
		return (Autorizado) getHibernateTemplate().get(Autorizado.class, id);
	}
}
