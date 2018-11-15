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
<form method="post" action="<%=CONTROLLER%>/Sucursal/Modificar"  name="MantenimientoSucursal">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Sucursal</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getSucursales();
String codigo="";
String nombre="";
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Sucursales sucursal=(Sucursales) it.next();
          codigo=sucursal.getCodigo();
          nombre=sucursal.getDescripcion();
          
      }
 }

%>
<tr>
<td>Codigo : </td>
<td><input name="Codigo" type="text" size="5" maxlength="5" value="<%=codigo.trim()%>" READONLY><td>
</tr>

<tr>
<td>Descripcion : </td>
<td><input name="Descripcion" type="text" size="30" maxlength="30" value="<%=nombre.trim()%>"><td>
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


