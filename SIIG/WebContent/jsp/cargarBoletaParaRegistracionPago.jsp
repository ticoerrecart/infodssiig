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

		parent.location=contextRoot() + "/boletaDeposito.do?metodo=cargarRegistrarPagoBoletas";
	}
	
</script>
<input id="paramUrlSeleccionGuia" type="hidden" value="${urlSeleccionGuia}">
<input type="hidden" value="${boleta.id}" id="idBoleta">
<input type="hidden" value="${boleta.productor.id}" id="idProductor">

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
		<td class="azulAjustado" colspan="3">Registrar Pago de Boleta</td>
	</tr>
	<tr>
		<td height="20" colspan="3"></td>
	</tr>
	<tr>
		<td colspan="2">
			<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="1">
			<tr>
				<td height="10"></td>
			</tr>			
			<tr>
				<td class="botoneralNegrita">
					Número
					<input type="text" value="${boleta.numero}" class="botonerab" size="10" readonly="readonly">
				</td>
				<td class="botoneralNegrita">
					Fecha Vencimiento
					<input class="botonerab" type="text" size="20" readonly="readonly" 
						value='<fmt:formatDate value="${boleta.fechaVencimiento}" pattern="dd/MM/yyyy" />'>											
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>					
				</td>
			</tr>
			<tr>
				<td height="10"></td>
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
						Productor
					</td>
					<td class="azulAjustado botoneralNegrita">
						Fecha de Devolución
					</td>					
					<td class="azulAjustado botoneralNegrita">
						Tipo de Producto
					</td>
					<td class="azulAjustado botoneralNegrita">
						Cantidad
					</td>
					<td class="azulAjustado botoneralNegrita">
						Monto	
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
							${guia.productor.nombre}
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
							$ ${guia.montoTotal}
						</td>	
					</tr>
				</c:forEach>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<td colspan="5" class="botoneralNegritaRight">
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
			<input type="button" value="Registrar Pago" class="botonerab" onclick="javascript:abrirVentanaRegistrarPago();">
			<input type="button" value="Volver" class="botonerab" onclick="javascript:volver();">
		</td>
	</tr>
	<tr>
		<td colspan="2" height="20"></td>
	</tr>		
</table>	
