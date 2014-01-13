package ar.com.siig.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.EntidadDAO;
import ar.com.siig.dao.GuiaDAO;
import ar.com.siig.dto.GuiaDTO;
import ar.com.siig.enums.TipoMarcaSenial;
import ar.com.siig.negocio.Guia;
import ar.com.siig.negocio.Productor;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class GuiaFachada {

	private GuiaDAO guiaDAO;
	private EntidadDAO entidadDAO;
	
	public GuiaFachada(){}
	
	public GuiaFachada(GuiaDAO pGuiaDAO, EntidadDAO pEntidadDAO){
		
		this.guiaDAO = pGuiaDAO;
		this.entidadDAO = pEntidadDAO;
	}
	
	public boolean existeGuia(long nroGuia) {
		return guiaDAO.existeGuia(nroGuia);
	}
	
	public void altaLegalizacionGuia(GuiaDTO guiaDTO){
		
		Guia guia;
		Productor productor = entidadDAO.getProductor(guiaDTO.getProductor().getId());
		if(guiaDTO.getMarcaSenial().getTipo().equals(TipoMarcaSenial.Marca.getName())){
			guia = ProviderDominio.getGuia(guiaDTO,productor.getUltimaMarca(),productor,null);
		}else{
			guia = ProviderDominio.getGuia(guiaDTO,null,productor,productor.getUltimaSenial());
		}
		
		guiaDAO.altaLegalizacionGuia(guia);
	}
	
	public List<Guia> recuperarLegalizacionGuias(Long idProductor, String periodo){
		
		return guiaDAO.recuperarLegalizacionGuias(idProductor,periodo);
	}
	
	public Guia recuperarGuia(Long idGuia){
		
		return guiaDAO.recuperarGuia(idGuia);
	}
	
	public GuiaDTO recuperarGuiaDTO(Long idGuia){
		
		Guia guia = guiaDAO.recuperarGuia(idGuia);
		return ProviderDTO.getGuiaDTO(guia);
	}
}
