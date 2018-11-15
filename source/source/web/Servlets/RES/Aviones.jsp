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
<form method="post" action="<%=CONTROLLER%>/Aviones/Nuevo"  name="MantenimientoAviones">
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<tr>
<th colspan="3">Mantenimiento de Aviones</th>
</tr>
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>

<th>Descripción</th>
<th>Capacidad Pax</th>
<th>Capacidad carga</th>
</tr>
<%
 List list = model.getAviones();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Aviones avion=(Aviones) it.next();
          String seleccionUrl="";
          if (usuario.getTipo()<1)
          {
          seleccionUrl=CONTROLLER+"/Aviones/Selecciona?codigo="+avion.getCodigo() ;
          }
          
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=avion.getDescripcion()%></td>
       <td><%=avion.getCapacidadPax()%></td>
       <td><%=f.format(avion.getCapacidadCarga())%></td>
  </tr>    
 <%}}%>

</table>
</td>
</tr>
<%---------------------
<tr>
<td align="center">
<table width="100%" align="center">
<tr>
<th>fecha</th>
<th>fecha</th>
<th>fecha</th>
</tr>
 <%
  Calendar inicio=Calendar.getInstance();
  int mascara=0;
  int dia=0;
  for (int i=0;i<=6;i++)
  {
      //inicio.add(Calendar.DATE,1);
      inicio.set(2006,6,i+1);
      mascara=inicio.get(Calendar.DAY_OF_WEEK);
      dia=0;//inicio.get(Calendar.DAY_OF_WEEK_MASK);
%>
      <tr>
      <td><%=inicio.DATE%>/<%=inicio.MONTH+1%>/<%=inicio.YEAR%></TD>
      <td><%=mascara%></TD>
      <td><%=inicio.getTime()%></TD>
      </tr>
  <%}
 %>
 
</table>
</td>
</tr>
-----------------%>
<tr>
<td align="center">

<table width="10%" align="center">
<% if (usuario.getTipo()<1)
          {%>
<td>
 <input TYPE="submit"    NAME="Nuevo" value="Nuevo">
 </td>
 <%}%>
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


