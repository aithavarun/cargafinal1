

    
<table id="t1" width="100%" class="sortable">

<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<tr>
<th > Nª Guia</th>
<th > Piezas</th>
<th > Fecha(AAAA-MM-DD) </th>
<th > Peso</th>
<th > Destino</th>
<th > Contiene</th>
<th > Destinatario</th>
<th > Remitente</th>
<th > Ruta</th>
<th > Tarifa</th>
<th > Valorizacion</th>
<th > Seguro</th>
<th > I.V.A.</th>
<th > Total</th>
</tr>


<%
 List lista = model.getGuiasLista();
 int secuencial=0;
 String filascolor="";
 String Destino="";
 String Ruta1="";
 String Ruta2="";
 String Origen1="";
 String Vuelo ="";
 float totalopz1=0;
 float totalopz2=0;
 float totalops1=0;
 float totalops2=0;
 int ban=0;
 float ttotal=0;
 float totalpz=0;
 float totalps=0;
if (lista != null){
     Iterator itr = lista.iterator();
      while (itr.hasNext()){
            ban=1; 
            secuencial++;
             Guias guia=(Guias) itr.next();              
             String seleccionUrl=CONTROLLER+"/Guias/Selecciona?codigo="+guia.getCodigo() ;
             if(guia.getEntregaen()==1 )
             Destino="Domicilio";
             else if(guia.getEntregaen()==2)
             Destino="Oficina";
             else if(guia.getEntregaen()==3)
             Destino="Aeropuerto";
             ttotal+=guia.getTotal();
             totalpz+=guia.getPiezas();
             totalps+=guia.getPeso();
             
             if (Origen1.equals("") || Origen1.equals(guia.getOrigen()))
             { 
                 Ruta1=guia.getOrigen();
                 totalopz1+=guia.getPiezas();
                 totalops1+=guia.getPeso();
                 Origen1=guia.getOrigen();
             }
             else
             {
                 totalopz2+=guia.getPiezas();    
                 totalops2+=guia.getPeso();
                 Ruta2=guia.getOrigen();
             }
             
             
             
             
             %>
             <tr   bgcolor="<%=filascolor%>">
             <td><input type="checkbox" name="Guia<%=secuencial%>" value= "<%=guia.getCodigo()%>" onclick ="contar();"  checked ><b> <%=guia.getNumero()%> </b></td>
             <td><%=guia.getPiezas()%></td>
             <td><%=guia.getFecha() %></td>
             <td><%=guia.getPeso()%></td>
             <td><%=Destino%></td>
             <td><%=guia.getContiene()%></td>
             <td><%=guia.getDestinatario()%></td>
             <td><%=guia.getRemitente()%></td>
             <td><%=guia.getOrigen() + " - " + guia.getDestino()  %></td>
             <td><%=f.format(guia.getFlete()) %></td>
             <td><%=f.format(guia.getServicioa()) %></td>
             <td><%=f.format(guia.getSeguro()) %></td>
             <td><%=f.format(guia.getIva()) %></td>
             <td><%=f.format(guia.getTotal()) %></td>
            </tr>   
 
             <%}}%> 
 
          
 
             <tr   bgcolor="<%=filascolor%>">
             <td><b><%=Ruta1%>  </a></b></td>
             <td><%=totalopz1%></td>             
             <td><%=totalops1%> </td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td><%=ttotal%></td>
             </tr>   
           
            <tr>
            
            
             <input type="hidden" value="<%=secuencial%>" name="Secuencial"  size="10" maxl>
             
             <td> </td>
             
             <td></td>
             <td></td>
             <td></td>
             
            </tr> 
 
   
</table>

<table>
 <% if (ban==0) 
   {%>
    
   <th> NO  EXISTEN DATOS PARA MOSTRAR NI FACTURAR <th>
   <%}%>
   
</table>
