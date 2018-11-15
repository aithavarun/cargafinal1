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
<form method="post" action="<%=CONTROLLER%>/Tipost/Nuevo"  name="MantenimientoTipoTarifas">

<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="2">MANTENIMIENTO DE TIPOS TARIFAS </th>
</tr>
<tr>

<th>Nombre</th>
<th>Descripcion</th>
</tr>
<%
 List list = model.getTiposTarifas();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Tipot tipot=(Tipot) it.next();
          //Grupos grupo=(Grupos) it.next();
          String seleccionUrl=CONTROLLER+"/Tipost/Selecciona?codigo="+tipot.getSecuencial();
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=tipot.getNombre()%></td>
       
      
       <td> <%=tipot.getObservacion() %></td>
       
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


