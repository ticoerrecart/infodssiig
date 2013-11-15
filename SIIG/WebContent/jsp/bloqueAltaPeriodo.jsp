<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">
	
<script type="text/javascript">

	$(function() {
	
		$( "#datepicker1" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker2" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker3" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker4" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker5" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker6" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker7" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker8" ).datepicker({ dateFormat: 'dd/mm/yy'});							
		$( "#datepicker9" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker10" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker11" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker12" ).datepicker({ dateFormat: 'dd/mm/yy'});
	});

	function submitir(){
		validarForm("periodoFormId","../periodo","validarPeriodoForm","PeriodoForm");
	}
</script>


<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="periodo" styleId="periodoFormId" onsubmit="javascript:submitir();">
	<c:choose>
		<c:when test="${empty metodo}">
			<html:hidden property="metodo" value="${param.metodo}" />
		</c:when>
		<c:otherwise>
			<html:hidden property="metodo" value="${metodo}" />
		</c:otherwise>
	</c:choose>
	<html:hidden property="periodoDTO.id" value="${periodo.id}" />

	<table border="0" class="cuadrado" align="center" width="80%"
		cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				<c:choose>
					<c:when test="${metodo == 'altaPeriodo'}">
						Alta Periodo
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Periodo</td>
			<td align="left">
				<html:text styleClass="botonerab" property="periodoDTO.periodo" value="${periodo.periodo}" 
							onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="botoneralNegrita" style="font:oblique; " >El formato es AAAA-AAAA. Ej: 2012-2013</td>
		</tr>		
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2">
				<table border="0" class="cuadradoSinBorde" align="center" width="100%" cellpadding="2">
					<tr>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Julio
						</td>
						<td width="30%">
							<input id="datepicker1" type="text" name="periodoDTO.vencimientoPeriodoDTO[0].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[0].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[0].id" value="${periodo.vencimientoPeriodoDTO[0].id}">							
						</td>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Enero
						</td>
						<td width="30%">
							<input id="datepicker2" type="text" name="periodoDTO.vencimientoPeriodoDTO[1].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[1].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>	
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[1].id" value="${periodo.vencimientoPeriodoDTO[1].id}">						
						</td>						
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Agosto
						</td>
						<td width="30%">
							<input id="datepicker3" type="text" name="periodoDTO.vencimientoPeriodoDTO[2].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[2].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[2].id" value="${periodo.vencimientoPeriodoDTO[2].id}">							
						</td>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Febrero
						</td>
						<td width="30%">
							<input id="datepicker4" type="text" name="periodoDTO.vencimientoPeriodoDTO[3].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[3].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[3].id" value="${periodo.vencimientoPeriodoDTO[3].id}">							
						</td>						
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Septiembre
						</td>
						<td width="30%">
							<input id="datepicker5" type="text" name="periodoDTO.vencimientoPeriodoDTO[4].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[4].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>	
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[4].id" value="${periodo.vencimientoPeriodoDTO[4].id}">						
						</td>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Marzo
						</td>
						<td width="30%">
							<input id="datepicker6" type="text" name="periodoDTO.vencimientoPeriodoDTO[5].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[5].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[5].id" value="${periodo.vencimientoPeriodoDTO[5].id}">							
						</td>						
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Octubre
						</td>
						<td width="30%">
							<input id="datepicker7" type="text" name="periodoDTO.vencimientoPeriodoDTO[6].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[6].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[6].id" value="${periodo.vencimientoPeriodoDTO[6].id}">							
						</td>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Abril
						</td>
						<td width="30%">
							<input id="datepicker8" type="text" name="periodoDTO.vencimientoPeriodoDTO[7].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[7].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[7].id" value="${periodo.vencimientoPeriodoDTO[7].id}">							
						</td>						
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Noviembre
						</td>
						<td width="30%">
							<input id="datepicker9" type="text" name="periodoDTO.vencimientoPeriodoDTO[8].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[8].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[8].id" value="${periodo.vencimientoPeriodoDTO[8].id}">							
						</td>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Mayo
						</td>
						<td width="30%">
							<input id="datepicker10" type="text" name="periodoDTO.vencimientoPeriodoDTO[9].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[9].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[9].id" value="${periodo.vencimientoPeriodoDTO[9].id}">							
						</td>						
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Diciembre
						</td>
						<td width="30%">
							<input id="datepicker11" type="text" name="periodoDTO.vencimientoPeriodoDTO[10].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[10].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[10].id" value="${periodo.vencimientoPeriodoDTO[10].id}">							
						</td>
						<td width="20%" class="botoneralNegritaRight">
							Fecha Vencimiento Junio
						</td>
						<td width="30%">
							<input id="datepicker12" type="text" name="periodoDTO.vencimientoPeriodoDTO[11].fecha" readonly="readonly" 
								class="botonerab" value="${periodo.vencimientoPeriodoDTO[11].fecha}">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							<input type="hidden" name="periodoDTO.vencimientoPeriodoDTO[11].id" value="${periodo.vencimientoPeriodoDTO[11].id}">							
						</td>						
					</tr>																									
				</table>
			</td>
		</tr>		
		<tr>
			<td height="10" colspan="2"></td>
		</tr>		
		<tr>
			<td height="20" colspan="2">
				<input type="button" class="botonerab" value="Aceptar" id="enviar"
						onclick="javascript:submitir();"> 
				<c:choose>
					<c:when test="${empty metodo}">
						<input type="button" class="botonerab" value="Cancelar"
							onclick="javascript:parent.location= contextRoot() +  '/jsp.do?page=.index'">
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
	</table>

</html:form>
