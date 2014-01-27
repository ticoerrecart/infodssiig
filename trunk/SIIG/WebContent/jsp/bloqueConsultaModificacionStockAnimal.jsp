<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>
	function seleccionar(id){
		var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
		parent.location=contextRoot() + "/animalEnEstablecimiento.do?metodo="+urlSeleccionGuia+"&idAnimalEnEstablecimiento="+id;
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
<table border="0" class="cuadrado" align="center" width="100%" cellpadding="2" cellspacing="1">		
	<c:choose>
		<c:when test="${empty productorEnEstablecimiento}">
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
						Establecimiento
					</td>
					<td class="azulAjustado botoneralNegrita">
						Categoria
					</td>
					<td class="azulAjustado botoneralNegrita">
						Tipo Producto
					</td>
					<td class="azulAjustado botoneralNegrita">
						Stock		
					</td>
					<td class="azulAjustado botoneralNegrita">
								
					</td>
				</tr>

			<%String clase=""; %>	
			<c:forEach items="${productorEnEstablecimiento}" var="prod" varStatus="index">				
				<c:forEach items="${prod.animalesEnEstablecimiento}" var="anim" varStatus="index">
					<%clase=(clase.equals("")?"par":""); %>
					<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${index.index}'></c:out>');"
						onmouseout="javascript:despintarFila('idTr<c:out value='${index.index}'></c:out>');"
						id="idTr<c:out value='${index.index}'></c:out>">

							<td>
								${anim.productorEnEstablecimiento.productor.nombre}
							</td>
							<td>
								${anim.productorEnEstablecimiento.establecimiento.nombre}
							</td>
							<td>
								${anim.tipoAnimal.categoria.descripcion}
							</td>
							<td>
								${anim.tipoAnimal.descripcion}
							</td>
							<td>
								${anim.stock}
							</td>
							<td>
								<c:if test="${urlSeleccionGuia != ''}">
									<a href="javascript:seleccionar(${anim.id});">Seleccionar</a>
								</c:if>	
							</td>					
					</tr>
				</c:forEach>	
			</c:forEach>

		</c:otherwise>
	</c:choose>
</table>
