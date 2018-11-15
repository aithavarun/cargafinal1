<table width="100%" align="left">

<%DecimalFormat f =new DecimalFormat("00");%>
<tr class="form1">
<th colspan="6">
Vuelos Disponibles
</th>
</tr>
<tr>
<th>No.</th>
<th>Org</th>
<th>Des</th>

<th>Hora</th>
<th>Avion</th>
<th>Capacidad</th>

</tr>
<%
 List list = model.getVuelos();
 String Numero="0";
 String Fondo="#ffffff";
 int cont=0;
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Vueloc vuelo=(Vueloc) it.next();
          String seleccionUrl="" ;
          if (usuario.getTipo()<=1)
          {
              seleccionUrl=CONTROLLER+"/Vuelo/Selecciona?codigo="+vuelo.getCodigo() ;
          }
          if (!Numero.equals(vuelo.getNumero()))
          {
              Numero=vuelo.getNumero();
              if (Fondo!="#ffffff")
                  Fondo="#ffffff";
              else
                  Fondo="#66CCFF";
          }
          cont++;
          %>
  <tr bgcolor="<%=Fondo%>">
      
       <td><A HREF="<%=seleccionUrl%>"> 
      
       <input type="checkbox" name="revisado<%=cont%>" value= "<%=vuelo.getCodigo() %>"><%=vuelo.getNumero()%>
       </a></td>
       <td><%=vuelo.getOrigen()%></td>
       <td><%=vuelo.getDestino()%></td>
       <td><%=f.format(vuelo.getHora())+":"+f.format(vuelo.getMinuto())%></td>
       <td><%=vuelo.getAvion()%></td>
       <td><%=vuelo.getPax()%>(<%=vuelo.getPaxreservados()%> )</td>
      
  </tr>    
 <%}}%>
 <input name="i" value="<%=cont%>" 
type="hidden"  >
</table>
