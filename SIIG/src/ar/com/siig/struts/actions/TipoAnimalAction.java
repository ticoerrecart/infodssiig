package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.TipoAnimalDTO;
import ar.com.siig.fachada.CategoriaFachada;
import ar.com.siig.fachada.TipoAnimalFachada;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.struts.actions.forms.TipoAnimalForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class TipoAnimalAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarAltaTipoAnimal(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarAltaTipoAnimal";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			CategoriaFachada categoriaFachada = (CategoriaFachada) ctx
					.getBean("categoriaFachada");

			// recuperar categorias
			request.setAttribute("categorias", categoriaFachada.getCategorias());

			request.setAttribute("metodo", "altaTipoAnimal");
			request.setAttribute("titulo", "Alta de Tipo de Animal");
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward altaTipoAnimal(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strForward = "exitoAltaTipoAnimal";
		try {
			WebApplicationContext ctx = getWebApplicationContext();
			TipoAnimalForm tipoAnimalForm = (TipoAnimalForm) form;
			TipoAnimalDTO tipoAnimalDTO = tipoAnimalForm.getTipoAnimal();

			// valido nuevamente por seguridad.
			if (!validarTipoAnimalForm(new StringBuffer(), tipoAnimalForm)) {
				throw new Exception("Error de Seguridad");
			}

			TipoAnimalFachada tipoAnimalFachada = (TipoAnimalFachada) ctx
					.getBean("tipoAnimalFachada");

			tipoAnimalFachada.altaTipoAnimal(tipoAnimalDTO);

			request.setAttribute("exitoGrabado",
					Constantes.EXITO_ALTA_TIPO_ANIMAL);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public boolean validarTipoAnimalForm(StringBuffer error, ActionForm form) {

		try {
			TipoAnimalForm tipoAnimalForm = (TipoAnimalForm) form;

			boolean ok1, ok2;
			boolean existe = false;

			ok1 = Validator.requerido(tipoAnimalForm.getTipoAnimal()
					.getDescripcion(), "Nombre", error);

			ok2 = Validator.requerido(
					tipoAnimalForm.getTipoAnimal().getValor(), "Valor", error);

			WebApplicationContext ctx = getWebApplicationContext();
			TipoAnimalFachada tipoAnimalFachada = (TipoAnimalFachada) ctx
					.getBean("tipoAnimalFachada");
			existe = tipoAnimalFachada.existeTipoAnimal(tipoAnimalForm
					.getTipoAnimal());
			if (existe) {
				Validator.addErrorXML(error, Constantes.EXISTE_TIPO_ANIMAL);
			}

			return ok1 && ok2 && !existe;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarTipoAnimalesAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarTipoAnimales";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			TipoAnimalFachada tipoAnimalFachada = (TipoAnimalFachada) ctx
					.getBean("tipoAnimalFachada");
			List<TipoAnimalDTO> tipoAnimales = tipoAnimalFachada
					.getTipoAnimalesDTO();
			request.setAttribute("tipoAnimales", tipoAnimales);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarTipoAnimalAModificar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarTipoAnimalAModificar";
		try {
			WebApplicationContext ctx = getWebApplicationContext();

			TipoAnimalFachada tipoAnimalFachada = (TipoAnimalFachada) ctx
					.getBean("tipoAnimalFachada");
			CategoriaFachada categoriaFachada = (CategoriaFachada) ctx
					.getBean("categoriaFachada");

			// recupero la entidad de la B.D.
			String id = request.getParameter("id");
			TipoAnimalDTO tipoAnimal = tipoAnimalFachada.getTipoAnimalDTO(Long
					.parseLong(id));

			// recuperar categorias
			request.setAttribute("categorias", categoriaFachada.getCategorias());
			request.setAttribute("tipoAnimal", tipoAnimal);

			request.setAttribute("metodo", "modificacionTipoAnimal");

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "bloqueError";
		}
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward modificacionTipoAnimal(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionTipoAnimal";
		try {
			WebApplicationContext ctx = getWebApplicationContext();
			TipoAnimalForm tipoAnimalForm = (TipoAnimalForm) form;
			TipoAnimalDTO tipoAnimal = tipoAnimalForm.getTipoAnimal();

			// valido nuevamente por seguridad.
			if (!validarTipoAnimalForm(new StringBuffer(), tipoAnimalForm)) {
				throw new Exception("Error de Seguridad");
			}

			TipoAnimalFachada tipoAnimalFachada = (TipoAnimalFachada) ctx
					.getBean("tipoAnimalFachada");

			tipoAnimalFachada.modificacionTipoAnimal(tipoAnimal);

			request.setAttribute("exitoGrabado",
					Constantes.EXITO_MODIFICACION_TIPO_ANIMAL);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}
}
