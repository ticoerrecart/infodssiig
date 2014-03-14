package ar.com.siig.fachada;

import java.util.HashMap;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import ar.com.siig.dao.ReportesDAO;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.utils.Constantes;

@Transactional(rollbackFor = { Throwable.class })
public class ReportesFachada {

	private ReportesDAO reportesDAO;

	public ReportesFachada() {
	}

	public ReportesFachada(ReportesDAO pReportesDAO) {

		this.reportesDAO = pReportesDAO;
	}

	public byte[] generarReporteVencimientoMarcasSeniales(String path,
			Long idProductor) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("idProductor", idProductor);

		return reportesDAO.generarReporte(
				Constantes.REPORTE_VENCIMIENTO_MARCAS_SENIALES, parameters);
	}

	public byte[] generarReporteGuias(String tipoGuia, String path,
			Long idProductor, String periodo) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("idProductor", idProductor);
		parameters.put("periodo", periodo);
		String nombreReporte = "";
		if (tipoGuia.equals("Devueltas")) {
			nombreReporte = Constantes.REPORTE_GUIAS_DEVUELTAS;
		} else {
			if (tipoGuia.equals("Legalizadas")) {
				nombreReporte = Constantes.REPORTE_GUIAS_LEGALIZADAS;
			} else {
				if (tipoGuia.equals("Registradas")) {
					nombreReporte = Constantes.REPORTE_GUIAS_REGISTRADAS;
				} else {
					if (tipoGuia.equals("Canceladas")) {
						nombreReporte = Constantes.REPORTE_GUIAS_CANCELADAS;
					} else {
						if (tipoGuia.equals("EstadoGralGuias")) {
							nombreReporte = Constantes.REPORTE_ESTADO_GRAL_GUIAS;
						} else {						
							throw new NegocioException("No existe el reporte para "
									+ tipoGuia);
						}	
					}
				}
			}
		}
		return reportesDAO.generarReporte(nombreReporte, parameters);
	}

	public byte[] generarReporteProductorPeriodoDestino(String path,
			Long idProductor, String tipoGuia, String periodo,
			Long idEstablecimientoDestino) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("idProductor", idProductor);
		parameters.put("periodo", periodo);
		parameters.put("destino", idEstablecimientoDestino);
		parameters.put("tipoGuia", tipoGuia);
		return reportesDAO.generarReporte(
				Constantes.REPORTE_PRODUCTOR_PERIODO_DESTINO, parameters);
	}
}
