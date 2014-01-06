<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/jquery-1.3.2.min.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>

<script>
	var tr = null;
	var clase = null;
	function mostrarDatos(idEntidad,idTr){
		$('#exitoGrabado').empty();
		if(tr!=null){
			$('#tr'+tr).attr("class", clase);	
		}
		tr=idTr;
		clase = $('#tr'+tr).attr("class");
		$('#tr'+tr).attr("class", "seleccionado");

		$('#divCargando').show();	
		$('#divModificacion').html("");
		
		$('#divModificacion').load('../../autorizacion.do?metodo=cargarAutorizacionAModificar&id=' + idEntidad);
		$('#divModificacion').hide();
		//$('#divModificacion').fadeIn(600);

		Concurrent.Thread.create(function(){
		    while ($('#divModificacion').html() == "") {}
		    $('#divCargando').hide();
		    $('#divModificacion').show(600);
		});		
	}
</script>


<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

<table border="0" class="cuadrado" align="center" width="80%"
	cellpadding="2">
	<tr>
		<td class="azulAjustado">
			<bean:message key='SIIG.titulo.ModificacionAutorizacion'/>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
		<table border="0" class="cuadrado" align="center" width="90%"
			cellpadding="2">
			<tr>
				<td class="azulAjustado"><bean:message key='SIIG.label.Productor'/></td>
				<td class="azulAjustado"><bean:message key='SIIG.label.Autorizado'/></td>
				<td class="azulAjustado"><bean:message key='SIIG.label.TipoAutorizacion'/></td>
				<td class="azulAjustado"></td>
			</tr>
			<%String clase=""; %>
			<c:forEach items="${autorizaciones}" var="autorizacion" varStatus="i">
				<%clase=(clase.equals("")?"par":""); %>
				<tr id="tr${i.count}" class="botonerab <%=clase%>">
					<td><c:out value="${autorizacion.productor.nombre}" /></td>
					<td><c:out value="${autorizacion.autorizado.nombre}" /></td>
					<td>
						<c:forEach items="${autorizacion.tiposDeAutorizacion}" var="tipoDeautorizacion">
							<c:out value="${tipoDeautorizacion.descripcion}" /> &nbsp; <strong>|</strong>
						</c:forEach>
					</td>
					<td>
						<a href="javascript:mostrarDatos(${autorizacion.id},${i.count});">
							<bean:message key='SIIG.label.Editar'/>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td id="divCargando" style="display: none">
			<img src="<html:rewrite page='/imagenes/cargando.gif'/>">
		</td>
	</tr>	
	<tr>
		<td>
			<div id="divModificacion"></div>
		</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>	
</table>

