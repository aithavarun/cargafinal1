<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>





<%@ include file="/WEB-INF/Banner.jsp"%>  
<%DecimalFormat f =new DecimalFormat("00");
DecimalFormat f1 =new DecimalFormat("###,##0.00");

SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>

<table width="100%" align="left">
<tr>



<td valign="top" width="100%" >

<form method="post" action="<%=CONTROLLER%>/Tarifas/Confirmar"  
name="ConfirmarTarifas"  
>
<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="6" >Reserva</th>
</tr>
<tr class="form1">
<th colspan="6" >Grupo y Contacto</th>
</tr>
<TR bgcolor="#CCCCCC">
<% Cabecera contacto=model.getCabecera();%>
<td><b>Booking Reference:</b></td>
<td ><b><%=contacto.getBooking()%></b></td> 
<td>Quien Solicita:</td>
<td><%=contacto.getQuiens()%></td> 
<td>Telefono:</td>
<td><%=contacto.getTelefono()%></td>
</tr>
<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >
<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Grupo:</b></td>
<td colspan="7">
<%=contacto.getGrupo().trim()%>
</td>

</tr>

<tr>
<th colspan="6" >Time Limit</th>
</tr>
<td><b>Fecha:</b></td>
<td colspan="2" ><b><%=FORMATOFECHA.format(contacto.getFechat())%></b></td> 
<td><b><%=f.format(contacto.getHorat())+":"+f.format(contacto.getMinutot())%></b></td> 

<tr>
</TR>


<tr class="form1">
<th colspan="6" >Datos del Viaje</th>

</tr>
<tr >
<th >Fecha</th>
<th >Origen</th>
 <th >Destino</th>
 <th >Numero</th>
 <th >Hora</th>
 <th >Avion</th>
</tr>

<%
String titulo="";
String titulo1="";
int contador=0;
 List lista = model.getVueloreserva();
              if  (lista != null)  {
                    Iterator itv = lista.iterator();
                   while (itv.hasNext()) {
                        Vuelosreserva vuelo=(Vuelosreserva) itv.next();
                    if (contador==0) 
                    {
                        titulo= vuelo.getOrigen().trim()+ "-" +vuelo.getDestino().trim()+"-"  + vuelo.getNumero().trim(); 
                        contador++;
                    }
                    else
                    {
                       titulo1= vuelo.getOrigen().trim()+ "-" +vuelo.getDestino().trim()+"-"  + vuelo.getNumero().trim();      
                      
                    }
%>
<tr class="vuelo">
<td  ><%=FORMATOFECHA.format(vuelo.getFecha())%></td>       
             
<td><%=vuelo.getOrigen()%></td>
<td><%=vuelo.getDestino()%></td>
<td><%=vuelo.getNumero()%></td>
<td><%=f.format(vuelo.getHora())+":"+f.format(vuelo.getMinuto())%></td>
<td><%=vuelo.getAvion()%></td>
</tr>
<%}}%>

</table>
<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="10" >Pasajeros</th>
</tr>
<tr>

<th >Cantidad</th>
<th >Origen</th>
<th >Destino</th>
<th >Tipo</th>
<th >Nac</th>
 <th >Tarifa</th>
 <th >Iva</th>
 <th >Seguro</th>
 <th >Tasa</th>
 <th >Total</th>
</tr>

<%
  List lista2 = model.getReservaestado();
  float valor=0;
  float iva=0;
  float seguro=0;
  float tasa=0;
  
  contador=0;
  int i=0;
  long reservacodigo=0;
              if  (lista2 != null)  {
                    Iterator itr = lista2.iterator();
                   while (itr.hasNext()) {
                       Totales reserva=(Totales) itr.next();
                       valor+=reserva.getValor();
                       iva+=reserva.getIva();
                       seguro+=reserva.getSeguro();
                       tasa+=reserva.getTasa();
  
%>
<tr >
<td bgcolor="#FFFFCC"   align="right" colspan="1"><%=reserva.getContador()%></td>
<td bgcolor="#FFFFCC" colspan="1"><%=reserva.getOrigen()%></td>
<td bgcolor="#FFFFCC" colspan="1"><%=reserva.getDestino()%></td>
<td bgcolor="#FFFFCC" colspan="1"><%=reserva.getTipo()%></td>
<td bgcolor="#FFFFCC" colspan="1"><%=reserva.getNacionalidad()%></td>
<td bgcolor="#FFFFCC" align="right" colspan="1"><%=f1.format(reserva.getValor())%></td>
<td bgcolor="#FFFFCC" colspan="1" align="right"><%=f1.format(reserva.getIva())%></td>
<td bgcolor="#FFFFCC" colspan="1" align="right"><%=f1.format(reserva.getSeguro())%></td>
<td bgcolor="#FFFFCC" colspan="1" align="right"><%=f1.format(reserva.getTasa())%></td>
<td bgcolor="#FFFFCC" colspan="1" align="right"><%=f1.format(reserva.getValor()+reserva.getTasa()+reserva.getIva()+reserva.getSeguro())%></td>
</tr>                   

<%}}%>

<tr >
<td bgcolor="#CCCCCC"   align="right" colspan="5">Totales</td>
<td bgcolor="#CCCCCC" align="right" colspan="1"><%=f1.format(valor)%></td>
<td bgcolor="#CCCCCC" colspan="1" align="right"><%=f1.format(iva)%></td>
<td bgcolor="#CCCCCC" colspan="1" align="right"><%=f1.format(seguro)%></td>
<td bgcolor="#CCCCCC" colspan="1" align="right"><%=f1.format(tasa)%></td>
<td bgcolor="#CCCCCC" colspan="1" align="right"><%=f1.format(valor+tasa+iva+seguro)%></td>
</tr>                   


</table>
<%------------Prueba-------------%>
<table width="80%" align="center">        
<tr class="form1">
<tH colspan="3">
Observaciones
</tH>
</tr>

<%
 lista = model.getReservas();
              if  (lista != null)  {
                    Iterator ito = lista.iterator();
                   while (ito.hasNext()) {
                        Observaciones obs=(Observaciones) ito.next();
                        
%>
<tr bgcolor="#99FFFF">
<td><%=obs.getUsuario()%></td>
<td><%=obs.getFecha()%></td>
<td><%=obs.getHora()%></td>
</tr>
<tr bgcolor="#CCFFCC">
<td colspan="3"><%=obs.getObservacion()%></td>
</tr>

<%}}%>
</table>
<table width="80%" align="center">         
   
<%------Fin Prueba-----------------%>
<tr align="center">
<td align="center">
 <input TYPE="submit"    NAME="Nueva" value="Nueva Reserva">
 </td>
 <td align="center" colspan="2">
 <input  type="submit"  NAME="Modificar" value="Modificar Viaje">
 </td>
 <td align="center" colspan="1">
 <input  type="submit"  NAME="Nombres" value="Modificar Nombres">
 </td>
 <td align="center" colspan="1">
 <input  type="submit"  NAME="Tarifas" value="Pagos">
 </td>
 <td align="center" colspan="1">
 <input  type="submit"  NAME="PTA" value="PTA">
 </td>
 <td align="center">
 <input  type="submit"  NAME="Salir" value="Terminar">
 </td>
 </tr>
 </form>
 
</table>
</td>
</tr>
</table>


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


