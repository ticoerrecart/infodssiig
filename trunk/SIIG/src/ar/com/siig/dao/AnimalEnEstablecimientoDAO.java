package ar.com.siig.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.AnimalEnEstablecimiento;

public class AnimalEnEstablecimientoDAO extends HibernateDaoSupport {

	public AnimalEnEstablecimiento recuperarAnimalEnEstablecimiento(Long idAnimalEnEstablecimiento){
		
		return (AnimalEnEstablecimiento)getHibernateTemplate().get(
											AnimalEnEstablecimiento.class,idAnimalEnEstablecimiento);
	}
}
