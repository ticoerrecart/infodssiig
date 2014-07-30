<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>
	
<script type="text/javascript" 
		src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>
				
<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	  type="text/css">
	
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript">

$(function() {
	
	$( "#datepickerDesde" ).datepicker({ dateFormat: 'dd/mm/yy'});
	$( "#datepickerHasta" ).datepicker({ dateFormat: 'dd/mm/yy'});
});


function filtrarDenuncias(){

	var idProductor = $('#idProductor').val();
	var desde = $('#datepickerDesde').val();
	var hasta = $('#datepickerHasta').val();
	var urlSeleccionDenuncia = $('#paramUrlSeleccionDenuncia').val();
	
	$('#divCargando').show();	
	$('#divDetalle').html("");

	if(idProductor != ""){
		$('#divDetalle').load( $('#paramUrlDetalle').val() + '&idProductor='+idProductor + '&desde=' + desde + '&hasta=' + hasta + '&urlSeleccionDenuncia=' + urlSeleccionDenuncia);
		$('#divDetalle').hide();
		$('#divDetalle').fadeIn(600);

		Concurrent.Thread.create(function(){
		    while ($('#divDetalle').html() == "") {}
		    $('#divCargando').hide();
		});		
		
	}else{
		$('#divDetalle').hide(600);
		$('#divDetalle').html("");
		$('#divCargando').hide();
	}	
}		

function cargarProductorPeriodo(idProd,desde, hasta){

	$("#idProductor").val(idProd);
	$("#datepickerDesde").val(desde);
	$("#datepickerHasta").val(hasta);

	filtrarDenuncias();
}

</script>

<input id="paramUrlDetalle" type="hidden" value="${urlDetalle}">
<input id="paramUrlSeleccionDenuncia" type="hidden" value="${urlSeleccionDenuncia}">

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<div id="errores" class="rojoAdvertencia">${error}</div>


<br>
<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
	<tr>
		<td class="azulAjustado" colspan="3"><c:out value="${titulo}" /></td>
	</tr>
	<tr>
		<td height="20" colspan="3"></td>
	</tr>

	<tr>
		<td class="botoneralNegritaRight" width="40%">Tipo de Productor</td>
		<td class="botonerab" align="left">
			<select id="idProductor" class="botonerab" onchange="cambiarProductor()">
				<option value="-1">-Seleccione un Productor-</option>
				<c:forEach items="${productores}" var="prod">
					<option value="${prod.id}">
						<c:out value="${prod.nombre}"></c:out>
					</option>
				</c:forEach>
			</select>
		</td>
		<td width="15%"></td>					
	</tr>
	
	<tr>
		<td width="40%" class="botoneralNegritaRight">Desde</td>
			<td class="botonerab" align="left">
				<input id="datepickerDesde" type="text" name="desde" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
			</td>
	</tr>
	
	<tr>
		<td width="40%" class="botoneralNegritaRight">Hasta</td>
			<td class="botonerab" align="left">
				<input id="datepickerHasta" type="text" name="hasta" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
			</td>
	</tr>
	 
	<tr>
		<td height="20" colspan="3"></td>
	</tr>
	
	<tr>
		<td height="20" colspan="3">
			<input type="button" onclick="javascript:filtrarDenuncias();" value="Aceptar">
		</td>
	</tr>
	<tr>
		<td id="divCargando" style="display: none" colspan="3">
			<img src="<html:rewrite page='/imagenes/cargando.gif'/>">
		</td>	
	</tr>
	<tr>
		<td colspan="3">
			<div id="divDetalle"></div>		
		</td>	
	</tr>	
	<tr>
		<td height="20" colspan="3"></td>
	</tr>
</table>
<script type="text/javascript">
	if('${idProductor}' !=""){
		cargarProductorPeriodo('${idProductor}',$("#datepickerDesde").val(), $("#datepickerHasta").val());
	}
</script>