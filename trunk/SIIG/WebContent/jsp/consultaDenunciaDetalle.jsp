<%@page import="ar.com.siig.negocio.TipoDeDenuncia"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

	}
</script>


<html:form action="denuncia" styleId="denunciaFormId">

	<html:hidden property="metodo" value="altaDenuncia" />

	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="4" class="azulAjustado">
				<bean:message key='SIIG.titulo.ConsultaDenuncia'/>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>
	
	
		<tr>
			<td width="20%" class="botoneralNegritaRight">Productor</td>
			<td class="botonerab">
				<input type="text" value="${denuncia.productor.nombre}" class="readonly"/>
			</td>
		</tr>

		<c:if test="${denuncia.numeroDeDenuncia>0}">
			<tr>
				<td width="20%" class="botoneralNegritaRight">Denuncia N° <input type="radio" name="denunciaLlamado" id="radioDenuncia" checked="checked"></td>
				<td width="20%" id="tdDenuncia">
					<input type="text" size="23" id="denuncia" class="readonly botonerab"
								onkeypress="return evitarAutoSubmit(event)" value="${denuncia.numeroDeDenuncia}"/>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${denuncia.numeroDeLlamado>0}">
			<tr>		
				<td width="20%" class="botoneralNegritaRight">Llamado N° <input type="radio" name="denunciaLlamado" id="radioLlamado"> </td>
				<td width="20%" id="tdLlamado" style="display: none">
					<input type="text" class="readonly botonerab" value="${denuncia.numeroDeLlamado}"
								onkeypress="return evitarAutoSubmit(event)"/>
				</td>
			</tr>
		</c:if>

		<tr>
			<td width="20%" class="botoneralNegritaRight">Momento</td>
			<td width="20%" class="botoneralNegrita">Fecha y Hora</td>
			
			<td colspan="2" width="20%" class="botoneralNegrita">Lugar(celda mapa)</td>
		</tr>
		
		<tr>
			<td width="20%" class="botoneralNegritaRight">Desde</td>
			<td width="20%">
				<input id="datepickerDesde" type="text" value="<fmt:formatDate value="${denuncia.desde}" pattern="dd/MM/yyyy" />" readonly="readonly" class="botonerab">
												
			</td>
			
			<td colspan="2" width="20%" >
				<input type="text" class="readonly botonerab" value="${denuncia.lugar}"
							onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		
		<tr>
			<td width="20%" class="botoneralNegritaRight">Hasta</td>
			<td width="20%" >
				<input id="datepickerHasta" type="text" value="<fmt:formatDate value="${denuncia.hasta}" pattern="dd/MM/yyyy" />" readonly="readonly" class="botonerab">
			</td>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td width="20%" class="botoneralNegritaRight">Tipo de Denuncia</td>
			<td>
				<select  id="tipoDenunciaEnum" onchange="cambioTipoDenunciaEnum()">
					<c:forEach items="${tiposDeDenunciasEnum}" var="tipoDenunciaEnum" varStatus="i">
						<c:choose>
							<c:when test="${tipoDenunciaEnum == denuncia.tipoDeDenuncia }">
								<option value="${tipoDenunciaEnum}" selected="selected">${tipoDenunciaEnum.descripcion}</option>
							</c:when>
							<c:otherwise>
								<option value="${tipoDenunciaEnum}">${tipoDenunciaEnum.descripcion}</option>
							</c:otherwise>
						
						</c:choose>
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
					<c:if test="${tipoDenuncia.id ==  tiposDenunciaSeleccionados[tipoDenuncia.id]}">
						&nbsp;&nbsp;${tipoDenuncia.descripcion}
					</c:if>
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
					<c:forEach items="${denunciaPerrosSeleccionados['AVISTAJE']}" var="denunciaPerros">
						<tr>
							
							<td width="10%">
								<input class="ind" type="hidden" value="0">
								<input type="text" size="4" class="botonerab readonly" value="${denunciaPerros.cantidad}" onkeypress="return evitarAutoSubmit(event)"/>
							</td>
							<td width="30%"><input type="text" size="25" class="botonerab readonly" value="${denunciaPerros.señas}" onkeypress="return evitarAutoSubmit(event)"/></td>
							<td width="10%">
								<input type="text" value="${denunciaPerros.sexo}" class="botonerab readonly">
							</td>
							<td width="10%">
								<input type="text" value="${denunciaPerros.edad}" class="botonerab readonly">
							</td>	
							<td width="10%">
								<input type="text" value="${denunciaPerros.tamaño}" class="botonerab readonly">
							</td>
							<td width="20%"><input type="text" size="10" class="botonerab readonly" value="${denunciaPerros.veniaDe}" onkeypress="return evitarAutoSubmit(event)"/></td>
							<td width="20%"><input type="text" size="10" class="botonerab readonly" value="${denunciaPerros.ibaHacia}" onkeypress="return evitarAutoSubmit(event)"/></td>
						</tr>		
					
					</c:forEach>
				</table>
			</td>
			
		</tr>

		<tr class="perros">
			<td colspan="4">
					&nbsp;
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
					
					<c:forEach items="${denunciaPerrosSeleccionados['CAPTURA']}" var="capturaPerros">
						<tr>
							
							<td width="10%">
								<input class="ind" type="hidden" value="0">
								<input type="text" size="4" class="botonerab readonly" value="${capturaPerros.cantidad}" onkeypress="return evitarAutoSubmit(event)"/>
							</td>
							<td width="30%">
								<input type="text" size="25" class="botonerab readonly" value="${capturaPerros.señas}" onkeypress="return evitarAutoSubmit(event)"/></td>
							<td width="10%">
								<input type="text" class="botonerab readonly" value="${capturaPerros.sexo }"/>
							</td>
							<td width="10%">
								<input type="text" class="botonerab readonly" value="${capturaPerros.edad }"/>
									
							</td>	
							<td width="10%">
								<input type="text" class="botonerab readonly" value="${capturaPerros.tamaño }"/>
							</td>
							<td width="20%"><input type="text" size="10" class="botonerab readonly" value="${capturaPerros.veniaDe}" onkeypress="return evitarAutoSubmit(event)"/></td>
							<td width="20%"><input type="text" size="10" class="botonerab readonly" value="${capturaPerros.ibaHacia}" onkeypress="return evitarAutoSubmit(event)"/></td>
						</tr>		
					</c:forEach>
				</table>
			</td>
			
		</tr>

		<tr class="perros">
			<td colspan="4">
					&nbsp;
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
					&nbsp;
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
					&nbsp;
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
					&nbsp;
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
				<input type="button" class="botonerab" value="Cancelar"
						onclick="javascript:parent.location= contextRoot() +  '/jsp.do?page=.index'">
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
	</table>


</html:form>

<script>
	$(".readonly").attr("readonly","readonly");	
</script>