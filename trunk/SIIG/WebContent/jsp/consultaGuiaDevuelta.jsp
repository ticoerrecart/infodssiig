<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>		
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/TipoAnimalFachada.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PeriodoFachada.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/CategoriaFachada.js'/>"></script>	
		

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">
	

<script>

var type;
if (navigator.userAgent.indexOf("Opera")!=-1 && document.getElementById) type="OP"; 
if (document.all) type="IE"; 
if (!document.all && document.getElementById) type="MO";

function volver(){

	var idProductor = $("#idProductor").val();
	var periodo = $("#periodo").val();
	//var urlSeleccionGuia = $("#urlSeleccionGuia").val();
	//parent.location=contextRoot() + "/guia.do?metodo=cargarConsultaLegalizacionGuia&urlSeleccionGuia="+urlSeleccionGuia+"&idProductor="+idProductor+"&periodo="+periodo;
	parent.location=contextRoot() + "/guia.do?metodo=cargarConsultaGuiasDevueltas&urlDetalle=recuperarGuiasDevueltas&urlSeleccionGuia=cargarGuiaDevuelta&idProductor="+idProductor+"&periodo="+periodo;
}

//-----------------------------------------------------//

</script>
		
	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td class="azulAjustado">
				Guía Devuelta
			</td>
		</tr>
		<tr>
			<td height="15"></td>
		</tr>
		<tr>
			<td>
				<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="4" class="grisSubtitulo">Datos Guía Legalizada</td>
					</tr>
					<tr>
						<td colspan="4" height="10"></td>
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">Nro de Guía</td>
						<td width="30%" align="left">
							<input value="${guia.numero}" class="botonerab" type="text" size="20" readonly="readonly">
						</td>
			
						<td width="20%" class="botoneralNegritaRight">Período</td>
						<td align="left">
							<input id="idPeriodo" value="${guia.periodo}" class="botonerab" type="text" size="20" readonly="readonly">				
						</td>
					</tr>
			
					<tr>
						<td width="20%" class="botoneralNegritaRight">Productor</td>
						<td width="30%" align="left">
							<input value="${guia.productor.id}" type="hidden" id="idProductor">
							<input value="${guia.productor.nombre}" class="botonerab" type="text" size="20" readonly="readonly">
						</td>
						<td width="20%" class="botoneralNegritaRight">Fecha de Legalización</td>
						<td align="left">				
							<input value="${guia.fechaLegalizacion}" class="botonerab" type="text" size="20" readonly="readonly">						
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
						</td>
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">Nro Interno</td>
						<td width="30%" align="left">
							<input value="${guia.numeroInterno}" class="botonerab" type="text" size="20" readonly="readonly">
						</td>
						<td width="20%" class="botoneralNegritaRight">Agente Firmante</td>
						<td align="left">
							<input value="${guia.agenteFirmante.nombreUsuario}" class="botonerab" type="text" size="20" readonly="readonly">				
						</td>
					</tr>		
					<tr>
						<td height="10" colspan="4"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>
		
		<tr>
			<td>
				<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="4" class="grisSubtitulo"></td>
					</tr>
					<tr>
						<td colspan="4" height="10"></td>
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">Establecimiento de Orígen</td>
						<td width="30%" align="left">
							<input type="text" size="20" value="${guia.establecimientoOrigen.nombre}" class="botonerab" readonly="readonly">
						</td>
			
						<td width="20%" class="botoneralNegritaRight">Nro DTA</td>
						<td align="left">
							<input type="text" size="20" value="${guia.nroDTA}" class="botonerab" readonly="readonly">				
						</td>
					</tr>
			
					<tr>
						<td width="20%" class="botoneralNegritaRight">Finalidad</td>
						<td width="30%" align="left">
							<input type="text" size="20" value="${guia.finalidad}" class="botonerab" readonly="readonly">							
						</td>
						<td width="20%" class="botoneralNegritaRight">Fecha de Transito</td>
						<td align="left">				
							<input type="text" size="20" value="${guia.fechaTransito}" class="botonerab" readonly="readonly">						
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
			<td height="10"></td>
		</tr>
		<tr>
			<td>
				<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="4" class="grisSubtitulo">Datos de Transporte</td>
					</tr>
					<tr>
						<td colspan="4" height="10"></td>
					</tr>
					<tr>
						<td width="20%" class="botoneralNegritaRight">Medio de Transporte</td>
						<td width="30%" align="left">
							<input type="text" size="20" value="${guia.medioTransporte}" class="botonerab" readonly="readonly">
						</td>
			
						<td width="20%" class="botoneralNegritaRight">Transporte a Cargo de</td>
						<td align="left">	
							<input type="text" size="20" value="${guia.trasporteACargo}" class="botonerab" readonly="readonly"> 			
						</td>
					</tr>
			
					<tr>
						<td width="20%" class="botoneralNegritaRight">Patente de Vehiculo</td>
						<td width="30%" align="left">
							<input type="text" size="20" value="${guia.patente}" class="botonerab" readonly="readonly">
						</td>
						<td width="20%" class="botoneralNegritaRight">Patente de Acoplado</td>
						<td align="left">				
							<input type="text" size="20" value="${guia.patenteAcoplado}" class="botonerab" readonly="readonly">
						</td>
					</tr>		
					<tr>
						<td height="10" colspan="4"></td>
					</tr>
				</table>
			</td>
		</tr>		
		<tr>
			<td height="15"></td>
		</tr>		
						
	</table>


	<!-- MARCA/SEÑAL -->		
	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td colspan="4" align="left">
				<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="2" class="grisSubtitulo">Marca/Señal</td>
					</tr>
					<tr>
						<td colspan="2" height="10"></td>
					</tr>					
					<tr>
						<td colspan="2" height="10">
							<c:choose>
								<c:when test="${guia.marcaSenial.tipo == 'Marca'}">
									<c:set var="titulo" value="Nro Marca" />
									<input type="radio" id="radioMayor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMayor')" 
											disabled="disabled" checked="checked">Ganado Mayor
									<input type="radio" id="radioMenor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMenor')" 
											disabled="disabled">Ganado Menor
								</c:when>
								<c:otherwise>
									<c:set var="titulo" value="Nro Señal" />
									<input type="radio" id="radioMayor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMayor')" 
											disabled="disabled">Ganado Mayor
									<input type="radio" id="radioMenor" name="tipoGuia" onchange="cambiarTipoGuia('ganadoMenor')" 
											disabled="disabled" checked="checked">Ganado Menor								
								</c:otherwise>	
							</c:choose>	
						</td>
					</tr>
					<tr>
						<td colspan="2">
							
							<table border="0" class="cuadradoSinBorde" align="center" width="50%" cellpadding="2" cellspacing="0">
								<tr>
									<td colspan="2" height="10"></td>
								</tr>							
								<tr>
									<td class="botoneralNegritaRight">
										<c:out value="${titulo}"></c:out>
									</td>
									<td align="left">
										<input type="text" class="botonerab" size="10" readonly="readonly" value="${guia.marcaSenial.numero}">
									</td>																		
								</tr>
								<tr>
									<td colspan="2" height="10"></td>
								</tr>								
								<tr>
									<td colspan="2">
										<img height="20%" width="20%" alt="" src="../../imagenes/<c:out value='${guia.marcaSenial.nombreImagen}'></c:out>">																			
									</td>
								</tr>
							</table>
							
						</td>
					</tr>																												
					<tr>
						<td colspan="2" height="10"></td>
					</tr>				
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3" height="10"></td>
		</tr>				
	</table>						

	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td height="10"></td>
		</tr>	
		<tr>
			<td align="left">
				<div id="e1" style="DISPLAY: ">
					<label onclick="javascript:exp('1')"> 
						<img src="../../imagenes/expand.gif" border="0" /> 
						<U class="azulOpcion">
							Detalle de Productos						
						</U>
						<BR>
					</label>
				</div>
				<div id="c1" style="DISPLAY: none">
					<label onclick="javascript:col('1')"> 
						<img src="../../imagenes/collapse.gif" border="0" /> 
						<U class="azulOpcion">
							Detalle de Productos						
						</U>
						<BR>
					</label>
					<br>
					
					<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
						<tr>
							<td width="30%" class="grisSubtituloCenter">Categoría</td>
							<td width="30%" class="grisSubtituloCenter">Tipo Producto</td>
							<td width="10%" class="grisSubtituloCenter">Cantidad</td>
							<td width="2%" class="grisSubtituloCenter"></td>
							<td width="10%" class="grisSubtituloCenter">Canon</td>
							<td width="2%" class="grisSubtituloCenter"></td>							
							<td width="16%" class="grisSubtituloCenter">Monto</td>
						</tr>
						<tr>
							<td>
								<input type="text" size="27" value="${guia.tipoAnimal.descripcionCategoria}" class="botonerab" readonly="readonly">
							</td>
							<td>
								<input type="text" size="27" value="${guia.tipoAnimal.descripcion}" class="botonerab" readonly="readonly">
							</td>
							<td>
								<input type="text" value="${guia.cantidad}" class="botonerab" size="5" readonly="readonly">
							</td>
							<td>
								x
							</td>							
							<td>
								<input type="text" value="${guia.canon}" class="botonerab" size="5" readonly="readonly">							
							</td>
							<td>
								=
							</td>
							<td>
								$<input type="text" value="${guia.monto}" class="botonerab" size="12" id="idMonto" readonly="readonly">
							</td>
						</tr>
						<tr style="display: " class="montoTotal">
							<td colspan="6" id="idInteres" class="botoneralNegritaRight">% de Interes</td>							
							<td class="botonerab">
								$<input type="text" value="${guia.interes}" class="botonerab" size="12" readonly="readonly">
							</td>							
						</tr>
						<tr style="display: " class="montoTotal">
							<td colspan="4"></td>							
							<td colspan="3">
								<hr>
							</td>							
						</tr>
						<tr style="display: " class="montoTotal">
							<td colspan="6" class="botoneralNegritaRight">Monto Total</td>							
							<td class="botonerab">
								$<input type="text" class="botonerab" size="12" value="${guia.montoTotal}" readonly="readonly">
							</td>							
						</tr>													
						<tr>
							<td colspan="7" height="10"></td>							
						</tr>	
						<script type="text/javascript">
							var monto = <c:out value="${guia.monto}"/>
							var interes = <c:out value="${guia.interes}"/>

							var porc = (interes/monto)*100;
							$("#idInteres").html(porc+" % de Interes");
						</script>										
					</table>	
					
				</div>
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>		
	</table>				

	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
		<tr>
			<td height="10" colspan="4"></td>
		</tr>
		<tr>
			<td height="20" colspan="4">
				<input type="button" value="Volver" class="botonerab" onclick="volver();" > 
			</td>
		</tr>
		<tr>
			<td height="10" colspan="4"></td> 
		</tr>
	</table>

