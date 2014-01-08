package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.AutorizadoDTO;
import ar.com.siig.fachada.AutorizadoFachada;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.struts.actions.forms.AutorizadoForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class AutorizadoAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward altaAutorizado(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strForward = "exitoAltaAutorizado";
		try {
			WebApplicationContext ctx = getWebApplicationContext();
			AutorizadoForm autorizadoForm = (AutorizadoForm) form;
			AutorizadoDTO autorizadoDTO = autorizadoForm.getAutorizado();

			// valido nuevamente por seguridad.
			if (!validarAutorizadoForm(new StringBuffer(), autorizadoForm)) {
				throw new Exception("Error de Seguridad");
			}

			AutorizadoFachada autorizadoFachada = (AutorizadoFachada) ctx
					.getBean("autorizadoFachada");

			autorizadoFachada.altaAutorizado(autorizadoDTO);

			request.setAttribute("exitoGrabado",
					Constantes.EXITO_ALTA_AUTORIZADO);
		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public boolean validarAutorizadoForm(StringBuffer error, ActionForm form) {

		try {
			AutorizadoForm autorizadoForm = (AutorizadoForm) form;

			boolean ok1;
			boolean ok2;
			boolean existe = false;

			ok1 = Validator.requerido(autorizadoForm.getAutorizado()
					.getNombre(), "Nombre", error);
			ok2 = Validator.validarEnteroMayorQue(0, autorizadoForm
					.getAutorizado().getDni().toString(), "Dni", error);

			WebApplicationContext ctx = getWebApplicationContext();
			AutorizadoFachada autorizadoFachada = (AutorizadoFachada) ctx
					.getBean("autorizadoFachada");
			existe = autorizadoFachada.existeAutorizado(autorizadoForm
					.getAutorizado().getNombre(), autorizadoForm
					.getAutorizado().getDni(), autorizadoForm.getAutorizado()
					.getId());
			if (existe) {
				Validator.addErrorXML(error, Constantes.EXISTE_AUTORIZADO);
			}

			return ok1 && ok2 && !existe;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarAutorizadosAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarAutorizados";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			AutorizadoFachada autorizadoFachada = (AutorizadoFachada) ctx
					.getBean("autorizadoFachada");
			List<AutorizadoDTO> autorizados = autorizadoFachada
					.getAutorizadosDTO();
			request.setAttribute("autorizados", autorizados);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarAutorizadoAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarAutorizadoAModificar";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			AutorizadoFachada autorizadoFachada = (AutorizadoFachada) ctx
					.getBean("autorizadoFachada");

			// recupero la entidad de la B.D.
			String id = request.getParameter("id");
			AutorizadoDTO autorizado = autorizadoFachada.getAutorizadoDTO(Long
					.parseLong(id));
			request.setAttribute("autorizado", autorizado);

			request.setAttribute("metodo", "modificacionAutorizado");

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "bloqueError";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward modificacionAutorizado(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionAutorizado";
		try {
			WebApplicationContext ctx = getWebApplicationContext();
			AutorizadoForm autorizadoForm = (AutorizadoForm) form;
			AutorizadoDTO autorizado = autorizadoForm.getAutorizado();

			// valido nuevamente por seguridad.
			if (!validarAutorizadoForm(new StringBuffer(), autorizadoForm)) {
				throw new Exception("Error de Seguridad");
			}

			AutorizadoFachada autorizadoFachada = (AutorizadoFachada) ctx
					.getBean("autorizadoFachada");

			autorizadoFachada.modificacionAutorizado(autorizado);

			request.setAttribute("exitoGrabado",
					Constantes.EXITO_MODIFICACION_AUTORIZADO);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

}
