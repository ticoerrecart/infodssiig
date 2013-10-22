package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateSystemException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.Constantes;

public class LocalidadDAO extends HibernateDaoSupport {

	public List<Localidad> getLocalidades(){

		return getHibernateTemplate().loadAll(Localidad.class);
	}

	public Localidad getLocalidadPorId(Long id){

		return (Localidad) getHibernateTemplate().get(Localidad.class, id);		
	}

	public boolean existeLocalidad(String nombre, Long id) {
		Criteria criteria = getSession().createCriteria(Localidad.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("nombre", nombre));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Localidad> localidades = criteria.list();
		return (localidades.size() > 0);
	}

	public void alta_modficacion_Localidad(Localidad localidad) throws NegocioException {

		try{
			if (existeLocalidad(localidad.getNombre(), localidad.getId())) {
				throw new NegocioException(Constantes.EXISTE_LOCALIDAD);
			}
			this.getHibernateTemplate().saveOrUpdate(localidad);
			this.getHibernateTemplate().flush();
			this.getHibernateTemplate().clear();
			
		} catch (HibernateException he) {
			throw new NegocioException(Constantes.ERROR_ALTA_LOCALIDAD);
		} catch (HibernateSystemException he) {
			throw new NegocioException(Constantes.ERROR_ALTA_LOCALIDAD);
		} catch (Exception e) {
			throw new NegocioException(Constantes.ERROR_ALTA_LOCALIDAD);
		}			
	}
	
}