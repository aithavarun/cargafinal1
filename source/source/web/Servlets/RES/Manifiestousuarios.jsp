<table  align="center" border="0" cellpadding="1" cellspacing="0" >

<th colspan="1">Sec.</th>
<th>Apellido/Nombre</th>
<th>Destino</th>
<th>Clase</th>
<th>Grupo</th>
<th>Asiento</th>
<th>Bording</th>
<th>Agente</th>
<th>Fecha</th>
<th>Estado</th>
  <%
  List lista3 = model.getProveedores();
  int ci=0;
  String asiento="";
  String estado="";
%>

  <%;
  if  (lista3 != null)  {
       Iterator itpnl = lista3.iterator();
       while (itpnl.hasNext()) {
            PNL pnl=(PNL) itpnl.next();
            ci++;
            asiento=pnl.getAsiento();
            if (asiento==null)
                asiento="";
            estado=pnl.getEstado().trim();
            if (estado.equals("EM"))
                estado="B-OK";
            else
                estado="B-GS";
        %>
        <tr>
       <td><%=ci%></td> 
       <td><%=pnl.getApellido()%>/<%=pnl.getNombre()%></td>
       <td><%=pnl.getDestino()%></td>
       <td>Y</td>
       <td><%=pnl.getGrupo()%></td>
       <td align="center"><%=asiento%></td>
       <td align="center"><%=pnl.getBording()%></td>
       <td><%=pnl.getOrigen()%></td>
       <td><%=pnl.getFecha()%></td>
       <td><%=estado%></td>
       
           
        </tr>
 <%
       }
  }
  %>
  </table>