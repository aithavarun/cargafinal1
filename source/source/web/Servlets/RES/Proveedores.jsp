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
<form method="post" action="<%=CONTROLLER%>/Proveedores/Nuevo"  name="MantenimientoProveedores">
<tr>
<th colspan="4">Mantenimiento Proveedores</th>
</tr>
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>

<th>Nombre </th>
<th>Ciudad </th>
<th>Telefono </th>
<th>Saldo </th>
</tr>
<%
 List list = model.getProveedores();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Proveedores proveedor=(Proveedores) it.next();
          String seleccionUrl=CONTROLLER+"/Proveedores/Selecciona?codigo="+proveedor.getCodigo() ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=proveedor.getRSocial()%></td>
       <td><%=proveedor.getCiudad()%></td>
       <td><%=proveedor.getTelefono()%></td>
       <td><%=f.format(proveedor.getSaldo())%></td>
  </tr>    
 <%}}%>

</table>
</td>
</tr>
<tr>
<td align="center">
<table width="10%" align="center">
<td>
 <input TYPE="submit"    NAME="Nuevo" value="Nuevo">
 </td>
 <%-----------------
 <td>
 <input  type="submit"  NAME="Salir" value="Salir">
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


