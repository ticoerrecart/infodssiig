package ar.com.siig.struts.actions;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.util.StringUtils;
import org.springframework.web.context.WebApplicationContext;

import ar.com.siig.fachada.EntidadFachada;
import ar.com.siig.fachada.EstablecimientoFachada;
import ar.com.siig.fachada.PeriodoFachada;
import ar.com.siig.fachada.ReportesFachada;
import ar.com.siig.utils.MyLogger;

public class ReportesAction extends ValidadorAction {

	public ActionForward cargarReporteVencimientoMarcasSeniales(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strForward = "exitoCargarReporteVencimientoMarcasSeniales";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			// PeriodoFachada periodoFachada = (PeriodoFachada)
			// ctx.getBean("periodoFachada");
			EntidadFachada entidadFachada = (EntidadFachada) ctx
					.getBean("entidadFachada");

			// request.setAttribute("periodos",periodoFachada.getPeriodosDTO());
			request.setAttribute("productores",
					entidadFachada.getProductoresDTO());
			request.setAttribute("titulo",
					"Reporte Vencimiento de Títulos de Marcas y señales");
			request.setAttribute("action", "reportes");
			request.setAttribute("metodo",
					"generarReporteVencimientoMarcasSeniales");
			request.setAttribute("permitirTodosLosProductores", "S");
			// request.setAttribute("permitirTodosLosPeriodos","N");
			request.setAttribute("mostrarPeriodos", "N");

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward generarReporteVencimientoMarcasSeniales(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx
					.getBean("reportesFachada");
			String productor = request.getParameter("productor");

			byte[] bytes = reportesFachada
					.generarReporteVencimientoMarcasSeniales(path,
							Long.valueOf(productor));

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}

	public ActionForward cargarReporteGuias(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strForward = "exitoCargarReporteGuias";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PeriodoFachada periodoFachada = (PeriodoFachada) ctx
					.getBean("periodoFachada");
			EntidadFachada entidadFachada = (EntidadFachada) ctx
					.getBean("entidadFachada");

			String tipoGuia = request.getParameter("tipoGuia");
			if (tipoGuia.equals("Legalizadas")) {
				request.setAttribute("titulo", "Reporte Guías Legalizadas");
			} else {
				if (tipoGuia.equals("Registradas")) {
					request.setAttribute("titulo", "Reporte Guías Registradas");
				} else {
					if (tipoGuia.equals("Devueltas")) {
						request.setAttribute("titulo",
								"Reporte Producto Movido");
					} else {
						if (tipoGuia.equals("Canceladas")) {
							request.setAttribute("titulo",
									"Reporte Guías Canceladas");
						}
						else{
							if (tipoGuia.equals("EstadoGralGuias")) {
								request.setAttribute("titulo",
										"Reporte Estado General de Guías");
							}							
						}
					}
				}
			}
			request.setAttribute("periodos", periodoFachada.getPeriodosDTO());
			request.setAttribute("productores",
					entidadFachada.getProductoresDTO());
			request.setAttribute("action", "reportes");
			request.setAttribute("metodo", "generarReporteGuias");
			request.setAttribute("tipoGuia", tipoGuia);
			request.setAttribute("permitirTodosLosProductores", "S");
			request.setAttribute("permitirTodosLosPeriodos", "S");

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward generarReporteGuias(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx
					.getBean("reportesFachada");
			String productor = request.getParameter("productor");
			String periodo = request.getParameter("periodo");
			String tipoGuia = request.getParameter("tipoGuia");
			byte[] bytes = reportesFachada.generarReporteGuias(tipoGuia, path,
					Long.valueOf(productor), periodo);

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}

	public ActionForward cargarReporteProductorPeriodoDestino(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strForward = "exitoCargarReporteProductorPeriodoDestino";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PeriodoFachada periodoFachada = (PeriodoFachada) ctx
					.getBean("periodoFachada");
			EntidadFachada entidadFachada = (EntidadFachada) ctx
					.getBean("entidadFachada");
			EstablecimientoFachada establecimientoFachada = (EstablecimientoFachada) ctx
					.getBean("establecimientoFachada");

			String tipoGuia = request.getParameter("tipoGuia");
			if (!StringUtils.hasText(tipoGuia)) {
				tipoGuia = "DEVUELTA";
			}
			request.setAttribute("titulo",
					"Reporte Detalle Guías Por Establecimiento Destino");
			request.setAttribute("periodos", periodoFachada.getPeriodosDTO());
			request.setAttribute("productores",
					entidadFachada.getProductoresDTO());
			request.setAttribute("destinos",
					establecimientoFachada.getEstablecimientosDTO());
			request.setAttribute("action", "reportes");
			request.setAttribute("metodo", "generarProductorPeriodoDestino");
			request.setAttribute("tipoGuia", tipoGuia);
			request.setAttribute("permitirTodosLosProductores", "S");
			request.setAttribute("permitirTodosLosPeriodos", "S");
			request.setAttribute("permitirTodosLosEstablecimientos", "S");

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}

	public ActionForward generarProductorPeriodoDestino(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx
					.getBean("reportesFachada");
			String productor = request.getParameter("productor");
			String periodo = request.getParameter("periodo");
			String tipoGuia = request.getParameter("tipoGuia");
			String destino = request.getParameter("establecimientoDestino");
			byte[] bytes = reportesFachada
					.generarReporteProductorPeriodoDestino(path,
							Long.valueOf(productor), tipoGuia, periodo,
							Long.valueOf(destino));

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado");
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}
}
