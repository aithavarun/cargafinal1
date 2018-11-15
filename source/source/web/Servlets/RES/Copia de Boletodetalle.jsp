<%------------------------nuevo------------------------%>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
  <%=destino%>
</div>
<div id="cabecera" style="position:absolute; left:4.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                          
VOID
</div>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:7.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:8.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
OK
</div>
<div id="cabecera" style="position:absolute; left:11cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:14.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
0000
</div>
<div id="cabecera" style="position:absolute; left:16cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
0000
</div>
<div id="cabecera" style="position:absolute; left:17.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
 00
 </div>
<%while (jj<4)/// era 5 vear
{
       posy+=0.4;
       jj++;
       %>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:4.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                          
VOID
</div>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:7.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:8.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
OK
</div>
<div id="cabecera" style="position:absolute; left:11cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:14.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
0000
</div>
<div id="cabecera" style="position:absolute; left:16cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
0000
</div>
<div id="cabecera" style="position:absolute; left:17.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
 00<%=jj%>
 </div>
       
<%
//postotal+=posy+12.5;

}%>

<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+13.8%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD <%=f.format(valor+q)%>
</div>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+14.2%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD <%=f.format(valor+q)%>
</div>
<div id="cabecera" style="position:absolute; left:3cm;top:<%=postotal+14.2%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%------------------
<%=pagosrutas%> 2K <%=f.format(segunda)%> <%=destino%> 2K <%=f.format(reserva.getValor())%> TTL USD <%=f.format(reserva.getValor()*2)%>
-------------------%>
<%=pagosrutas%> TTL USD <%=f.format(platas)%>
</div>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+14.6%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD EC <%=f.format(iva)%>
</div>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+15%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD WT <%=f.format(tasa)%>
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+15%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=documento%>
<%if (contacto.getCodigopta()>0)
{
%>                    
PTA: <%=contacto.getNumeropta()%> <%=contacto.getNombrepta()%>
<%}%>

</div>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+15.4%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD XT <%=f.format(seguro)%>
</div>

<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+15.8%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">    
<%
if (contacto.getCodigopta()>0)
{
%>                    
N.A.D.C. 
<%}
else
{%>

USD   <%=f.format(tasa+seguro+valor+iva+q)%>

<%}%>
</div>

<script language="JavaScript"> 
//alert("entra");
document.getElementById("TTotal<%=capa%>").innerHTML="<%=origen%> <%=destino%>";
//alert("sale");
</script>
<%----------fin nuevo---------------------------------quirtar
<div id="origendestino" style="position:absolute; left:12cm;top:<%=postotal+9.5%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
<span id="TTotal<%=capa%>"  style="position:relative;">
UIO-UIO
</span>
</div>
<div id="cabecera" style="position:absolute; left:14.5cm;top:<%=postotal+9.5%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
AEROGAL-<%=FORMATOFECHA.format(hoy.getTime())%> 
</div>
<div id="cabecera" style="position:absolute; left:4cm;top:<%=postotal+9.5%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
<%
if (contacto.getCodigopta()>0) 
{
%>
NOT END
<%
}
else
{
%>
NO REFUND 
<%}%>
</div>
<div id="cabecera" style="position:absolute; left:12cm;top:<%=postotal+9.8%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
<%=contacto.getBooking()%>
</div>
<div id="cabecera" style="position:absolute; left:14.5cm;top:<%=postotal+9.8%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
R.U.C.:1790727203001 <%=usuario.getNombre()%>
</div>
<div id="cabecera" style="position:absolute; left:3cm;top:<%=postotal+10%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
<% if(!contacto.getRuc().trim().equals(""))
  {%>
     R.U.C.:<%=contacto.getRuc()%> - Razon social:<%=contacto.getRazon()%>
  <%}%> 
</div>
<div id="cabecera" style="position:absolute; left:12cm;top:<%=postotal+10.1%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
<%=usuario.getSucursal()%>
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+12.5%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
<%=contacto.getTour()%> 
</div>

<div id="cabecera" style="position:absolute; left:14.5cm;top:<%=postotal+10.1%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
QUITO - ECUADOR 
</div>

