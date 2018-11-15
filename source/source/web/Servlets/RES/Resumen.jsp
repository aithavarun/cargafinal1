<table width="50%" align="left">
<tr>
<td>
<table width="100%" align="center">
<tr class="form1">
<% String que="";
if (accion.equals("2"))
    que="HK - RR";
else if (accion.equals("6"))
    que="Cancelados";

%>

<th colspan="4" >TOTAL  <%=que%> </th>
</tr>
<%DecimalFormat f =new DecimalFormat("00");%>
<tr>
<th>Tipo</th>
<th>Origen</th>
<th>Destino</th>
<th>Total</th>

</tr>
<%
 List list = model.getReservaestado();
 String Color;
 String Mensaje;
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Reservaresumen vuelo=(Reservaresumen) it.next();
          //String seleccionUrl=CONTROLLER+"/Vuelo/Selecciona?codigo="+vuelo.getCodigo() ;
          /*if (vuelo.getEstado().equals("A"))
          {
              Mensaje="Activo";
              Color="#66CCFF";
          }
          else if (vuelo.getEstado().equals("X"))
          {
              Mensaje="Cancelado";
              Color="#FF0000";
          }
          else
          {
              Mensaje="Stop Booking";
              Color="#FF9900";
          }*/
          %>
  <tr>
      <font color="#ffffff">
       <td> <%=vuelo.getTipo()%></td>
       <td><%=vuelo.getOrigen()%></td>
       <td><%=vuelo.getDestino()%></td>
       <td><%=vuelo.getSuma()%></td>
      
       
       </font>
  </tr>    
 <%}}%>
</table>
</td>
</tr>
</table>


<table width="50%" align="right">
<tr>
<td>
<table width="100%" align="center">
<tr class="form1">
<%  que="";
if (accion.equals("2"))
    que="HK - RR";
else if (accion.equals("6"))
    que="Cancelados";

%>

<th colspan="4" >Resumen  <%=que%> </th>
</tr>

<tr>
<th>Vuelo</th>
<th>Origen</th>
<th>Destino</th>
<th>Total</th>

</tr>
<%
  list = model.getVueloreserva();
  String Blanco="";
 if (list != null) {
      Iterator it1 = list.iterator();
      while (it1.hasNext()) {
          Reservaresumen vuelo=(Reservaresumen) it1.next();
          Blanco="";
         if (vuelo.getTipo().equals("A"))
          {
              Mensaje="Activo";
              Color="#66CCFF";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else if (vuelo.getTipo().equals("X"))
          {
              Mensaje="Cancelado";
              Color="#FF0000";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else if (vuelo.getTipo().equals("H"))
          {
              Mensaje="En chequeo";
              Color="#666666";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else if (vuelo.getTipo().equals("V"))
          {
              Mensaje="Volado";
              Color="#FF1100";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else if (vuelo.getTipo().equals("C"))
          {
              Mensaje="Stop Booking";
              Color="#FF9900";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else
          {
                Mensaje=vuelo.getTipo();
                Blanco="";//"Stop Booking";
                Blanco=String.valueOf(vuelo.getSuma());
              Color="#FFFFFF";
          }
          %>
  <tr bgcolor="<%=Color%>">
      
       <td ><A HREF="#<%=vuelo.getOrigen()+"-"+ vuelo.getDestino()%>"><%=Mensaje%></A></td>
       <td ><%=vuelo.getOrigen()%></td>
       <td><%=vuelo.getDestino()%></td>
       <td><%=Blanco%></td>
      
       
      
  </tr>    
 <%}}%>
</table>
</td>
</tr>
</table>

