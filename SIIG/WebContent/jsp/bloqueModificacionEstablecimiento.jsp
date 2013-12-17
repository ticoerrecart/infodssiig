<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript">
	function submitir(){
		validarForm("establecimientoFormId","../establecimiento","validarEstablecimientoForm","EstablecimientoForm");
	}
</script>


<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>
<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

<html:form action="establecimiento" styleId="establecimientoFormId">

	<html:hidden property="metodo" value="modificacionEstablecimiento" />

	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Nombre'/></td>
			<td align="left">
				<html:hidden property="establecimientoDTO.id" value="${establecimientoDTO.id}" />			
				<html:text styleClass="botonerab" property="establecimientoDTO.nombre" 
							value="${establecimientoDTO.nombre}" onkeypress="return evitarAutoSubmit(event)" />
			</td>
		</tr>
		
		<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Localidad'/></td>
			<td align="left">
				<select id="localiSelect" class="botonerab" name="establecimientoDTO.localidadDTO.id" >
					<option value="-1">-Seleccione una Localidad-</option>
				</select>
						
			</td>
		</tr>		
		
		<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Provincia'/></td>
			<td align="left">
				<html:select property="establecimientoDTO.localidadDTO.provinciaDTO.id" styleId="provSelect"
					styleClass="botonerab" value="${establecimientoDTO.localidadDTO.provinciaDTO.id}" onchange="actLocalidades()">
					<c:forEach items="${provincias}" var="provincia">
						<html:option value="${provincia.id}">
							<c:out value="${provincia.nombre}"></c:out>
						</html:option>
					</c:forEach>
				</html:select>						
			</td>
		</tr>		
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td height="20" colspan="2">
				<input type="button" class="botonerab" value="Aceptar" id="enviar"
						onclick="javascript:submitir();"> 
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
	</table>


<script>



actLocalidades();
		
function actLocalidades(){
	var provSelect = $('#provSelect').val();
	LocalidadFachada.getLocalidadesDTODeProvincia(provSelect,actLocalidadesCallback );
}

function actLocalidadesCallback(localidades) {
	dwr.util.removeAllOptions("localiSelect");
	dwr.util.addOptions("localiSelect", localidades, "id", "nombre");
	$("#localiSelect").val(${establecimientoDTO.localidadDTO.id});
}	

</script>


</html:form>
