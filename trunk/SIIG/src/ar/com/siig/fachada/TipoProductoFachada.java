package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.List;

import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.dao.TipoProductoDAO;
import ar.com.siig.dto.TipoProductoDTO;
import ar.com.siig.negocio.TipoProducto;
import ar.com.siig.providers.ProviderDTO;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class TipoProductoFachada{

	private TipoProductoDAO tipoProductoDAO;
	
	public TipoProductoFachada(){}
	
	public TipoProductoFachada(TipoProductoDAO pTipoProductoDAO){
		this.tipoProductoDAO = pTipoProductoDAO;
	}
	
	public TipoProductoDTO recuperarTipoProductoDTO(long id) {

		TipoProducto tipoProducto = tipoProductoDAO.recuperarTipoProducto(id);
		
		return ProviderDTO.getTipoProductoDTO(tipoProducto);
	}

	public List<TipoProductoDTO> recuperarTiposProductoDTO(){
		
		List<TipoProductoDTO> tiposProductoDTO = new ArrayList<TipoProductoDTO>();
		List<TipoProducto> tiposProducto = tipoProductoDAO.recuperarTiposProducto();
		for (TipoProducto tipoProducto : tiposProducto) {
			tiposProductoDTO.add(ProviderDTO.getTipoProductoDTO(tipoProducto));
		}
		return tiposProductoDTO;		
	}	
	
	public void modificacionTipoProducto(TipoProductoDTO tipoProductoDTO)throws NegocioException{
		
		TipoProducto tipoProducto = tipoProductoDAO.recuperarTipoProducto(tipoProductoDTO.getId());
		tipoProductoDAO.modificacionTipoProducto(tipoProducto);
	}
}
