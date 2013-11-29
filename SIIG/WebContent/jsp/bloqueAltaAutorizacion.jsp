<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript">

	function submitir(){
		validarForm("autorizacionFormId","../autorizacion","validarAutorizacionForm","AutorizacionForm");
	}
	
</script>

<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="autorizacion" styleId="autorizacionFormId">
	<html:hidden property="metodo" value="${metodo}" />
	<html:hidden property="autorizacion.id" value="${autorizacion.id}" />

	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">${titulo}</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		
		<tr>
			<td width="45%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Productor'/></td>
			<td align="left">
			<c:choose>
				<c:when test="${metodo=='altaAutorizacion'}">
					<select id="selectProductor" class="botonerab" name="autorizacion.productor.id">
						<option value="-1">-Seleccione un Productor-</option>
						<c:forEach items="${productores}" var="productor" varStatus="i">
							<option value="<c:out value='${productor.id}'></c:out>">
								<c:out value="${productor.nombre}"></c:out>
							</option>							
						</c:forEach>
					</select>
				</c:when>
				<c:otherwise>
					<input type="text" readonly="readonly" class="botonerab" name="autorizacion.productor.id" value="${productor.nombre}" size="30">
				</c:otherwise>
			</c:choose></td>
		</tr>

		<tr>
			<td width="45%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Autorizado'/></td>
			<td align="left">
				<select id="selectAutorizado" class="botonerab" name="autorizacion.autorizado.id">
					<option value="-1">-Seleccione un Autorizado-</option>
					<c:forEach items="${autorizados}" var="autorizado" varStatus="i">
						<option value="<c:out value='${autorizado.id}'></c:out>">
							<c:out value="${autorizado.nombre}"></c:out>
						</option>
					</c:forEach>
				</select>
			</td>
		</tr>

		<tr>
			<td width="45%" class="botoneralNegritaRight"><bean:message key='SIIG.label.TipoAutorizacion'/></td>
			<td align="left">
				&nbsp;
			</td>
		</tr>
		
		<c:forEach items="${tiposAutorizacion}" var="tipoAutorizacion" varStatus="i">
			<tr>
				<td width="45%" class="botoneralNegritaRight">
					&nbsp;
				</td>
				<td align="left">
					
					<c:out value="${tipoAutorizacion.descripcion}"></c:out>
					
					<c:choose>
						<c:when test="${tipoAutorizacion.habilitado}">
							checkeado
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="autorizacion.tiposDeAutorizacion[${i.index}].id" value="${tipoAutorizacion.id}"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>

		<tr>
			<td height="20" colspan="2"><c:choose>
				<c:when test="${metodo=='altaAutorizacion'}">
					<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();">
					<input type="button" class="botonerab" value="Cancelar" onclick="javascript:parent.location= contextRoot() +  '/jsp.do?page=.index'">
				</c:when>
				<c:otherwise>
					<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();">
				</c:otherwise>
			</c:choose></td>
		</tr>

		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		
		
	</table>

</html:form>