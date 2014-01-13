package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.Guia;

public class GuiaDAO extends HibernateDaoSupport {

	public boolean existeGuia(long nroGuia) {

		Criteria criteria = getSession().createCriteria(Guia.class);
		criteria.add(Restrictions.eq("numero", nroGuia));
 
		List<Guia> guias = criteria.list();

		return (guias.size() > 0);
	}
	
	public void altaLegalizacionGuia(Guia guia){
		
		this.getHibernateTemplate().saveOrUpdate(guia);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();		
	}
	
	public List<Guia> recuperarLegalizacionGuias(Long idProductor, String periodo){
		
		Criteria criteria = getSession().createCriteria(Guia.class);
		criteria.add(Restrictions.eq("productor.id", idProductor));
		criteria.add(Restrictions.eq("periodo", periodo));
 
		List<Guia> guias = criteria.list();	
		
		return guias;
	}	
	
	public Guia recuperarGuia(Long idGuia){
		
		return (Guia)getHibernateTemplate().get(Guia.class,idGuia);
	}	
}
