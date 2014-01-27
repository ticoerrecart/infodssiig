package ar.com.siig.fachada;

import ar.com.siig.dao.AnimalEnEstablecimientoDAO;
import ar.com.siig.dao.EntidadDAO;
import ar.com.siig.dao.EstablecimientoDAO;
import ar.com.siig.dao.TipoAnimalDAO;
import ar.com.siig.dto.AnimalEnEstablecimientoDTO;
import ar.com.siig.dto.ProductorEnEstablecimientoDTO;
import ar.com.siig.negocio.AnimalEnEstablecimiento;
import ar.com.siig.negocio.Establecimiento;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.ProductorEnEstablecimiento;
import ar.com.siig.negocio.TipoAnimal;
import ar.com.siig.providers.ProviderDominio;

public class AnimalEnEstablecimientoFachada {

	private AnimalEnEstablecimientoDAO animalEnEstablecimientoDAO;
	private EntidadDAO entidadDAO;
	private EstablecimientoDAO establecimientoDAO;
	private TipoAnimalDAO tipoAnimalDAO;
	
	public AnimalEnEstablecimientoFachada(){}
	
	public AnimalEnEstablecimientoFachada(AnimalEnEstablecimientoDAO pAnimalEnEstablecimientoDAO, EntidadDAO pEntidadDAO,
										  EstablecimientoDAO pEstablecimientoDAO, TipoAnimalDAO pTipoAnimalDAO){
		
		this.animalEnEstablecimientoDAO = pAnimalEnEstablecimientoDAO;
		this.entidadDAO = pEntidadDAO;
		this.establecimientoDAO = pEstablecimientoDAO;
		this.tipoAnimalDAO = pTipoAnimalDAO;
	}
	
	public void altaStockAnimalDeProductorEnEstablecimiento(ProductorEnEstablecimientoDTO pProductorEnEstablecimientoDTO,
															AnimalEnEstablecimientoDTO pAnimalEnEstablecimientoDTO){
		
		ProductorEnEstablecimiento productorEnEstablecimiento = null;		
		Productor productor = entidadDAO.getProductor(pProductorEnEstablecimientoDTO.getProductor().getId());
		TipoAnimal tipoAnimal = tipoAnimalDAO.getTipoAnimal(pAnimalEnEstablecimientoDTO.getTipoAnimal().getId());
		int stock = pAnimalEnEstablecimientoDTO.getStock();
		
		//Busco si el productor tiene animales en el establecimiento.
		Long idEstablecimiento = pProductorEnEstablecimientoDTO.getEstablecimiento().getId();
		for (ProductorEnEstablecimiento prodEnEst : productor.getProductorEnEstablecimiento()) {
			
			if(prodEnEst.getEstablecimiento().getId().equals(idEstablecimiento)){
				productorEnEstablecimiento = prodEnEst;
			}
		}
		
		if(productorEnEstablecimiento == null){
			Establecimiento establecimiento = establecimientoDAO.getEstablecimientoPorId(idEstablecimiento);
			productorEnEstablecimiento = ProviderDominio.getProductorEnEstablecimiento(
																				productor,establecimiento,tipoAnimal,
																				stock);
		}else{
			AnimalEnEstablecimiento animalEnEstablecimiento = ProviderDominio.getAnimalesEnEstablecimiento(
														productorEnEstablecimiento,tipoAnimal,stock);
			productorEnEstablecimiento.getAnimalesEnEstablecimiento().add(animalEnEstablecimiento);
		}
		
		productor.getProductorEnEstablecimiento().add(productorEnEstablecimiento);
	}

	public AnimalEnEstablecimiento recuperarAnimalEnEstablecimiento(Long idAnimalEnEstablecimiento){
		
		return animalEnEstablecimientoDAO.recuperarAnimalEnEstablecimiento(idAnimalEnEstablecimiento);
	}
	
	public void modificacionStockAnimalDeProductorEnEstablecimiento(AnimalEnEstablecimientoDTO animalEnEstablecimiento){
		
		AnimalEnEstablecimiento a = animalEnEstablecimientoDAO.recuperarAnimalEnEstablecimiento(animalEnEstablecimiento.getId());
		a.setStock(animalEnEstablecimiento.getStock());
	}
}
