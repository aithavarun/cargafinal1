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
<form method="post" action="<%=CONTROLLER%>/Sboletos/Nuevo"  name="MantenimientoStockBoletos">
<tr>
<th colspan="1">MANTENIMIENTO DE STOCK DE BOLETOS</th>
</tr>

<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th>Sucursal</th>
<th>Tipo</th>
<th>Boleto Inicial</th>
<th>Boleto Final</th>
<th>Secuencia</th>
<th>Fecha</th>
<th>Actual en Uso</th>
</tr>
<%
 List list = model.getSboletos();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Sboletos sboleto=(Sboletos) it.next();
          String seleccionUrl=CONTROLLER+"/Sboletos/Selecciona?codigo="+sboleto.getCodigo() ;
          %>
  <tr>
      <%
       java.util.Date mifecha;
       mifecha=sboleto.getFecha();
       //String lfecha = new SimpleDateFormat("yyyy-MM-dd 00:00:00.0").format(new java.util.Date());
      %>
       <td><A HREF="<%=seleccionUrl%>"> <%=sboleto.getSucursal()%></td>
       <td><%=sboleto.getTipo()%></td>
       <td><%=sboleto.getBolini()%></td>
       <td><%=sboleto.getBolfin()%></td>
       <td><%=sboleto.getSecuencia()%></td>
         <td><%=mifecha%></td> 
       <td><%=sboleto.getUso()%></td>
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


