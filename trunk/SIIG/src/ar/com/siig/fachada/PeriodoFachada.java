package ar.com.siig.fachada;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import ar.com.siig.dao.PeriodoDAO;
import ar.com.siig.dto.GuiaDTO;
import ar.com.siig.dto.PeriodoDTO;
import ar.com.siig.negocio.Periodo;
import ar.com.siig.negocio.VencimientoPeriodo;
import ar.com.siig.negocio.exception.DataBaseException;
import ar.com.siig.negocio.exception.NegocioException;
import ar.com.siig.providers.ProviderDTO;
import ar.com.siig.providers.ProviderDominio;
import ar.com.siig.utils.Fecha;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class PeriodoFachada{

	private PeriodoDAO PeriodoDAO;
	private GuiaFachada guiaFachada;
	
	public PeriodoFachada() {
	}

	public PeriodoFachada(PeriodoDAO laPeriodoAO) {
		this.PeriodoDAO = laPeriodoAO;
		//this.guiaFachada = pGuiaFachada;
	}

	public GuiaFachada getGuiaFachada() {
		return guiaFachada;
	}

	public void setGuiaFachada(GuiaFachada guiaFachada) {
		this.guiaFachada = guiaFachada;
	}

	public List<Periodo> getPeriodos(){

		return PeriodoDAO.getPeriodos();	
	}

	public Periodo getPeriodoPorId(Long id){

		return PeriodoDAO.getPeriodoPorId(id);			
	}

	public boolean existePeriodo(PeriodoDTO Periodo) {
		return PeriodoDAO.existePeriodo(Periodo.getPeriodo(),Periodo.getId());
	}

	public void altaPeriodo(PeriodoDTO PeriodoDTO) throws NegocioException {

		PeriodoDAO.alta_modficacion_Periodo(ProviderDominio.getPeriodo(PeriodoDTO));
	}
	
	public List<PeriodoDTO> getPeriodosDTO(){

		List<PeriodoDTO> periodosDTO = new ArrayList<PeriodoDTO>();
		List<Periodo> periodos = PeriodoDAO.getPeriodos();
		
		for (Periodo Periodo : periodos) {
			periodosDTO.add(ProviderDTO.getPeriodoDTO(Periodo));
		}
		
		return periodosDTO;
	}	
	
	public PeriodoDTO getPeriodoDTOPorId(Long id){

		Periodo Periodo = PeriodoDAO.getPeriodoPorId(id);
		
		return ProviderDTO.getPeriodoDTO(Periodo);
	}
	
	public PeriodoDTO getPeriodoDTOPorPeriodo(String periodo){

		Periodo Periodo = PeriodoDAO.getPeriodoPorPeriodo(periodo);
		
		return ProviderDTO.getPeriodoDTO(Periodo);
	}
	
	public void modificacionPeriodo(PeriodoDTO PeriodoDTO) throws NegocioException{

		Periodo Periodo = PeriodoDAO.getPeriodoPorId(PeriodoDTO.getId());

		PeriodoDAO.alta_modficacion_Periodo(ProviderDominio.getPeriodo(Periodo,PeriodoDTO));		
	}
	
	public double calcularInteres(String pFechaVencimiento, String pFechaTransito, String pPeriodo){
		
		//pPeriodo="2012-2013";
		//String f1 = "12/07/2013";
		//Date fechaHoy = Fecha.stringDDMMAAAAToUtilDate(f1);
		
		//Calendar fechaHoy = Calendar.getInstance();
		Date fechaVencimiento = Fecha.stringDDMMAAAAToUtilDate(pFechaVencimiento);
		Date fechaTransito = Fecha.stringDDMMAAAAToUtilDate(pFechaTransito);
		
		Periodo periodo = PeriodoDAO.getPeriodoPorPeriodo(pPeriodo);
		int intervalos = recuperarFechaVencimiento(0,periodo,fechaTransito,fechaVencimiento);
		//int intervalos = recuperarFechaVencimiento(0,periodo,fechaTransito,fechaHoy.getTime());

		String a = "01/07/"+pPeriodo.substring(5);
		Date fechaFinPeriodo = Fecha.stringDDMMAAAAToUtilDate(a);
		
		//Por si la fecha de hoy no se corresponde con el periodo de la guia en cuestion
		//if(fechaFinPeriodo.before(fechaHoy.getTime())){
		if(fechaFinPeriodo.before(fechaVencimiento)){
			Integer anioPeriodo = new Integer(pPeriodo.substring(5));
			anioPeriodo++;
			Periodo periodoSiguiente = PeriodoDAO.getPeriodoPorPeriodo(pPeriodo.substring(5)+"-"+anioPeriodo);
			//intervalos = recuperarFechaVencimiento(intervalos,periodoSiguiente,fechaTransito,fechaHoy.getTime());
			intervalos = recuperarFechaVencimiento(intervalos,periodoSiguiente,fechaTransito,fechaVencimiento);
		}

		switch (intervalos){
		case 0: return 0.0;
		case 1: return 0.5;
		case 2: return 0.75;
		default:return 1.0;
		}
	}	
	
	public List<GuiaDTO> calcularInteres2(String pFechaVencimiento, String pPeriodo, Long idProductor){
		
		List<GuiaDTO> listaGuiasDevueltas = guiaFachada.recuperarGuiasDevueltasImpagasDTO(idProductor,pPeriodo);		
		
		for (GuiaDTO guia : listaGuiasDevueltas) {				
			double interes = calcularInteres(pFechaVencimiento,guia.getFechaTransito(), pPeriodo);
			guia.setInteres(interes);
		}	
		
		return listaGuiasDevueltas;
	}
	
	public int recuperarFechaVencimiento(int pIntervalo, Periodo periodo, Date fechaTransito, Date fechaHoy){
		
		int intervalos = pIntervalo;
		Collections.sort(periodo.getVencimientoPeriodo());
		
		for (VencimientoPeriodo vp : periodo.getVencimientoPeriodo()) {
			Date fechaV = vp.getFecha();  
			if(fechaV.after(fechaTransito) && fechaV.before(fechaHoy)){
				intervalos++;
			}
		}

		return intervalos;
	}
}
