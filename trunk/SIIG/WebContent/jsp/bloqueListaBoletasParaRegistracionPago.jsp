<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>
	function recuperarBoleta(id){
		//parent.location=contextRoot() + '${fwdDetalle}' + '&id=' + id;
		//var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
		parent.location=contextRoot() + "/boletaDeposito.do?metodo=recuperarBoletaParaRegistracionPago&idBoleta="+id;
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
<input id="paramUrlSeleccionGuia" type="hidden" value="${urlSeleccionGuia}">

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
						Nros de Guías
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
					<td>
						${boleta.numero}
					</td>
					<td>
						<fmt:formatDate value="${boleta.fechaVencimiento}" pattern="dd/MM/yyyy" />
					</td>
					<td>
						<c:forEach items="${boleta.guias}" var="guia" varStatus="index">
						${guia.numero} - 
						</c:forEach>
					</td>					
					<td>
						$ ${boleta.monto}
					</td>					
					<td>						
						<a href="javascript:recuperarBoleta(${boleta.id});">Seleccionar</a>						
					</td>	
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
