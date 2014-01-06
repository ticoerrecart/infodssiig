<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>		
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/MarcaSenialFachada.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/EntidadFachada.js'/>"></script>

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">
	

<script>
	$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});		
	});

var type;
if (navigator.userAgent.indexOf("Opera")!=-1 && document.getElementById) type="OP"; 
if (document.all) type="IE"; 
if (!document.all && document.getElementById) type="MO";



function submitir(){
	validarForm("guiaForm","../guia","validarAltaLegalizacionGuiaForm","GuiaForm");
}

function exp(sec) {
	
	 if (type=="IE") { 
	 	 eval("document.all." + "e"+sec + ".style.display='none'");
	 	 eval("document.all." + "c"+sec + ".style.display=''"); 	 
	 	}
	 if (type=="MO" || type=="OP") {
	    eval("document.getElementById('" + "e"+sec + "').style.display='none'");
	    eval("document.getElementById('" + "c"+sec + "').style.display=''");
	   }
}

function col(sec) {
	
 if (type=="IE") { 
 	 eval("document.all." + "c"+sec + ".style.display='none'");
 	 eval("document.all." + "e"+sec + ".style.display=''"); 	 
 	}
 if (type=="MO" || type=="OP") {
    eval("document.getElementById('" + "c"+sec + "').style.display='none'");
    eval("document.getElementById('" + "e"+sec + "').style.display=''");
   }
}

var tipoGuia;
function cambiarTipoGuia(pTipoGuia){
	tipoGuia = pTipoGuia;
	var idProductor = $("#idProductor").val();
	
	$("#idTRMarcaSenial").hide();
	$("#idTRMarcaError").hide();
	$("#idTRSenialError").hide();
	
	if (tipoGuia=="ganadoMayor"){
		$("#idTitMarcaSenial").html("Nro Marca:");
		MarcaSenialFachada.getMarcaDTO(idProductor,marcaSenialCallback );
		
	}else{
		$("#idTitMarcaSenial").html("Nro Señal:");
		MarcaSenialFachada.getSenialDTO(idProductor,marcaSenialCallback );		
	}
}

function marcaSenialCallback(marcaSenial){
	
	$("#nroInterno").val("");
	
	if(marcaSenial != null){
		$("#idTRMarcaSenial").show();
		$("#idTRMarcaError").hide();
		$("#idTRSenialError").hide();
		$("#idNumMarcaSenial").val(marcaSenial.numero);
		$("#idMarcaSenial").val(marcaSenial.id);
		$("#tipoMarcaSenial").val(marcaSenial.tipo);
		$("#idImg").attr("src","../../imagenes/"+marcaSenial.nombreImagen);
		
		var idProductor = $("#idProductor").val();
		var periodo = $("#periodo").val();
		EntidadFachada.recuperarCantGuias(idProductor,periodo,recuperarCantGuiasCallback);			
	}
	else{
		$("#idTRMarcaSenial").hide();
		$("#idTRMarcaError").hide();
		$("#idTRSenialError").hide();

		if(tipoGuia == "ganadoMayor"){
			$("#idTRMarcaError").show();	
		}else{
			$("#idTRSenialError").show();	
		}

		$("#idMarcaSenial").val(0);
		$("#tipoMarcaSenial").val("");		
	}	
}

function recuperarCantGuiasCallback(valor){
	
	var nroMarcaSenial = $("#idNumMarcaSenial").val();
	$("#nroInterno").val((valor+1)+nroMarcaSenial);
}

function cambiarProductor(){

	if($("#idProductor").val() == "-1"){
		$("#radioMayor").attr("disabled","disabled");
		$("#radioMenor").attr("disabled","disabled");		
	}else{
		$("#radioMayor").attr("disabled",false);
		$("#radioMenor").attr("disabled",false);
	}
	
	$("#radioMayor").attr("checked",false);
	$("#radioMenor").attr("checked",false);

	$("#idTRMarcaSenial").hide();
	$("#idTRMarcaError").hide();
	$("#idTRSenialError").hide();	

	$("#idMarcaSenial").val(0);
	$("#tipoMarcaSenial").val("");
	$("#nroInterno").val("");
}

//-----------------------------------------------------//

