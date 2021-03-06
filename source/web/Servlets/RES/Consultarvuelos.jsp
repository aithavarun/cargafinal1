<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>
<head>
<title>::: Reservaciones Aerogal ::: </title>
<link href="<%=BASEURL%>/images/Sistema/Level2_Verdana_Forms.css" rel="stylesheet" type="text/css">
</head>
<%Usuarios usuario=model.getUsuarios();%>
<body>
<table width="100%" align="center">
<tr>
<td>
<table width="100%" align="center">

<%DecimalFormat f =new DecimalFormat("00");%>
<tr>
<th>Numero</th>
<th>Origen</th>
<th>Destino</th>

<th>Hora</th>
<th>Avion</th>
 <%-------------
<th>Capacidad</th>
<th>Infantes</th>
      ----------------%>
<th>Estado</th>
</tr>
<%
 List list = model.getVuelos();
 String Color;
 String Mensaje;
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Vuelos vuelo=(Vuelos) it.next();
          String seleccionUrl="";
          if (usuario.getTipo()<=1)
          {
            seleccionUrl=CONTROLLER+"/Vuelo/Selecciona?codigo="+vuelo.getCodigo() ;
          }
          if (vuelo.getEstado().equals("A"))
          {
              Mensaje="Activo";
              Color="#66CCFF";
          }
          else if (vuelo.getEstado().equals("X"))
          {
              Mensaje="Cancelado";
              Color="#FF0000";
          }
          else if (vuelo.getEstado().equals("H"))
          {
              Mensaje="En chequeo";
              Color="#666666";
          }
          else if (vuelo.getEstado().equals("V"))
          {
              Mensaje="Volado";
              Color="#FF1100";
          }
          else
          {
              Mensaje="Stop Booking";
              Color="#FF9900";
          }
          
          %>
  <tr>
      <font color="#ffffff">
       <td><%=vuelo.getNumero()%></td>
       <td><%=vuelo.getOrigen()%></td>
       <td><%=vuelo.getDestino()%></td>
       <td><%=f.format(vuelo.getHora())+":"+f.format(vuelo.getMinuto())%></td>
       <td><%=vuelo.getAvion()%></td>
       <%-------------
       <td><%=vuelo.getPax()%></td>
       <td><%=vuelo.getInfantes()%></td>
       ----------------%>
       <td bgcolor="<%=Color%>"><%=Mensaje%></td>
       </font>
  </tr>    
 <%}}%>
</table>
</td>
</tr>

</table>


</body>
</html>
<%model.Limpiarlistas();%>

