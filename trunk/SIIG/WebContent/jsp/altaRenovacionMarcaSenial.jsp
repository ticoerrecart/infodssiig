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
		//alert($('#idImagen').val())
		$("#idImg").attr("src","");
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
	
	function obtenerMarcaSenial(){
		var idProductor = $("#idProductor").val();
		//alert(idProductor + "/" + $("#idTipo").val());
		if(idProductor!="-1"){
			if ($("#idTipo").val()=="AltaMarca" || $("#idTipo").val()=="RenovacionMarca"){
				MarcaSenialFachada.getMarcaDTO(idProductor,marcaSenialCallback );
			}else{
				if ($("#idTipo").val()=="AltaSenial" || $("#idTipo").val()=="RenovacionSenial"){
					MarcaSenialFachada.getSenialDTO(idProductor,marcaSenialCallback );		
				}else{
					alert("Error, no se puede obtener Marca/Señal");
				}
			}
		}else{
			$("#idImg").attr("src","");
			$("#idImg").hide();
		}
	}

	function marcaSenialCallback(marcaSenial){
		//alert("cbk " + marcaSenial)
		if(marcaSenial != null){
			$("#idImg").attr("src","../../imagenes/"+marcaSenial.nombreImagen);
			$("#idImg").show();
			$("#divImagenAnterior").show();
			$("#trImagen").show();
			
			if ($("#idTipo").val()=="RenovacionMarca" || $("#idTipo").val()=="RenovacionSenial"){
				$("#numeroMarcaSenial").val(marcaSenial.numero);
				$("#numeroMarcaSenial").attr("readonly","readonly");
			}else{
				$("#numeroMarcaSenial").val("");
				$("#numeroMarcaSenial").removeAttr("readonly");
			}

		}else{
			$("#idImg").hide();
			$("#divImagenAnterior").hide();
			$("#trImagen").hide();
		}
		
	}
	
	function utilizarImagenAnteriorFunc(){
		var valor = $("#checkUtilizarImagenAnterior").is(':checked');
		if(valor){
			$("#divImagen").hide();
		}else{
			$("#divImagen").show();
		}
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
			<td class="botoneralNegritaRight" width="40%"><bean:message key='SIIG.label.Productor'/></td>
			<td align="left">
				<html:select styleId="idProductor" property="marcaSenial.productor.id" styleClass="botonerab" onchange="obtenerMarcaSenial();">
					<html:option value="-1">
							-- Seleccione un Productor --
					</html:option>
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
				<html:select styleId="idTipo" property="marcaSenial.tipo" styleClass="botonerab" onchange="cambiarCanon();obtenerMarcaSenial();">
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
				<html:text styleId="numeroMarcaSenial" property="marcaSenial.numero" styleClass="botonerab"/>
			</td>
		</tr>					
		<tr>
			<td class="botoneralNegritaRight"><bean:message key='SIIG.label.FechaVencimiento'/></td>
			<td align="left">
				<input id="datepicker1" type="text" name="marcaSenial.fechaVencimiento" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>								
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" height="10px"><bean:message key='SIIG.label.Imagen'/> Nueva</td>
			<td align="left" height="10px">
				<div id="divImagen">
					<input id="idImagen" type="file" name="imagen" onchange="javascript:cargoImagen();">
					<input id="idNomImg" name="marcaSenial.nombreImagen" type="hidden">
				</div>
				<br>
				
				<div id="divImagenAnterior" style="display: none">
					<input type="checkbox" name="utilizarImagenAnterior" id="checkUtilizarImagenAnterior" onclick="javascript:utilizarImagenAnteriorFunc(this.value);"> <span class="botoneralNegritaRight">Utilizar imagen anterior</span>
				</div>
			</td>
		</tr>
		<tr id="trImagen" style="display: none">
			<td class="botoneralNegritaRight"><bean:message key='SIIG.label.Imagen'/> Anterior</td>
			<td align="left">
				<img id="idImg" alt="" src="" height="20%" width="20%" style="display:none">
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
							<input id="datepicker2" type="text" name="marcaSenial.boletaDeposito.fechaVencimiento" class="botonerab">
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

	<script>
		obtenerMarcaSenial();
	</script>
</html:form>
