package ar.com.siig.struts.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.AnimalEnEstablecimientoDTO;
import ar.com.siig.dto.ProductorEnEstablecimientoDTO;
import ar.com.siig.fachada.AnimalEnEstablecimientoFachada;
import ar.com.siig.fachada.CategoriaFachada;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.fachada.EstablecimientoFachada;
import ar.com.siig.negocio.AnimalEnEstablecimiento;
import ar.com.siig.negocio.Productor;
import ar.com.siig.negocio.ProductorEnEstablecimiento;
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
			AnimalEnEstablecimientoFachada animalEnEstablecimientoFachada = (AnimalEnEstablecimientoFachada)
																ctx.getBean("animalEnEstablecimientoFachada");
			
			AnimalEnEstablecimientoDTO animalEnEstablecimientoDTO = 
												animalEnEstablecimientoForm.getAnimalEnEstablecimiento();
			
			ProductorEnEstablecimientoDTO productorEnEstablecimientoDTO = 
												animalEnEstablecimientoForm.getProductorEnEstablecimiento();
			
			// valido nuevamente por seguridad.  
			if (!validarAltaStockAnimalForm(new StringBuffer(), animalEnEstablecimientoForm)) {
				throw new Exception("Error de Seguridad");
			}
			
			animalEnEstablecimientoFachada.altaStockAnimalDeProductorEnEstablecimiento(
																			productorEnEstablecimientoDTO,
																			animalEnEstablecimientoDTO);
			
			request.setAttribute("exitoGrabado",Constantes.EXITO_ALTA_STOCK);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward cargarConsultaModificacionStockAnimal(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarConsultaModificacionStockAnimal";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			String tipo = request.getParameter("tipo");
			EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");
			
			request.setAttribute("productores", entidadFachada.getProductoresDTO());
			
			if(tipo.equals("c")){
				request.setAttribute("titulo", "Consulta de Stock Animal en Establecimiento");
				/*request.setAttribute("paramUrlDetalle",
						"../../animalEnEstablecimiento.do?metodo=recuperarStockAnimalesConsultaModificacion");*/
				request.setAttribute("urlSeleccionGuia","");				
			}else{
				request.setAttribute("titulo", "Modificación de Stock Animal en Establecimiento");
				/*request.setAttribute("paramUrlDetalle",
						"../../animalEnEstablecimiento.do?metodo=recuperarStockAnimalesConsultaModificacion");*/
				request.setAttribute("urlSeleccionGuia","cargarStockAnimalModificacion");				
			}	
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarStockAnimalesConsultaModificacion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strForward = "exitoRecuperarStockAnimalesConsultaModificacion";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");
			
			String idProductor = request.getParameter("idProductor");			
			String urlSeleccionGuia = request.getParameter("urlSeleccionGuia");
			
			Productor productor = entidadFachada.getProductor(Long.valueOf(idProductor));
			
			request.setAttribute("productorEnEstablecimiento", productor.getProductorEnEstablecimiento());
			request.setAttribute("urlSeleccionGuia", urlSeleccionGuia);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		

	@SuppressWarnings("unchecked")
	public ActionForward cargarStockAnimalModificacion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strForward = "exitoCargarStockAnimalModificacion";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			AnimalEnEstablecimientoFachada animalEnEstablecimientoFachada = (AnimalEnEstablecimientoFachada)
																ctx.getBean("animalEnEstablecimientoFachada");
			
			String idAnimalEnEstablecimiento = request.getParameter("idAnimalEnEstablecimiento");			
			
			AnimalEnEstablecimiento animalEnEstablecimiento = animalEnEstablecimientoFachada.
									recuperarAnimalEnEstablecimiento(Long.valueOf(idAnimalEnEstablecimiento));
			
			request.setAttribute("animalEnEstablecimiento", animalEnEstablecimiento);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	@SuppressWarnings("unchecked")
	public ActionForward modificacionStockAnimalDeProductorEnEstablecimiento(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionStockAnimalDeProductorEnEstablecimiento";

		try {
			AnimalEnEstablecimientoForm animalEnEstablecimientoForm = (AnimalEnEstablecimientoForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			AnimalEnEstablecimientoFachada animalEnEstablecimientoFachada = (AnimalEnEstablecimientoFachada)
																ctx.getBean("animalEnEstablecimientoFachada");
			
			AnimalEnEstablecimientoDTO animalEnEstablecimientoDTO = 
												animalEnEstablecimientoForm.getAnimalEnEstablecimiento();
			
			animalEnEstablecimientoFachada.modificacionStockAnimalDeProductorEnEstablecimiento(animalEnEstablecimientoDTO);
			
			request.setAttribute("exitoGrabado",Constantes.EXITO_MODIFICACION_STOCK);			
			
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
			WebApplicationContext ctx = getWebApplicationContext();			
			EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");
			
			boolean ok1 = false;
			boolean ok2 = false;
			boolean ok3 = false;
			boolean ok4 = false;
			boolean ok5 = true;

			ok1 = Validator.validarComboRequeridoSinNull("-1",Long.toString(
					 animalEnEstablecimientoForm.getProductorEnEstablecimiento().getProductor().getId()),
					 "Productor",error);	
			
			ok2 = Validator.validarComboRequeridoSinNull("-1",Long.toString(
					 animalEnEstablecimientoForm.getProductorEnEstablecimiento().getEstablecimiento().getId()),
					 "Establecimiento",error);			

			ok3 = Validator.requerido(animalEnEstablecimientoForm.getAnimalEnEstablecimiento().getTipoAnimal().getId(), 
									  "Tipo Producto",error);
			if(ok3){
				ok3 = Validator.validarComboRequeridoSinNull("-1",Long.toString(
						 animalEnEstablecimientoForm.getAnimalEnEstablecimiento().getTipoAnimal().getId()),
						 "Tipo Producto",error);			
			}
			
			ok4 = Validator.validarLongMayorQue(0, Integer.toString(
							animalEnEstablecimientoForm.getAnimalEnEstablecimiento().getStock()),"Stock", error);
			
			if(ok1 && ok2 && ok3 && ok4){
				
				Productor productor = entidadFachada.getProductor(
							animalEnEstablecimientoForm.getProductorEnEstablecimiento().getProductor().getId());
				
				//Busco si el productor tiene animales en el establecimiento.
				ProductorEnEstablecimiento productorEnEstablecimiento = null;
				Long idEstablecimiento = animalEnEstablecimientoForm.getProductorEnEstablecimiento()
																	.getEstablecimiento().getId();
				Long idTipoAnimal = animalEnEstablecimientoForm.getAnimalEnEstablecimiento().getTipoAnimal().getId();
				for (ProductorEnEstablecimiento prodEnEst : productor.getProductorEnEstablecimiento()) {
					
					if(prodEnEst.getEstablecimiento().getId().equals(idEstablecimiento)){
						productorEnEstablecimiento = prodEnEst;
					}
				}
				if(productorEnEstablecimiento != null){
					
					for (AnimalEnEstablecimiento animEnEst : productorEnEstablecimiento.getAnimalesEnEstablecimiento()) {
						
						if(animEnEst.getTipoAnimal().getId().equals(idTipoAnimal)){
							ok5=false;
							Validator.addErrorXML(error, "Ya existe ese producto en ese establecimiento para ese productor");
						}
					}
					
				}else{
					ok5 = true;
				}
			}	

			return ok1 && ok2 && ok3 && ok4 && ok5;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}
}
