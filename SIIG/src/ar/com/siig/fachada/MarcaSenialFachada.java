package ar.com.siig.fachada;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.MarcaSenialDAO;
import ar.com.siig.dto.MarcaSenialDTO;
import ar.com.siig.enums.TipoMarcaSenial;
import ar.com.siig.negocio.CanonMarcaSenial;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.Marca;
import ar.com.siig.negocio.Senial;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.InputOutput;
import ar.com.siig.utils.MyLogger;

@Transactional(rollbackFor = { Throwable.class })
public class MarcaSenialFachada {

	private MarcaSenialDAO marcaSenialDAO;
	private EntidadFachada entidadFachada;
	
	public MarcaSenialFachada(){}
	
	public MarcaSenialFachada(MarcaSenialDAO pMarcaSenialDAO, EntidadFachada entidadFachada){
		
		this.marcaSenialDAO = pMarcaSenialDAO;
		this.entidadFachada = entidadFachada;
	}

	public MarcaSenialDAO getMarcaSenialDAO() {
		return marcaSenialDAO;
	}

	public void setMarcaSenialDAO(MarcaSenialDAO marcaSenialDAO) {
		this.marcaSenialDAO = marcaSenialDAO;
	}
	
	public EntidadFachada getEntidadFachada() {
		return entidadFachada;
	}

	public void setEntidadFachada(EntidadFachada entidadFachada) {
		this.entidadFachada = entidadFachada;
	}

	public List<TipoMarcaSenial> recuperarTipoMarcaSenial(){
		
		List<TipoMarcaSenial> tipoMarcaSenial = new ArrayList<TipoMarcaSenial>();
		tipoMarcaSenial.add(TipoMarcaSenial.Marca);
		tipoMarcaSenial.add(TipoMarcaSenial.Senial);

		return tipoMarcaSenial;		
	}
	
	public List<CanonMarcaSenial> recuperarCanonMarcaSenial(){
		
		return marcaSenialDAO.recuperarCanonMarcaSenial();
	}
	
	public CanonMarcaSenial recuperarCanonMarcaSenial(Long id){
		
		return marcaSenialDAO.recuperarCanonMarcaSenial(id);
	}

	public CanonMarcaSenial recuperarCanonMarcaSenial(String tipo){
				
		return marcaSenialDAO.recuperarCanonMarcaSenial(TipoMarcaSenial.valueOf(tipo).getDescripcion());
	}
	
	public void modificarCanonMarcaSenial(CanonMarcaSenial canonMarcaSenial){
		
		CanonMarcaSenial canonMS = this.recuperarCanonMarcaSenial(canonMarcaSenial.getId());
		canonMS.setMonto(canonMarcaSenial.getMonto());
	}
	
	public void altaRenovacionMarcaSenial(MarcaSenialDTO marcaSenialDTO){
		
		Entidad productor = this.getEntidadFachada().getEntidad(marcaSenialDTO.getProductor().getId());
				
		if(TipoMarcaSenial.Marca.getName().equals(marcaSenialDTO.getTipo())){
			productor.getMarcas().add(ProviderDominio.getMarca(marcaSenialDTO,productor));
		}else{
			productor.getSeniales().add(ProviderDominio.getSenial(marcaSenialDTO,productor));
		}
	}
	
	public String registrarPagoBoletaDeposito(Long idMarcaSenial, String fechaPago, String tipo) 
		throws NegocioException
	{
		try{
			return marcaSenialDAO.registrarPagoBoletaDeposito(idMarcaSenial,fechaPago,tipo);
		} catch (Throwable t) {
			MyLogger.logError(t);
			throw new NegocioException("Error Inesperado");
		}			
	}
	
	public MarcaSenialDTO getMarcaDTO(Long idProductor) throws IOException, SQLException{
		
		WebContext ctx = WebContextFactory.get();
		HttpServletRequest req = ctx.getHttpServletRequest();
		String path = req.getServletContext().getRealPath("imagenes");		
		
		Marca marca = marcaSenialDAO.getMarcaDTO(idProductor);
		if(marca != null){

			FileOutputStream fos = new FileOutputStream(new File(path+
					File.separatorChar+marca.getNombreImagen()));			
			InputOutput.copyStream(marca.getImagen().getBinaryStream(),fos);
			
			MarcaSenialDTO m = ProviderDTO.getMarcaSenialDTO(marca);
			//m.setNombreImagen(path+File.separatorChar+marca.getNombreImagen());
			//m.setNombreImagen(".."+File.separatorChar+".."+File.separatorChar+"imagenes"+File.separatorChar+marca.getNombreImagen());
			m.setNombreImagen(marca.getNombreImagen());
			return m;
		}
		return null;
	}
	
	public MarcaSenialDTO getSenialDTO(Long idProductor) throws IOException, SQLException{
		
		WebContext ctx = WebContextFactory.get();
		HttpServletRequest req = ctx.getHttpServletRequest();
		String path = req.getServletContext().getRealPath("imagenes");		
		
		Senial senial = marcaSenialDAO.getSenialDTO(idProductor);
		if(senial != null){
		
			FileOutputStream fos = new FileOutputStream(new File(path+
					File.separatorChar+senial.getNombreImagen()));			
			InputOutput.copyStream(senial.getImagen().getBinaryStream(),fos);			
			
			MarcaSenialDTO s = ProviderDTO.getMarcaSenialDTO(senial);
			//s.setNombreImagen(".."+File.separatorChar+".."+File.separatorChar+"imagenes"+File.separatorChar+senial.getNombreImagen());
			s.setNombreImagen(senial.getNombreImagen());
			return s;
		}
		return null;
	}
}
