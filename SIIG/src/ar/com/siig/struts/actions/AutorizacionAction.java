package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.AutorizacionDTO;
import ar.com.siig.dto.TipoAutorizacionDTO;
import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.fachada.AutorizacionFachada;
import ar.com.siig.fachada.AutorizadoFachada;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.fachada.TipoAutorizacionFachada;
import ar.com.siig.negocio.Autorizacion;
import ar.com.siig.negocio.TipoAutorizacion;
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

	@SuppressWarnings("unchecked")
	public ActionForward cargarAutorizacionesAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarAutorizaciones";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			AutorizacionFachada autorizacionFachada = (AutorizacionFachada) ctx
					.getBean("autorizacionFachada");

			request.setAttribute("autorizaciones",
					autorizacionFachada.getAutorizaciones());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarAutorizacionAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarAutorizacionAModificar";
		try {
			String id = request.getParameter("id");

			WebApplicationContext ctx = getWebApplicationContext();

			AutorizacionFachada autorizacionFachada = (AutorizacionFachada) ctx
					.getBean("autorizacionFachada");
			TipoAutorizacionFachada tipoAutorizacionFachada = (TipoAutorizacionFachada) ctx
					.getBean("tipoAutorizacionFachada");

			Autorizacion autorizacion = autorizacionFachada
					.getAutorizacion(Long.parseLong(id));
			request.setAttribute("autorizacion", autorizacion);

			// recuperar tipos de autorizacion (n autorizaciones)
			List<TipoAutorizacionDTO> tiposAutorizacion = tipoAutorizacionFachada
					.getTiposAutorizacionDTO();
			for (TipoAutorizacion tipoAutorizacion : autorizacion
					.getTiposDeAutorizacion()) {
				for (TipoAutorizacionDTO tipoAutorizacionDTO : tiposAutorizacion) {
					if (tipoAutorizacionDTO.getId() == tipoAutorizacion.getId()) {
						tipoAutorizacionDTO.setHabilitado(true);
					}
				}
			}

			request.setAttribute("tiposAutorizacion", tiposAutorizacion);
			request.setAttribute("metodo", "modificacionAutorizacion");
			request.setAttribute("titulo", "Modificación de Autorización");

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward modificacionAutorizacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionAutorizacion";
		try {
			WebApplicationContext ctx = getWebApplicationContext();
			AutorizacionForm autorizacionForm = (AutorizacionForm) form;
			AutorizacionDTO autorizacion = autorizacionForm.getAutorizacion();

			// valido nuevamente por seguridad.
			if (!validarAutorizacionForm(new StringBuffer(), autorizacionForm)) {
				throw new Exception("Error de Seguridad");
			}

			AutorizacionFachada autorizacionFachada = (AutorizacionFachada) ctx
					.getBean("autorizacionFachada");

			autorizacionFachada.modificacionAutorizacion(autorizacion);

			request.setAttribute("exitoGrabado",
					Constantes.EXITO_MODIFICACION_AUTORIZACION);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

}
