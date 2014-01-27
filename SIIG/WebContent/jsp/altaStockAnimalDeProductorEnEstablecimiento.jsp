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

function submitir(){
	$('#exitoGrabado').html("");
	$('#errores').html("");
	validarForm("animalEnEstablecimientoForm","../animalEnEstablecimiento","validarAltaStockAnimalForm","AnimalEnEstablecimientoForm");
}

function cambioCategoria(){
	var idCategoria = $("#idCategoria").val();
	
	if(idCategoria != "-1"){
		TipoAnimalFachada.getTipoAnimalDTOPorCategoria(idCategoria,getTipoAnimalDTOPorCategoriaCallback);
	}else{

		dwr.util.removeAllOptions("idTipoProducto");
		var data = [ { descripcion:"-Seleccione un Producto-", id:-1 }];
		dwr.util.addOptions("idTipoProducto", data, "id", "descripcion");
				
		$('#idTipoProducto').attr('disabled',true);		
	}	
}

function getTipoAnimalDTOPorCategoriaCallback(tiposAnimal){
	
	dwr.util.removeAllOptions("idTipoProducto");
	var data = [ { descripcion:"-Seleccione un Producto-", id:-1 }];
	dwr.util.addOptions("idTipoProducto", data, "id", "descripcion");	
	dwr.util.addOptions("idTipoProducto", tiposAnimal,"id","descripcion");

	$("#idTipoProducto").attr('disabled', false);
}

</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="animalEnEstablecimiento" styleId="animalEnEstablecimientoForm">
	<html:hidden property="metodo" value="altaStockAnimalDeProductorEnEstablecimiento" />
	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td class="azulAjustado">
				Alta de Stock Animal en Establecimiento
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
							<select id="idProductor" class="botonerab" name="productorEnEstablecimiento.productor.id">
								<option value="-1">- Seleccione un Productor -</option>
								<c:forEach items="${productores}" var="productor" varStatus="i">
									<option value="<c:out value='${productor.id}'></c:out>">
										<c:out value="${productor.nombre}"></c:out>
									</option>							
								</c:forEach>
							</select>					
						</td>
					</tr>	
					<tr>
						<td height="5" colspan="2"></td>
					</tr>						
					<tr>
						<td width="40%" class="botoneralNegritaRight">Establecimiento</td>
						<td class="botonerab" align="left">
							<select id="idEstablecimiento" class="botonerab" name="productorEnEstablecimiento.establecimiento.id">
								<option value="-1">- Seleccione un Establecimiento -</option>														
								<c:forEach items="${establecimientos}" var="establecimiento" varStatus="i">
									<option value="<c:out value='${establecimiento.id}'></c:out>">
										<c:out value="${establecimiento.nombre}"></c:out>
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td height="5" colspan="2"></td>
					</tr>				
					<tr>
						<td width="40%" class="botoneralNegritaRight">Categoria</td>
						<td class="botonerab" align="left">
							<select id="idCategoria" class="botonerab" onchange="cambioCategoria();">
								<option value="-1">- Seleccione una Categoria -</option>														
								<c:forEach items="${categorias}" var="categoria" varStatus="i">
									<option value="<c:out value='${categoria.id}'></c:out>">
										<c:out value="${categoria.descripcion}"></c:out>
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td height="5" colspan="2"></td>
					</tr>	
					<tr>
						<td width="40%" class="botoneralNegritaRight">Tipo Producto</td>
						<td class="botonerab" align="left">
							<select id="idTipoProducto" class="botonerab" disabled="disabled" 
								name="animalEnEstablecimiento.tipoAnimal.id">
								<option value="-1">- Seleccione una Producto -</option>														
							</select>
						</td>
					</tr>
					<tr>
						<td height="5" colspan="2"></td>
					</tr>							
					<tr>
						<td width="40%" class="botoneralNegritaRight">Stock</td>
						<td class="botonerab" align="left">
							<input id="idStock" type="text" class="botonerab" size="20" 
							name="animalEnEstablecimiento.stock" onkeypress="javascript:esNumerico(event);">
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
				<input type="button" value="Aceptar" class="botonerab" onclick="javascript:submitir();">
			</td>
		</tr>	
		<tr>
			<td height="20"></td>
		</tr>
	</table>
</html:form>