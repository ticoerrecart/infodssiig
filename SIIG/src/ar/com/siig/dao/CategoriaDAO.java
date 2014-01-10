package ar.com.siig.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.siig.negocio.Categoria;

public class CategoriaDAO extends HibernateDaoSupport {

	public Categoria getCategoria(Long id) {
		return (Categoria) this.getHibernateTemplate().get(Categoria.class, id);
	}

	public List<Categoria> getCategorias() {
		return getHibernateTemplate().loadAll(Categoria.class);
	}
}
