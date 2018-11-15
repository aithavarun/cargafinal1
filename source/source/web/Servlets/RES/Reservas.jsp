<table width="100%" align="center">
<tr>
<td>
<table id="t1" class="sortable">

<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<tr>
<th>Sec</th>
<th >Booking</th>
<th >Apellido</th>
<th >Nombre</th>
<th >Tipo</th>
<th >Estado</th>
<th >Infante</th>
<th >Grupo</th>
<th >Fono</th>
<th >Vuelo</th>
</tr>
<%
 List lista = model.getReservas();
 int secuencial=0;
 int sec2=0;
 long g=0;
 long v=0;
 String filascolor="";
 String infante="";
 if (lista != null) {
      Iterator itr = lista.iterator();
      while (itr.hasNext()) {
          secuencial++;
          Reservaciones reservas=(Reservaciones) itr.next();
          String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?codigo="+reservas.getCodigo() ;
          if (reservas.getInfante()==null)
              infante="";
          else
              infante=reservas.getInfante();
          if (v!=reservas.getCodigov())
          {  
            sec2=0;  
            if (filascolor.equals("#CCFFCC"))
                filascolor="#FFFF99";
            else if (filascolor.equals("#FFFF99"))
                filascolor="#FFFFFF";
            else
                filascolor="#CCFFCC";
            /*
            if (v!=0)
            {*/%>
            <%--------------
<tr bgcolor="#66FF99">
         <td colspan="6" align="center"><b>Total Viaje <%=reservas.getOrigen()+"-"+reservas.getDestino()%> = <%=secuencial-1%> </b> </td> 
    </tr>      
               ------------%> 
           <% //}
            v=reservas.getCodigov();
            secuencial=1;
%>      
<%---------------------
<tr bgcolor="#CCCCCC">
       <td colspan="9" align="center"><A NAME="<%=reservas.getOrigen()+"-"+reservas.getDestino()%>">
<b>Viaje :<%=reservas.getOrigen()+"-"+reservas.getDestino()%> </b> </a></td> 
    </tr>      
----------------------------------------%>    
         <% }
          /*
         if (g!=reservas.getCodigo())
          {  
            sec2=0;  
            g=reservas.getCodigo();
 *
            
         */ %>
  <tr   bgcolor="<%=filascolor%>">
       <td><%=secuencial%></td>
       <td><b><A HREF="<%=seleccionUrl%>"> <%=reservas.getBooking()%>(<%=reservas.getClase()%>)</a></b></td>
       <td><%=reservas.getApellido()%></td>
       <td><%=reservas.getNombre()%></td>
       <td><%=reservas.getTipo()%></td>
       <td><%=reservas.getEstado()%></td>
       <td><%=infante%></td>
       <td><%=reservas.getGrupo()%></td>
       <td><%=reservas.getTelefono()%></td>
       <td><%=reservas.getOrigen()+"-"+reservas.getDestino()%></td> 
       <%--------------------
       <td><b><%=FORMATOFECHA.format(reservas.getFecha())%></b></td>
        
       <td colspan="2"><b><%=FORMATOFECHA.format(reservas.getFechat())+ "-"+ f.format(reservas.getHora())+":"+f.format(reservas.getMinutos())%></b></td>
       
      --------------------%>
  </tr>     
       <%
       /*
          }
sec2++;*/%>
   
           
 <%}}%>
</table>
</td>
</tr>
</table>
