<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" 
		src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/MarcaSenialFachada.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	  type="text/css">

<script type="text/javascript">

	function recuperarMarcasSeniales(){

		var prod = $('#idProductor').val();
		var tipo = $('#idTipo').val();
		$('#divCargando').show();	
		$('#divDetalle').html("");
		
		if(prod != "-1" && tipo != "-1"){
			$('#divDetalle').load('../../marcaSenial.do?metodo=cargarMarcasSenialesParaPagoBoletas&idProductor='+prod + '&idTipo=' + tipo);
			$('#divDetalle').hide();
			//$('#divDetalle').fadeIn(600);

			Concurrent.Thread.create(function(){
			    while ($('#divDetalle').html() == "") {}
			    $('#divCargando').hide();
			    $('#divDetalle').show(600);
			});	
						
		}else{
			$('#divDetalle').hide(600);
			$('#divDetalle').html("");
			$('#divCargando').hide();			
		}
	}

	function actualizarCanon(canon){
		
		$('#idCanon').val(canon.monto);
	}
	
</script>

<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">
	${error}
</div>

	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado" >Pago de Boletas de Depósito de Marca y Señal</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="40%"><bean:message key='SIIG.label.Productor'/></td>
			<td align="left" width="60%">
				<select id="idProductor" name="marcaSenial.productor.id" class="botonerab" onchange="recuperarMarcasSeniales();">
					<option value="-1">-Seleccione un Productor-</option>
					<c:forEach items="${productores}" var="productor">
						<option value="${productor.id}">
							<c:out value="${productor.nombre}"/>
						</option>
					</c:forEach>				
				</select>
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">Marca/Señal</td>
			<td align="left" width="60%">
				<select id="idTipo" name="marcaSenial.tipo" class="botonerab" onchange="recuperarMarcasSeniales();">
					<option value="-1">-Seleccione un Tipo-</option>
					<c:forEach items="${tipoMarcaSenial}" var="tipo">
						<option value="${tipo.name}">
							<c:out value="${tipo.descripcion}"/>
						</option>
					</c:forEach>				
				</select>				
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		<tr>
			<td id="divCargando" style="display: none" colspan="2">
				<img src="<html:rewrite page='/imagenes/cargando.gif'/>">
			</td>
		</tr>	
		<tr>		
			<td colspan="2">
				<div id="divDetalle"></div>		
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>													
	</table>