<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+10.5%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">
<%=reserva.getApellido()%>/<%=reserva.getNombre()%>
</div>

   <%
   double posy=-0.4; //posy=-5
   String destino="";
   int jj=0;
   pagosrutas="";
   platas=0;
   float segunda=reserva.getValor();
   String origen=reserva.getOrigen();
   if  (lista != null)  {
                    Iterator itv = lista.iterator();
                   while (itv.hasNext()) {
                        Vuelosreserva vuelo=(Vuelosreserva) itv.next();
       j++; 
       jj++;
                 posy+=0.4  ;                            
                 destino=vuelo.getDestino();        
                 pagosrutas+=reserva.getOrigen().trim()+" 2K "+String.valueOf(reserva.getValor())+reserva.getDestino().trim() +" 2K ";
                         platas+=reserva.getValor();
                        %>
<div id="cabecera" style="position:absolute; left:0.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
  <%=vuelo.getOrigen()%>
</div>
<div id="cabecera" style="position:absolute; left:4.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                          
2K
</div>
<%if (!vuelo.getNumero().trim().equals("OPEN"))
{
                     %>

<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=vuelo.getNumero()%>
</div>
<div id="cabecera" style="position:absolute; left:6.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=contacto.getClase()%>
</div>
<div id="cabecera" style="position:absolute; left:7.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=FORMATOFECHA.format(vuelo.getFecha())%>
</div>
<div id="cabecera" style="position:absolute; left:8.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=f1.format(vuelo.getHora())+":"+f1.format(vuelo.getMinuto())%>
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
OK
<%------------------------
<%=reserva.getEstado()%>
-----------%>
<%------------------------quitar
</div>
<div id="cabecera" style="position:absolute; left:11cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=reserva.getBase()%>---<%=TarifaString[j]%>----<%=j%>
</div>
<div id="cabecera" style="position:absolute; left:14.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=FORMATOFECHA.format(hoy.getTime())%>
</div>
<div id="cabecera" style="position:absolute; left:16cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=FORMATOFECHA.format(reserva.getValidez())%>
</div>
<div id="cabecera" style="position:absolute; left:17.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
 20
 </div>
<%}
else
{%>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=vuelo.getNumero()%>
</div>
<div id="cabecera" style="position:absolute; left:6.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=contacto.getClase().trim()%>
</div>
<div id="cabecera" style="position:absolute; left:7.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
OPEN
</div>
<div id="cabecera" style="position:absolute; left:9.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
OPEN
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
OPEN
</div>
<div id="cabecera" style="position:absolute; left:11cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=reserva.getBase()%>
</div>
<div id="cabecera" style="position:absolute; left:14.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=FORMATOFECHA.format(hoy.getTime())%>
</div>
<div id="cabecera" style="position:absolute; left:16cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=FORMATOFECHA.format(reserva.getValidez())%>
</div>
<div id="cabecera" style="position:absolute; left:17.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
 20
 </div>

<%}
                   }}
   posy+=0.4;
           jj++;
%>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
  <%=destino%>
</div>
<div id="cabecera" style="position:absolute; left:4.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                          
VOID
</div>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:7.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:8.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
OK
</div>
<div id="cabecera" style="position:absolute; left:11cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:14.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
0000
</div>
<div id="cabecera" style="position:absolute; left:16cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
0000
</div>
<div id="cabecera" style="position:absolute; left:17.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
 00
 </div>
<%while (jj<4)/// era 5 vear
{
       posy+=0.4;
       jj++;
       %>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:4.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                          
VOID
</div>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:7.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:8.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
OK
</div>
<div id="cabecera" style="position:absolute; left:11cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
VOID
</div>
<div id="cabecera" style="position:absolute; left:14.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
0000
</div>
<div id="cabecera" style="position:absolute; left:16cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
0000
</div>
<div id="cabecera" style="position:absolute; left:17.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
 00
 </div>
       
<%
//postotal+=posy+12.5;
}%>

