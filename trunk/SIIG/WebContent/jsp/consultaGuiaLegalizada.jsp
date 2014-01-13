<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>		

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">
	

<script>

var type;
if (navigator.userAgent.indexOf("Opera")!=-1 && document.getElementById) type="OP"; 
if (document.all) type="IE"; 
if (!document.all && document.getElementById) type="MO";

function volver(){

	var idProductor = $("#idProductor").val();
	var periodo = $("#periodo").val();
	parent.location=contextRoot() + "/guia.do?metodo=cargarConsultaLegalizacionGuia&idProductor="+idProductor+"&periodo="+periodo;
}

//-----------------------------------------------------//

</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

	<input id="idProductor" type="hidden" value="${guia.productor.id}">
	<input id="periodo" type="hidden" value="${guia.periodo}">
	
	<table border="0" class="cuadrado" align="center" width="80%"
		cellpadding="2">
		<tr>
			<td colspan="4" class="azulAjustado">
				Legalización de Guía
			</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>

		<tr>
			<td width="12%" class="botoneralNegritaRight">Nro de Guía</td>
			<td width="30%" align="left">
				<input value="${guia.numero}" class="botonerab" type="text" size="20" readonly="readonly">
			</td>

			<td width="30%" class="botoneralNegritaRight">Período</td>
			<td align="left">
				<input value="${guia.periodo}" class="botonerab" type="text" size="20" readonly="readonly">				
			</td>
		</tr>

		<tr>
			<td width="12%" class="botoneralNegritaRight">Productor</td>
			<td width="30%" align="left">
				<input value="${guia.productor.nombre}" class="botonerab" type="text" size="20" readonly="readonly">
			</td>
			<td width="30%" class="botoneralNegritaRight">Fecha de Legalización</td>
			<td align="left">				
				<input value="${guia.fechaLegalizacion}" class="botonerab" type="text" size="20" readonly="readonly">						
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
			</td>
		</tr>
		<tr>
			<td width="12%" class="botoneralNegritaRight">Nro Interno</td>
			<td width="30%" align="left">
				<input value="${guia.numeroInterno}" class="botonerab" type="text" size="20" readonly="readonly">
			</td>
			<td colspan="2"></td>
		</tr>		
		<tr>
			<td height="10" colspan="4"></td>
		</tr>
	</table>


	<!-- MARCA/SEÑAL -->
	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td colspan="4" align="left">
				<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="2" class="grisSubtitulo">Marca/Señal</td>
					</tr>
					<tr>
						<td colspan="2" height="10"></td>
					</tr>					
					<tr>
						<td colspan="2" height="10">
							<c:choose>
								<c:when test="${guia.marcaSenial.tipo == 'Marca'}">
									<c:set var="titulo" value="Nro Marca" />
									<input type="radio" id="radioMayor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMayor')" 
											disabled="disabled" checked="checked">Ganado Mayor
									<input type="radio" id="radioMenor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMenor')" 
											disabled="disabled">Ganado Menor
								</c:when>
								<c:otherwise>
									<c:set var="titulo" value="Nro Señal" />
									<input type="radio" id="radioMayor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMayor')" 
											disabled="disabled">Ganado Mayor
									<input type="radio" id="radioMenor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMenor')" 
											disabled="disabled" checked="checked">Ganado Menor								
								</c:otherwise>	
							</c:choose>	
						</td>
					</tr>
					<tr>
						<td colspan="2">
							
							<table border="0" class="cuadradoSinBorde" align="center" width="50%" cellpadding="2" cellspacing="0">
								<tr>
									<td colspan="2" height="10"></td>
								</tr>							
								<tr>
									<td class="botoneralNegritaRight">
										<c:out value="${titulo}"></c:out>
									</td>
									<td align="left">
										<input type="text" class="botonerab" size="10" readonly="readonly" value="${guia.marcaSenial.numero}">
									</td>																		
								</tr>
								<tr>
									<td colspan="2" height="10"></td>
								</tr>								
								<tr>
									<td colspan="2">
										<img alt="" src="../../imagenes/<c:out value='${guia.marcaSenial.nombreImagen}'></c:out>">																			
									</td>
								</tr>
							</table>
							
						</td>
					</tr>																												
					<tr>
						<td colspan="2" height="10"></td>
					</tr>				
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3" height="10"></td>
		</tr>				
	</table>								


	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td height="10" colspan="4"></td>
		</tr>
		<tr>
			<td height="20" colspan="4">
				<input type="button" value="Volver" class="botonerab" onclick="volver();" > 
			</td>
		</tr>
		<tr>
			<td height="10" colspan="4"></td> 
		</tr>
	</table>
