package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.CanonMarcaSenial;

public class MarcaSenialDAO extends HibernateDaoSupport {

	public List<CanonMarcaSenial> recuperarCanonMarcaSenial(){
		
		Criteria criteria = getSession().createCriteria(CanonMarcaSenial.class);
		List<CanonMarcaSenial> lista = criteria.list();
		
		return lista;
	}	
	
	public CanonMarcaSenial recuperarCanonMarcaSenial(Long id){
		
		return (CanonMarcaSenial) getHibernateTemplate().get(CanonMarcaSenial.class, id);
	}	
}