<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+13.8%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD <%=f.format(reserva.getValor())%>
</div>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+14.2%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD <%=f.format(reserva.getCola())%>
</div>
<div id="cabecera" style="position:absolute; left:3cm;top:<%=postotal+14.2%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%------------------
<%=pagosrutas%> 2K <%=f.format(segunda)%> <%=destino%> 2K <%=f.format(reserva.getValor())%> TTL USD <%=f.format(reserva.getValor()*2)%>
-------------------%>
<%------------------------quitar
<%=pagosrutas%> TTL USD <%=f.format(platas)%>
</div>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+14.6%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD EC <%=f.format(reserva.getIva())%>
</div>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+15%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD WT <%=f.format(reserva.getTasa())%>
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+15%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=documento%>
<%if (contacto.getCodigopta()>0)
{
%>                    
PTA: <%=contacto.getNumeropta()%> <%=contacto.getNombrepta()%>
<%}%>

</div>
<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+15.4%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
USD XT <%=f.format(reserva.getSeguro())%>
</div>

<div id="cabecera" style="position:absolute; left:1cm;top:<%=postotal+15.8%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">    
<%
if (contacto.getCodigopta()>0)
{
%>                    
N.A.D.C. 
<%}
else
{%>

USD   <%=f.format(reserva.getTasa()+reserva.getSeguro()+reserva.getValor()+reserva.getIva())%>

<%}%>
</div>

<script language="JavaScript"> 
//alert("entra");
document.getElementById("TTotal<%=capa%>").innerHTML="<%=origen%> <%=destino%>";
//alert("sale");
</script>
<%------------------------------
<table width="643"  border="0">
  <tr>
    <td><table width="50%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#000066" class="style9">
      <tr class="boleto">
        <th >FARE/TARIFA</th>
        <td align="right" ><%=f.format(reserva.getValor())%></td>
      </tr>
      <tr class="boleto">
        <th  >CHARGE/CARGO</th>
        <td align="right" ><%=f.format(reserva.getSc())%></td>
      </tr>
      <tr class="boleto">
        <th  >TAX/I.V.A.</th>
        <td align="right" ><%=f.format(reserva.getIva())%></td>
      </tr>
      <tr  class="boleto">
        <th>TAX/SEGURO</th>
        <td align="right" ><%=f.format(reserva.getSeguro())%></td>
      </tr>
      <tr class="boleto">
        <th  >TAX/TASA</th>
        <td align="right" ><%=f.format(reserva.getTasa())%></td>
      </tr>
      <tr class="boleto">
        <th  >TOTAL</th>
        <td align="right" ><%=f.format(reserva.getTasa()+reserva.getSeguro()+reserva.getValor()+reserva.getIva())%></td>
      </tr>
    </table></td>
    <td><table width="50%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#000066" class="style9" >
      <tr class="boleto" >
        <th scope="col">&nbsp;</th>
        <th scope="col">AMOUNT/CANTIDAD</th>
        <th scope="col">DOCUMENT/DOCUMENTO</th>
        <th scope="col">REMARKS/OBSERVACIONES</th>
      </tr>
      <tr class="boleto">
        <th  >CREDIT CARD / TARJETA DE CREDITO </th>
        <td align="right"><%=f.format(reserva.getTc())%></td>
        <td><%=Tc%></td>
        <td><%=obstc%></td>
      </tr>
      <tr class="boleto">
        <th >CHECK/CHEQUE</th>
        <td align="right"><%=f.format(reserva.getCheque())%></td>
        <td><%=documentoch%></td>
        <td><%=obsch%></td>
      </tr>
      <tr class="boleto">
        <th >CAHS/EFECTIVO</th>
        <td align="right"><%=f.format(reserva.getEfectivo())%></td>
        <td>&nbsp;</td>
        <td><%=obsefectivo%></td>
      </tr>
      <tr class="boleto">
        <th >OTHERS/OTROS</th>
        <td align="right"><%=f.format(reserva.getOtros()+reserva.getMpd()+reserva.getPta()+reserva.getCredito()+reserva.getCanje())%></td>
        <td><%=documento%></td>
        <td><%=ya%></td>
      </tr>
      <tr class="boleto">
        <th  >TOTAL</th>
        <td align="right"><%=f.format(reserva.getTc()+reserva.getCheque()+reserva.getEfectivo()+reserva.getOtros()+reserva.getMpd()+reserva.getPta()+reserva.getCredito()+reserva.getCanje())%></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
--------------%>