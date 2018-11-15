<table width="100%" align="center">
<tr>
<td>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Duplicados/Aceptar"  name="MantenimientoDuplicados">
<tr class="form1">
<th colspan="8">Resrevaciones en Time Limit</th>
</tr>
<tr>
<th>Sec/Booking</th>
<th>Grupo/Apellido</th>
<th>Fecha R /Nombre</th>
<th>Fono/Tipo</th>
<th>Time Limit/Fecha Vuelo</th>



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
          TimeLimit reservas=(TimeLimit) itr.next();
          String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?codigo="+reservas.getCodigo() ;
          if (codigo!=reservas.getCodigo())
          {
              Apellido=reservas.getApellido().trim();
              Nombre=reservas.getNombre().trim();
              codigo=reservas.getCodigo();
              cont++;
              secuencial=0;
            %>
            
 <tr bgcolor="#FFCC66" >   
 
        
       <td><b><A HREF="<%=seleccionUrl%>"><input type="checkbox" name="revisado<%=cont%>" value= "<%=reservas.getBooking().trim()%>" > <%=reservas.getBooking()%></a></b></td>
       <input name="codigo<%=cont%>" value="<%=reservas.getCodigo() %>" type="hidden"  >
       <td><%=reservas.getGrupo()%></td>
       <td><%=FORMATOFECHA.format(reservas.getFecha())%></td>
       <td><%=reservas.getTelefono()%></td>
       <td><%=FORMATOFECHA.format(reservas.getFechat())%>-<%=f.format(reservas.getHorat())%>:<%=f.format(reservas.getMinutot())%></td>
       
 <%}
    if (rcodigo!=reservas.getReservascodigo())
    {
        rcodigo=reservas.getReservascodigo();
        secuencial++;
        cont1=0;
%> 
     <tr bgcolor="#CCCCCC">
        <input name="<%=reservas.getBooking().trim()%><%=secuencial%>" value="<%=reservas.getReservascodigo()%>" type="hidden"  >
        <%--
        <input name="nombre<%=secuencial%>" value="<%=reservas.getApellido()+"/"+reservas.getNombre()%>" type="hidden"  >
        ---%>
       <td> <%=secuencial%></td> 
       <td ><%=reservas.getApellido()%></td>
       <td><%=reservas.getNombre()%></td>
       <td colspan="2"><%=reservas.getTipo()%></td>
       
     </tr>
 <%}
          cont1++;
%>
      <tr bgcolor="#FFFFCC">
       <input name="v<%=reservas.getBooking().trim()%><%=secuencial%>-<%=cont1%>" value="<%=reservas.getProgramacioncodigo()%>" type="hidden"  >
       <td><%=reservas.getOrigen()%></td>
       <td><%=reservas.getDestino()%></td>
       <td><%=reservas.getNumero()%></td>
       <td><%=reservas.getEstado()%></td>
       <td><%=FORMATOFECHA.format(reservas.getFechav())%> -
       <%=f.format(reservas.getHorav())%>:<%=f.format(reservas.getMinutov())%></td>
 </tr>    
 <%}}%>
 <input name="i" value="<%=cont%>" 
type="hidden"  >
<tr align="center" >
<td align="center" colspan="6">
 <input TYPE="submit"    NAME="Anular" value="Cancelar">
 </td>
</tr> 
</form>
</table>

</td>
</tr>
</table>
