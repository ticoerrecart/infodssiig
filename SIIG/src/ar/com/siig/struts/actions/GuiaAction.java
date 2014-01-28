package ar.com.siig.struts.actions;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;


import ar.com.siig.negocio.Categoria;
import ar.com.siig.negocio.Guia;
import ar.com.siig.negocio.Marca;
import ar.com.siig.negocio.MarcaSenial;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.struts.utils.Validator;
import ar.com.siig.dto.GuiaDTO;
import ar.com.siig.dto.MarcaSenialDTO;
import ar.com.siig.fachada.CategoriaFachada;
import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.fachada.EstablecimientoFachada;
import ar.com.siig.fachada.GuiaFachada;
import ar.com.siig.fachada.PeriodoFachada;
import ar.com.siig.struts.actions.forms.GuiaForm;
import ar.com.siig.utils.Constantes;
import ar.com.siig.utils.Fecha;
import ar.com.siig.utils.InputOutput;
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
			
			// valido nuevamente por seguridad.  
			if (!validarAltaLegalizacionGuiaForm(new StringBuffer(), guiaForm)) {
				throw new Exception("Error de Seguridad");
			}
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
	
	@SuppressWarnings("unchecked")
	public ActionForward cargarConsultaLegalizacionGuia(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoConsultaLegalizacionGuias";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");
			PeriodoFachada periodoFachada = (PeriodoFachada) ctx.getBean("periodoFachada");
			
			String idProd = request.getParameter("idProductor");
			String periodo = request.getParameter("periodo");
			String urlSeleccionGuia = request.getParameter("urlSeleccionGuia");
			
			request.setAttribute("idProductor", idProd);
			request.setAttribute("periodo", periodo);
			request.setAttribute("productores", entidadFachada.getProductoresDTO());
			request.setAttribute("periodos", periodoFachada.getPeriodosDTO());
			
			if(urlSeleccionGuia.equals("cargarGuiaLegalizada")){
				request.setAttribute("titulo", "Consulta de Guías Legalizadas");
			}else{
				request.setAttribute("titulo", "Devolución de Guías");
			}
			
			request.setAttribute("urlDetalle",
					"../../guia.do?metodo=recuperarLegalizacionGuias");
			request.setAttribute("urlSeleccionGuia",urlSeleccionGuia);

			//request.setAttribute("urlSeleccionGuia","cargarGuiaLegalizada");
			//request.setAttribute("urlSeleccionGuia","cargarGuiaParaDevolucion");			
			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarLegalizacionGuias(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strForward = "exitoRecuperarLegalizacionGuias";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			GuiaFachada guiaFachada = (GuiaFachada) ctx.getBean("guiaFachada");
			String idProductor = request.getParameter("idProductor");
			String periodo = request.getParameter("periodo");			
			String urlSeleccionGuia = request.getParameter("urlSeleccionGuia");
			
			List<Guia> listaGuiasLegalizadas = guiaFachada.recuperarLegalizacionGuias(Long.valueOf(idProductor),periodo);
			request.setAttribute("guias", listaGuiasLegalizadas);
			request.setAttribute("urlSeleccionGuia", urlSeleccionGuia);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}			
	
	@SuppressWarnings("unchecked")
	public ActionForward cargarGuiaLegalizada(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarGuiaLegalizada";
		try {
			String idGuia = request.getParameter("id");
			String urlSeleccionGuia = request.getParameter("metodo");
			WebApplicationContext ctx = getWebApplicationContext();
			GuiaFachada guiaFachada = (GuiaFachada) ctx.getBean("guiaFachada");
			
			GuiaDTO guia = guiaFachada.recuperarGuiaDTO(Long.valueOf(idGuia));
			
			String path = request.getServletContext().getRealPath("imagenes");		
			MarcaSenialDTO marcaSenial = guia.getMarcaSenial();//(guia.getMarca()!=null)?guia.getMarca():guia.getSenial();

			StringBuffer nombreImg = new StringBuffer(marcaSenial.getNombreImagen());			
			nombreImg.insert(nombreImg.indexOf("."), marcaSenial.getId());			
				
			FileOutputStream fos = new FileOutputStream(new File(path+
					File.separatorChar+nombreImg));			
			InputOutput.copyStream(marcaSenial.getImagen().getBinaryStream(),fos);
				
			marcaSenial.setNombreImagen(nombreImg.toString());			
						
			request.setAttribute("guia", guia);
			request.setAttribute("urlSeleccionGuia", urlSeleccionGuia);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}			
	
	@SuppressWarnings("unchecked")
	public ActionForward cargarGuiaParaDevolucion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarGuiaParaDevolucion";
		try {
			String idGuia = request.getParameter("id");
			String urlSeleccionGuia = request.getParameter("metodo");
			WebApplicationContext ctx = getWebApplicationContext();
			
			GuiaFachada guiaFachada = (GuiaFachada) ctx.getBean("guiaFachada");
			EstablecimientoFachada establecimientoFachada = 
						(EstablecimientoFachada)ctx.getBean("establecimientoFachada"); 
			CategoriaFachada categoriaFachada = (CategoriaFachada) ctx.getBean("categoriaFachada");			
			
			GuiaDTO guia = guiaFachada.recuperarGuiaDTO(Long.valueOf(idGuia));
			
			String path = request.getServletContext().getRealPath("imagenes");		
			MarcaSenialDTO marcaSenial = guia.getMarcaSenial();

			StringBuffer nombreImg = new StringBuffer(marcaSenial.getNombreImagen());			
			nombreImg.insert(nombreImg.indexOf("."), marcaSenial.getId());			
				
			FileOutputStream fos = new FileOutputStream(new File(path+
					File.separatorChar+nombreImg));			
			InputOutput.copyStream(marcaSenial.getImagen().getBinaryStream(),fos);
				
			marcaSenial.setNombreImagen(nombreImg.toString());			
			
			/*List<Categoria> listaCategoria = categoriaFachada.getCategorias(guia.getMarcaSenial().getTipo());			
			request.setAttribute("categorias",listaCategoria);*/
			
			request.setAttribute("establecimientos", establecimientoFachada.
											getEstablecimientosDTODeProductor(guia.getProductor().getId()));
			request.setAttribute("finalidades", guiaFachada.recuperarFinalidades());			
			request.setAttribute("guia", guia);
			request.setAttribute("urlSeleccionGuia", urlSeleccionGuia);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward altaDevolucionGuia(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoDevolucionGuia";

		try {
			GuiaForm guiaForm = (GuiaForm) form;
			WebApplicationContext ctx = getWebApplicationContext();
			GuiaFachada guiaFachada = (GuiaFachada) ctx.getBean("guiaFachada");
			
			// valido nuevamente por seguridad.  
			if (!validarDevolucionGuiaForm(new StringBuffer(), guiaForm)) {
				throw new Exception("Error de Seguridad");
			}
			guiaFachada.altaDevolucionGuia(guiaForm.getGuia());
			
			request.setAttribute("exitoGrabado",
					Constantes.EXITO_DEVOLUCION_GUIA);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward cargarConsultaGuiasDevueltas(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoConsultaGuiasDevueltas";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EntidadFachada entidadFachada = (EntidadFachada) ctx.getBean("entidadFachada");
			PeriodoFachada periodoFachada = (PeriodoFachada) ctx.getBean("periodoFachada");
			
			String idProd = request.getParameter("idProductor");
			String periodo = request.getParameter("periodo");
			String urlSeleccionGuia = request.getParameter("urlSeleccionGuia");
			
			request.setAttribute("idProductor", idProd);
			request.setAttribute("periodo", periodo);
			request.setAttribute("productores", entidadFachada.getProductoresDTO());
			request.setAttribute("periodos", periodoFachada.getPeriodosDTO());
			
			if(urlSeleccionGuia != null && urlSeleccionGuia.equals("cargarGuiaDevuelta")){
				request.setAttribute("titulo", "Consulta de Guías Devueltas");
			}else{
				request.setAttribute("titulo", "Generar Boletas de Pago");
			}
			
			request.setAttribute("urlDetalle",
					"../../guia.do?metodo=recuperarGuiasDevueltas");
			request.setAttribute("urlSeleccionGuia",urlSeleccionGuia);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarGuiasDevueltas(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strForward = "exitoRecuperarGuiasDevueltas";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			GuiaFachada guiaFachada = (GuiaFachada) ctx.getBean("guiaFachada");
			String idProductor = request.getParameter("idProductor");
			String periodo = request.getParameter("periodo");			
			String urlSeleccionGuia = request.getParameter("urlSeleccionGuia");
			
			List<Guia> listaGuiasDevueltas = guiaFachada.recuperarGuiasDevueltas(Long.valueOf(idProductor),periodo);
			request.setAttribute("guias", listaGuiasDevueltas);
			request.setAttribute("urlSeleccionGuia", urlSeleccionGuia);
			
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
	
	public boolean validarDevolucionGuiaForm(StringBuffer error, ActionForm form) {

		try {
			GuiaForm guiaForm = (GuiaForm) form;
			GuiaDTO guia = guiaForm.getGuia();
			WebApplicationContext ctx = getWebApplicationContext();
			EstablecimientoFachada establecimientoFachada = 
				(EstablecimientoFachada)ctx.getBean("establecimientoFachada");

			boolean ok = true;
			boolean ok1 = true;
			boolean ok2 = true;
			boolean ok3 = true;
			boolean ok4 = true;
			boolean ok5 = true;
			boolean ok6 = true;
			boolean ok7 = true;
			
			ok = Validator.validarComboRequeridoSinNull("-1",Long.toString(guia.getEstablecimientoOrigen().getId()),
														 "Establecimiento de Orígen",error);

			ok1 = Validator.validarComboRequeridoSinNull("",guia.getFinalidadStr(),"Finalidad",error);
			
			ok2 = Validator.requerido(guia.getFechaTransito(), "Fecha de Transito", error);			
			
			ok3 = Validator.requerido(guia.getTipoAnimal().getId(), "Tipo Producto", error);
			
			if(ok3){
				ok3 = Validator.validarComboRequeridoSinNull("-1",Long.toString(guia.getTipoAnimal().getId()),
						 									 "Tipo Producto",error);
			}
			ok4 = Validator.validarEnteroMayorQue(0,String.valueOf(guia.getCantidad()), "Cantidad", error);
			
			ok5 = Validator.validarDoubleMayorQue(0,String.valueOf(guia.getCanon()), "Canon", error);
			
			ok6 = Validator.validarDoubleMayorQue(0,String.valueOf(guia.getMonto()+guia.getInteres()), "Monto Total", error);
			
			ok7 = establecimientoFachada.validarCantAnimalesEnEstablecimiento(guia.getEstablecimientoOrigen().getId(),
																		guia.getProductor().getId(),
																		guia.getTipoAnimal().getId(),
																		guia.getCantidad());
			if (!ok7) {
				Validator.addErrorXML(error, "La cantidad de Animales/Productos excede al número declarado por el productor en el establecimiento");
			}			
			
			return ok && ok1 && ok2 && ok3 && ok4 && ok5 && ok6 && ok7;			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado");
			return false;
		}
	}	
	
}
