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
<form method="post" action="<%=CONTROLLER%>/Cotizaciones/Nuevo"  name="MantenimientoCotizaciones">
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<tr>
<th colspan="3">Mantenimiento de Cotizaciones</th>
</tr>
<%DecimalFormat f =new DecimalFormat("0.00");
java.util.Date mifecha;
 %>
<tr>

<th>Cambio</th>
<th>Fecha</th>
<th>Moneda</th>
</tr>
<%
 List list = model.getCotizaciones();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Cotizaciones cotizacion=(Cotizaciones) it.next();
          mifecha=cotizacion.getFecha();
          String seleccionUrl="";
          seleccionUrl=CONTROLLER+"/Cotizaciones/Selecciona?codigo="+cotizacion.getSecuencial() ;
          %>
  <tr align="right">  
      
       <td><A HREF="<%=seleccionUrl%>"> <%=f.format(cotizacion.getCambio()) %>  </td>
       <td><%=mifecha%></td>
       <td><%=cotizacion.getMoneda() %></td>
       
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


