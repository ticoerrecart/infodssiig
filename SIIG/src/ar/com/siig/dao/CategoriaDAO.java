package ar.com.siig.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.enums.SuperCategoriaTipoAnimal;
import ar.com.siig.enums.TipoMarcaSenial;
import ar.com.siig.negocio.Categoria;

public class CategoriaDAO extends HibernateDaoSupport {

	public Categoria getCategoria(Long id) {
		return (Categoria) this.getHibernateTemplate().get(Categoria.class, id);
	}

	public List<Categoria> getCategorias() {
		return getHibernateTemplate().loadAll(Categoria.class);
	}
	
	public List<Categoria> getCategorias(String marcaSenial) {
		
		Criteria c = this.getSession().createCriteria(Categoria.class);
		
		if(marcaSenial.equals(TipoMarcaSenial.Marca.name())){
			c.add(Restrictions.eq("superCategoriaTipoAnimal", SuperCategoriaTipoAnimal.GMAYOR));
		}else{
			c.add(Restrictions.eq("superCategoriaTipoAnimal", SuperCategoriaTipoAnimal.GMENOR));
		}	
		
		return c.list();		
	}	
}
