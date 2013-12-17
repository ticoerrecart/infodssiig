<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
	
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/LocalidadFachada.js'/>"></script>	
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/EstablecimientoFachada.js'/>"></script>	

	
<script type="text/javascript">


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

	
	function mostrarEstablecimientos(){

		var idLocalidadSelect = $('#idLocalidadSelect').val();
		if(idLocalidadSelect != "-1"){
			
			$('#idEstablecimientoSelect').attr('disabled',false);
			EstablecimientoFachada.getEstablecimientosDTODeLocalidad(idLocalidadSelect,actualizarEstablecimientosCallback );
			
		}else{
			$('#divEstablecimiento').html("");
			
			dwr.util.removeAllOptions("idEstablecimientoSelect");
			var data = [ { nombre:"-Seleccione un Establecimiento-", id:-1 }];
			dwr.util.addOptions("idEstablecimientoSelect", data, "id", "nombre");		
			$('#idEstablecimientoSelect').attr('disabled',true);			
		}			
	}

	function actualizarEstablecimientosCallback(establecimientos) {

		dwr.util.removeAllOptions("idEstablecimientoSelect");
		var data = [ {
			nombre : "-Seleccione un Establecimiento-",
			id : -1
		} ];
		dwr.util.addOptions("idEstablecimientoSelect", data, "id", "nombre");
		dwr.util.addOptions("idEstablecimientoSelect", establecimientos, "id", "nombre");
	}	
	
	function mostrarDatosEstablecimiento(){

		$('#exitoGrabado').empty();		

		$('#divCargando').show();	
		$('#divEstablecimiento').html("");

		var idEstablecimientoSelect = $('#idEstablecimientoSelect').val();
		if(idEstablecimientoSelect != "-1"){
		
			$('#divEstablecimiento').load('../../establecimiento.do?metodo=cargarEstablecimientoAModificar&idEstablecimiento=' + idEstablecimientoSelect);
			$('#divEstablecimiento').hide();
			$('#divEstablecimiento').fadeIn(600);
	
			Concurrent.Thread.create(function(){
			    while ($('#divEstablecimiento').html() == "") {}
			    $('#divCargando').hide();
			});
		}else{

			$('#divCargando').hide();
			$('#divEstablecimiento').html("");			
		}	
	}
</script>


<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>
<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				<bean:message key='SIIG.titulo.ModificacionEstablecimiento'/>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
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
				<select id="idLocalidadSelect" class="botonerab" onchange="mostrarEstablecimientos();" disabled="disabled">
					<option value="-1">-Seleccione una Localidad-</option>
				</select>
			</td>		
		</tr>	
		
		<tr>
			<td width="40%" class="botoneralNegritaRight"><bean:message key='SIIG.label.Establecimiento'/></td>
			<td align="left">
				<select id="idEstablecimientoSelect" class="botonerab" onchange="mostrarDatosEstablecimiento();" disabled="disabled">
					<option value="-1">-Seleccione un Establecimiento-</option>
				</select>
			</td>		
		</tr>	
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		
		<tr>
			<td id="divCargando" style="display: none" colspan="2">
				<img src="<html:rewrite page='/imagenes/cargando.gif'/>">
			</td>
		</tr>	
		<tr>
			<td colspan="2">
				<div id="divEstablecimiento"></div>
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		
	</table>

