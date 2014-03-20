<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script>

	function registrarPago(){

		var fechaPago = $('#idFechaPagoDatePicker').val();
		if(fechaPago != ""){
			cerrarVentanaPagoBoleta();
			var idBoleta = $('#idBoleta').val();
			parent.location=contextRoot() + "/boletaDeposito.do?metodo=registrarPagoBoleta&idBoleta="+idBoleta+"&fechaPago="+fechaPago;									
		}
		else{
			$('#textoError').show();
		}
	}

	function cerrarVentanaPagoBoleta(){

		$('#textoError').hide();
		$('#idFechaPagoDatePicker').val("");
		$('#dialogo').dialog( "close" );
	}
	
	function abrirVentanaRegistrarPago(){

		//$('#idBoletaAPagar').val(boleta);
		$( "#idFechaPagoDatePicker" ).datepicker({ dateFormat: 'dd/mm/yy'});	
		$('#dialogo').dialog({title: 'Registrar Pago de Boleta', height: 200, width: 500, modal: true});			
	}
	
	var clase2;
	function pintarFila(idTr){

		$('#tr'+idTr).attr("class", "seleccionado");	
	}

	function despintarFila(idTr){

		if(!$('#idCheck'+idTr).is(':checked')){
			
			if(idTr%2 == 0){
				clase2 = "par";		
			}else{
				clase2 = "";
			}	
			$('#tr'+idTr).attr("class", clase2);
		}		
	}

	function volver(){
		/*var metodoVolver = "cargarRegistrarPagoBoletas";
		if($('#volver').val() != null || $('#volver').val() != ""){
			metodoVolver = $('#volver').val();
		}*/
		
		var metodoVolver = $('#volver').val();
		//parent.location=contextRoot() + "/boletaDeposito.do?metodo="+metodoVolver;
		parent.location = contextRoot() + metodoVolver;
	}
	
</script>
<input id="paramUrlSeleccionGuia" type="hidden" value="${urlSeleccionGuia}">
<input type="hidden" value="${boleta.id}" id="idBoleta">
<input type="hidden" value="${boleta.productor.id}" id="idProductor">
<input type="hidden" value="${volver}" id="volver">

<div id="dialogo" style="display: none" >
	<br>
	<div id="textoError" class="rojoAdvertencia" style="display: none" >Debe especificar una fecha de pago</div>	
	<br>
	<input id="idBoletaAPagar" type="hidden" value="">
	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td height="10" colspan="3"></td>
		</tr>	
		<tr>
			<td width="30%" class="botoneralNegritaRight">
				Fecha de Pago
			</td>
			<td class="botoneralNegritaRight">
				<input id="idFechaPagoDatePicker" class="botonerab" type="text" size="23"	readonly="readonly">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
			</td>				
			<td width="20%" ></td>			
		</tr>
		<tr>
			<td height="10" colspan="3"></td>
		</tr>		
	</table>
	<table border="0" class="cuadradoSinBorde" align="center" width="80%" cellpadding="2">
		<tr>
			<td height="10" colspan="3"></td>
		</tr>	
		<tr>
			<td width="48%" class="botonerab" align="right">
				<input type="button" class="botonerab" value="Aceptar" onclick="javascript:registrarPago();">
			</td>
			<td width="4%"></td>			
			<td width="48%" class="botonerab" align="left">
				<input type="button" class="botonerab" value="Cancelar" onclick="javascript:cerrarVentanaPagoBoleta();">
			</td>							
		</tr>
		<tr>
			<td height="10" colspan="3"></td>
		</tr>		
	</table>	
</div>

