<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<table width="100%" align="left">
<form method="post" action="<%=CONTROLLER%>/Chequeo/Vuelo"  name="ChequeoVuelo">
<tr>
<th colspan="2">VUELOS EN CHEQUEO</th>
</tr>
<tr align="left">

<td valign="top" align="left" width="50%">
 <%@ include file="/Servlets/VuelosLista.jsp"%>
</td>
<td valign="top" align="right"  width="50%">
 <%@ include file="/Servlets/Chequeovuelo.jsp"%>
</td>
</tr>
<tr>

<td align="center">
<table width="10%" align="center">
<td>
 <input TYPE="submit"    NAME="Anterior" value="<--- Dia Anterior">
 
 </td>

<td>
 <input TYPE="submit"    NAME="Activar" value="Activar Selección">
 
 </td>
 <td>
 <input TYPE="submit"    NAME="Siguiente" value="Siguiente dia -->">
 
 </td>

 <%-----------------
 <td>
 <input  type="submit"  NAME="Salir" value="Salir">
 </td>
 

</td>
-----------------%>
</table>
</td>
</tr>
</form>
</table>


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>
