<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/dwr/engine.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/dwr/util.js'/>"></script>

<div>
<table class="header">

	<tr>
		<td width="20%" height="100%"><img height="80%" width="100%" src="../../imagenes/logoSIIA.jpg">
		</td>
		<td width="60%" style="text-align: center; font-weight: bold"><jsp:useBean
			id="now" class="java.util.Date" /> <br>
			Usuario: <label id="usuario"></label> <br>
			Roles: <label id="roles"></label> <br>
		</td>
		 <td width="20%"><img src="../../imagenes/LaProvincia1.jpg">
		</td>
	</tr>	
	
</table>

</div>
