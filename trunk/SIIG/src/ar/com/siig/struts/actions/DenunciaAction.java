package ar.com.siig.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.fachada.DenunciaFachada;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.negocio.TipoDeDenuncia;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.struts.actions.forms.DenunciaForm;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class DenunciaAction extends ValidadorAction {

	public ActionForward initAltaDenuncia(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strForward = "exitoInitAltaDenuncia";
		try {

			// reset el form
			form = new DenunciaForm();
			request.setAttribute("denunciaForm", form);

			WebApplicationContext ctx = getWebApplicationContext();
			DenunciaFachada denunciaFachada = (DenunciaFachada) ctx
					.getBean("denunciaFachada");
			EntidadFachada entidadFachada = (EntidadFachada) ctx
					.getBean("entidadFachada");

			List<TipoDeDenuncia> tiposDeDenuncias = denunciaFachada
					.getTiposDeDenuncia();
			request.setAttribute("tipoDenuncias", tiposDeDenuncias);

			List<EntidadDTO> productores = entidadFachada.getProductoresDTO();
			request.setAttribute("productores", productores);

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward altaDenuncia(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String strForward = "exitoAltaDenuncia";
		try {
			DenunciaForm denunciaForm = (DenunciaForm) form;
			WebApplicationContext ctx = getWebApplicationContext();

			// valido nuevamente por seguridad.
			if (!validarDenunciaForm(new StringBuffer(), denunciaForm)) {
				throw new Exception("Error de Seguridad");
			}

			DenunciaFachada denunciaFachada = (DenunciaFachada) ctx
					.getBean("denunciaFachada");
			denunciaFachada.altaDenuncia(denunciaForm.getDenunciaDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_DENUNCIA);

		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public boolean validarDenunciaForm(StringBuffer error, ActionForm form) {

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			DenunciaForm denunciaForm = (DenunciaForm) form;
			denunciaForm.getDenunciaDTO().normalizarCollections();

			DenunciaFachada denunciaFachada = (DenunciaFachada) ctx
					.getBean("denunciaFachada");

			boolean ok = Validator.validarEnteroMayorQue(0, String
					.valueOf(denunciaForm.getDenunciaDTO()
							.getNumeroDeDenuncia()), "Numero de Denuncia",
					error);
			boolean ok2 = Validator.validarEnteroMayorQue(0,
					String.valueOf(denunciaForm.getDenunciaDTO()
							.getNumeroDeLlamado()), "Numero de Llamado", error);
			boolean ok3 = Validator.requerido(denunciaForm.getDenunciaDTO()
					.getDesde(), "Desde", error);
			boolean ok4 = Validator.requerido(denunciaForm.getDenunciaDTO()
					.getHasta(), "Hasta", error);
			boolean ok5 = Validator.requerido(denunciaForm.getDenunciaDTO()
					.getLugar(), "Lugar", error);

			boolean ok6 = Validator.validarFechaValida(denunciaForm
					.getDenunciaDTO().getDesde(), "Desde", error);
			boolean ok7 = Validator.validarFechaValida(denunciaForm
					.getDenunciaDTO().getHasta(), "Hasta", error);

			boolean ok8 = Validator.validarComboRequerido("-1", String
					.valueOf(denunciaForm.getDenunciaDTO().getProductorId()),
					"Productor", error);

			return ok && ok2 && ok3 && ok4 && ok5 && ok6 && ok7 && ok8;
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}

}
