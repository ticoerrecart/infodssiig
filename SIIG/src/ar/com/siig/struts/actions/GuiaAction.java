package ar.com.siig.struts.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;


import ar.com.siig.struts.utils.Validator;
import ar.com.siig.dto.GuiaDTO;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.fachada.GuiaFachada;
import ar.com.siig.fachada.PeriodoFachada;
import ar.com.siig.struts.actions.forms.GuiaForm;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.MyLogger;

public class GuiaAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarAltaLegalizacionGuia(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargaAltaLegalizacionGuia";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");
			PeriodoFachada periodoFachada = (PeriodoFachada) ctx.getBean("periodoFachada");
			
			request.setAttribute("productores", entidadFachada.getProductoresDTO());
			request.setAttribute("periodos", periodoFachada.getPeriodosDTO());
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward altaLegalizacionGuia(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoAltaLegalizacionGuia";

		try {
			GuiaForm guiaForm = (GuiaForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			GuiaFachada guiaFachada = (GuiaFachada) ctx.getBean("guiaFachada");
			
			guiaFachada.altaLegalizacionGuia(guiaForm.getGuia());
			
			request.setAttribute("exitoGrabado",
					Constantes.EXITO_ALTA_GUIA);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	public boolean validarAltaLegalizacionGuiaForm(StringBuffer error, ActionForm form) {

		try {
			GuiaForm guiaForm = (GuiaForm) form;
			GuiaDTO guia = guiaForm.getGuia();
			WebApplicationContext ctx = getWebApplicationContext();
			GuiaFachada guiaFachada = (GuiaFachada) ctx.getBean("guiaFachada");
			
			boolean ok = true;
			boolean ok1 = true;
			boolean ok2 = true;
			boolean ok3 = true;
			boolean ok4 = true;
			boolean ok5 = true;
			boolean ok6 = true;			
			
			ok = Validator.validarLongMayorQue(0, Long.toString(guia.getNumero()),
												"Nro de Guía", error);			
			if (ok) {
				ok1 = !guiaFachada.existeGuia(guia.getNumero());

				if (!ok1) {
					Validator.addErrorXML(error, Constantes.NRO_GUIA_EXISTENTE);
				}
			}			
			
			ok2 = Validator.validarComboRequeridoSinNull("-1",Long.toString(guia.getProductor().getId()),
														 "Productor",error);
			
			ok3 = Validator.requerido(guia.getFechaLegalizacion(), "Fecha Legalización", error);			
			
			ok4 = Validator.requerido(guia.getNumeroInterno(), "Nro Interno", error);
			
			ok5 = Validator.validarRequerido(Long.toString(guia.getMarcaSenial().getId()), "Marca/Señal", error);
			
			return ok && ok1 && ok2 && ok3 && ok4 && ok5 && ok6;			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}	
}
