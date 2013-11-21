package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.fachada.MarcaSenialFachada;
import ar.com.siig.fachada.PeriodoFachada;
import ar.com.siig.negocio.CanonMarcaSenial;
import ar.com.siig.struts.actions.forms.CanonMarcaSenialForm;
import ar.com.siig.struts.actions.forms.PeriodoForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class MarcaSenialAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarCanonMarcaSenial(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarMarcasSeniales";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			MarcaSenialFachada marcaSenialFachada = (MarcaSenialFachada) ctx
												.getBean("marcaSenialFachada");

			List<CanonMarcaSenial> lista = marcaSenialFachada.recuperarCanonMarcaSenial();

			request.setAttribute("listaCanonMarcaSenial", lista);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward cargarMarcaSenialAModificar(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarMarcaSenialAModificar";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			MarcaSenialFachada marcaSenialFachada = (MarcaSenialFachada) ctx
												.getBean("marcaSenialFachada");

			String id = request.getParameter("id");
			CanonMarcaSenial canonMarcaSenial = marcaSenialFachada.recuperarCanonMarcaSenial(Long.valueOf(id));

			request.setAttribute("canonMarcaSenial", canonMarcaSenial);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward modificarCanonMarcaSenial(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionCanonMarcaSenial";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			MarcaSenialFachada marcaSenialFachada = (MarcaSenialFachada) ctx
												.getBean("marcaSenialFachada");
			CanonMarcaSenialForm canonMarcaSenialForm = (CanonMarcaSenialForm) form;
			
			// valido nuevamente por seguridad.  
			if (!validarCanonMarcaSenialForm(new StringBuffer(), canonMarcaSenialForm)) {
				throw new Exception("Error de Seguridad");
			}
			
			marcaSenialFachada.modificarCanonMarcaSenial(canonMarcaSenialForm.getCanonMarcaSenial());

			request.setAttribute("exitoGrabado",Constantes.EXITO_MODIFICACION_CANON_MARCA_SENIAL);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}	
	
	public boolean validarCanonMarcaSenialForm(StringBuffer error, ActionForm form){
		try {
			CanonMarcaSenialForm canonMarcaSenialForm = (CanonMarcaSenialForm) form;
			String valor = String.valueOf(canonMarcaSenialForm.getCanonMarcaSenial().getMonto());
			boolean ok = Validator.validarDoubleMayorQue(0,valor,"Monto",error);

			return ok;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}
}
