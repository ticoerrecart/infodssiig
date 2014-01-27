package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.CategoriaDAO;
import ar.com.siig.dao.EntidadDAO;
import ar.com.siig.enums.SuperCategoriaTipoAnimal;
import ar.com.siig.enums.TipoMarcaSenial;
import ar.com.siig.negocio.AnimalEnEstablecimiento;
import ar.com.siig.negocio.Categoria;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.ProductorEnEstablecimiento;
import ar.com.siig.providers.ProviderDTO;

@Transactional(rollbackFor = { Throwable.class })
public class CategoriaFachada {

	private CategoriaDAO categoriaDAO;
	private EntidadDAO entidadDAO;

	public CategoriaFachada() {
	}

	public CategoriaFachada(CategoriaDAO categoriaDAO, EntidadDAO pEentidadDAO) {
		this.categoriaDAO = categoriaDAO;
		this.entidadDAO = pEentidadDAO;
	}

	public Categoria getCategoria(Long id) {
		return categoriaDAO.getCategoria(id);
	}

	public List<Categoria> getCategorias() {
		return categoriaDAO.getCategorias();
	}
	
	public List<Categoria> getCategorias(String marcaSenial) {
		return categoriaDAO.getCategorias(marcaSenial);
	}

	public Set<Categoria> getCategoriasPorEstablecimiento(Long idProductor, Long idEstablecimiento, String tipoMarcaSenial) {
		
		Productor productor = entidadDAO.getProductor(idProductor);
		Set<Categoria> listaCategorias = new HashSet<Categoria>();
		
		for (ProductorEnEstablecimiento prodEnEst : productor.getProductorEnEstablecimiento()) {
			if(prodEnEst.getEstablecimiento().getId().equals(idEstablecimiento)){
				
				for (AnimalEnEstablecimiento animEnEst : prodEnEst.getAnimalesEnEstablecimiento()) {
					
					if(tipoMarcaSenial.equals(TipoMarcaSenial.Marca.name()) && 
							animEnEst.getTipoAnimal().getCategoria().getSuperCategoriaTipoAnimal().getName().
							equals(SuperCategoriaTipoAnimal.GMAYOR.getName())){
						
						listaCategorias.add(animEnEst.getTipoAnimal().getCategoria());
					}
					if(tipoMarcaSenial.equals(TipoMarcaSenial.Senial.name()) && 
							animEnEst.getTipoAnimal().getCategoria().getSuperCategoriaTipoAnimal().getName().
							equals(SuperCategoriaTipoAnimal.GMENOR.getName())){
												
						listaCategorias.add(animEnEst.getTipoAnimal().getCategoria());
					}
					
				}
				
			}
		}		
		
		return listaCategorias;
	}	
}
