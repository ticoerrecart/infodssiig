package ar.com.siig.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.MarcaSenialDAO;
import ar.com.siig.negocio.CanonMarcaSenial;

@Transactional(rollbackFor = { Throwable.class })
public class MarcaSenialFachada {

	private MarcaSenialDAO marcaSenialDAO;
	
	public MarcaSenialFachada(){}
	
	public MarcaSenialFachada(MarcaSenialDAO pMarcaSenialDAO){
		
		this.marcaSenialDAO = pMarcaSenialDAO;
	}

	public MarcaSenialDAO getMarcaSenialDAO() {
		return marcaSenialDAO;
	}

	public void setMarcaSenialDAO(MarcaSenialDAO marcaSenialDAO) {
		this.marcaSenialDAO = marcaSenialDAO;
	}
	
	public List<CanonMarcaSenial> recuperarCanonMarcaSenial(){
		
		return marcaSenialDAO.recuperarCanonMarcaSenial();
	}
	
	public CanonMarcaSenial recuperarCanonMarcaSenial(Long id){
		
		return marcaSenialDAO.recuperarCanonMarcaSenial(id);
	}
	
	public void modificarCanonMarcaSenial(CanonMarcaSenial canonMarcaSenial){
		
		CanonMarcaSenial canonMS = this.recuperarCanonMarcaSenial(canonMarcaSenial.getId());
		canonMS.setMonto(canonMarcaSenial.getMonto());
	}
}
