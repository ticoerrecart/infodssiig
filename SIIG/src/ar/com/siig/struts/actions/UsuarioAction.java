package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.fachada.RolFachada;
import ar.com.siig.fachada.UsuarioFachada;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.struts.actions.forms.UsuarioForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class UsuarioAction extends ValidadorAction {

	public ActionForward cargarAltaUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strForward = "cargarAltaUsuario";
		try {

			WebApplicationContext ctx = getWebApplicationContext();

			RolFachada rolFachada = (RolFachada) ctx.getBean("rolFachada");
			// rolFachada.verificarMenu(Constantes.ALTA_USUARIO_MENU,usuario.getRol());

			EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");

			request.setAttribute("entidades", entidadFachada.getOficinasDTO());
			request.setAttribute("roles", rolFachada.getRolesDTO());

			request.setAttribute("titulo", Constantes.TITULO_ALTA_USUARIO);
			request.setAttribute("metodo", "altaUsuario");
			request.setAttribute("idRolAdministrador", rolFachada.getRolAdministrador().getId());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public boolean validarUsuarioForm(StringBuffer error, ActionForm form) {
		UsuarioForm usuarioForm = (UsuarioForm) form;
		WebApplicationContext ctx = getWebApplicationContext();
		UsuarioFachada usuarioFachada = (UsuarioFachada) ctx.getBean("usuarioFachada");
		boolean existe = usuarioFachada.existeUsuario(usuarioForm.getUsuarioDTO().getNombreUsuario(), usuarioForm.getUsuarioDTO().getId());
		if (existe) {
			Validator.addErrorXML(error, Constantes.EXISTE_ENTIDAD);
		}
		return !existe && usuarioForm.validar(error);
	}

	public ActionForward altaUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strForward = "exitoAltaUsuario";
		try {
			UsuarioForm usuarioForm = (UsuarioForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			UsuarioFachada usuarioFachada = (UsuarioFachada) ctx.getBean("usuarioFachada");

			// valido nuevamente por seguridad.  
			if (!validarUsuarioForm(new StringBuffer(), usuarioForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			// el Usuario nuevo siempre se crea habilitado
			usuarioForm.getUsuarioDTO().setHabilitado(true);
			usuarioFachada.altaUsuario(usuarioForm.getUsuarioDTO());

			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_USUARIO);

		} catch (NegocioException ne) {
			strForward = "errorAltaUsuario";
			request.setAttribute("error", ne.getMessage());
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	private void cargarUsuarioAModificar(HttpServletRequest request) {
		String id = request.getParameter("id");
		if (id == null) {
			id = String.valueOf(((UsuarioDTO) request.getSession().getAttribute("usuario")).getId());
		}
		WebApplicationContext ctx = getWebApplicationContext();
		UsuarioFachada usuarioFachada = (UsuarioFachada) ctx.getBean("usuarioFachada");
		EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");
		RolFachada rolFachada = (RolFachada) ctx.getBean("rolFachada");

		UsuarioDTO usuario = usuarioFachada.getUsuarioDTO(Long.valueOf(id));
		request.setAttribute("usu", usuario);
		request.setAttribute("entidades", entidadFachada.getOficinasDTO());
		request.setAttribute("roles", rolFachada.getRolesDTO());

		request.setAttribute("metodo", "modificacionUsuario");
		request.setAttribute("idRolAdministrador", rolFachada.getRolAdministrador().getId());
	}

	public ActionForward cargarUsuarioAModificar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strForward = "exitoCargarUsuarioAModificar";
		try {
			cargarUsuarioAModificar(request);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "bloqueError";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward cargarUsuariosAModificar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strForward = "exitoRecuperarUsuarios";
		try {
			UsuarioDTO usuario = (UsuarioDTO) request.getSession().getAttribute(Constantes.USER_LABEL_SESSION);
			WebApplicationContext ctx = getWebApplicationContext();

			RolFachada rolFachada = (RolFachada) ctx.getBean("rolFachada");
			// rolFachada.verificarMenu(Constantes.MODIFICACION_USUARIO_MENU,usuario.getRol());

			long idAdministrador = rolFachada.getRolAdministrador().getId();

			if (usuario != null && idAdministrador == usuario.getRol().getId().longValue()) {

				UsuarioFachada usuarioFachada = (UsuarioFachada) ctx.getBean("usuarioFachada");
				List<UsuarioDTO> usuarios = usuarioFachada.getUsuariosDTO();
				request.setAttribute("usuarios", usuarios);
			} else {
				cargarUsuarioAModificar(request);
				request.setAttribute("titulo", Constantes.TITULO_MODIFICACION_USUARIO);
				strForward = "exitoCargarUsuarioAModificar";
			}

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward modificacionUsuario(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String strForward = "exitoModificacionUsuario";
		try {
			WebApplicationContext ctx = getWebApplicationContext();
			UsuarioFachada usuarioFachada = (UsuarioFachada) ctx.getBean("usuarioFachada");
			UsuarioForm usuarioForm = (UsuarioForm) form;

			// valido nuevamente por seguridad.  
			if (!validarUsuarioForm(new StringBuffer(), usuarioForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			usuarioFachada.modificacionUsuario(usuarioForm.getUsuarioDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_USUARIO);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}
}
