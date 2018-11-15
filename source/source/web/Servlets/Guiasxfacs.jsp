


<table id="t1" class="sortable">

<%DecimalFormat f =new DecimalFormat("0.00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");
                        
DecimalFormat fx =new DecimalFormat("0000000");

int secuencial=0;
%>

<tr>
<td > Serie</td>
<td > Numero</td>
<td > Piezas</td>
<td > Peso</td>
<td > Destino</td>
<td > Contiene</td>
<td > Destinatario</td>
<td > Remitente</td>
<td > Ruta</td>
<td > Tarifa</td>
<td > Valorizacion</td>
<td > Seguro</td>
<td > I.V.A.</td>
<td > Total</td>
</tr>


<%
 List lista = model.getGuiasLista();

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
 
 float total=0;
 
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
             
             secuencial++;
             total+=guia.getTotal(); 
             %>
             <tr   bgcolor="<%=filascolor%>">
             <td  colspan="2"><input  type="hidden" name="Guia<%=secuencial%>" value= "<%=guia.getCodigo()%>" > <%=guia.getSerie().trim() +"-"+fx.format(guia.getNumero())%>   </td>
             
             <td><%=guia.getPiezas()%></td>             
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
             <td></td>
             <td></td>             
             <td> </td>
             <td> </td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td>Total</td>
             <td><input name="Total" id="Total" type="text" value="<%=f.format(total)%>" size="10" readonly> </td>
             <input type="hidden" value="<%=secuencial%>" name="Secuencial"  size="10" maxl>    
             </tr>   
                                         
</table>
