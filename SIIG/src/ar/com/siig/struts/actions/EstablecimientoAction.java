package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.EstablecimientoDTO;
import ar.com.siig.fachada.EstablecimientoFachada;
import ar.com.siig.fachada.LocalidadFachada;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.struts.actions.forms.EstablecimientoForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class EstablecimientoAction extends ValidadorAction {

	public ActionForward cargarEstablecimientosAModificar(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstablecimientos";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			EstablecimientoFachada establecimientoFachada = (EstablecimientoFachada) ctx
					.getBean("establecimientoFachada");
			List<EstablecimientoDTO> establecimientos = establecimientoFachada
					.getEstablecimientosDTO();
			request.setAttribute("establecimientos", establecimientos);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}

	public ActionForward cargarAltaEstablecimiento(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarAltaEstablecimiento";
		try {

			WebApplicationContext ctx = getWebApplicationContext();
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");

			request.setAttribute("provincias",
					localidadFachada.getProvinciasDTO());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward altaEstablecimiento(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoAltaEstablecimiento";
		try {
			EstablecimientoForm establecimientoForm = (EstablecimientoForm) form;
			WebApplicationContext ctx = getWebApplicationContext();

			// valido nuevamente por seguridad.
			if (!validarEstablecimientoForm(new StringBuffer(),
					establecimientoForm)) {
				throw new Exception("Error de Seguridad");
			}

			EstablecimientoFachada establecimientoFachada = (EstablecimientoFachada) ctx
					.getBean("establecimientoFachada");
			establecimientoFachada.altaEstablecimiento(establecimientoForm
					.getEstablecimientoDTO());
			request.setAttribute("exitoGrabado",
					Constantes.EXITO_ALTA_ESTABLECIMIENTO);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward cargarModificacionEstablecimiento(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarModificacionEstablecimiento";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");

			request.setAttribute("provincias",
					localidadFachada.getProvinciasDTO());
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward cargarEstablecimientoAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarEstablecimientoAModificar";
		try {
			String idEstablecimiento = request
					.getParameter("idEstablecimiento");

			WebApplicationContext ctx = getWebApplicationContext();

			EstablecimientoFachada establecimientoFachada = (EstablecimientoFachada) ctx
					.getBean("establecimientoFachada");
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");

			request.setAttribute("establecimientoDTO", establecimientoFachada
					.getEstablecimientoDTOPorId(new Long(idEstablecimiento)));
			request.setAttribute("provincias",
					localidadFachada.getProvinciasDTO());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward modificacionEstablecimiento(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionEstablecimiento";
		try {
			EstablecimientoForm establecimientoForm = (EstablecimientoForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			EstablecimientoFachada establecimientoFachada = (EstablecimientoFachada) ctx
					.getBean("establecimientoFachada");

			// valido nuevamente por seguridad.
			if (!validarEstablecimientoForm(new StringBuffer(),
					establecimientoForm)) {
				throw new Exception("Error de Seguridad");
			}

			establecimientoFachada
					.modificacionEstablecimiento(establecimientoForm
							.getEstablecimientoDTO());
			request.setAttribute("exitoGrabado",
					Constantes.EXITO_MODIFICACION_ESTABLECIMIENTO);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public boolean validarEstablecimientoForm(StringBuffer error,
			ActionForm form) {

		try {
			EstablecimientoForm establecimientoForm = (EstablecimientoForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			EstablecimientoFachada establecimientoFachada = (EstablecimientoFachada) ctx
					.getBean("establecimientoFachada");

			boolean existe = establecimientoFachada
					.existeEstablecimiento(establecimientoForm
							.getEstablecimientoDTO());
			if (existe) {
				Validator.addErrorXML(error, Constantes.EXISTE_ESTABLECIMIENTO);
			}
			return !existe && establecimientoForm.validar(error);

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}

}
