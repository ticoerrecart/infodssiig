package ar.com.siig.dao;

import java.util.Collections;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.enums.TipoDeEntidad;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.Guia;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.RecursosNaturales;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.Constantes;

public class EntidadDAO extends HibernateDaoSupport {

	public void altaEntidad(Entidad laEntidad) throws NegocioException {

		if (existeEntidad(laEntidad.getNombre(), laEntidad.getId())) {
			throw new NegocioException(Constantes.EXISTE_ENTIDAD);
		}
		this.getHibernateTemplate().saveOrUpdate(laEntidad);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}

	public boolean existeEntidad(String nombre, Long id) {
		Criteria criteria = getSession().createCriteria(Entidad.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("nombre", nombre));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Entidad> entidades = criteria.list();
		return (entidades.size() > 0);
	}

	public Entidad getEntidadPorNombre(String nombre) {

		Criteria criteria = getSession().createCriteria(Entidad.class);
		criteria.add(Restrictions.eq("nombre", nombre));

		List<Entidad> entidades = criteria.list();
		if (entidades.size() > 0) {
			return entidades.get(0);
		} else {
			return null;
		}
	}

	public List<Entidad> getEntidades() {

		return getHibernateTemplate().loadAll(Entidad.class);
	}

	public Entidad getEntidad(Long id) {

		return (Entidad) getHibernateTemplate().get(Entidad.class, id);
	}

	public List<Entidad> getEntidades(Long idLocalidad) {

		Localidad localidad = (Localidad) getHibernateTemplate().get(
				Localidad.class, idLocalidad);

		Criteria criteria = getSession().createCriteria(Productor.class);
		criteria.add(Restrictions.eq("localidad", localidad));
		List<Entidad> productores = criteria.list();

		return productores;
	}

	public List<Entidad> getEntidades(TipoDeEntidad tipoDeEntidad) {

		List<Entidad> productores = null;
		/*
		 * Criteria criteria = null; if (tipoDeEntidad == TipoDeEntidad.PRD) {
		 * criteria = getSession().createCriteria(Productor.class); productores
		 * = criteria.list(); }
		 */

		Criteria criteria = getSession().createCriteria(
				tipoDeEntidad.getClase());
		productores = criteria.list();

		return productores;
	}

	public List<Entidad> getOficinas() {

		List<Entidad> oficinas = null;
		Criteria criteria = getSession()
				.createCriteria(RecursosNaturales.class);
		oficinas = criteria.list();

		return oficinas;
	}

	public void modificacionEntidad(Entidad entidad) {

		this.getHibernateTemplate().saveOrUpdate(entidad);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}

	public List<Entidad> getProductores() {

		Criteria criteria = getSession().createCriteria(Productor.class);
		List<Entidad> productores = criteria.list();

		Collections.sort(productores);
		return productores;
	}

	public Productor getProductor(Long id) {

		return (Productor) getHibernateTemplate().get(Productor.class, id);
	}
	
	public long recuperarCantGuias(Long idProdcutor, String periodo){
		
		Criteria criteria = getSession().createCriteria(Guia.class);
		criteria.add(Restrictions.eq("periodo", periodo));
		criteria.add(Restrictions.eq("productor.id", idProdcutor));
		List<Guia> guias = criteria.list();

		return guias.size();
	}	
}
