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
	
	$( "#datepicker1" ).datepicker({ dateFormat: 'dd/mm/yy'});
	$( "#datepicker2" ).datepicker({ dateFormat: 'dd/mm/yy'});
});


function submitir(){
		validarForm("denunciaFormId","../denuncia","validarDenunciaForm","DenunciaForm");
	}
	
	
	
function agregarFila(tabla) {

	$('#idRemFila-'+tabla).attr('disabled',false);
	var j = $('#'+tabla +' tr[id*=fila]:last input.ind').val();

	var k = parseInt(j)+1;
	
	$("#"+tabla +" tr[id*=fila]:last").clone().find("input,select,td").each(function() {
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
	
	
}

function removerFila(tabla) {

	$('#'+ tabla +' tr:last').remove();

	var j = $('#'+ tabla +' tr[id*=fila]:last input.ind').val();
	if(j==0){
		$('#idRemFila-'+tabla).attr('disabled',true);
	}
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
			<td width="20%" class="botoneralNegritaRight">Denuncia N°</td>
			<td width="20%" >
				<html:text size="23" styleClass="botonerab" property="denunciaDTO.numeroDeDenuncia"
							onkeypress="return evitarAutoSubmit(event)"/>
			</td>
			
			<td width="20%" class="botoneralNegritaRight">Llamado N°</td>
			<td width="20%" align="left">
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
				<input id="datepicker1" type="text" name="denunciaDTO.desde" readonly="readonly" class="botonerab">
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
				<input id="datepicker2" type="text" name="denunciaDTO.hasta" readonly="readonly" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>								

			</td>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td height="20" colspan="4"></td>
		</tr>
		
		
		<tr>
			<td width="20%" rowspan="6" class="botoneralNegritaRight">General</td>
			<td>&nbsp;</td>
		</tr>

		<c:forEach items="${tipoDenuncias}" var="tipoDenuncia" varStatus="i">
			<tr>
				<td align="left" colspan="2">
					<input type="checkbox" class="botonerab" name="denunciaDTO.tiposDeDenuncia[${i.index}]" value="${tipoDenuncia.id}" /> ${tipoDenuncia.descripcion}
				</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		
		
		<tr>
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
						<td width="10%"><html:text size="3" styleClass="botonerab" property="denunciaDTO.avistajePerros[0].sexo" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="10%"><html:text size="5" styleClass="botonerab" property="denunciaDTO.avistajePerros[0].edad" onkeypress="return evitarAutoSubmit(event)"/></td>	
						<td width="10%"><html:text size="5" styleClass="botonerab" property="denunciaDTO.avistajePerros[0].tamaño" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="20%"><html:text size="10" styleClass="botonerab" property="denunciaDTO.avistajePerros[0].veniaDe" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="20%"><html:text size="10" styleClass="botonerab" property="denunciaDTO.avistajePerros[0].ibaHacia" onkeypress="return evitarAutoSubmit(event)"/></td>
					</tr>		
				</table>
			</td>
			
		</tr>

		<tr>
			<td colspan="4">
					<input id="idAgrFila-tablaAvistajePerros" type="button" value="+" onclick="agregarFila('tablaAvistajePerros');">
					<input id="idRemFila-tablaAvistajePerros" type="button" value="-" onclick="removerFila('tablaAvistajePerros');" disabled="disabled">
			</td>
		</tr>		
			
	
	
		<tr>
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
						<td width="10%"><html:text size="3" styleClass="botonerab" property="denunciaDTO.capturaPerros[0].sexo" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="10%"><html:text size="5" styleClass="botonerab" property="denunciaDTO.capturaPerros[0].edad" onkeypress="return evitarAutoSubmit(event)"/></td>	
						<td width="10%"><html:text size="5" styleClass="botonerab" property="denunciaDTO.capturaPerros[0].tamaño" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="20%"><html:text size="10" styleClass="botonerab" property="denunciaDTO.capturaPerros[0].veniaDe" onkeypress="return evitarAutoSubmit(event)"/></td>
						<td width="20%"><html:text size="10" styleClass="botonerab" property="denunciaDTO.capturaPerros[0].ibaHacia" onkeypress="return evitarAutoSubmit(event)"/></td>
					</tr>		
				</table>
			</td>
			
		</tr>

		<tr>
			<td colspan="4">
					<input id="idAgrFila-tablaCapturaPerros" type="button" value="+" onclick="agregarFila('tablaCapturaPerros');">
					<input id="idRemFila-tablaCapturaPerros" type="button" value="-" onclick="removerFila('tablaCapturaPerros');" disabled="disabled">
			</td>
		</tr>		


		<tr>
			<td width="30%" rowspan="2" class="botoneralNegritaRight">Daños en Hacienda</td>
			<td width="70%" colspan="3">
				<table id="tablaDañosHacienda">
					<tr>
						<td width="50%" class="botoneralNegrita">Especie</td>
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


		<tr>
			<td colspan="4">
					<input id="idAgrFila-tablaDañosHacienda" type="button" value="+" onclick="agregarFila('tablaDañosHacienda');">
					<input id="idRemFila-tablaDañosHacienda" type="button" value="-" onclick="removerFila('tablaDañosHacienda');" disabled="disabled">
			</td>
		</tr>	
		
		
		
		<tr>
			<td width="30%" rowspan="2" class="botoneralNegritaRight">Muerte en Hacienda</td>
			<td width="70%" colspan="3">
				<table id="tablaMuerteHacienda">
					<tr>
						<td width="20%" class="botoneralNegrita">Cantidad</td>
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


		<tr>
			<td colspan="4">
					<input id="idAgrFila-tablaMuerteHacienda" type="button" value="+" onclick="agregarFila('tablaMuerteHacienda');">
					<input id="idRemFila-tablaMuerteHacienda" type="button" value="-" onclick="removerFila('tablaMuerteHacienda');" disabled="disabled">
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
