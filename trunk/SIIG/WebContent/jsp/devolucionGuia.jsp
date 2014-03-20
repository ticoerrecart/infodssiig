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
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/TipoAnimalFachada.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PeriodoFachada.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/CategoriaFachada.js'/>"></script>	
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/EstablecimientoFachada.js'/>"></script>			

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

function volver(){

	var idProductor = $("#idProductor").val();
	var periodo = $("#periodo").val();
	var urlSeleccionGuia = $("#urlSeleccionGuia").val();
	parent.location=contextRoot() + "/guia.do?metodo=cargarConsultaLegalizacionGuia&urlSeleccionGuia="+urlSeleccionGuia+"&idProductor="+idProductor+"&periodo="+periodo;
}

function cambioCategoria(){
	var idCategoria = $("#idCategoria").val();
	$("#idCanon").val(0.0);
	$("#idStock").val("");
	
	if(idCategoria != "-1"){
		TipoAnimalFachada.getTipoAnimalDTOPorCategoria(idCategoria,getTipoAnimalDTOPorCategoriaCallback);
	}else{

		dwr.util.removeAllOptions("idTipoAnimal");
		var data = [ { razonSocial:"-Seleccione-", id:-1 }];
		var data = [ { descripcion:"-Seleccione-", id:-1 }];
		dwr.util.addOptions("idTipoAnimal", data, "id", "descripcion");
				
		$('#idTipoAnimal').attr('disabled',true);
		actualizarMontoTotal();		
	}	
}

function getTipoAnimalDTOPorCategoriaCallback(tiposAnimal){
	
	dwr.util.removeAllOptions("idTipoAnimal");
	var data = [ { descripcion:"-Seleccione-", id:-1 }];
	dwr.util.addOptions("idTipoAnimal", data, "id", "descripcion");	
	dwr.util.addOptions("idTipoAnimal", tiposAnimal,"id","descripcion");

	$("#idTipoAnimal").attr('disabled', false);
	actualizarMontoTotal();

}

function cambioTipoAnimal(){

	var idTipoAnimal = $("#idTipoAnimal").val();

	if(idTipoAnimal != "-1"){

		var idProductor = $("#idProductor").val();
		var idEstablecimiento = $("#establecimientoOrigen").val();

		EstablecimientoFachada.getCantidadTipoAnimalEnEstablecimiento(idEstablecimiento,idProductor,idTipoAnimal,getCantidadTipoAnimalEnEstablecimientoCallback);
		
		TipoAnimalFachada.getTipoAnimalDTO(idTipoAnimal,getTipoAnimalDTOCallback);
		
	}else{
		$("#idCanon").val(0.0);
		$("#idStock").val("");
		actualizarMontoTotal();
	}	
}

function getCantidadTipoAnimalEnEstablecimientoCallback(stock){

	$("#idStock").val(stock);	
}

function getTipoAnimalDTOCallback(tipoAnimal){

	$("#idCanon").val(tipoAnimal.valor);
	actualizarMontoTotal();
}

function actualizarMontoTotal(){

	var canon = new Number($('#idCanon').val()).toFixed(2);
	var cantidad = new Number($('#idCantidad').val());

	var monto = new Number(new Number(canon).toFixed(2) * new Number(cantidad).toFixed(2)).toFixed(2); 	
	
	$("#idMonto").val(monto);

	//calcularInteres();
}

/*function calcularInteres(){

	var montoTotal = $("#idMonto").val();
	var fechaTransito = $("#datepicker").val();
	var periodo = $("#idPeriodo").val();
	
	if(montoTotal != null && montoTotal != "" && montoTotal != 0 && fechaTransito != ""){

		PeriodoFachada.calcularInteres(fechaTransito,periodo,calcularInteresCallback);
		
	}else{
		$("#idInteres").html(" % de Interés");
		$("#idValorInteres").val(0.00);
		$("#idMontoTotal").val(0.00);		
	}
}

function calcularInteresCallback(interes){

	$(".montoTotal").show();
	var porcentajeInteres = interes * 100;
	$("#idInteres").html(porcentajeInteres+" % de Interés");
	$("#idValorInteres").val(new Number(interes * $("#idMonto").val()).toFixed(2));

	var monto = new Number($('#idMonto').val()).toFixed(2);
	var interes = new Number($('#idValorInteres').val()).toFixed(2);

	var montoTotal = new Number(new Number(monto) + new Number(interes)).toFixed(2);
	
	$("#idMontoTotal").val(montoTotal);
}*/

