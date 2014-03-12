<%@page import="ar.com.siig.negocio.TipoDeDenuncia"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" 
		src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	
<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	  type="text/css">
			
<script type="text/javascript">

$(function() {
	
	$( "#datepickerDesde" ).datepicker({ dateFormat: 'dd/mm/yy'});
	$( "#datepickerHasta" ).datepicker({ dateFormat: 'dd/mm/yy'});
	$( "#datepicker0" ).datepicker({ dateFormat: 'dd/mm/yy'});
});


function submitir(){
		validarForm("denunciaFormId","../denuncia","validarDenunciaForm","DenunciaForm");
	}
	
	
	
function agregarFila(tabla) {

	$('#idRemFila-'+tabla).attr('disabled',false);
	var j = $('#'+tabla +' tr[id*=fila]:last input.ind').val();

	var k = parseInt(j)+1;
	
	$("#"+tabla +" tr[id*=fila]:last").clone().find("input,select,td,textarea").each(function() {
		$(this).attr(
			{'name' : function(_, name){
							if(name != null)
								return name.replace([ j ], [ k ]);
					  },
			'value' : '',
			'onchange' : function(_, name){
							if(name != null)
								return name.replace([ j ], [ k ]);
						  },
			'id' : function(_, name){
							if(name != null)
								return name.replace([ j ], [ k ]);
					  	  }
			}
		);
	}).end().appendTo("#"+tabla);
		
	$('#'+ tabla +' tr[id*=fila]:last input.ind').val(k);

	$("#"+ tabla +" tr[id*=fila]:last").attr('id', "fila"+k);
	
	//para que ande porque cuando clono ya tiene esa clase y tiene problemas al intentar agregarla en la funcion .datePicker()
	$("#datepicker" + k).removeClass('hasDatepicker');
	$( "#datepicker" + k ).datepicker({ dateFormat: 'dd/mm/yy'});
}

function removerFila(tabla) {

	$('#'+ tabla +' tr:last').remove();

	var j = $('#'+ tabla +' tr[id*=fila]:last input.ind').val();
	if(j==0){
		$('#idRemFila-'+tabla).attr('disabled',true);
	}
}

var nroDenuncia = null;
function cambioDenunciaLlamado(){
	if($("#radioDenuncia").attr("checked") == "checked"){
		if(nroDenuncia!=null){
			$("#denuncia").val(nroDenuncia);
		}
		$("#tdDenuncia").show();
		$("#tdLlamado").hide();
	}
	
	if($("#radioLlamado").attr("checked") == "checked"){
		nroDenuncia = $("#denuncia").val();
		$("#denuncia").val("");
		$("#tdDenuncia").hide();
		$("#tdLlamado").show();
	}
}

	function cambioTipoDenunciaEnum(){
		if($("#tipoDenunciaEnum").val()=="PERROS"){
			$(".perros").show();
			$(".robo").hide();
			$(".otro").hide();
			$(".otro.perros").show();
		}
		
		if($("#tipoDenunciaEnum").val()=="ROBO"){
			$(".robo").show();
			$(".perros").hide();
			$(".otro").hide();
			$(".otro.perros").hide();
		}
		
		if($("#tipoDenunciaEnum").val()=="OTRO"){
			$(".otro").show();
			$(".perros").hide();
			$(".robo").hide();
			$(".otro.perros").show();
		}
		
		/*$(".otro").show();
		$(".perros").show();
		$(".robo").show();*/
	}
</script>


<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>
<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

