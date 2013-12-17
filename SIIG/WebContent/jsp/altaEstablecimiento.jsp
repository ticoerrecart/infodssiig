<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/LocalidadFachada.js'/>"></script>	
	
<script type="text/javascript">
	function submitir(){
		validarForm("establecimientoFormId","../establecimiento","validarEstablecimientoForm","EstablecimientoForm");
	}


function mostrarLocalidades(){

		var idProvinciaSelect = $('#idProvinciaSelect').val();
		if(idProvinciaSelect != "-1"){
			
			$('#idLocalidadSelect').attr('disabled',false);
			LocalidadFachada.getLocalidadesDTODeProvincia(idProvinciaSelect,actualizarLocalidadesCallback );
			
		}else{
			$('#divLocalidad').html("");
			
			dwr.util.removeAllOptions("idLocalidadSelect");
			var data = [ { nombre:"-Seleccione una Localidad-", id:-1 }];
			dwr.util.addOptions("idLocalidadSelect", data, "id", "nombre");		
			$('#idLocalidadSelect').attr('disabled',true);			
		}			
	}

	function actualizarLocalidadesCallback(localidades) {

		dwr.util.removeAllOptions("idLocalidadSelect");
		var data = [ {
			nombre : "-Seleccione una Localidad-",
			id : -1
		} ];
		dwr.util.addOptions("idLocalidadSelect", data, "id", "nombre");
		dwr.util.addOptions("idLocalidadSelect", localidades, "id", "nombre");
	}	
	
	</script>
	
<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>
<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

<html:form action="establecimiento" styleId="establecimientoFormId">

	<html:hidden property="metodo" value="altaEstablecimiento" />

	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				<bean:message key='SIIG.titulo.AltaEstablecimiento'/>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Nombre'/></td>
			<td align="left">
				<html:text styleClass="botonerab" property="establecimientoDTO.nombre"
							onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
			<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Provincia'/></td>
			<td align="left">
				<select class="botonerab" id="idProvinciaSelect" onchange="mostrarLocalidades();">
					<option value="-1">-Seleccione una Provincia-</option>
					<c:forEach items="${provincias}" var="provincia" varStatus="i">
						<option value="<c:out value='${provincia.id}'></c:out>">
							<c:out value="${provincia.nombre}"></c:out>
						</option>							
					</c:forEach>
				</select>				
			</td>
		</tr>	
		<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Localidad'/></td>
			<td align="left">
				<select id="idLocalidadSelect" class="botonerab" disabled="disabled" name="establecimientoDTO.localidadDTO.id">
					<option value="-1">-Seleccione una Localidad-</option>
				</select>
			</td>		
		</tr>	
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td height="20" colspan="2">
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