function cambioEstablecimientoOrigen(){

	var idEstablecimiento = $("#establecimientoOrigen").val(); 
	var tipoMarcaSenial = $("#tipoMarcaSenial").val();
	var idProductor = $("#idProductor").val();

	$("#idCanon").val(0.0);
	$("#idStock").val("");
	
	if(idEstablecimiento != "-1"){
		CategoriaFachada.getCategoriasPorEstablecimiento(idProductor,idEstablecimiento,tipoMarcaSenial,getCategoriasPorEstablecimientoCallback);
	}else{

		dwr.util.removeAllOptions("idCategoria");		
		var data = [ { descripcion:"-Seleccione-", id:-1 }];
		dwr.util.addOptions("idCategoria", data, "id", "descripcion");				
		$('#idCategoria').attr('disabled',true);
		
		dwr.util.removeAllOptions("idTipoAnimal");		
		var data = [ { descripcion:"-Seleccione-", id:-1 }];
		dwr.util.addOptions("idTipoAnimal", data, "id", "descripcion");				
		$('#idTipoAnimal').attr('disabled',true);
		
		actualizarMontoTotal();		
	}
}

function getCategoriasPorEstablecimientoCallback(categorias){

	dwr.util.removeAllOptions("idCategoria");
	var data = [ { descripcion:"-Seleccione-", id:-1 }];
	dwr.util.addOptions("idCategoria", data, "id", "descripcion");	
	dwr.util.addOptions("idCategoria", categorias,"id","descripcion");

	$("#idCategoria").attr('disabled', false);

	dwr.util.removeAllOptions("idTipoAnimal");
	var data = [ { razonSocial:"-Seleccione-", id:-1 }];
	var data = [ { descripcion:"-Seleccione-", id:-1 }];
	dwr.util.addOptions("idTipoAnimal", data, "id", "descripcion");
			
	$('#idTipoAnimal').attr('disabled',true);
	actualizarMontoTotal();	
}

function submitir(){
	validarForm("guiaForm","../guia","validarDevolucionGuiaForm","GuiaForm");
}

//-----------------------------------------------------//

</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>
	
	<input id="periodo" type="hidden" value="${guia.periodo}">
	<input id="urlSeleccionGuia" type="hidden" value="${urlSeleccionGuia}">
	<input id="tipoMarcaSenial" type="hidden" value="${guia.marcaSenial.tipo}">
	
