package ar.com.siig.fachada;

import java.util.List;

import ar.com.siig.dao.MenuDAO;
import ar.com.siig.negocio.ItemMenu;
import ar.com.siig.negocio.exception.DataBaseException;
import ar.com.siig.negocio.exception.NegocioException;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class MenuFachada{

	private MenuDAO menuDAO;

	/**
	 * Constructor por defecto.
	 * 
	 */
	public MenuFachada() {
	}

	public MenuFachada(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	public List<ItemMenu> getItemsMenu(String pRol) throws NegocioException {

		try{
			return menuDAO.getItemsMenu(pRol);
		
		} catch (DataBaseException e) {
			throw new NegocioException(e.getMessage());
		}			
	}

}
