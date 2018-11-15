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
<form method="post" action="<%=CONTROLLER%>/Ciudades/Nuevo"  name="MantenimientoCiudaes">
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="6">Mantenimiento de Ciudades</th>
</tr>
<tr>
<th>Codigo</th>
<th>Descripción</th>
<th>Continente</th>
</tr>

<%
 List list = model.getCiudades();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Ciudades ciudad=(Ciudades) it.next();
          String seleccionUrl=CONTROLLER+"/Ciudades/Selecciona?codigo="+ciudad.getCodigo() ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=ciudad.getCodigo()%></td>
       <td><%=ciudad.getNombre()%></td>
       <td><%=ciudad.getContinente()%></td>
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


