<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	src="<html:rewrite page='/dwr/interface/GuiaFachada.js'/>"></script>

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script>

	$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});		
	});

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

	function cambioProductor(){
		
		var idProductor = $("#idProductor").val();
		$("#idMonto").val("");
		$("#idDebito").html("");
		$("#idCredito").html("");

		$("#idBotonAceptar").attr("disabled",false);
		$("#idNumero").attr("disabled",false);
		$("#idFechaVenc").attr("disabled",false);
		$("#idMonto").attr("disabled",false);
		
		if(idProductor != "-1"){
			GuiaFachada.getDeudaProductor(idProductor,getDeudaProductorCallback);
		}	
	}

	function getDeudaProductorCallback(deuda){

		if(deuda < 0){
			$("#idSaldoProductor").val(deuda*(-1));
			$("#idMonto").val(deuda*(-1));
			$("#idDebito").html("El Productor posee $ "+deuda+" de débito en su cuenta corriente");
		}
		else{
			$("#idCredito").html("El Productor posee $ "+deuda+" de crédito en su cuenta corriente");
			$("#idBotonAceptar").attr("disabled",true);
			$("#idNumero").attr("disabled",true);
			$("#idFechaVenc").attr("disabled",true);
			$("#idMonto").attr("disabled",true);	
		}	
	}

	function submitir(){
		
		validarForm("boletaDepositoForm","../boletaDeposito","validarGenerarBoletaPagoInteresesForm","BoletaDepositoForm");
	}	
	
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="boletaDeposito" styleId="boletaDepositoForm">
<html:hidden property="metodo" value="generarBoletaInteres" />
<input type="hidden" value="" name="saldoCuentaCorrienteProductor" id="idSaldoProductor">

<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2" cellspacing="1">
	<tr>
		<td class="azulAjustado" colspan="4">
			Generar Boletas de Pago de Intereses
		</td>
	</tr>
	<tr>
		<td height="20" colspan="4"></td>
	</tr>			
	<tr>
		<td class="botoneralNegritaRight" width="20%">
			Número
		</td>
		<td width="30%" align="left">	
			<input type="text" name="boletaDeposito.numero" class="botonerab" size="10" onkeypress="javascript:esNumerico(event);" id="idNumero">
		</td>
		<td class="botoneralNegritaRight" width="20%">
			Productor
		</td>
		<td width="30%" align="left">	
			<select id="idProductor" class="botonerab" onchange="cambioProductor()" name="boletaDeposito.productor.id">
				<option value="-1">-Seleccione un Productor-</option>
				<c:forEach items="${productores}" var="prod">
					<option value="${prod.id}">
						<c:out value="${prod.nombre}"></c:out>
					</option>
				</c:forEach>
			</select>													
		</td>
	</tr>
	<tr>
		<td height="10" colspan="4"></td>
	</tr>	
	<tr>
		<td class="botoneralNegritaRight">
			Fecha Vencimiento
		</td>
		<td align="left">	
			<input id="datepicker" class="botonerab" type="text" size="20" readonly="readonly" name="boletaDeposito.fechaVencimiento" id="idFechaVenc">						
			<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>					
		</td>
		<td class="botoneralNegritaRight" width="20%">
			Monto $
		</td>
		<td width="30%" align="left">	
			<input type="text" id="idMonto" name="boletaDeposito.monto" class="botonerab" size="10" onkeypress="javascript:esNumericoConDecimal(event);">												
		</td>
	</tr>			
	<tr>
		<td height="15" colspan="4"></td>
	</tr>
	<tr>
		<td colspan="4" class="botoneralNegrita">	
			<div id="idDebito" class="rojoAdvertencia"></div>
			<div id="idCredito" class="verdeExito"></div>								
		</td>
	</tr>
	<tr>
		<td colspan="4" height="20"></td>
	</tr>		
</table>	
<table border="0" class="cuadradoSinBorde" align="center" width="60%" cellpadding="2" cellspacing="1">
	<tr>
		<td height="10"></td>
	</tr>
	<tr>
		<td>
			<input type="button" id="idBotonAceptar" value="Aceptar" class="botonerab" onclick="javascript:submitir();">
		</td>
	</tr>
</table>
</html:form>