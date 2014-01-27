<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/TipoAnimalFachada.js'/>"></script>
	
<script type="text/javascript">

var type;
if (navigator.userAgent.indexOf("Opera")!=-1 && document.getElementById) type="OP"; 
if (document.all) type="IE"; 
if (!document.all && document.getElementById) type="MO";

</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="animalEnEstablecimiento" styleId="animalEnEstablecimientoForm">
	<html:hidden property="metodo" value="modificacionStockAnimalDeProductorEnEstablecimiento" />
	<input type="hidden" name="animalEnEstablecimiento.id" value="${animalEnEstablecimiento.id}">
	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td class="azulAjustado">
				Modificacion de Stock Animal en Establecimiento
			</td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>	
		<tr>
			<td>
				<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2" cellspacing="0">		
					<tr>
						<td height="15" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="botoneralNegritaRight">Productor</td>
						<td class="botonerab" align="left">
							<input type="text" value="${animalEnEstablecimiento.productorEnEstablecimiento.productor.nombre}"
								readonly="readonly" size="25" class="botonerab">					
						</td>
					</tr>	
					<tr>
						<td height="5" colspan="2"></td>
					</tr>						
					<tr>
						<td width="40%" class="botoneralNegritaRight">Establecimiento</td>
						<td class="botonerab" align="left">
							<input type="text" value="${animalEnEstablecimiento.productorEnEstablecimiento.establecimiento.nombre}"
								readonly="readonly" size="25" class="botonerab">
						</td>
					</tr>
					<tr>
						<td height="5" colspan="2"></td>
					</tr>				
					<tr>
						<td width="40%" class="botoneralNegritaRight">Categoria</td>
						<td class="botonerab" align="left">
							<input type="text" value="${animalEnEstablecimiento.tipoAnimal.categoria.descripcion}"
								readonly="readonly" size="25" class="botonerab">
						</td>
					</tr>
					<tr>
						<td height="5" colspan="2"></td>
					</tr>	
					<tr>
						<td width="40%" class="botoneralNegritaRight">Tipo Producto</td>
						<td class="botonerab" align="left">
							<input type="text" value="${animalEnEstablecimiento.tipoAnimal.descripcion}" readonly="readonly" size="25"
								class="botonerab">
						</td>
					</tr>
					<tr>
						<td height="5" colspan="2"></td>
					</tr>							
					<tr>
						<td width="40%" class="botoneralNegritaRight">Stock</td>
						<td class="botonerab" align="left">
							<input id="idStock" type="text" class="botonerab" size="25" value="${animalEnEstablecimiento.stock}" 
								   onkeypress="javascript:esNumerico(event);" name="animalEnEstablecimiento.stock">
						</td>
					</tr>								
					<tr>
						<td height="15" colspan="2"></td>
					</tr>
				</table>		
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>	
		<tr>
			<td>
				<input type="submit" value="Aceptar" class="botonerab" onclick="javascript:submitir();">
			</td>
		</tr>	
		<tr>
			<td height="20"></td>
		</tr>
	</table>
</html:form>