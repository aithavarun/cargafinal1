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
<form method="post" action="<%=CONTROLLER%>/Clientes/Nuevo"  name="MantenimientoClientes">
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="4">Mantenimiento de Clientes</th>
</tr>
</table>
<table width="90%" align="CENTER" id="tcli1" class="sortable">
<tr>
<th>Codigo </th>
<th>Nombre </th>
<th>Ciudad </th>
<th>Telefono </th>

</tr>
<%
 List list = model.getClientes();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Clientes cliente=(Clientes) it.next();
          String seleccionUrl=CONTROLLER+"/Clientes/Selecciona?codigo="+cliente.getCodigo() ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=cliente.getCodigos()%></td>
       <td><%=cliente.getNombre()%></td>
       <td><%=cliente.getCiudad()%></td>
       <td><%=cliente.getTelefono()%></td>
      
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


