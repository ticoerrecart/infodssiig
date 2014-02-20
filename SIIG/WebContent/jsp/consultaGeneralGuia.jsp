<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript">

function cambiarProductor(){

	var idProductor = $('#idProductor').val();
	var periodo = $('#periodo').val();
	var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
	
	$('#divCargando').show();	
	$('#divDetalle').html("");

	if(idProductor != "" && idProductor != "-1"){
		$('#divDetalle').load( $('#paramUrlDetalle').val() + '&idProductor='+idProductor + '&periodo=' + periodo + '&urlSeleccionGuia=' + urlSeleccionGuia);
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

function cargarProductorPeriodo(idProd,periodo){

	$("#idProductor").val(idProd);
	$("#periodo").val(periodo);

	cambiarProductor();
}

</script>

<input id="paramUrlDetalle" type="hidden" value="${urlDetalle}">
<input id="paramUrlSeleccionGuia" type="hidden" value="${urlSeleccionGuia}">

<input id="idPeriodo" type="hidden" value="${periodo}">

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
		<td class="botoneralNegritaRight" width="30%">Tipo de Productor</td>
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
		<td width="40%" class="botoneralNegritaRight">Período</td>
		<td class="botonerab" align="left">
			<select id="periodo" class="botonerab" onchange="cambiarProductor()">
				<c:forEach items="${periodos}" var="per">
					<option value="${per.periodo}">
						<c:out value="${per.periodo}"></c:out>
					</option>
				</c:forEach>
			</select>
		</td>
	</tr> 
	<tr>
		<td height="20" colspan="3"></td>
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
	if('${idProductor}' !="" && $("#idPeriodo").val()!=""){

		cargarProductorPeriodo('${idProductor}',$("#idPeriodo").val());
	}
</script>