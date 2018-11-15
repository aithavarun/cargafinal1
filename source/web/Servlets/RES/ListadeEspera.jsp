<table width="100%" align="center">
<tr>
<td>

<form method="post" action="<%=CONTROLLER%>/Duplicados/Aceptar"  name="MantenimientoDuplicados">
<table width="100%" >
<tr class="form1">
<th colspan="9">Resrevaciones en Lista de Espera</th>
</tr>
</table>
<table width="100%" align="center" id="t2" class="sortable">
<tr>
<th>Sec</th>
<th>Booking</th>
<th>Grupo</th>
<th>Apellido</th>
<th>Nombre</th>
<th>Tipo</th>
<th>Vuelo</th>
<th>Prioridad</th>
<th>Boleto</th>



</tr>
<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<%
 List lista = model.getReservas();
 int secuencial=0;
 long codigo=0;
  long rcodigo=0;
 String Apellido="";
 String Nombre="";
 int cont=0;
  int cont1=0;
 
 String color="#FFFFFF";
 if (lista != null) {
      Iterator itr = lista.iterator();
      while (itr.hasNext()) {
          //secuencial++;
          Waitinglist reservas=(Waitinglist) itr.next();
          String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?codigo="+reservas.getCodigo() ;
         
              Apellido=reservas.getApellido().trim();
              Nombre=reservas.getNombre().trim();
              codigo=reservas.getCodigo();
              cont++;
              if (reservas.getPrioridad()==3)
                  color="#FFFFCC";
              else if (reservas.getPrioridad()==2)
                color="#66FFFF";
              else if (reservas.getPrioridad()==1)
                color="#66FFCC";
            %>
 <tr bgcolor="<%=color%>" >   
 
       <td> <%=cont%></td>  
       <td><b><A HREF="<%=seleccionUrl%>"><input type="checkbox" name="revisado<%=cont%>" value= "<%=reservas.getCodigo()%>" > <%=reservas.getBooking()%></a></b></td>
     <%---------------------------
        <input name="p<%=cont%>" value="<%=reservas.getPrioridad() %>" type="hidden"  >
----------------------%>
       <input name="p<%=cont%>" value="1" type="hidden"  >
       <input name="vuelo<%=cont%>" value="<%=reservas.getVuelocodigo() %>" type="hidden"  >
       <input name="boleto<%=cont%>" value="<%=reservas.getBoleto() %>" type="hidden"  >
        <input name="programacion<%=cont%>" value="<%=reservas.getProgramacioncodigo() %>" type="hidden"  >
       <td><%=reservas.getGrupo()%></td>
       <td ><%=reservas.getApellido()%></td>
       <td><%=reservas.getNombre()%></td>
       <td ><%=reservas.getTipo()%></td>
       <td><%=reservas.getOrigen()%>-<%=reservas.getDestino()%>-<%=reservas.getNumero()%></td>
       <td><%=reservas.getPrioridad()%></td>
       <td><%=reservas.getBoleto()%></td>
       
       
 </tr>    
 <%}}%>
 <input name="i" value="<%=cont%>" 
type="hidden"  >
<table width="100%" >
<tr align="center" >
 <%if(usuario.getTipo()<=1)
 {%>
<td align="center" colspan="9">
 <input TYPE="submit"    NAME="Incrementar" value="Reconfirmar o Confirmar">
 </td>
 <%}%>
</tr> 
</table>
</form>


</td>
</tr>
</table>