<html:form action="guia" styleId="guiaForm">
	<html:hidden property="metodo" value="altaDevolucionGuia" />
	<html:hidden property="guia.id" value="${guia.id}" />
	<input id="idProductor" name="guia.productor.id" type="hidden" value="${guia.productor.id}">
		
	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td class="azulAjustado">
				Devolución de Guía
			</td>
		</tr>
		<tr>
			<td height="15"></td>
		</tr>
		<tr>
			<td>
				<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="4" class="grisSubtitulo">Datos Guía Legalizada</td>
					</tr>
					<tr>
						<td colspan="4" height="10"></td>
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">Nro de Guía</td>
						<td width="30%" align="left">
							<input value="${guia.numero}" class="botonerab" type="text" size="20" readonly="readonly">
						</td>
			
						<td width="20%" class="botoneralNegritaRight">Período</td>
						<td align="left">
							<input id="idPeriodo" value="${guia.periodo}" class="botonerab" type="text" size="20" readonly="readonly">				
						</td>
					</tr>
			
					<tr>
						<td width="20%" class="botoneralNegritaRight">Productor</td>
						<td width="30%" align="left">
							<input value="${guia.productor.nombre}" class="botonerab" type="text" size="20" readonly="readonly">
						</td>
						<td width="20%" class="botoneralNegritaRight">Fecha de Legalización</td>
						<td align="left">				
							<input value="${guia.fechaLegalizacion}" class="botonerab" type="text" size="20" readonly="readonly">						
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
						</td>
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">Nro Interno</td>
						<td width="30%" align="left">
							<input value="${guia.numeroInterno}" class="botonerab" type="text" size="20" readonly="readonly">
						</td>
						<td colspan="2"></td>
					</tr>		
					<tr>
						<td height="10" colspan="4"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>
		
		<tr>
			<td>
				<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="4" class="grisSubtitulo"></td>
					</tr>
					<tr>
						<td colspan="4" height="10"></td>
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">Establecimiento de Orígen</td>
						<td width="30%" align="left">
							<select id="establecimientoOrigen" name="guia.establecimientoOrigen.id" class="botonerab" 
								onchange="cambioEstablecimientoOrigen();">
								<option value="-1">-Seleccione-</option>
								<c:forEach items="${establecimientos}" var="est">
									<option value="${est.id}">
										<c:out value="${est.nombre}"></c:out>
									</option>
								</c:forEach>
							</select>
						</td>
			
						<td width="20%" class="botoneralNegritaRight">Nro DTA</td>
						<td align="left">
							<input name="guia.nroDTA" class="botonerab" type="text" size="20">				
						</td>
					</tr>
			
					<tr>
						<td width="20%" class="botoneralNegritaRight">Establecimiento de Destino</td>
						<td width="30%" align="left">
							<select id="establecimientoDestino" name="guia.establecimientoDestino.id" class="botonerab">
								<option value="-1">-Seleccione-</option>
								<c:forEach items="${establecimientosDestino}" var="est">
									<option value="${est.id}">
										<c:out value="${est.nombre}"></c:out>
									</option>
								</c:forEach>
							</select>							
						</td>
						<td width="20%" class="botoneralNegritaRight">Finalidad</td>
						<td align="left">				
							<select id="finalidad" class="botonerab" name="guia.finalidadStr">
								<c:forEach items="${finalidades}" var="finalidad">
									<option value="${finalidad.name}">
										<c:out value="${finalidad.descripcion}"></c:out>
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>	
					<tr>
						<td colspan="2"></td>
						<td width="20%" class="botoneralNegritaRight">Fecha de Transito</td>
						<td align="left">				
							<input id="datepicker" name="guia.fechaTransito" class="botonerab" type="text" size="20" readonly="readonly">						
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
						</td>						
					</tr>	
					<tr>
						<td height="10" colspan="4"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td>
				<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="4" class="grisSubtitulo">Datos de Transporte</td>
					</tr>
					<tr>
						<td colspan="4" height="10"></td>
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">Medio de Transporte</td>
						<td width="30%" align="left">
							<input name="guia.medioTransporte" class="botonerab" type="text" size="20">
						</td>
			
						<td width="20%" class="botoneralNegritaRight">Transporte a Cargo de</td>
						<td align="left">
							<input name="guia.trasporteACargo" class="botonerab" type="text" size="20">				
						</td>
					</tr>
			
					<tr>
						<td width="20%" class="botoneralNegritaRight">Patente de Vehiculo</td>
						<td width="30%" align="left">
							<input name="guia.patente" class="botonerab" type="text" size="20">
						</td>
						<td width="20%" class="botoneralNegritaRight">Patente de Acoplado</td>
						<td align="left">				
							<input name="guia.patenteAcoplado" class="botonerab" type="text" size="20">
						</td>
					</tr>		
					<tr>
						<td height="10" colspan="4"></td>
					</tr>
				</table>
			</td>
		</tr>		
		<tr>
			<td height="15"></td>
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
										<img height="20%" width="20%" alt="" src="../../imagenes/<c:out value='${guia.marcaSenial.nombreImagen}'></c:out>">																			
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
			<td height="10"></td>
		</tr>	
		<tr>
			<td align="left">
				<div id="e1" style="DISPLAY: ">
					<label onclick="javascript:exp('1')"> 
						<img src="../../imagenes/expand.gif" border="0" /> 
						<U class="azulOpcion">
							Detalle de Productos						
						</U>
						<BR>
					</label>
				</div>
				<div id="c1" style="DISPLAY: none">
					<label onclick="javascript:col('1')"> 
						<img src="../../imagenes/collapse.gif" border="0" /> 
						<U class="azulOpcion">
							Detalle de Productos						
						</U>
						<BR>
					</label>
					<br>
					
					<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
						<tr>
							<td width="25%" class="grisSubtituloCenter">Categoría</td>
							<td width="25%" class="grisSubtituloCenter">Tipo Producto</td>
							<td width="10%" class="grisSubtituloCenter">Stock</td>
							<td width="10%" class="grisSubtituloCenter">Cantidad</td>
							<td width="2%" class="grisSubtituloCenter"></td>
							<td width="10%" class="grisSubtituloCenter">Canon</td>
							<td width="2%" class="grisSubtituloCenter"></td>							
							<td width="16%" class="grisSubtituloCenter">Monto</td>
						</tr>
						<tr>
							<td>
								<select id="idCategoria" class="botonerab" onchange="cambioCategoria();" disabled="disabled">
									<option value="-1">-Seleccione-</option>
								</select>
							</td>
							<td>
								<select id="idTipoAnimal" name="guia.tipoAnimal.id" class="botonerab" disabled="disabled" 
									onchange="cambioTipoAnimal();">
									<option value="-1">-Seleccione-</option>
								</select>
							</td>
							<td>
								<input type="text" class="botonerab" size="5" id="idStock" readonly="readonly">
							</td>							
							<td>
								<input type="text" name="guia.cantidad" class="botonerab" size="5" id="idCantidad" onblur="actualizarMontoTotal()">
							</td>
							<td>
								x
							</td>							
							<td>
								<input type="text" name="guia.canon" class="botonerab" size="5" id="idCanon" readonly="readonly">
							</td>
							<td>
								=
							</td>
							<td>
								$<input type="text" name="guia.monto" class="botonerab" size="12" id="idMonto" readonly="readonly">
							</td>
						</tr>					
						<tr>
							<td colspan="8" height="10"></td>							
						</tr>											
					</table>	
					
				</div>
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>		
	</table>				

	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td height="10" colspan="4"></td>
		</tr>
		<tr>
			<td height="20" colspan="4">
				<input type="button" value="Aceptar" class="botonerab" onclick="submitir();" >
				<input type="button" value="Volver" class="botonerab" onclick="volver();" > 
			</td>
		</tr>
		<tr>
			<td height="10" colspan="4"></td> 
		</tr>
	</table>
</html:form>	
