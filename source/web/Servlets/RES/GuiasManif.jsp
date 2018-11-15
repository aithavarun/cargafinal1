
<table width="100%" align="center">
<tr>
<td>
<table id="t1" class="sortable">

<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<tr>
<th > Nª Guia</th>
<th > Piezas</th>
<th > Peso</th>
<th > Destino</th>
<th > Contiene</th>
<th > Destinatario</th>
<th > Remitente</th>
<th > Ruta</th>

</tr>


<%
 List lista = model.getGuiasLista();
 int secuencial=0;
 String filascolor="";
 String Destino="";
 String Ruta1="";
 String Ruta2="";
 String Origen1="";
 float totalopz1=0;
 float totalopz2=0;
 float totalops1=0;
 float totalops2=0;
 
 
 float totalpz=0;
 float totalps=0;
if (lista != null){
     Iterator itr = lista.iterator();
      while (itr.hasNext()){
             secuencial++;
             Guias guia=(Guias) itr.next();              
             String seleccionUrl=CONTROLLER+"/Guias/Selecciona?codigo="+guia.getCodigo() ;
             if(guia.getEntregaen()==1 )
             Destino="Domicilio";
             else if(guia.getEntregaen()==2)
             Destino="Oficina";
             else if(guia.getEntregaen()==3)
             Destino="Aeropuerto";
             
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
             <td><b> <%=guia.getNumero()%> </b></td>
             <td><%=guia.getPiezas()%></td>             
             <td><%=guia.getPeso()%></td>
             
             <td><%=Destino%></td>
             
             <td><%=guia.getContiene()%></td>
             <td><%=guia.getDestinatario()%></td>
             <td><%=guia.getRemitente()%></td>
             <td><%=guia.getOrigen() + " - " + guia.getDestino()  %></td>
             
             
            </tr>   
 
             <%}}%> 
 
         
 
            <tr   bgcolor="<%=filascolor%>">
             <td><b><%=Ruta1%>  </a></b></td>
             <td><%=totalopz1%></td>             
             <td><%=totalops1%> </td>
             
             <td> </td>
             
             <td></td>
             <td></td>
             <td></td>
             </tr>   
           <% if (Ruta2.length()>0)
              {
     
           %> 
               
           <tr   bgcolor="<%=filascolor%>">
             <td><b><%=Ruta2%>  </a></b></td>
             <td><%=totalopz2%></td>             
             <td><%=totalops2%></td>
             
             <td> </td>
             
             <td></td>
             <td></td>
             <td></td>
             
            </tr>   
            <%}%>
            
            
            
             <tr   bgcolor="<%=filascolor%>">
             <td><b> Totales  </a></b></td>
             <td><%=totalpz%>  </td>             
             <td><%=totalps%></td>
             
             <td> </td>
             
             <td></td>
             <td></td>
             <td></td>
             
            </tr>   
</table>
</td>
</tr>
</table>