</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="guia" styleId="guiaForm">
	<html:hidden property="metodo" value="altaLegalizacionGuia" />
	<table border="0" class="cuadrado" align="center" width="80%"
		cellpadding="2">
		<tr>
			<td colspan="4" class="azulAjustado">
				Alta de Legalización de Guía
			</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>

		<tr>
			<td width="12%" class="botoneralNegritaRight">Nro de Guía</td>
			<td width="30%" align="left">
				<input name="guia.numero" class="botonerab" type="text" size="20" 
						onkeypress="javascript:esNumerico(event);">
			</td>

			<td width="30%" class="botoneralNegritaRight">Período</td>
			<td align="left">
				<select id="periodo" name="guia.periodo" class="botonerab">
					<c:forEach items="${periodos}" var="per">
						<option value="${per.periodo}">
							<c:out value="${per.periodo}"></c:out>
						</option>
					</c:forEach>
				</select>				
			</td>
		</tr>

		<tr>
			<td width="12%" class="botoneralNegritaRight">Productor</td>
			<td width="30%" align="left">
				<select id="idProductor" name="guia.productor.id" class="botonerab" onchange="cambiarProductor()">
					<option value="-1">-Seleccione un Productor-</option>
					<c:forEach items="${productores}" var="prod">
						<option value="${prod.id}">
							<c:out value="${prod.nombre}"></c:out>
						</option>
					</c:forEach>
				</select>
			</td>
			<td width="30%" class="botoneralNegritaRight">Fecha de Legalización</td>
			<td align="left">
				<input id="datepicker" type="text" name="guia.fechaLegalizacion" readonly="readonly" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
			</td>
		</tr>
		<tr>
			<td width="12%" class="botoneralNegritaRight">Nro Interno</td>
			<td width="30%" align="left">
				<input id="nroInterno" name="guia.numeroInterno" class="botonerab" type="text" size="20">
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
							
							<input type="radio" id="radioMayor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMayor')" disabled="disabled">Ganado Mayor
							<input type="radio" id="radioMenor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMenor')" disabled="disabled">Ganado Menor
						</td>
					</tr>
					<tr id="idTRMarcaSenial" style="display: none;">
						<td colspan="2">
							
							<table border="0" class="cuadradoSinBorde" align="center" width="50%" cellpadding="2" cellspacing="0">
								<tr>
									<td colspan="2" height="10"></td>
								</tr>							
								<tr>
									<td id="idTitMarcaSenial" class="botoneralNegritaRight">
									</td>
									<td align="left">
										<input id="idNumMarcaSenial" type="text" class="botonerab" size="10" readonly="readonly">
										<html:hidden styleId="idMarcaSenial" property="guia.marcaSenial.id" value=""/>
										<html:hidden styleId="tipoMarcaSenial" property="guia.marcaSenial.tipo" value=""/>
									</td>																		
								</tr>
								<tr>
									<td colspan="2" height="10"></td>
								</tr>								
								<tr>
									<td colspan="2">
										<img id="idImg" alt="" src="">
									</td>
								</tr>
							</table>
							
						</td>
					</tr>
					<tr id="idTRMarcaError" style="display: none;">
						<td colspan="2">
							<table border="0" class="cuadradoSinBorde" align="center" width="50%" cellpadding="2" cellspacing="0">
								<tr>
									<td height="10"></td>
								</tr>							
								<tr>
									<td class="rojoAdvertenciaChico">
										El productor no tiene declarada una marca
									</td>									
								</tr>
							</table>
						</td>
					</tr>
					<tr id="idTRSenialError" style="display: none;">
						<td colspan="2">
							<table border="0" class="cuadradoSinBorde" align="center" width="50%" cellpadding="2" cellspacing="0">
								<tr>
									<td height="10"></td>
								</tr>							
								<tr>
									<td class="rojoAdvertenciaChico">
										El productor no tiene declarada una señal
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


	<table border="0" class="cuadrado" align="center" width="80%"
		cellpadding="2">
		<tr>
			<td height="10" colspan="4"></td>
		</tr>
		<tr>
			<td height="20" colspan="4">
				<input type="button" value="Aceptar" id="enviar" 
					class="botonerab" onclick="javascript:submitir();" > 
				<input type="button" class="botonerab" value="Volver" onclick="javascript:volverAltaGuia();">
			</td>
		</tr>
		<tr>
			<td height="10" colspan="4"></td> 
		</tr>
	</table>
</html:form>
