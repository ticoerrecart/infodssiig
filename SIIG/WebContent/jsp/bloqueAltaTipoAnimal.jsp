<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript">
	function submitir(){
		validarForm("tipoAnimalFormId","../tipoAnimal","validarTipoAnimalForm","TipoAnimalForm");
	}
</script>


<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="tipoAnimal" styleId="tipoAnimalFormId">
	<c:choose>
		<c:when test="${empty metodo}">
			<html:hidden property="metodo" value="${param.metodo}" />
		</c:when>
		<c:otherwise>
			<html:hidden property="metodo" value="${metodo}" />
		</c:otherwise>
	</c:choose>
	<html:hidden property="tipoAnimal.id" value="${tipoAnimal.id}" />

	<table border="0" class="cuadrado" align="center" width="60%"
		cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				<c:choose>
					<c:when test="${metodo == 'altaTipoAnimal'}">
						<bean:message key='SIIG.titulo.AltaTipoAnimal'/>
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Nombre'/></td>
			<td align="left">
				<html:text size="40" styleClass="botonerab" property="tipoAnimal.descripcion" value="${tipoAnimal.descripcion}" 
							onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Categoria'/></td>
			<td align="left">
				<html:select styleClass="botonerab" property="tipoAnimal.idCategoria" value="${tipoAnimal.idCategoria}">
					<c:forEach items="${categorias}" var="categoria">
						<html:option value="${categoria.id}">
							<c:out value="${categoria.descripcion}" />
						</html:option>
					</c:forEach>

				</html:select>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Valor'/></td>
			<td align="left">
				<html:text styleClass="botonerab" property="tipoAnimal.valor" value="${tipoAnimal.valor}" 
							onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>

		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td height="20" colspan="2">
				<c:choose>
					<c:when test="${metodo=='altaTipoAnimal'}">
						<input type="button" class="botonerab" value="Aceptar" id="enviar"
							onclick="javascript:submitir();">
						<input type="button" class="botonerab" value="Cancelar"
							onclick="javascript:parent.location= contextRoot() +  '/jsp.do?page=.index'">
					</c:when>
					<c:otherwise>
						<input type="button" class="botonerab" value="Aceptar" id="enviar"
							onclick="javascript:submitir();">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
	</table>

</html:form>
