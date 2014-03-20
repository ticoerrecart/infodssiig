<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PeriodoFachada.js'/>"></script>

<script>

	$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});		
	});

	function recuperarGuia(id){
		//parent.location=contextRoot() + '${fwdDetalle}' + '&id=' + id;
		var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
		parent.location=contextRoot() + "/guia.do?metodo="+urlSeleccionGuia+"&id="+id;
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
	
	function agrElimGuia(indice,idGuia){

		var i = indice;
		var montoCreditoDebito = new Number($("#idCreditoDebito").val()).toFixed(2);		
		var montoTotal = new Number($("#idMontoTotal").val()).toFixed(2);
		//var montoFila = new Number($("#monto"+idGuia).val()).toFixed(2);
		var montoFila = new Number($("#montoTotalGuia"+idGuia).val()).toFixed(2);		
		
		if($('#idCheck'+i).is(':checked')){
			
			$("#idGuia"+indice).val(idGuia);
			montoTotal = new Number(new Number(montoTotal) + new Number(montoFila)).toFixed(2);
			
		}else{
			
			$("#idGuia"+indice).val(0);
			montoTotal = new Number(new Number(montoTotal) - new Number(montoFila)).toFixed(2);			
		}

		var montoTotalTotal = new Number(new Number(montoTotal) - new Number(montoCreditoDebito)).toFixed(2);
		
		$("#idMontoTotal").val(montoTotal);
		$("#idMontoTotalStr").html("$ "+montoTotal);
		
		$("#idMontoTotalTotal").val(montoTotalTotal);
		$("#idMontoTotalTotalStr").html("$ "+montoTotalTotal);
	}

	function submitir(){
		
		$("#idProd").val($("#idProductor").val());
		validarForm("boletaDepositoForm","../boletaDeposito","validarGenerarBoletaPagoForm","BoletaDepositoForm");
	}	

	function cambioFechaVencimiento(){

		var fechaVencimiento = $('#datepicker').val();
		var periodo = $("#periodo").val();
		var idProductor = $("#idProductor").val();		
		PeriodoFachada.calcularInteres2(fechaVencimiento,periodo,idProductor,calcularInteresCallback2);
	}

	function calcularInteresCallback2(listaGuiasConInteres){

		var montoTotal = 0;
		
		for(i=0;i<listaGuiasConInteres.length;i++){

			var interes = listaGuiasConInteres[i].interes;
			var id = listaGuiasConInteres[i].id;
			var montoGuia = $("#monto"+id).val();

			//Columna "Interes %"
			$("#divInteres"+id).html(interes*100+"%");			
			$("#interes"+id).val(interes);
			
			//Columna "Monto Interes"
			var montoInteres = new Number(new Number(montoGuia) * new Number(interes)).toFixed(2);
			$("#divMontoInteres"+id).html("$ "+ montoInteres);

			//Columna "Monto Total Guia"
			var montoTotalGuia = new Number(new Number(montoGuia) + new Number(montoInteres)).toFixed(2);
			$("#divMontoTotalGuia"+id).html("$ "+ montoTotalGuia);
			$("#montoTotalGuia"+id).val(montoTotalGuia);

			if($('#idCheck'+i).is(':checked')){

				montoTotal = new Number(new Number(montoTotal) + new Number(montoTotalGuia)).toFixed(2);
			}	
		}	

		var montoCreditoDebito = new Number($("#idCreditoDebito").val()).toFixed(2);

		var montoTotalTotal = new Number(new Number(montoTotal) - new Number(montoCreditoDebito)).toFixed(2);
		
		$("#idMontoTotal").val(montoTotal);
		$("#idMontoTotalStr").html("$ "+montoTotal);
		
		$("#idMontoTotalTotal").val(montoTotalTotal);
		$("#idMontoTotalTotalStr").html("$ "+montoTotalTotal);
	}	

	function cambioCheckCreditoDebito(){

		var saldoCuantaCorriente = ${productor.saldoCuentaCorriente};
		
		if($('#idCheckCreditoDebito').is(':checked')){

			$("#idCreditoDebito").attr("readonly",false);
			$("#idCreditoDebito").val(saldoCuantaCorriente);	
		}
		else{

			$("#idCreditoDebito").attr("readonly",true);
			$("#idCreditoDebito").val(0.00);
		}

		var montoTotal = new Number($("#idMontoTotal").val()).toFixed(2);
		var montoCreditoDebito = new Number($("#idCreditoDebito").val()).toFixed(2);
		var montoTotalTotal = new Number(new Number(montoTotal) - new Number(montoCreditoDebito)).toFixed(2);
		
		$("#idMontoTotalTotal").val(montoTotalTotal);
		$("#idMontoTotalTotalStr").html("$ "+montoTotalTotal);			
	}

	function cambioMontoCreditoDebito(){

		if($('#idCheckCreditoDebito').is(':checked')){
			var montoTotal = new Number($("#idMontoTotal").val()).toFixed(2);
			var montoCreditoDebito = new Number($("#idCreditoDebito").val()).toFixed(2);
			var montoTotalTotal = new Number(new Number(montoTotal) - new Number(montoCreditoDebito)).toFixed(2);
			
			$("#idMontoTotalTotal").val(montoTotalTotal);
			$("#idMontoTotalTotalStr").html("$ "+montoTotalTotal);
		}				
	}
	
</script>
<input id="paramUrlSeleccionGuia" type="hidden" value="${urlSeleccionGuia}">

<html:form action="boletaDeposito" styleId="boletaDepositoForm">
<html:hidden property="metodo" value="generarBoletaGuias" />
<html:hidden property="boletaDeposito.productor.id" value="" styleId="idProd"/>


<div id="dialogo" style="display: none" >


	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td height="10"></td>
		</tr>	
		<tr>
			<td class="botoneralNegrita">
				<div id="idInteresDialogo"></div>
			</td>							
		</tr>		
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td height="10">
				<input type="button" class="botonerab" value="Cerrar" onclick="javascript:cerrarVentanaPagoBoleta();">			
			</td>
		</tr>		
		<tr>
			<td height="10"></td>
		</tr>		
	</table>	
</div>


<table border="0" class="cuadradoSinBorde" align="center" width="100%" cellpadding="2" cellspacing="1">

<c:choose>
<c:when test="${empty guias}">
	<tr>
		<td height="15">
			No existen datos
		</td>
	</tr>
</c:when>
<c:otherwise>
	<tr >
		<td colspan="2">
			<table border="0" class="cuadrado" align="center" width="90%" cellpadding="2" cellspacing="1">
			<tr>
				<td height="10"></td>
			</tr>			
			<tr>
				<td class="botoneralNegrita">
					Número
					<input type="text" name="boletaDeposito.numero" class="botonerab" size="10" onkeypress="javascript:esNumerico(event);">
				</td>
				<td class="botoneralNegrita">
					Fecha Vencimiento
					<input id="datepicker" class="botonerab" type="text" size="20" readonly="readonly" name="boletaDeposito.fechaVencimiento"
						onchange="cambioFechaVencimiento()">						
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>					
				</td>
			</tr>
			<tr>
				<td height="15"></td>
			</tr>
			<tr>
				<td colspan="2" class="botoneralNegrita">
					<c:if test="${productor.saldoCuentaCorriente < 0}">		
						<div class="rojoAdvertencia">El Productor posee $${productor.saldoCuentaCorriente} de débito en su cuenta corriente</div>
					</c:if>
					<c:if test="${productor.saldoCuentaCorriente >= 0}">
						<div class="verdeExito">El Productor posee $${productor.saldoCuentaCorriente} de crédito en su cuenta corriente</div>
					</c:if>						
				</td>
			</tr>
			<tr>
				<td height="15"></td>
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
			<table border="0" class="cuadrado" align="center" width="90%" cellpadding="2" cellspacing="1">						
				<tr>
					<td class="azulAjustado botoneralNegrita"></td>
					<td class="azulAjustado botoneralNegrita">
						Número
					</td>
					<td class="azulAjustado botoneralNegrita">
						Fecha de Tránsito
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
				<c:forEach items="${guias}" var="guia" varStatus="index">
					<%clase=(clase.equals("")?"par":""); %>
					<tr class="<%=clase%>" onmouseover="javascript:pintarFila('<c:out value='${index.index}'></c:out>');"
						onmouseout="javascript:despintarFila('<c:out value='${index.index}'></c:out>');"
						id="tr<c:out value='${index.index}'></c:out>">
	
						<td>		
							<html:hidden styleId="idGuia${index.index}" property="listaGuias[${index.index}].id" value=""/>										
							<input type="checkbox" id="idCheck<c:out value='${index.index}'></c:out>" 
								   onclick="javascript:pintarFila('<c:out value='${index.index}'></c:out>');agrElimGuia(<c:out value='${index.index}'></c:out>,<c:out value='${guia.id}'></c:out>);">	
												
						</td>
						<td>
							${guia.numero}
						</td>
						<td>

							${guia.fechaTransito}
						</td>					
						<td>
							${guia.tipoAnimal.descripcion}
						</td>
						<td>
							${guia.cantidad}
						</td>
						<td>
							<input type="hidden" value="${guia.monto}" id="monto${guia.id}">
							$ ${guia.monto}
						</td>
						<td>
							<input type="hidden" value="0" id="interes${guia.id}" name="listaGuias[${index.index}].interes">
							<div id="divInteres${guia.id}">${guia.interes*100}%</div>
						</td>
						<td>
							<div id="divMontoInteres${guia.id}">
								$ ${guia.monto * guia.interes}
							</div>	
						</td>						
						<td>
							<input type="hidden" value="${guia.monto + (guia.monto * guia.interes)}" id="montoTotalGuia${guia.id}">
							<div id="divMontoTotalGuia${guia.id}">$ ${guia.monto + (guia.monto * guia.interes)}</div>
						</td>														
					</tr>
				</c:forEach>
				<tr>
					<td height="10" colspan="9"></td>
				</tr>
				<tr>
					<td colspan="8" class="botoneralNegritaRight">
						<input type="hidden" value="0" id="idMontoTotal">
						Monto Total Guías
					</td>
					<td id="idMontoTotalStr" class="botoneralNegrita">
						$ 0.00
					</td>
				</tr>
				<tr>
					<td colspan="8" class="botoneralNegritaRight">
						<input type="checkbox" id="idCheckCreditoDebito" onclick="cambioCheckCreditoDebito()">
						<input type="hidden" value="${productor.saldoCuentaCorriente}" name="saldoCuentaCorrienteProductor">
						Desea utilizar el Crédito/Débito									
					</td>
					<td id="idCreditoDebitoStr" class="botoneralNegrita">					
						$ <input type="text" value="0.00" id="idCreditoDebito" class="botonerab" size="6" readonly="readonly" 
								onblur="cambioMontoCreditoDebito()" name="boletaDeposito.debitoCreditoUsado">
					</td>
				</tr>
				<tr>
					<td colspan="7">
					</td>
					<td class="botoneralNegrita" colspan="2">
						<hr>
					</td>
				</tr>
				<tr>
					<td colspan="8" class="botoneralNegritaRight">
						<input type="hidden" value="0" id="idMontoTotalTotal" name="boletaDeposito.monto">
						Monto Total
					</td>
					<td id="idMontoTotalTotalStr" class="botoneralNegrita">					
						$ 0.00
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
			<input type="button" value="Aceptar" class="botonerab" onclick="javascript:submitir();">
		</td>
	</tr>
</c:otherwise>
</c:choose>		
</table>	
</html:form>