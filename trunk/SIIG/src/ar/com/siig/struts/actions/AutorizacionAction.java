package ar.com.siig.struts.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.fachada.AutorizacionFachada;
import ar.com.siig.fachada.AutorizadoFachada;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.fachada.TipoAutorizacionFachada;
import ar.com.siig.struts.actions.forms.AutorizacionForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class AutorizacionAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarAltaAutorizacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "cargarAltaAutorizacion";
		try {
			UsuarioDTO usuario = (UsuarioDTO) request.getSession()
					.getAttribute(Constantes.USER_LABEL_SESSION);
			WebApplicationContext ctx = getWebApplicationContext();

			EntidadFachada entidadFachada = (EntidadFachada) ctx
					.getBean("entidadFachada");
			AutorizadoFachada autorizadoFachada = (AutorizadoFachada) ctx
					.getBean("autorizadoFachada");
			TipoAutorizacionFachada tipoAutorizacionFachada = (TipoAutorizacionFachada) ctx
					.getBean("tipoAutorizacionFachada");

			// recuperar productores (1 productor)
			request.setAttribute("productores",
					entidadFachada.getProductoresDTO());
			// recuperar autorizados (1 autorizado)
			request.setAttribute("autorizados",
					autorizadoFachada.getAutorizadosDTO());
			// recuperar tipos de autorizacion (n autorizaciones)
			request.setAttribute("tiposAutorizacion",
					tipoAutorizacionFachada.getTiposAutorizacionDTO());
			request.setAttribute("metodo", "altaAutorizacion");
			request.setAttribute("titulo", "Alta de Autorización");
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public boolean validarAutorizacionForm(StringBuffer error, ActionForm form) {
		AutorizacionForm autorizacionForm = (AutorizacionForm) form;
		boolean ok1 = Validator.validarProductorRequerido(autorizacionForm
				.getAutorizacion().getProductor().getId().toString(), error);
		boolean ok2 = Validator.validarRequerido(autorizacionForm
				.getAutorizacion().getAutorizado().getId().toString(),
				"Autorizado", error);
		boolean ok3 = autorizacionForm.getAutorizacion()
				.getTiposDeAutorizacion().size() > 0;
		if (!ok3) {
			Validator.addErrorXML(error,
					"Debe seleccionar al menos un Tipo de Autorización");
		}

		WebApplicationContext ctx = getWebApplicationContext();

		AutorizacionFachada autorizacionFachada = (AutorizacionFachada) ctx
				.getBean("autorizacionFachada");

		boolean ok4 = autorizacionFachada.existeAutorizacion(autorizacionForm
				.getAutorizacion());

		if (ok4) {
			Validator
					.addErrorXML(error,
							"Ya existe una Autorización para este Productor-Autorizado");// y
																							// este
																							// conjunto
																							// de
																							// Tipos
																							// de
																							// Autorización");
		}
		return ok1 && ok2 && ok3 && !ok4;
	}

	public ActionForward altaAutorizacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoAltaAutorizacion";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			AutorizacionFachada autorizacionFachada = (AutorizacionFachada) ctx
					.getBean("autorizacionFachada");
			AutorizacionForm autorizacionForm = (AutorizacionForm) form;

			autorizacionFachada.altaAutorizacion(autorizacionForm
					.getAutorizacion());

			request.setAttribute("exitoGrabado",
					Constantes.EXITO_ALTA_AUTORIZACION);
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}
}