<html:form action="denuncia" styleId="denunciaFormId">

	<html:hidden property="metodo" value="altaDenuncia" />

	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="4" class="azulAjustado">
				<bean:message key='SIIG.titulo.AltaDenuncia'/>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>
	
	
		<tr>
			<td width="20%" class="botoneralNegritaRight">Productor</td>
			<td >
				<select class="botonerab" id="idProductorSelect" name="denunciaDTO.productorId" style="width: 160px;">
					<option value="-1">-Seleccione un Productor-</option>
					<c:forEach items="${productores}" var="productor" varStatus="i">
						<option value="<c:out value='${productor.id}'></c:out>">
							<c:out value="${productor.nombre}"></c:out>
						</option>
					</c:forEach>
				</select>		
			</td>
		</tr>


		<tr>
			<td width="20%" class="botoneralNegritaRight">Denuncia N° <input type="radio" name="denunciaLlamado" id="radioDenuncia" checked="checked" onclick="cambioDenunciaLlamado()"></td>
			<td width="20%" id="tdDenuncia">
				<html:text size="23" styleId="denuncia" styleClass="botonerab" property="denunciaDTO.numeroDeDenuncia"
							onkeypress="return evitarAutoSubmit(event)" value="${numeroDeDenuncia}"/>
			</td>
		</tr>
		<tr>		
			<td width="20%" class="botoneralNegritaRight">Llamado N° <input type="radio" name="denunciaLlamado" id="radioLlamado" onclick="cambioDenunciaLlamado()"> </td>
			<td width="20%" id="tdLlamado" style="display: none">
				<html:text styleClass="botonerab" property="denunciaDTO.numeroDeLlamado"
							onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		
		<tr>
			<td width="20%" class="botoneralNegritaRight">Momento</td>
			<td width="20%" class="botoneralNegrita">Fecha y Hora</td>
			
			<td colspan="2" width="20%" class="botoneralNegrita">Lugar(celda mapa)</td>
		</tr>
		
		<tr>
			<td width="20%" class="botoneralNegritaRight">Desde</td>
			<td width="20%">
				<input id="datepickerDesde" type="text" name="denunciaDTO.desde" readonly="readonly" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>								
			</td>
			
			<td colspan="2" width="20%" >
				<html:text styleClass="botonerab" property="denunciaDTO.lugar"
							onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		
		<tr>
			<td width="20%" class="botoneralNegritaRight">Hasta</td>
			<td width="20%" >
				<input id="datepickerHasta" type="text" name="denunciaDTO.hasta" readonly="readonly" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>								

			</td>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td width="20%" class="botoneralNegritaRight">Tipo de Denuncia</td>
			<td>
				<select name="denunciaDTO.tipoDeDenuncia" id="tipoDenunciaEnum" onchange="cambioTipoDenunciaEnum()">
					<c:forEach items="${tiposDeDenunciasEnum}" var="tipoDenunciaEnum" varStatus="i">
						<option value="${tipoDenunciaEnum}">${tipoDenunciaEnum.descripcion}</option>
					</c:forEach>
				</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		
		
		<tr class="perros">
			<td width="20%" rowspan="6" class="botoneralNegritaRight">General</td>
			<td>&nbsp;</td>
		</tr>

		<c:forEach items="${tipoDenuncias}" var="tipoDenuncia" varStatus="i">
			<tr class="perros">
				<td align="left" colspan="2">
					<input type="checkbox" class="botonerab" name="denunciaDTO.tiposDeDenuncia[${i.index}]" value="${tipoDenuncia.id}" /> ${tipoDenuncia.descripcion}
				</td>
			</tr>
		</c:forEach>
		
		<tr class="perros">
			<td height="20" colspan="2"></td>
		</tr>
		
		
		<tr class="perros">
			<td width="30%" rowspan="2" class="botoneralNegritaRight">Avistaje De Perros</td>
			<td width="70%" colspan="3">
				<table id="tablaAvistajePerros">
					<tr>
						<td width="10%" class="botoneralNegrita">Cantidad</td>
						<td width="30%" class="botoneralNegrita">Señas</td>
						<td width="10%" class="botoneralNegrita">Sexo</td>
						<td width="10%" class="botoneralNegrita">Edad</td>			
						<td width="10%" class="botoneralNegrita">Tamaño</td>
						<td width="20%" class="botoneralNegrita">Venian De (celda mapa)</td>
						<td width="20%" class="botoneralNegrita">Iban Hacia (celda mapa)</td>
					</tr>
					<tr id="fila0">
						
						<td width="10%">
							<input class="ind" type="hidden" value="0">
							<html:text size="4" styleClass="botonerab" property="denunciaDTO.avistajePerros[0].cantidad" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"><html:text size="25" styleClass="botonerab" property="denunciaDTO.avistajePerros[0].señas" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="10%">
							<select name="denunciaDTO.avistajePerros[0].sexo" class="botonerab">
								<c:forEach items="${sexos}" var="sexo" varStatus="i">
									<option value="${sexo}">${sexo} </option>
								</c:forEach>
							</select>
						</td>
						<td width="10%">
							<select name="denunciaDTO.avistajePerros[0].edad" class="botonerab">
								<c:forEach items="${edades}" var="edad" varStatus="i">
									<option value="${edad}">${edad} </option>
								</c:forEach>
							</select>
						</td>	
						<td width="10%">
							<select name="denunciaDTO.avistajePerros[0].tamaño" class="botonerab">
								<c:forEach items="${tamanos}" var="tamano" varStatus="i">
									<option value="${tamano}">${tamano} </option>
								</c:forEach>
							</select>
						</td>
						<td width="20%"><html:text size="10" styleClass="botonerab" property="denunciaDTO.avistajePerros[0].veniaDe" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="20%"><html:text size="10" styleClass="botonerab" property="denunciaDTO.avistajePerros[0].ibaHacia" onkeypress="return evitarAutoSubmit(event)"/></td>
					</tr>		
				</table>
			</td>
			
		</tr>

		<tr class="perros">
			<td colspan="4">
					<input id="idAgrFila-tablaAvistajePerros" type="button" value="+" onclick="agregarFila('tablaAvistajePerros');">
					<input id="idRemFila-tablaAvistajePerros" type="button" value="-" onclick="removerFila('tablaAvistajePerros');" disabled="disabled">
			</td>
		</tr>		
			
	
	
		<tr class="perros">
			<td width="30%" rowspan="2" class="botoneralNegritaRight">Captura De Perros</td>
			<td width="70%" colspan="3">
				<table id="tablaCapturaPerros">
					<tr>
						<td width="10%" class="botoneralNegrita">Cantidad</td>
						<td width="30%" class="botoneralNegrita">Señas</td>
						<td width="10%" class="botoneralNegrita">Sexo</td>
						<td width="10%" class="botoneralNegrita">Edad</td>			
						<td width="10%" class="botoneralNegrita">Tamaño</td>
						<td width="20%" class="botoneralNegrita">Venian De (celda mapa)</td>
						<td width="20%" class="botoneralNegrita">Iban Hacia (celda mapa)</td>
					</tr>
					<tr id="fila0">
						
						<td width="10%">
							<input class="ind" type="hidden" value="0">
							<html:text size="4" styleClass="botonerab" property="denunciaDTO.capturaPerros[0].cantidad" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"><html:text size="25" styleClass="botonerab" property="denunciaDTO.capturaPerros[0].señas" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="10%">
							<select name="denunciaDTO.capturaPerros[0].sexo" class="botonerab">
								<c:forEach items="${sexos}" var="sexo" varStatus="i">
									<option value="${sexo}">${sexo} </option>
								</c:forEach>
							</select>
						</td>
						<td width="10%">
							<select name="denunciaDTO.capturaPerros[0].edad" class="botonerab">
								<c:forEach items="${edades}" var="edad" varStatus="i">
									<option value="${edad}">${edad} </option>
								</c:forEach>
							</select>
						</td>	
						<td width="10%">
							<select name="denunciaDTO.capturaPerros[0].tamaño" class="botonerab">
								<c:forEach items="${tamanos}" var="tamano" varStatus="i">
									<option value="${tamano}">${tamano} </option>
								</c:forEach>
							</select>
						</td>
						<td width="20%"><html:text size="10" styleClass="botonerab" property="denunciaDTO.capturaPerros[0].veniaDe" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="20%"><html:text size="10" styleClass="botonerab" property="denunciaDTO.capturaPerros[0].ibaHacia" onkeypress="return evitarAutoSubmit(event)"/></td>
					</tr>		
				</table>
			</td>
			
		</tr>

		<tr class="perros">
			<td colspan="4">
					<input id="idAgrFila-tablaCapturaPerros" type="button" value="+" onclick="agregarFila('tablaCapturaPerros');">
					<input id="idRemFila-tablaCapturaPerros" type="button" value="-" onclick="removerFila('tablaCapturaPerros');" disabled="disabled">
			</td>
		</tr>		


		<tr class="perros">
			<td width="30%" rowspan="2" class="botoneralNegritaRight">Daños en Hacienda</td>
			<td width="70%" colspan="3">
				<table id="tablaDañosHacienda">
					<tr>
						<td width="50%" class="botoneralNegrita" align="left">Especie</td>
						<td width="50%" class="botoneralNegrita">Categoria</td>
					</tr>
					<tr id="fila0">
						
						<td width="50%">
							<input class="ind" type="hidden" value="0">
							<html:text size="4" styleClass="botonerab" property="denunciaDTO.dañosHacienda[0].especie" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="50%"><html:text size="25" styleClass="botonerab" property="denunciaDTO.dañosHacienda[0].categoria" onkeypress="return evitarAutoSubmit(event)"/></td>
					
					</tr>		
				</table>
			</td>
			
		</tr>


		<tr class="perros">
			<td colspan="4">
					<input id="idAgrFila-tablaDañosHacienda" type="button" value="+" onclick="agregarFila('tablaDañosHacienda');">
					<input id="idRemFila-tablaDañosHacienda" type="button" value="-" onclick="removerFila('tablaDañosHacienda');" disabled="disabled">
			</td>
		</tr>	
		
		
		
		<tr class="perros">
			<td width="30%" rowspan="2" class="botoneralNegritaRight">Muerte en Hacienda</td>
			<td width="70%" colspan="3">
				<table id="tablaMuerteHacienda">
					<tr>
						<td width="20%" class="botoneralNegrita" align="left">Cantidad</td>
						<td width="40%" class="botoneralNegrita">Especie</td>
						<td width="40%" class="botoneralNegrita">Categoria</td>
					</tr>
					<tr id="fila0">
						
						<td width="50%">
							<input class="ind" type="hidden" value="0">
							<html:text size="4" styleClass="botonerab" property="denunciaDTO.muertesHacienda[0].cantidad" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="50%"><html:text size="25" styleClass="botonerab" property="denunciaDTO.muertesHacienda[0].especie" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="50%"><html:text size="25" styleClass="botonerab" property="denunciaDTO.muertesHacienda[0].categoria" onkeypress="return evitarAutoSubmit(event)"/></td>
					
					</tr>		
				</table>
			</td>
			
		</tr>


		<tr class="perros">
			<td colspan="4">
					<input id="idAgrFila-tablaMuerteHacienda" type="button" value="+" onclick="agregarFila('tablaMuerteHacienda');">
					<input id="idRemFila-tablaMuerteHacienda" type="button" value="-" onclick="removerFila('tablaMuerteHacienda');" disabled="disabled">
			</td>
		</tr>


		<tr class="robo" style="display:none;">
			<td width="30%" rowspan="2" class="botoneralNegritaRight">Robo</td>
			<td width="70%" colspan="3">
				<table id="tablaRobos" border="0">
					<tr>
						<td width="10%" class="botoneralNegrita">Producto</td>
						<td width="5%" class="botoneralNegrita">Cantidad</td>
						<td width="55%" class="botoneralNegrita">Fecha</td>
						<td colspan="4" class="botoneralNegrita">Observaciones</td>			
					</tr>
					<tr id="filat0">
						<input class="ind" type="hidden" value="0">
						<td width="10%"><html:text size="25" styleClass="botonerab" property="denunciaDTO.robos[0].producto" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="5%"><html:text size="5" styleClass="botonerab" property="denunciaDTO.robos[0].cantidad" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="55%">
							<input id="datepicker0" type="text" size="10" name="denunciaDTO.robos[0].fechaStr" readonly="readonly" class="botonerab">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
							</td>
						<td colspan="4"><html:textarea rows="5" cols="10" styleClass="botonerab" property="denunciaDTO.robos[0].observaciones" onkeypress="return evitarAutoSubmit(event)"/></td>
					</tr>
				</table>
			</td>
		</tr>


		<tr class="robo" style="display:none">
			<td colspan="4">
					<input id="idAgrFila-tablaRobos" type="button" value="+" onclick="agregarFila('tablaRobos');">
					<input id="idRemFila-tablaRobos" type="button" value="-" onclick="removerFila('tablaRobos');" disabled="disabled">
			</td>
		</tr>
		
		
		<tr class="otro perros">
			<td width="30%" rowspan="2" class="botoneralNegritaRight">Otro</td>
			<td width="70%" colspan="3">
				<table id="tablaOtro" border="0" align="center">
					<tr>
						<td width="100%" colspan="4" class="botoneralNegrita">Observaciones</td>
					</tr>
					<tr>
						<td colspan="4"><html:textarea rows="5" cols="50" styleClass="botonerab" property="denunciaDTO.observaciones" onkeypress="return evitarAutoSubmit(event)"/></td>
					</tr>
				</table>
			</td>
		</tr>



		<tr>
			<td height="20" colspan="4">
				<input type="button" class="botonerab" value="Aceptar" id="enviar"
						onclick="javascript:submitir();"> 
				<input type="button" class="botonerab" value="Cancelar"
						onclick="javascript:parent.location= contextRoot() +  '/jsp.do?page=.index'">
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
	</table>

</html:form>
