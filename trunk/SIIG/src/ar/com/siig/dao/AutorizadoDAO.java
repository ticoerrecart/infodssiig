package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.Autorizado;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.Constantes;

public class AutorizadoDAO extends HibernateDaoSupport {

	public List<Autorizado> getAutorizados() {
		return getHibernateTemplate().loadAll(Autorizado.class);
	}

	public Autorizado getAutorizado(Long id) {
		return (Autorizado) getHibernateTemplate().get(Autorizado.class, id);
	}

	public boolean existeAutorizado(String nombre, Integer dni, Long id) {
		Criteria criteria = getSession().createCriteria(Autorizado.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.or(Restrictions.eq("nombre", nombre),
				Restrictions.eq("dni", dni)));

		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Autorizado> autorizados = criteria.list();
		return (autorizados.size() > 0);
	}

	public void altaAutorizado(Autorizado autorizado) throws NegocioException {
		if (existeAutorizado(autorizado.getNombre(), autorizado.getDni(),
				autorizado.getId())) {
			throw new NegocioException(Constantes.EXISTE_AUTORIZADO);
		}
		this.getHibernateTemplate().saveOrUpdate(autorizado);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}

}
