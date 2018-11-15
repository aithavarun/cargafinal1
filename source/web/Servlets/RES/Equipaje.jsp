<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat,java.text.DecimalFormat,java.text.SimpleDateFormat" %>

<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Equipaje/Nuevo"  name="MantenimientoExceso">
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="4">Mantenimiento de Exceso Equipaje</th>
</tr>
</table>
<table width="90%" align="CENTER" id="tcli1" class="sortable">
<tr>
<th>Numero </th>
<th>Fecha </th>
<th>Origen </th>
<th>Destino </th>
<th>Valor </th>
<th>Iva </th>
<th>Efectivo </th>
<th>Tarjeta Credito </th>
<th>Obeservacion </th>

</tr>
<%
 List list = model.getEquipaje();
 java.util.Date mifecha;
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Excesos exceso=(Excesos) it.next();
          String seleccionUrl=CONTROLLER+"/Equipaje/Selecciona?codigo="+exceso.getSecuencial() ;
          
         mifecha=exceso.getFecha();
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=exceso.getNumero()%></td>
       <td><%=mifecha%></td>
       <td><%=exceso.getOrigen()%></td>
       <td><%=exceso.getDestino()%></td>
       <td><%=exceso.getTarifa()%></td>
       <td><%=exceso.getIva()%></td>
       <td><%=exceso.getEfectivo()%></td>
       <td><%=exceso.getTarjeta()%></td>
       <td><%=exceso.getObservacion()%></td>
      
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


