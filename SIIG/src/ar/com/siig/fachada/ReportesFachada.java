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

}
