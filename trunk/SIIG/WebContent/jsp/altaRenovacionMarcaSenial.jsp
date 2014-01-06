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

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	  type="text/css">

<script type="text/javascript">

	$(function() {
		
		$( "#datepicker1" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker2" ).datepicker({ dateFormat: 'dd/mm/yy'});
	});

	function submitir(){
		$('#exito').html("");
		validarForm("marcaSenialFormId","../marcaSenial","validarMarcaSenialForm","MarcaSenialForm");
	}

	function cargoImagen(){

		$('#idNomImg').val($('#idImagen').val());
	}

	function cambiarCanon(){

		var tipo = $('#idTipo').val();
		MarcaSenialFachada.recuperarCanonMarcaSenial(tipo,
				{callback : actualizarCanon,async : false});		
	}

	function actualizarCanon(canon){
		
		$('#idCanon').val(canon.monto);
	}
	
</script>

<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">
	${error}
</div>
<div id="exito" class="verdeExito">
	${exitoGrabado}
</div>
<html:form action="marcaSenial" styleId="marcaSenialFormId" enctype="multipart/form-data">
	<html:hidden property="metodo" value="altaRenovacionMarcaSenial"/>

	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2"  class="azulAjustado" >Alta/Renovación de Marca y Señal</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight"><bean:message key='SIIG.label.Productor'/></td>
			<td align="left">
				<html:select property="marcaSenial.productor.id" styleClass="botonerab">
					<c:forEach items="${productores}" var="productor">
						<html:option value="${productor.id}">
							<c:out value="${productor.nombre}"/>
						</html:option>
					</c:forEach>				
				</html:select>
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight">Marca/Señal</td>
			<td align="left">
				<html:select styleId="idTipo" property="marcaSenial.tipo" styleClass="botonerab" onchange="cambiarCanon();">
					<c:forEach items="${tipoMarcaSenial}" var="tipo">
						<html:option value="${tipo.name}">
							<c:out value="${tipo.descripcion}"/>
						</html:option>
					</c:forEach>				
				</html:select>				
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight"><bean:message key='SIIG.label.Numero'/></td>
			<td align="left">
				<html:text property="marcaSenial.numero" styleClass="botonerab"/>
			</td>
		</tr>					
		<tr>
			<td class="botoneralNegritaRight"><bean:message key='SIIG.label.FechaVencimiento'/></td>
			<td align="left">
				<input id="datepicker1" type="text" name="marcaSenial.fechaVencimiento" readonly="readonly" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>								
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight"><bean:message key='SIIG.label.Imagen'/></td>
			<td align="left">
				<input id="idImagen" type="file" name="imagen" onchange="javascript:cargoImagen();">
				<input id="idNomImg" name="marcaSenial.nombreImagen" type="hidden">
			</td>
		</tr>			
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2">
				<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
					<tr>
						<td colspan="4"  class="grisSubtitulo" >Boleta de Deposito</td>
					</tr>
					<tr>
						<td height="10" colspan="4"></td>
					</tr>
					<tr>
						<td class="botoneralNegritaRight">
							Número
						</td>
						<td align="left">
							<html:text property="marcaSenial.boletaDeposito.numero" styleClass="botonerab" 
									   onkeypress="javascript:esNumerico(event);"/>
						</td>
						<td class="botoneralNegritaRight">
							Monto $
						</td>
						<td align="left">
							<html:text property="marcaSenial.boletaDeposito.monto" styleClass="botonerab" styleId="idCanon"
									   onkeypress="javascript:esNumericoConDecimal(event);" value="${canonMarcaSenial.monto}"/>
						</td>																		
					</tr>
					<tr>
						<td class="botoneralNegritaRight" colspan="2">
							Fecha Vencimiento
						</td>
						<td colspan="2" align="left">
							<input id="datepicker2" type="text" name="marcaSenial.boletaDeposito.fechaVencimiento" readonly="readonly" class="botonerab">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>						
						</td>																		
					</tr>					
					<tr>
						<td height="10" colspan="4"></td>
					</tr>									
				</table>			
			</td>
		</tr>		
		<tr>
			<td height="20" colspan="2"></td>
		</tr>		
		<tr>
			<td height="20" colspan="2">				
				<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();">
				<input type="button" class="botonerab" value="Cancelar" 
						onclick="javascript:parent.location= contextRoot() +  '/jsp.do?page=.index'">
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>									
	</table>

</html:form>