<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="1">
	<tr>
		<td class="azulAjustado" colspan="3">
			<c:out value="${titulo}"></c:out>
		</td>
	</tr>
	<tr>
		<td height="20" colspan="3"></td>
	</tr>
	<tr>
		<td colspan="2">
			<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="1">
			<tr>
				<td height="10" colspan="4"></td>
			</tr>			
			<tr>
				<td class="botoneralNegritaRight" width="15%">
					Número
				</td>
				<td width="25%" align="left">	
					<input type="text" value="${boleta.numero}" class="botonerab" size="10" readonly="readonly">
				</td>
				<td class="botoneralNegritaRight" width="25%">
					Fecha Vencimiento
				</td>
				<td width="35%" align="left">					
					<input class="botonerab" type="text" size="20" readonly="readonly" 
						value='<fmt:formatDate value="${boleta.fechaVencimiento}" pattern="dd/MM/yyyy" />'>											
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>					
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="15%">
					Productor
				</td>
				<td width="25%" align="left">	
					<input type="text" value="${boleta.productor.nombre}" class="botonerab" size="20" readonly="readonly">
				</td>
				<td colspan="2">
					
				</td>
			</tr>			
			<c:if test="${consulta}">
				<tr>
					<td class="botoneralNegritaRight" width="15%">
						Estado:
					</td>
					<td width="25%" align="left">						
						<c:choose>
						 <c:when test="${boleta.fechaPago != null}">
						 	<div class="verdeExitoLeft">Pagada</div>
						 </c:when>
						 <c:otherwise>
						 	<div class="rojoAdvertenciaLeft">Impaga</div>
						 </c:otherwise>
						</c:choose>						
					</td>
					<td class="botoneralNegritaRight" width="25%">
						Fecha Pago
					</td>
					<td width="35%" align="left">						
						<input class="botonerab" type="text" size="20" readonly="readonly" 
							value='<fmt:formatDate value="${boleta.fechaPago}" pattern="dd/MM/yyyy" />'>											
						<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>					
					</td>
				</tr>			
			</c:if>			
			<tr>
				<td height="10" colspan="4"></td>
			</tr>			
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" height="15"></td>
	</tr>
	<tr>
		<td width="10%"></td>
		<td class="botoneralNegritaLeft">
			Guías Devueltas
		</td>
	</tr>				
	<tr>
		<td colspan="2">
			<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="1">						
				<tr>
					<td class="azulAjustado botoneralNegrita">
						Número
					</td>
					<td class="azulAjustado botoneralNegrita">
						Fecha de Transito
					</td>					
					<td class="azulAjustado botoneralNegrita">
						Tipo de Producto
					</td>
					<td class="azulAjustado botoneralNegrita">
						Cantidad
					</td>
					<td class="azulAjustado botoneralNegrita">
						Monto Guía	
					</td>
					<td class="azulAjustado botoneralNegrita">
						Interes %
					</td>
					<td class="azulAjustado botoneralNegrita">
						Monto Interes
					</td>					
					<td class="azulAjustado botoneralNegrita">
						Monto Total x Guía	
					</td>						
				</tr>
				<%String clase=""; %>	
				<c:forEach items="${boleta.guias}" var="guia" varStatus="index">
					<%clase=(clase.equals("")?"par":""); %>
					<tr class="<%=clase%>" onmouseover="javascript:pintarFila('<c:out value='${index.index}'></c:out>');"
						onmouseout="javascript:despintarFila('<c:out value='${index.index}'></c:out>');"
						id="tr<c:out value='${index.index}'></c:out>">

						<td>
							${guia.numero}
						</td>
						<td>
							<fmt:formatDate value="${guia.fechaTransito}" pattern="dd/MM/yyyy" />
						</td>					
						<td>
							${guia.tipoAnimal.descripcion}
						</td>
						<td>
							${guia.cantidad}
						</td>
						<td>
							$ ${guia.monto}
						</td>
						<td>
							<div id="divInteres${guia.id}">${guia.interes*100}%</div>
						</td>
						<td>
							$ ${guia.montoInteres}	
						</td>						
						<td>
							<input type="hidden" value="${guia.montoTotal}" id="montoTotalGuia${guia.id}">
							<div id="divMontoTotalGuia${guia.id}">$ ${guia.montoTotal}</div>
						</td>							
					</tr>					
				</c:forEach>
				<tr>
					<td height="10" colspan="8"></td>
				</tr>
				<tr>
					<td colspan="7" class="botoneralNegritaRight">
						Monto Total Guías
					</td>
					<td class="botoneralNegrita">
						$ ${boleta.montoTotalGuias}
					</td>
				</tr>
				<tr>
					<td colspan="7" class="botoneralNegritaRight"></td>
					<td class="botoneralNegritaLeft">
						-
					</td>
				</tr>				
				<tr>
					<td colspan="7" class="botoneralNegritaRight">
						Créditos/Débitos Usados
					</td>
					<td class="botoneralNegrita">
						$ ${boleta.debitoCreditoUsado}
					</td>
				</tr>				
				<tr>
					<td colspan="6">
					</td>
					<td class="botoneralNegrita" colspan="2">
						<hr>
					</td>
				</tr>								
				<tr>
					<td colspan="7" class="botoneralNegritaRight">
						Monto Total
					</td>
					<td id="idMontoTotalStr" class="botoneralNegrita">
						$ ${boleta.monto}
					</td>
				</tr>								
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" height="20"></td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!consulta}">
				<input type="button" value="Registrar Pago" class="botonerab" onclick="javascript:abrirVentanaRegistrarPago();">
			</c:if>	
			<input type="button" value="Volver" class="botonerab" onclick="javascript:volver();">
		</td>
	</tr>
	<tr>
		<td colspan="2" height="20"></td>
	</tr>		
</table>	
