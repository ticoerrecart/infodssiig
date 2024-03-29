package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.Periodo;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.Constantes;

public class PeriodoDAO extends HibernateDaoSupport {

	public List<Periodo> getPeriodos() {

		Criteria criteria = getSession().createCriteria(Periodo.class);
		criteria.addOrder(Order.desc("periodo"));

		return (List<Periodo>) criteria.list();
	}

	public Periodo getPeriodoPorId(Long id) {

		return (Periodo) getHibernateTemplate().get(Periodo.class, id);
	}

	public boolean existePeriodo(String periodo, Long id) {
		Criteria criteria = getSession().createCriteria(Periodo.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("periodo", periodo));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Periodo> periodos = criteria.list();
		return (periodos.size() > 0);
	}

	public Periodo getPeriodoPorPeriodo(String periodo) {
		Criteria criteria = getSession().createCriteria(Periodo.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("periodo", periodo));
		criteria.add(conj);
		List<Periodo> periodos = criteria.list();
		return periodos.get(0);
	}

	public void alta_modficacion_Periodo(Periodo periodo)
			throws NegocioException {

		if (existePeriodo(periodo.getPeriodo(), periodo.getId())) {
			throw new NegocioException(Constantes.EXISTE_PERIODO);
		}
		this.getHibernateTemplate().saveOrUpdate(periodo);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}

}
