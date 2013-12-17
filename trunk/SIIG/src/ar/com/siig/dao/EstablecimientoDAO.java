package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.Establecimiento;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.Constantes;

public class EstablecimientoDAO extends HibernateDaoSupport {

	public List<Establecimiento> getEstablecimientos() {

		return getHibernateTemplate().loadAll(Establecimiento.class);
	}

	public Establecimiento getEstablecimientoPorId(Long id) {

		return (Establecimiento) getHibernateTemplate().get(
				Establecimiento.class, id);
	}

	public boolean existeEstablecimiento(String nombre, Long id) {
		Criteria criteria = getSession().createCriteria(Establecimiento.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("nombre", nombre));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Establecimiento> establecimientos = criteria.list();
		return (establecimientos.size() > 0);
	}

	public void alta_modficacion_Establecimiento(Establecimiento establecimiento)
			throws NegocioException {

		try {
			if (existeEstablecimiento(establecimiento.getNombre(),
					establecimiento.getId())) {
				throw new NegocioException(Constantes.EXISTE_ESTABLECIMIENTO);
			}
			this.getHibernateTemplate().saveOrUpdate(establecimiento);
			this.getHibernateTemplate().flush();
			this.getHibernateTemplate().clear();

		} catch (Exception e) {
			throw new NegocioException(Constantes.ERROR_ALTA_ESTABLECIMIENTO);
		}
	}

	public boolean existeEstablecimiento(String nombre, Long id,
			Long idLocalidad) {
		Criteria criteria = getSession().createCriteria(Establecimiento.class);
		criteria.createAlias("localidad", "loc");
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("nombre", nombre));
		conj.add(Restrictions.eq("loc.id", idLocalidad));

		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Establecimiento> establecimientos = criteria.list();
		return (establecimientos.size() > 0);
	}

	public List<Establecimiento> getEstablecimientosDeLocalidad(Long idLocalidad) {

		Criteria criteria = getSession().createCriteria(Establecimiento.class);
		criteria.createAlias("localidad", "loc");
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("loc.id", idLocalidad));
		criteria.add(conj);

		List<Establecimiento> establecimientos = criteria.list();
		return establecimientos;
	}

}
