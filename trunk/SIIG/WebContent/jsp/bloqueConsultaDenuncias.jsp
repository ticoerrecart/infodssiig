<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>
	function recuperarDenuncia(id){
		//parent.location=contextRoot() + '${fwdDetalle}' + '&id=' + id;
		var urlSeleccionDenuncia = $('#paramUrlSeleccionDenuncia').val();
		parent.location=contextRoot() + "/denuncia.do?metodo="+urlSeleccionDenuncia+"&id="+id;
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
<input id="paramUrlSeleccionDenuncia" type="hidden" value="${urlSeleccionDenuncia}">
<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="1">		
	<c:choose>
		<c:when test="${empty denuncias}">
			<tr>
				<td height="15" colspan="3">
					No existen datos
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
					<td class="azulAjustado botoneralNegrita">
						Productor
					</td>
					<td class="azulAjustado botoneralNegrita">
						Número de Denuncia
					</td>
					<td class="azulAjustado botoneralNegrita">
						Número de Llamado
					</td>
					<td class="azulAjustado botoneralNegrita">
						Desde
					</td>
					<td class="azulAjustado botoneralNegrita">
						Hasta		
					</td>
					<td class="azulAjustado botoneralNegrita">
								
					</td>
				</tr>
			<%String clase=""; %>
			<c:forEach items="${denuncias}" var="denuncia" varStatus="index">
				<%clase=(clase.equals("")?"par":""); %>
				<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${index.index}'></c:out>');"
					onmouseout="javascript:despintarFila('idTr<c:out value='${index.index}'></c:out>');"
					id="idTr<c:out value='${index.index}'></c:out>">
					<td>
						${denuncia.productor.nombre}
					</td>
					<td>
						<c:choose>
							<c:when test="${denuncia.numeroDeDenuncia > 0}">
								${denuncia.numeroDeDenuncia}
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose>
						
					</td>
					<td>
						
						<c:choose>
							<c:when test="${denuncia.numeroDeLlamado > 0}">
								${denuncia.numeroDeLlamado}
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<fmt:formatDate value="${denuncia.desde}" pattern="dd/MM/yyyy" />
					</td>
					<td>
						<fmt:formatDate value="${denuncia.hasta}" pattern="dd/MM/yyyy" />
					</td>
					<td>
						<a href="javascript:recuperarDenuncia(${denuncia.id});">Seleccionar</a>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
