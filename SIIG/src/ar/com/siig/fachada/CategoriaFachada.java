package ar.com.siig.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.CategoriaDAO;
import ar.com.siig.negocio.Categoria;

@Transactional(rollbackFor = { Throwable.class })
public class CategoriaFachada {

	private CategoriaDAO categoriaDAO;

	public CategoriaFachada() {
	}

	public CategoriaFachada(CategoriaDAO categoriaDAO) {
		this.categoriaDAO = categoriaDAO;
	}

	public Categoria getCategoria(Long id) {
		return categoriaDAO.getCategoria(id);
	}

	public List<Categoria> getCategorias() {
		return categoriaDAO.getCategorias();
	}
}
