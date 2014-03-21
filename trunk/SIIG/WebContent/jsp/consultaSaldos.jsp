<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<div id="errores" class="rojoAdvertencia">${error}</div>

<div class="verdeExito">${creditoGenerado}</div>
<div class="rojoAdvertencia">${debitoGenerado}</div>

<br>
<table id="datos" border="0" class="cuadrado" align="center" width="40%" cellpadding="2" cellspacing="1">		
	<c:choose>
		<c:when test="${empty productores}">
			<tr>
				<td height="15">
					No existen datos
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
					<td class="azulAjustado ">
						Productor
					</td>
					<td class="azulAjustado ">
						Saldo en Cuenta Corriente
					</td>					
				</tr>
			
			<c:forEach items="${productores}" var="productor" varStatus="index">
			
				<tr id="idTr<c:out value='${index.index}'></c:out>">
								
					<td class="negrita">
						${productor.nombre}
					</td>
					<c:if test="${productor.saldoCuentaCorriente ge 0 }">			
						<td class="verdeExito">
							${productor.saldoCuentaCorriente}
						</td>
					</c:if>
					<c:if test="${productor.saldoCuentaCorriente lt 0 }">			
						<td class="rojoAdvertencia">
							${productor.saldoCuentaCorriente}
						</td>
					</c:if>
					
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<script type="text/javascript">
	$("#datos tr:nth-child(even)").addClass("par"); //Para pintar en cebra los tr de la tabla
</script>