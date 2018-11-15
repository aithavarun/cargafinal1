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
<form method="post" action="<%=CONTROLLER%>/Usuarios/Nuevo"  name="MantenimientoUsuarios">
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="3">MANTENIMIENTO DE USUARIOS</th>
</tr>
<tr>
<tr>

<th>Nombre</th>
<th>Grupo</th>
<th>Sucursal</th>

</tr>
<%
 List list = model.getUsuariosl();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Usuarios usuariox=(Usuarios) it.next();
          String seleccionUrl=CONTROLLER+"/Usuarios/Selecciona?codigo="+usuariox.getNombre() ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=usuariox.getNombre()%></td>
       <td><%=usuariox.getGrupo()%></td>
       <td><%=usuariox.getSucursal()%></td>
       
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

<table width="90%" align="CENTER">
    <% String error=model.getError();
String color="FFFFCC";
if (error !=null)
{%>
<tr class="error">
<th colspam="3" ><%=error%></th>
</tr>
<%}%>
</TABLE>

</form>
</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>

