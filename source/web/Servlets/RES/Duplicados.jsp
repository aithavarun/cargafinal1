<table width="100%" align="center">
<tr>
<td>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Duplicados/Aceptar"  name="MantenimientoDuplicados">
<tr class="form1">
<th colspan="6">Resrevaciones duplicadas</th>
</tr>
<tr>
<th>Sec</th>
<th>Booking</th>
<th>Apellido</th>
<th>Nombre</th>
<th>Estado</th>
<th>Viaje</th>


</tr>
<%
 List lista = model.getReservas();
 int secuencial=0;
 String Apellido="";
 String Nombre="";
 int cont=0;
 
 
 String color="#FFFFFF";
 if (lista != null) {
      Iterator itr = lista.iterator();
      while (itr.hasNext()) {
          secuencial++;
          Duplicados reservas=(Duplicados) itr.next();
          String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?codigo="+reservas.getCodigo() ;
          if ((!Apellido.equals(reservas.getApellido().trim())) || (!Nombre.equals(reservas.getNombre().trim())))
          {
              Apellido=reservas.getApellido().trim();
              Nombre=reservas.getNombre().trim();
              if (cont==0)
              {
                  color="#FFFFCC";
                  cont++;
              }
              else
              {
                  color="#CCFFFF";
                  cont=0;
              }
          }
            %>
<tr bgcolor="<%=color%>" >
    
 
       <td>
       <input name="cabecera<%=secuencial%>" value="<%=reservas.getCodigo()%>" type="hidden"  >
        <input name="nombre<%=secuencial%>" value="<%=reservas.getApellido().trim()+"/"+reservas.getNombre().trim()%>" type="hidden"  >
       <input type="checkbox" name="revisado<%=secuencial%>" value= "<%=reservas.getReservacodigo()%>" ><%=secuencial%></td>
       <td><b><A HREF="<%=seleccionUrl%>"> <%=reservas.getBooking()%></a></b></td>
       <td><%=reservas.getApellido()%></td>
       <td><%=reservas.getNombre()%></td>
       <td><%=reservas.getEstado()%></td>
       <td><%=reservas.getOrigen()+"-"+reservas.getDestino()%></td>
 </tr>
           
 <%}}%>
 <input name="i" value="<%=secuencial%>" 
type="hidden"  >
<tr align="center" >
<td align="center" colspan="6">
 <input TYPE="submit"    NAME="Grabar" value="Chequear">
 </td>
</tr> 
</form>
</table>

</td>
</tr>
</table>
