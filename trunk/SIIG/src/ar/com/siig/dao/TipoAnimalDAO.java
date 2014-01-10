package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.TipoAnimal;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.Constantes;

public class TipoAnimalDAO extends HibernateDaoSupport {

	public boolean existeTipoAnimal(String descripcion, Long idCategoria,
			Long idTipoAnimal) {
		Criteria criteria = getSession().createCriteria(TipoAnimal.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("descripcion", descripcion));
		conj.add(Restrictions.eq("categoria.id", idCategoria));

		if (idTipoAnimal != null) {
			conj.add(Restrictions.ne("id", idTipoAnimal));
		}
		criteria.add(conj);

		List<TipoAnimal> tipoAnimales = criteria.list();
		return (tipoAnimales.size() > 0);
	}

	public void altaTipoAnimal(TipoAnimal tipoAnimal) throws NegocioException {
		if (existeTipoAnimal(tipoAnimal.getDescripcion(), tipoAnimal
				.getCategoria().getId(), tipoAnimal.getId())) {
			throw new NegocioException(Constantes.EXISTE_TIPO_ANIMAL);
		}
		this.getHibernateTemplate().saveOrUpdate(tipoAnimal);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}

	public List<TipoAnimal> getTipoAnimales() {
		Criteria c = this.getSession().createCriteria(TipoAnimal.class);
		c.createAlias("categoria", "categoria");
		c.addOrder(Order.asc("categoria.superCategoriaTipoAnimal"));
		c.addOrder(Order.asc("descripcion"));
		return c.list();
	}

	public TipoAnimal getTipoAnimal(Long id) {
		return (TipoAnimal) this.getHibernateTemplate().get(TipoAnimal.class,
				id);
	}

	public void modificacionTipoAnimal(TipoAnimal tipoAnimal)
			throws NegocioException {
		if (existeTipoAnimal(tipoAnimal.getDescripcion(), tipoAnimal
				.getCategoria().getId(), tipoAnimal.getId())) {
			throw new NegocioException(Constantes.EXISTE_TIPO_ANIMAL);
		}
		this.getHibernateTemplate().saveOrUpdate(tipoAnimal);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}
}
