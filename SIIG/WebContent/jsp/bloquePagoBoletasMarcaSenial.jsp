<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<script type="text/javascript">

var idTipo;
var boton;
var idFechaPago;
function pagarBoleta(idTipoMarcaSenial,id){

	boton = 'idBotonPago'+id;
	idFechaPago = 'idFechaPago'+id;

	$('#idMarcaSenial').val(idTipoMarcaSenial);
	$( "#idFechaPagoDatePicker" ).datepicker({ dateFormat: 'dd/mm/yy'});	
	$('#dialogo').dialog({title: 'Registrar Pago Boleta de Deposito', height: 200, width: 500, modal: true});	
}

function registrarPago(){
	alert($('#idMarcaSenial').val());
	var fechaPago = $('#idFechaPagoDatePicker').val();
	alert(fechaPago);
	if(fechaPago != ""){
		idTipo = $('#idMarcaSenial').val();			
		cerrarVentanaPagoBoleta();
		MarcaSenialFachada.registrarPagoBoletaDeposito(idTipo,fechaPago,$('#idTipo').val(),registrarPagoCallback);			
	}
	else{
		$('#textoError').show();
	}
}

function registrarPagoCallback(fechaPago){
	
	$('#'+boton).hide();
	$('#'+idFechaPago).html(fechaPago);
}

function cerrarVentanaPagoBoleta(){

	$('#textoError').hide();
	$('#idFechaPagoDatePicker').val("");
	$('#dialogo').dialog( "close" );
}
</script>

<div id="dialogo" style="display: none" >
	<br>
	<div id="textoError" class="rojoAdvertencia" style="display: none" >Debe especificar una fecha de pago</div>	
	<br>
	<input id="idMarcaSenial" type="hidden" value="">
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

	<c:choose>
		<c:when test="${fn:length(listaMarcaSenial)>0}">
			<table id="idTabla" border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
				<tr>
					<td class="azulAjustado" >Número</td>
					<td class="azulAjustado" >Fecha Vencimiento</td>	
					<td class="azulAjustado" >Número Boleta</td>
					<td class="azulAjustado" >Fecha Vencimiento Boleta</td>
					<td class="azulAjustado" >Monto</td>
					<td class="azulAjustado" >Fecha Pago Boleta</td>
				</tr>
					<c:forEach items="${listaMarcaSenial}" var="tipo" varStatus="ind">
						<tr>
							<td class="botonerab" ><c:out value="${tipo.numero}"></c:out></td>
							<td class="botonerab" >
								<fmt:formatDate value="${tipo.fechaVencimiento}" pattern="dd/MM/yyyy" />
							</td>
							<td class="botonerab" ><c:out value="${tipo.boletaDeposito.numero}"></c:out></td>
							<td class="botonerab" >
								<fmt:formatDate value="${tipo.boletaDeposito.fechaVencimiento}" pattern="dd/MM/yyyy" />
							</td>
							<td class="botonerab" >$<c:out value="${tipo.boletaDeposito.monto}"></c:out></td>
							<td class="botonerab" id="idFechaPago${ind.index}">							
								<c:choose>
									<c:when test="${tipo.boletaDeposito.fechaPago == null}">
										<input id="idBotonPago${ind.index}" type="button" class="botonerab" 
													value="Pagar" onclick="pagarBoleta(${tipo.id},'${ind.index}');">
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${tipo.boletaDeposito.fechaPago}" pattern="dd/MM/yyyy" />
									</c:otherwise>				
								</c:choose>					
							</td>
						</tr>
					</c:forEach>													
			</table>
			<script type="text/javascript">
				$("#idTabla tr:nth-child(even)").addClass("par"); //Para pintar en cebra los tr de la tabla
			</script>
		</c:when>
		<c:otherwise>
			No existen Marcas/Señales para este Productor
		</c:otherwise>
	</c:choose>	