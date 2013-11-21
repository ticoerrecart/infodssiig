package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.dto.ProvinciaDTO;
import ar.com.siig.fachada.LocalidadFachada;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.struts.actions.forms.LocalidadForm;
import ar.com.siig.struts.actions.forms.ProvinciaForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class LocalidadAction extends ValidadorAction {

	public ActionForward cargarLocalidadesAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarLocalidades";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");
			List<LocalidadDTO> localidades = localidadFachada
					.getLocalidadesDTO();
			request.setAttribute("localidades", localidades);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}

	public ActionForward altaProvincia(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strForward = "exitoAltaProvincia";
		try {
			ProvinciaForm provinciaForm = (ProvinciaForm) form;
			WebApplicationContext ctx = getWebApplicationContext();

			// valido nuevamente por seguridad.
			if (!validarProvinciaForm(new StringBuffer(), provinciaForm)) {
				throw new Exception("Error de Seguridad");
			}

			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");
			localidadFachada.altaProvincia(provinciaForm.getProvinciaDTO());
			request.setAttribute("exitoGrabado",
					Constantes.EXITO_ALTA_PROVINCIA);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward cargarProvinciasAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strForward = "exitoRecuperarProvincias";
		try {

			WebApplicationContext ctx = getWebApplicationContext();
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");
			List<ProvinciaDTO> provincias = localidadFachada.getProvinciasDTO();
			request.setAttribute("provincias", provincias);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}

	public ActionForward cargarProvinciaAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarProvinciaAModificar";
		try {

			WebApplicationContext ctx = getWebApplicationContext();
			String id = request.getParameter("id");
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");
			request.setAttribute("provincia",
					localidadFachada.getProvinciaDTOPorId(Long.valueOf(id)));
			request.setAttribute("metodo", "modificacionProvincia");

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward modificacionProvincia(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionProvincia";
		try {
			ProvinciaForm provinciaForm = (ProvinciaForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");

			// valido nuevamente por seguridad.
			if (!validarProvinciaForm(new StringBuffer(), provinciaForm)) {
				throw new Exception("Error de Seguridad");
			}

			localidadFachada.modificacionProvincia(provinciaForm
					.getProvinciaDTO());
			request.setAttribute("exitoGrabado",
					Constantes.EXITO_MODIFICACION_PROVINCIA);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward cargarAltaLocalidad(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarAltaLocalidad";
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

	public ActionForward altaLocalidad(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strForward = "exitoAltaLocalidad";
		try {
			LocalidadForm localidadForm = (LocalidadForm) form;
			WebApplicationContext ctx = getWebApplicationContext();

			// valido nuevamente por seguridad.
			if (!validarLocalidadForm(new StringBuffer(), localidadForm)) {
				throw new Exception("Error de Seguridad");
			}

			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");
			localidadFachada.altaLocalidad(localidadForm.getLocalidadDTO());
			request.setAttribute("exitoGrabado",
					Constantes.EXITO_ALTA_LOCALIDAD);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward cargarModificacionLocalidad(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarModificacionLocalidad";
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

	public ActionForward cargarLocalidadAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarLocalidadAModificar";
		try {
			String idLocalidad = request.getParameter("idLocalidad");

			WebApplicationContext ctx = getWebApplicationContext();

			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");
			request.setAttribute("localidadDTO", localidadFachada
					.getLocalidadDTOPorId(new Long(idLocalidad)));
			request.setAttribute("provincias",
					localidadFachada.getProvinciasDTO());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward modificacionLocalidad(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionLocalidad";
		try {
			LocalidadForm localidadForm = (LocalidadForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");

			// valido nuevamente por seguridad.
			if (!validarLocalidadForm(new StringBuffer(), localidadForm)) {
				throw new Exception("Error de Seguridad");
			}

			localidadFachada.modificacionLocalidad(localidadForm
					.getLocalidadDTO());
			request.setAttribute("exitoGrabado",
					Constantes.EXITO_MODIFICACION_LOCALIDAD);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public boolean validarProvinciaForm(StringBuffer error, ActionForm form) {

		try {
			ProvinciaForm provinciaForm = (ProvinciaForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");

			boolean existe = localidadFachada.existeProvincia(provinciaForm
					.getProvinciaDTO());
			if (existe) {
				Validator.addErrorXML(error, Constantes.EXISTE_PROVINCIA);
			}
			return !existe && provinciaForm.validar(error);

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}

	public boolean validarLocalidadForm(StringBuffer error, ActionForm form) {

		try {
			LocalidadForm localidadForm = (LocalidadForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx
					.getBean("localidadFachada");

			boolean existe = localidadFachada.existeLocalidad(localidadForm
					.getLocalidadDTO());
			if (existe) {
				Validator.addErrorXML(error, Constantes.EXISTE_LOCALIDAD);
			}
			return !existe && localidadForm.validar(error);

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}

}
