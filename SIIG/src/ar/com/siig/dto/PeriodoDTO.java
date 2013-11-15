package ar.com.siig.dto;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;


public class PeriodoDTO {

	private Long id;
	private String periodo;
	private List<VencimientoPeriodoDTO> vencimientoPeriodoDTO;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public PeriodoDTO(){
		
		vencimientoPeriodoDTO = (List<VencimientoPeriodoDTO>) LazyList.decorate(new ArrayList(),
				FactoryUtils.instantiateFactory(VencimientoPeriodoDTO.class));
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	
	public List<VencimientoPeriodoDTO> getVencimientoPeriodoDTO() {
		return vencimientoPeriodoDTO;
	}

	public void setVencimientoPeriodoDTO(
			List<VencimientoPeriodoDTO> vencimientoPeriodoDTO) {
		this.vencimientoPeriodoDTO = vencimientoPeriodoDTO;
	}	
}
