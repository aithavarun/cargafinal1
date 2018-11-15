
<table border="0" cellpadding="0" cellspacing="0" width="643">
<!-- fwtable fwsrc="logoeticket.png" fwbase="logoeticket.gif" fwstyle="Dreamweaver" fwdocid = "1463324027" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="231" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="75" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="337" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td><img name="<%=BASEURL%>/images/logoeticket_r1_c1" src="<%=BASEURL%>/images/logoeticket_r1_c1.gif" width="231" height="140" border="0" alt=""></td>
   <td><img name="<%=BASEURL%>/images/logoeticket_r1_c2" src="<%=BASEURL%>/images/logoeticket_r1_c2.gif" width="75" height="140" border="0" alt=""></td>
   <td>
    <%
bcrequest.setFormat("jpeg");
bcrequest.setResolution("150");
bcrequest.setMsg(String.valueOf(reserva.getBoleto()));
genbc = "http://www.aerogal.com.ec/barcode4j/"+bcrequest.toURL();%>
<img src="<%=genbc%>"/></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="140" border="0" alt=""></td>
  </tr>
</table>
<table width="643"  border="0" cellpadding="0" cellspacing="0" bordercolor="#000066" class="style9">
 <tr class="boleto">
<th  >
  ENDORSEMENTS/RETRICTIONS</th>
<TH >
  ORIGIN/DESTINATION</TH>
<th >
  DATE AND PLACE OF ISSUE</th>
</tr>

<tr class="boleto">
<th >
  ENDOSOS Y RESTRICCIONES</th>
<TH >
  ORIGEN/DESTINO</TH>
<th>
  LUGAR Y FECHA DE EMISION</th>
</tr>
<tr >
  <tD>non Refound
 
  </td>
  
  <TD> UIO-UIO </TD>
  <TD> AEROGAL </TD>
</tr>
<tr >
  <tD rowspan="4"> <% if(contacto.getRuc()!=null)
  {%>
     R.U.C.:<%=contacto.getRuc()%> - Razon social:<%=contacto.getRazon()%>
  <%}%> </tD>
  <TD rowspan="4" align="center"> <strong><%=contacto.getBooking()%></strong> </TD>
  <TD><%=FORMATOFECHA.format(hoy.getTime())%> </TD>
</tr>
<tr  >
  
  <TD>R.U.C. 1790727203001 </TD>
</tr>
<tr  >
    <TD>MATRIZ-QUITO-ECUADOR</TD>
</tr>
<tr class="style9">
	
   <Td><%=usuario.getNombre()%></Td>
</tr>
</table>
<table width="643"  border="0" cellpadding="0" cellspacing="0" bordercolor="#000066" class="style9">
 <tr class="boleto">
<th >
  NAME OF PASSENGER</th>
<TH >
  IDENTIFICATION DOCUMENT </TH>
<th >
  TOUR CODE </th>
</tr>

<tr class="boleto">
<th >
  NOMBRE DEL PASAJERO </th>
<TH >
  DOCUMETO DE IDENTIFICACION </TH>
<Th >
  CODIGO EXCURSION </Th>
</tr >
<tr >
  <tD><%=reserva.getApellido()%>/<%=reserva.getNombre()%>
  <TD> falta cedula</TD>
  <TD><%=contacto.getTour()%> </TD>
</tr>
</table>
<table width="643"  border="0" cellpadding="0" cellspacing="0" bordercolor="#000066" class="style9" >
 <tr class="boleto">
   
<th  colspan="2">
  NOT GOOD FOR PASSAGE </th>
<TH >
  CARRIER</TH>
<th >FLIGHT</th>
<th >CLASS</th>
<th >DATE</th>
<th >TIME</th>
<th >STATUS</th>
<th >FARE BASIS </th>
<th >NOT VALID BEFORE </th>
<th >
  NOT VALID AFTER </th>
</tr>

<tr class="boleto">
<th  colspan="2">
  NO VALIDO PARA TRANSPORTE </th>
<TH >
  TRANSPORTISTA</TH>
<Th align="center" >VUELO</Th>
<Th align="center" >CLASE</Th>
<Th align="center" >FECHA</Th>
<Th align="center" >HORA</Th>
<Th align="center" >ESTADO</Th>
<Th align="center" >TARIFA BASE </Th>
<Th align="center" >NO VALIDO ANTES </Th>
<Th align="center" >
   NO VALIDO DESPUES </Th>
</tr>
   <%
   
   if  (lista != null)  {
                    Iterator itv = lista.iterator();
                   while (itv.hasNext()) {
                        Vuelosreserva vuelo=(Vuelosreserva) itv.next();
       j++;                 
                                               
                         
                        %>
<%----------
            
----%>
                        
<tr >
  <tD>TO:  
  <tD><%=vuelo.getOrigen()%>-<%=vuelo.getDestino()%>
  <TD> 2K </TD>
  <TD>032</TD>
  <TD>Y</TD>
  <TD><%=FORMATOFECHA.format(vuelo.getFecha())%></TD>
  <TD><%=f1.format(vuelo.getHora())+":"+f1.format(vuelo.getMinuto())%></TD>
  <TD><%=reserva.getEstadob()%></TD>
  
  <TD><span id="Base<%=j%>"  style="position:relative;">
       <%=j%></span>
  </TD>
  <TD><%=FORMATOFECHA.format(hoy.getTime())%></TD>
  <TD><%=FORMATOFECHA.format(reserva.getValidez())%> </TD>
</tr>
<%}}%>
</table>

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
