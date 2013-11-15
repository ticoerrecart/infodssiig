package ar.com.siig.struts.actions.forms;

import java.util.List;

import org.apache.struts.action.ActionForm;

import ar.com.siig.dto.PeriodoDTO;
import ar.com.siig.dto.VencimientoPeriodoDTO;
import ar.com.siig.negocio.Periodo;
import ar.com.siig.struts.utils.Validator;

public class PeriodoForm extends ActionForm {

	private Periodo periodo;
	private PeriodoDTO periodoDTO;

	public PeriodoForm() {
		periodo = new Periodo();
		periodoDTO = new PeriodoDTO();
	}

	public boolean validar(StringBuffer error) {
		boolean b1 = Validator.requerido(this.getPeriodoDTO().getPeriodo(),
				"Periodo", error);
		boolean b2 = Validator.validarFormatoPeriodo(this.getPeriodoDTO()
				.getPeriodo(), error);
		
		List<VencimientoPeriodoDTO> lista = this.getPeriodoDTO().getVencimientoPeriodoDTO();
		
		boolean ok1 =  Validator.requerido(lista.get(0).getFecha(),"Fecha Vencimiento Julio", error);
		boolean ok2 = Validator.requerido(lista.get(2).getFecha(),"Fecha Vencimiento Agosto", error);
		boolean ok3 = Validator.requerido(lista.get(4).getFecha(),"Fecha Vencimiento Septiembre", error);
		boolean ok4 = Validator.requerido(lista.get(6).getFecha(),"Fecha Vencimiento Octubre", error);
		boolean ok5 = Validator.requerido(lista.get(8).getFecha(),"Fecha Vencimiento Noviembre", error);
		boolean ok6 = Validator.requerido(lista.get(10).getFecha(),"Fecha Vencimiento Diciembre", error);
		boolean ok7 = Validator.requerido(lista.get(1).getFecha(),"Fecha Vencimiento Enero", error);
		boolean ok8 = Validator.requerido(lista.get(3).getFecha(),"Fecha Vencimiento Febrero", error);
		boolean ok9 = Validator.requerido(lista.get(5).getFecha(),"Fecha Vencimiento Marzo", error);
		boolean ok10 = Validator.requerido(lista.get(7).getFecha(),"Fecha Vencimiento Abril", error);
		boolean ok11 = Validator.requerido(lista.get(9).getFecha(),"Fecha Vencimiento Mayo", error);
		boolean ok12 = Validator.requerido(lista.get(11).getFecha(),"Fecha Vencimiento Junio", error);
		
		return b1 && b2 && ok1 && ok2 && ok3 && ok4 && ok5 && ok6 && ok7 && ok8 && ok9 && ok10 && ok11 && ok12;

	}

	public Periodo getPeriodo() {
		return periodo;
	}

	public void setPeriodo(Periodo periodo) {
		this.periodo = periodo;
	}

	public PeriodoDTO getPeriodoDTO() {
		return periodoDTO;
	}

	public void setPeriodoDTO(PeriodoDTO periodoDTO) {
		this.periodoDTO = periodoDTO;
	}

}
