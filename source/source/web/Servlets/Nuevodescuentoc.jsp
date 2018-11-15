<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>
<SCRIPT language="JavaScript" type="text/javascript">
    

    
</SCRIPT>


<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<%
int codigo=0;
String codigocli = request.getParameter("Codigocli");


%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Descuento/Guardar"  name="MantenimientoDescuentos">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th> Nuevo Descuento </th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");%>



<input name="Codigocli" type= "hidden"  value=<%=codigocli%> >


<tr>
<td>Origen :</td>
<td><input name="Origen" type="text" size="3" maxlength="3" ><td>
</tr>

<tr>
<td>Destino :</td>
<td><input name="Destino" type="text" size="3" maxlength="3" ><td>
</tr>

<tr>
<td>Descuento :</td>
<td><input name="Descuento" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>


<tr>
<td>Minimo Para Descuento :</td>
<td><input name="Mindescuento" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>


</table>
</td>
</tr>
<tr>
<td align="right">
<table width="10%" align="center">
<tr>
<td>
 <input TYPE="submit"    NAME="Guardar" value="Guardar">
 </td>
 <td>
 <input  type="submit"  NAME="Salir" value="Salir">
 </td>
 </tr>
</table>
</td>
</tr>
</form>
</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


