<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/TipoAnimalFachada.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>
	
<script type="text/javascript">

var type;
if (navigator.userAgent.indexOf("Opera")!=-1 && document.getElementById) type="OP"; 
if (document.all) type="IE"; 
if (!document.all && document.getElementById) type="MO";

function cambioProductor(){

	var idProductor = $("#idProductor").val();
	//var paramUrlDetalle = $("#paramUrlDetalle").val();
	var urlSeleccionGuia = $("#urlSeleccionGuia").val();
	$('#divCargando').show();	
	$('#divDetalle').html("");
	
	if(idProductor != "-1"){
		
		//$('#divDetalle').load( $('#paramUrlDetalle').val() + '&idProductor='+idProductor + '&urlSeleccionGuia=' + urlSeleccionGuia);
		$('#divDetalle').load('../../animalEnEstablecimiento.do?metodo=recuperarStockAnimalesConsultaModificacion&idProductor='+idProductor + '&urlSeleccionGuia=' + urlSeleccionGuia);
		
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
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<!-- <input id="paramUrlDetalle" type="hidden" value="${paramUrlDetalle}"> -->

<input id="urlSeleccionGuia" type="hidden" value="${urlSeleccionGuia}">

	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td class="azulAjustado">
				${titulo}
			</td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>	
		<tr>
			<td>
				<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2" cellspacing="0">		
					<tr>
						<td height="15" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="botoneralNegritaRight">Productor</td>
						<td class="botonerab" align="left">
							<select id="idProductor" class="botonerab" onchange="cambioProductor();">
								<option value="-1">- Seleccione un Productor -</option>
								<c:forEach items="${productores}" var="productor" varStatus="i">
									<option value="<c:out value='${productor.id}'></c:out>">
										<c:out value="${productor.nombre}"></c:out>
									</option>							
								</c:forEach>
							</select>					
						</td>
					</tr>	
					<tr>
						<td height="10" colspan="2"></td>
					</tr>						
				</table>		
			</td>
		</tr>
		
		<tr>
			<td>
				<table border="0" class="cuadradoSinBorde" align="center" width="90%" cellpadding="2" cellspacing="0">	
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
						<td height="10" colspan="3"></td>
					</tr>
				</table>				
			</td>	
		</tr>	
		<tr>
			<td height="10"></td>
		</tr>
	</table>