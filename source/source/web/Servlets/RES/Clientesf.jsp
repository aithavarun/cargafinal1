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
<form method="post" action="<%=CONTROLLER%>/Clientesf/Nuevo"  name="MantenimientoClientesF">
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="4">CLIENTES FRECUENTES</th>
</tr>
<tr>
<th>PIN </th>
<th>Nombre </th>
<th>Tarjeta </th>
<th>Telefono </th>

</tr>
<%
 List list = model.getClientesf();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Clientesf clientef=(Clientesf) it.next();
          String seleccionUrl=CONTROLLER+"/Clientesf/Selecciona?codigo="+clientef.getTarjeta() ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=clientef.getPin()%></td>
       <td><%=clientef.getNombre()%></td>
       <td><%=clientef.getTarjeta()%></td>
       <td><%=clientef.getTelefono()%></td>
      
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


