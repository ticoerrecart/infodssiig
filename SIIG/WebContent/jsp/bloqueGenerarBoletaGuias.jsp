<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

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
		var montoTotal = new Number($("#idMontoTotal").val()).toFixed(2);
		var montoFila = new Number($("#monto"+idGuia).val()).toFixed(2);	
		
		if($('#idCheck'+i).is(':checked')){
			
			$("#idGuia"+indice).val(idGuia);
			montoTotal = new Number(new Number(montoTotal) + new Number(montoFila)).toFixed(2);
			
		}else{
			
			$("#idGuia"+indice).val(0);
			montoTotal = new Number(new Number(montoTotal) - new Number(montoFila)).toFixed(2);			
		}

		$("#idMontoTotal").val(montoTotal);
		$("#idMontoTotalStr").html("$ "+montoTotal);

	}

	function submitir(){
		
		$("#idProd").val($("#idProductor").val());
		validarForm("boletaDepositoForm","../boletaDeposito","validarGenerarBoletaPagoForm","BoletaDepositoForm");
	}	
	
</script>
<input id="paramUrlSeleccionGuia" type="hidden" value="${urlSeleccionGuia}">

<html:form action="boletaDeposito" styleId="boletaDepositoForm">
<html:hidden property="metodo" value="generarBoletaGuias" />
<html:hidden property="boletaDeposito.productor.id" value="" styleId="idProd"/>
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
			<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="1">
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
					<input id="datepicker" class="botonerab" type="text" size="20" readonly="readonly" name="boletaDeposito.fechaVencimiento">						
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
					<td class="azulAjustado botoneralNegrita"></td>
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
							<input type="hidden" value="${guia.montoTotal}" id="monto${guia.id}">
							$ ${guia.montoTotal}
						</td>	
					</tr>
				</c:forEach>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<td colspan="6" class="botoneralNegritaRight">
						<input type="hidden" value="0" id="idMontoTotal" name="boletaDeposito.monto">
						Monto Total
					</td>
					<td id="idMontoTotalStr" class="botoneralNegrita">
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