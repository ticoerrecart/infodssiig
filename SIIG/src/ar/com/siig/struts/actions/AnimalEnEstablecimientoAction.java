package ar.com.siig.struts.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.fachada.CategoriaFachada;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.fachada.EstablecimientoFachada;
import ar.com.siig.struts.actions.forms.AnimalEnEstablecimientoForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class AnimalEnEstablecimientoAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarStockAnimalDeProductorEnEstablecimiento(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarStockAnimalDeProductorEnEstablecimiento";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");
			EstablecimientoFachada establecimientoFachada = 
							(EstablecimientoFachada) ctx.getBean("establecimientoFachada");
			CategoriaFachada categoriaFachada = (CategoriaFachada) ctx.getBean("categoriaFachada");
			
			request.setAttribute("productores", entidadFachada.getProductoresDTO());
			request.setAttribute("establecimientos", establecimientoFachada.getEstablecimientosDTO());
			request.setAttribute("categorias",categoriaFachada.getCategorias());
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	} 
	
	@SuppressWarnings("unchecked")
	public ActionForward altaStockAnimalDeProductorEnEstablecimiento(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoAltaStockAnimalDeProductorEnEstablecimiento";

		try {
			AnimalEnEstablecimientoForm animalEnEstablecimientoForm = (AnimalEnEstablecimientoForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			
			
			request.setAttribute("exitoGrabado",
					Constantes.EXITO_ALTA_STOCK);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}
	
	public boolean validarAltaStockAnimalForm(StringBuffer error, ActionForm form) {
		try {	
			AnimalEnEstablecimientoForm animalEnEstablecimientoForm = (AnimalEnEstablecimientoForm) form;
				
			boolean ok1 = false;
			boolean ok2 = false;
			boolean ok3 = false;
			boolean ok4 = false;

			ok1 = Validator.validarComboRequeridoSinNull("-1",Long.toString(
					 animalEnEstablecimientoForm.getProductorEnEstablecimiento().getProductor().getId()),
					 "Productor",error);	
			
			ok2 = Validator.validarComboRequeridoSinNull("-1",Long.toString(
					 animalEnEstablecimientoForm.getProductorEnEstablecimiento().getEstablecimiento().getId()),
					 "Establecimiento",error);			

			ok3 = Validator.requerido(animalEnEstablecimientoForm.getAnimalEnEstablecimiento().getTipoAnimal().getId(), 
									  "Tipo Productor",error);
			if(ok3){
				ok3 = Validator.validarComboRequeridoSinNull("-1",Long.toString(
						 animalEnEstablecimientoForm.getAnimalEnEstablecimiento().getTipoAnimal().getId()),
						 "Tipo Productor",error);			
			}
			
			ok4 = Validator.validarLongMayorQue(0, Integer.toString(
							animalEnEstablecimientoForm.getAnimalEnEstablecimiento().getStock()),"Stock", error);
			
			return ok1 && ok2 && ok3 && ok4;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}
}
