package ar.com.siig.fachada;

import java.util.HashMap;
import java.util.Map;

import ar.com.siig.dao.ReportesDAO;
import ar.com.siig.utils.Constantes;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class ReportesFachada{

	private ReportesDAO reportesDAO;
	
	public ReportesFachada(){}
	
	public ReportesFachada(ReportesDAO pReportesDAO){
		
		this.reportesDAO = pReportesDAO;
	}	

	public byte[] generarReporteVencimientoMarcasSeniales(
			String path, Long idProductor) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("idProductor", idProductor);

		return reportesDAO.generarReporte(Constantes.REPORTE_VENCIMIENTO_MARCAS_SENIALES,parameters);
	}	

	public byte[] generarReporteGuiasLegalizadas(
			String path, Long idProductor, String periodo) throws Exception {

		Map parameters = new HashMap();
		parameters.put("PATH_SUB_REPORTES", path);
		parameters.put("idProductor", idProductor);
		parameters.put("periodo", periodo);

		return reportesDAO.generarReporte(Constantes.REPORTE_GUIAS_LEGALIZADAS,parameters);
	}	
	
}
