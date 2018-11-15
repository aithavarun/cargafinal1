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
<form method="post" action="<%=CONTROLLER%>/Blacklist/Nuevo"  name="MantenimientoBlacklists">
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="3">BLACK LISTS</th>
</tr>
<tr>

<th>Num. Boleto </th>
<th>Nombre </th>
<th>Ruta </th>
</tr>
<%
 List list = model.getBlacklists();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Blacklists blacklist=(Blacklists) it.next();
          String seleccionUrl=CONTROLLER+"/Blacklists/Selecciona?Numero="+ String.valueOf(blacklist.getNumero()) ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=blacklist.getNumero()%></td>
       <td><%=blacklist.getNombre()%></td>
       <td><%=blacklist.getRuta()%></td>
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


