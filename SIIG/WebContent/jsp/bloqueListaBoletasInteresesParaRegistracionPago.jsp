<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>

	var idBoleta;
	var boton;
	var idFechaPago;
	function pagarBoleta(idBoleta){

		$('#idBoleta').val(idBoleta);
		$( "#idFechaPagoDatePicker" ).datepicker({ dateFormat: 'dd/mm/yy'});	
		$('#dialogo').dialog({title: 'Registrar Pago Boleta de Deposito', height: 200, width: 500, modal: true});	
	}

	function registrarPago(){

		var fechaPago = $('#idFechaPagoDatePicker').val();

		if(fechaPago != ""){			
			cerrarVentanaPagoBoleta();
			parent.location=contextRoot() + "/boletaDeposito.do?metodo=registrarPagoBoletaIntereses&idBoleta="+$('#idBoleta').val()+"&fechaPago="+fechaPago;
			//MarcaSenialFachada.registrarPagoBoletaDeposito(idTipo,fechaPago,$('#idTipo').val(),registrarPagoCallback);
						
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
	
	var clase;
	function pintarFila(idTr){
		
		clase = $('#'+idTr).attr("class");
		$('#'+idTr).removeClass(clase);
		$('#'+idTr).addClass("verdeSeleccionFila");		
	}

	function despintarFila(idTr){
		
		$('#'+idTr).addClass(clase);
		$('#'+idTr).removeClass("verdeSeleccionFila");
	}
	
</script>

<div id="dialogo" style="display: none" >
	<br>
	<div id="textoError" class="rojoAdvertencia" style="display: none" >Debe especificar una fecha de pago</div>	
	<br>
	<input id="idBoleta" type="hidden" value="">
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
	<c:choose>
		<c:when test="${empty boletas}">
			<tr>
				<td height="15">
					No existen datos
				</td>
			</tr>
		</c:when>
		<c:otherwise>
				<tr>			
					<td class="azulAjustado botoneralNegrita">
						Número
					</td>
					<td class="azulAjustado botoneralNegrita">
						Fecha Vencimiento
					</td>					
					<td class="azulAjustado botoneralNegrita">
						Monto Total
					</td>					
					<td class="azulAjustado botoneralNegrita"></td>
				</tr>
			<%String clase=""; %>	
			<c:forEach items="${boletas}" var="boleta" varStatus="index">
				<%clase=(clase.equals("")?"par":""); %>
				<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${index.index}'></c:out>');"
					onmouseout="javascript:despintarFila('idTr<c:out value='${index.index}'></c:out>');"
					id="idTr<c:out value='${index.index}'></c:out>">						
					<td class="botonerab">
						${boleta.numero}
					</td>
					<td class="botonerab">
						<fmt:formatDate value="${boleta.fechaVencimiento}" pattern="dd/MM/yyyy" />
					</td>
					<td class="botonerab">
						$ ${boleta.monto}
					</td>					
					<td>						
						<input type="button" class="botonerab" value="Pagar" onclick="pagarBoleta(${boleta.id});">										
					</td>	
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
