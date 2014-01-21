package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.CategoriaDAO;
import ar.com.siig.dao.TipoAnimalDAO;
import ar.com.siig.dto.TipoAnimalDTO;
import ar.com.siig.negocio.Categoria;
import ar.com.siig.negocio.TipoAnimal;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class TipoAnimalFachada {

	private TipoAnimalDAO tipoAnimalDAO;
	private CategoriaDAO categoriaDAO;

	public TipoAnimalFachada() {
	}

	public TipoAnimalFachada(TipoAnimalDAO tipoAnimalDAO,
			CategoriaDAO categoriaDAO) {
		this.tipoAnimalDAO = tipoAnimalDAO;
		this.categoriaDAO = categoriaDAO;
	}

	public boolean existeTipoAnimal(TipoAnimalDTO tipoAnimalDTO) {
		return tipoAnimalDAO.existeTipoAnimal(tipoAnimalDTO.getDescripcion(),
				tipoAnimalDTO.getIdCategoria(), tipoAnimalDTO.getId());
	}

	public void altaTipoAnimal(TipoAnimalDTO tipoAnimalDTO)
			throws NegocioException {
		Categoria categoria = categoriaDAO.getCategoria(tipoAnimalDTO
				.getIdCategoria());
		TipoAnimal tipoAnimal = ProviderDominio.getTipoAnimal(tipoAnimalDTO,
				categoria);
		tipoAnimalDAO.altaTipoAnimal(tipoAnimal);
	}

	public List<TipoAnimalDTO> getTipoAnimalesDTO() {
		List<TipoAnimal> tipoAnimales = tipoAnimalDAO.getTipoAnimales();
		List<TipoAnimalDTO> tipoAnimalesDTO = new ArrayList<TipoAnimalDTO>();

		for (TipoAnimal tipoAnimal : tipoAnimales) {
			TipoAnimalDTO dto = ProviderDTO.getTipoAnimalDTO(tipoAnimal);
			tipoAnimalesDTO.add(dto);
		}

		return tipoAnimalesDTO;
	}

	public TipoAnimalDTO getTipoAnimalDTO(Long id) {
		TipoAnimal tipoAnimal = tipoAnimalDAO.getTipoAnimal(id);
		return ProviderDTO.getTipoAnimalDTO(tipoAnimal);
	}

	public void modificacionTipoAnimal(TipoAnimalDTO tipoAnimalDTO)
			throws NegocioException {
		TipoAnimal tipoAnimal = tipoAnimalDAO.getTipoAnimal(tipoAnimalDTO
				.getId());
		tipoAnimal.setDescripcion(tipoAnimalDTO.getDescripcion());
		Categoria categoria = categoriaDAO.getCategoria(tipoAnimalDTO
				.getIdCategoria());
		tipoAnimal.setCategoria(categoria);
		tipoAnimal.setValor(Double.valueOf(tipoAnimalDTO.getValor()));

		tipoAnimalDAO.modificacionTipoAnimal(tipoAnimal);
	}
	
	public List<TipoAnimalDTO> getTipoAnimalDTOPorCategoria(Long idCategoria){
		
		List<TipoAnimal> tipoAnimales = tipoAnimalDAO.getTipoAnimalPorCategoria(idCategoria);
		List<TipoAnimalDTO> tipoAnimalesDTO = new ArrayList<TipoAnimalDTO>();

		for (TipoAnimal tipoAnimal : tipoAnimales) {
			TipoAnimalDTO dto = ProviderDTO.getTipoAnimalDTO(tipoAnimal);
			tipoAnimalesDTO.add(dto);
		}

		return tipoAnimalesDTO;		
	}
}
