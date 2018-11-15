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
<form method="post" action="<%=CONTROLLER%>/Grupos/Nuevo"  name="MantenimientoGrupos">

<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="2">MANTENIMIENTO DE GRUPOS DE USUARIOS</th>
</tr>
<tr>

<th>Codigo</th>
<th>Descripcion</th>
</tr>
<%
 List list = model.getGrupos();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Grupos grupo=(Grupos) it.next();
          String seleccionUrl=CONTROLLER+"/Grupos/Selecciona?codigo="+grupo.getCodigo() ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=grupo.getCodigo()%></td>
       
      
       <td> <%=grupo.getNombre()%></td>
       
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


