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

<form method="post" action="<%=CONTROLLER%>/Vuelos/Buscar"  name="BuscarVuelos" >
<table width="100%" align="center">

<tr>
<th colspan="4">PROGRAMACION DE VUELOS</th>
</tr>

<tr>
<td>Origen :
<input name="Origen" type="text" size="3" maxlength="3" ></td>
<td>Destino :
<input name="Destino" type="text" size="3" maxlength="3" ></td>
<td>Numero de Vuelo :
<input name="Nvuelo" type="text" size="3" maxlength="3" ></td>
<td>
<input TYPE="submit"    NAME="Buscar" value="Buscar"></td>
</tr>

</table>
</form>

<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Vuelos/Nuevo"  name="MantenimientoVuelos">
<tr>
<td valign="top">

<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("00");%>
<tr>
<th>Numero</th>
<th>Origen</th>
<th>Destino</th>
<th>Dia</th>
<th>Hora</th>
<th>Tiempo V.</th>
</tr>
<%
 List list = model.getItinerarios();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Itinerarios itinerario=(Itinerarios) it.next();
          String seleccionUrl=CONTROLLER+"/Vuelos/Selecciona?codigo="+itinerario.getCodigo() ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=itinerario.getNumero()%></td>
       <td><%=itinerario.getOrigen()%></td>
       <td><%=itinerario.getDestino()%></td>
       <td><%=itinerario.getDia()%></td>
       <td><%=f.format(itinerario.getHora())+":"+f.format(itinerario.getMinuto())%></td>
       <td><%=itinerario.getTiempo()%></td>
  </tr>    
 <%}}%>

</table>
</td>
</tr>
<%----------------------------------------
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
 
</table>
</td>
</tr>
-----------------%>
</form>
</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


