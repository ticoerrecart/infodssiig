package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;
import ar.com.siig.negocio.exception.NegocioException;

import ar.com.siig.utils.Constantes;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.dto.TipoProductoDTO;
import ar.com.siig.fachada.TipoProductoFachada;
import ar.com.siig.struts.actions.forms.TipoProductoForm;
import ar.com.siig.utils.MyLogger;

public class TipoProductoAction extends ValidadorAction {

	
	public ActionForward cargarModificacionTipoProductoForestal(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strForward = "exitoCargarModificacionTipoProducto";

		try {

			WebApplicationContext ctx = getWebApplicationContext();

			TipoProductoFachada tipoProductoForestalFachada = (TipoProductoFachada) ctx.getBean("tipoProductoFachada");

			List<TipoProductoDTO> tiposProducto = tipoProductoForestalFachada.recuperarTiposProductoDTO();
			request.setAttribute("tiposProducto", tiposProducto);
			//request.setAttribute("metodo", "recuperarTipoProductoForestal");

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}
	
	public ActionForward recuperarTipoProducto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strForward = "exitoRecuperarTipoProducto";

		try {

			WebApplicationContext ctx = getWebApplicationContext();
			TipoProductoFachada tipoProductoFachada = (TipoProductoFachada) 
														ctx.getBean("tipoProductoFachada");

			String id = request.getParameter("id");

			TipoProductoDTO tipoProductoForestal = tipoProductoFachada.
																recuperarTipoProductoDTO(new Long(id).longValue());
			request.getSession().setAttribute("tipoProducto", tipoProductoForestal);
			//request.getSession().setAttribute("metodoValidacion", "validarTipoProductoForestalForm");
			//request.getSession().setAttribute("metodo", "modificacionTipoProductoForestal");

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "bloqueError";
		}

		return mapping.findForward(strForward);
	}	
	
	public ActionForward modificacionTipoProducto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strForward = "exitoModificacionTipoProducto";
		TipoProductoForm tipoProductoForm = null;

		try {

			WebApplicationContext ctx = getWebApplicationContext();
			TipoProductoFachada tipoProductoFachada = (TipoProductoFachada) ctx.getBean("tipoProductoFachada");
			tipoProductoForm = (TipoProductoForm) form;

			// valido nuevamente por seguridad.  
			if (!validarTipoProductoForm(new StringBuffer(), tipoProductoForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			tipoProductoFachada.modificacionTipoProducto(tipoProductoForm.getTipoProducto());

			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_TIPO_PRODUCTO);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	public boolean validarTipoProductoForm(StringBuffer error, ActionForm form) {
		
		TipoProductoForm tipoProductoForm = (TipoProductoForm) form;
		TipoProductoDTO tipoProductoDTO = tipoProductoForm.getTipoProducto();		
		
		//return Validator.validarDoubleMayorQue(0, String.valueOf(tipoProductoDTO.getRegaliaMinera()), "Regalía Minera", error);
		
		return true;
	}	
}
