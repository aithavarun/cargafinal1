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
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/ClientesCarga/Guardar"  name="MantenimientoClientes">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Cliente Carga</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<td>Codigo:</td>
<td><input name="Codigo" type="text" size="10" maxlength="50"><td>
</tr>
<tr>
<td>Nombre :</td>
<td><input name="Nombre" type="text" size="50" maxlength="50"><td>
</tr>





<tr>
<td>Direccion :</td>
<td><input name="Direccion" type="text" size="50" maxlength="50"><td>
</tr>


<tr>
<td>Ciudad :</td>
<td><input name="Ciudad" type="text" size="20" maxlength="20" ><td>
</tr>

<tr>
<td>Telefono :</td>
<td><input name="Telefono" type="text" size="20" maxlength="20" ><td>
</tr>

<tr>
<td>Contacto :</td>
<td><input name="Contacto" type="text" size="30" maxlength="30" ><td>
</tr>

<tr>
<td>RUC :</td>
<td><input name="Ruc" type="text" size="15" maxlength="15" ><td>
</tr>

<tr>
<td>Credito:</td>
<td><input name="Credito" type="text" size="15" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ><td>
</tr>

<tr>
<td>Vendedor  :</td>
<td><input name="Vendedor" type="text" size="15" maxlength="15" ><td>
</tr>

<tr>
<td>Saldo:</td>
<td><input name="Saldo" type="text" size="15" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ><td>
</tr>




<tr>
<td>Cuenta  :</td>
<td><input name="Cuenta" type="text" size="15" maxlength="15" ><td>
</tr>


<tr>
<td><input type="checkbox" name="contribuyente" value= "1" >Contribuyente Especial</td>

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


