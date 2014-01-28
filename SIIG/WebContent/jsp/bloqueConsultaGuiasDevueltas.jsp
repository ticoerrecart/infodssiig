<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>
	function recuperarGuia(id){
		//parent.location=contextRoot() + '${fwdDetalle}' + '&id=' + id;
		var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
		parent.location=contextRoot() + "/guia.do?metodo="+urlSeleccionGuia+"&id="+id;
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
		<c:when test="${empty guias}">
			<tr>
				<td height="15">
					No existen datos
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
					<c:if test="${urlSeleccionGuia == ''}">
						<td class="azulAjustado botoneralNegrita"></td>
					</c:if>			
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
						Monto Total		
					</td>
					<c:if test="${urlSeleccionGuia != ''}">
						<td class="azulAjustado botoneralNegrita"></td>
					</c:if>	
				</tr>
			<%String clase=""; %>	
			<c:forEach items="${guias}" var="guia" varStatus="index">
				<%clase=(clase.equals("")?"par":""); %>
				<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${index.index}'></c:out>');"
					onmouseout="javascript:despintarFila('idTr<c:out value='${index.index}'></c:out>');"
					id="idTr<c:out value='${index.index}'></c:out>">
					<c:if test="${urlSeleccionGuia == ''}">
						<td>						
							<input type="checkbox">						
						</td>
					</c:if>						
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
					<c:if test="${urlSeleccionGuia != ''}">
						<td>						
							<a href="javascript:recuperarGuia(${guia.id});">Seleccionar</a>						
						</td>
					</c:if>		
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
