package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.MyLogger;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.fachada.LocalidadFachada;
import ar.com.siig.struts.actions.forms.LocalidadForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;

public class LocalidadAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarLocalidadesAModificar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String strForward = "exitoRecuperarLocalidades";
		try{
			UsuarioDTO usuario = (UsuarioDTO)request.getSession().getAttribute(Constantes.USER_LABEL_SESSION);			
			WebApplicationContext ctx = getWebApplicationContext();			
			
			//IRolFachada rolFachada = (IRolFachada) ctx.getBean("rolFachada");
			//rolFachada.verificarMenu(Constantes.MODIFICACION_LOCALIDAD_MENU,usuario.getRol());
			
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx.getBean("localidadFachada");
			List<LocalidadDTO> localidades = localidadFachada.getLocalidadesDTO();
			request.setAttribute("localidades", localidades);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward altaLocalidad(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String strForward = "exitoAltaLocalidad";
		try{	
			LocalidadForm localidadForm = (LocalidadForm) form;
			UsuarioDTO usuario = (UsuarioDTO)request.getSession().getAttribute(Constantes.USER_LABEL_SESSION);	
			WebApplicationContext ctx = getWebApplicationContext();			
			
			// valido nuevamente por seguridad.  
			if (!validarLocalidadForm(new StringBuffer(), localidadForm)) {
				throw new Exception("Error de Seguridad");
			}	
			
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx.getBean("localidadFachada");
			localidadFachada.altaLocalidad(localidadForm.getLocalidadDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_LOCALIDAD);
		
		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}			
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward cargarLocalidadAModificar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String strForward = "exitoCargarLocalidadAModificar";
		try{
			UsuarioDTO usuario = (UsuarioDTO)request.getSession().getAttribute(Constantes.USER_LABEL_SESSION);			
			WebApplicationContext ctx = getWebApplicationContext();			
			
			//IRolFachada rolFachada = (IRolFachada) ctx.getBean("rolFachada");
			//rolFachada.verificarMenu(Constantes.MODIFICACION_LOCALIDAD_MENU,usuario.getRol());		
		
			String id = request.getParameter("id");
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx.getBean("localidadFachada");
			request.setAttribute("localidad", localidadFachada.getLocalidadDTOPorId(Long.valueOf(id)));
			request.setAttribute("metodo", "modificacionLocalidad");
		
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "bloqueError";
		}			
		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward modificacionLocalidad(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String strForward = "exitoModificacionLocalidad";
		try{		
			LocalidadForm localidadForm = (LocalidadForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			
			// valido nuevamente por seguridad.  
			if (!validarLocalidadForm(new StringBuffer(), localidadForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx.getBean("localidadFachada");
			localidadFachada.modificacionLocalidad(localidadForm.getLocalidadDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_LOCALIDAD);
		
		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}			
		return mapping.findForward(strForward);
	}	
	
	public boolean validarLocalidadForm(StringBuffer error, ActionForm form) {
		try{
			LocalidadForm localidadForm = (LocalidadForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			LocalidadFachada localidadFachada = (LocalidadFachada) ctx.getBean("localidadFachada");
			boolean existe = localidadFachada.existeLocalidad(localidadForm.getLocalidadDTO());
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
