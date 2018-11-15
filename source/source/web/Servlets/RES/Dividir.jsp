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
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>

<table width="100%" align="left">
<tr>



<td valign="top" width="100%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/Reservas/Dividir"  
name="DividirReservas" >
<tr class="form1">
<th colspan="6" >Dividir Reservas</th>
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
<td colspan="2">
<%=contacto.getGrupo().trim()%>
</td>
<td><b>Clase:</b></td>
<td colspan="4">
<%String selecciona1=contacto.getClase();
String selecciona="";
if (selecciona1==null)
    selecciona1="";
else
    selecciona1=selecciona1.trim();
%>
<select name='Clase'>
<%if (selecciona1.equals("Y"))
    selecciona="SELECTED";
else
    selecciona="";
%>
<option value='Y' <%=selecciona%> >Y</option>
<%if (selecciona1.equals("B"))
    selecciona="SELECTED";
else
    selecciona="";
%>

<option value='B' <%=selecciona%> >B</option>
<%if (selecciona1.equals("M"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='M' <%=selecciona%> >M</option>
<%if (selecciona1.equals("P"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='P' <%=selecciona%> >P</option>
<%if (selecciona1.equals("Q"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='Q' <%=selecciona%> >Q</option>
<%if (selecciona1.equals("V"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='V' <%=selecciona%> >V</option>

<%if (selecciona1.equals("X"))
    selecciona="SELECTED";
else
    selecciona="";
%>
<option value='X' <%=selecciona%> >X</option>

<%if (selecciona1.equals("Z"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='Z' <%=selecciona%> >Z</option>

</select>
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
                    
                       titulo=vuelo.getAvion().trim();
                       if (!titulo.equals("OPEN"))
                            contador++;
                    
                       
                      
                    
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
<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="10" >Nuevo Grupo</th>
</tr>
<tr>
<td><b>Nombre: </b></td>
<td colspan="2"><input name="Nombre" value="" type="text" size="20"  maxlength="30"></td> 
</tr>
</table>
<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="10" >Pasajeros</th>
</tr>
<tr>

<th >Apellido</th>
<th >Nombre</th>
<th >Cedula</th>
 
 <%-------<th >Estado <%=titulo%></th>-----------%>
 <%----------------- valido
<th colspan="2"><input type="checkbox" name="Titulo1" onclick="anulo(2)">Estado <%=titulo1%></th>

<%------- <th >Estado <%=titulo1%></th>-
<%----------------- valido----------%>
 <th  >Boleto</th>
 <th  >Tipo</th>
 <th>No.</th>
</tr>

<%
  List lista2 = model.getReservaestado();
  String Cedula="";
  String Apellido="";
  String Infante="";
  String Tipo="";
  String Estado="";
  
  String Estado1="";
  
  //contador=0;
  int i=0;
  String color="#CCFFFF";
  String colore="#CCFFFF";
  String  tipob="";
    int aux=0;
    long vuelo=0;
    String tipoB="";
  long reservacodigo=0;
  
              if  (lista2 != null)  {
                    Iterator itr = lista2.iterator();
                   while (itr.hasNext()) {
                        Reservaestado reserva=(Reservaestado) itr.next();
                     
                   Cedula="";  
                   Infante="";
                   //Apellido=reserva.getApellido()+" "+reserva.getNombre();
                  
                   
                   if (reserva.getCedula()!=null)
                                Cedula=reserva.getCedula();
                   if (reserva.getInfante()!=null)
                                Infante=reserva.getInfante(); 
                  if (!Tipo.equals(reserva.getTipo().trim()))
                  {
                    Tipo=reserva.getTipo().trim();   
                    
%>


<tr  class="tipo">
<th colspan="10" >Pasajeros <%=Tipo%></th>
</tr>
<%}
 if (reservacodigo!=reserva.getReservacodigo())
 {
     reservacodigo=reserva.getReservacodigo();  
     i++;
     aux=0;
     tipoB=reserva.getBoletotipo();
                    tipob="";
                    if (tipoB==null)
                        tipoB="";
                    else
                        tipoB=tipoB.trim();
                  if (tipoB.equals("B"))
                      tipob="BSP";
                    else if (tipoB.equals("W"))
                      tipob="WEB";
                    else if (tipoB.equals("E"))
                      tipob="e-ticket";  
                    else if (tipoB.equals("A"))
                      tipob="Aerogal";
                    else if (tipoB.equals("R"))
                      tipob="Revisi&oacute;n";
                    else if (tipoB.equals("H"))
                      tipob="Ch.Coorp.";  
                    else 
                      tipob="BSP";
 
%>

<tr bgcolor="#CCFFFF">
<input name="Rcodigo<%=i%>" value="<%=reserva.getReservacodigo() %>" 
type="hidden"  >

<td colspan="1" ><input type="checkbox" name="Reserva<%=i%>" value= "<%=reserva.getReservacodigo()%>"><%=reserva.getApellido().trim()%> 
</td>
<td>
<%=reserva.getNombre().trim()%> 
</td>       
<td><%=Cedula%>
</td>
<td><%=reserva.getBoletonumero()%>
</td>
<td>
<%=tipob%>
</td>
<td rowspan="<%=contador+1+reserva.getInfantes()%>" bgcolor="#CCCCCC"><%=i%> </td>
</tr>
<% if (reserva.getInfantes()==1)
{
    String Infa=reserva.getInfante();
                    if(Infa==null)
                        Infa="";
%>
<tr bgcolor="#66FFFF">
<td><b>Infante:</b></td>
<td>
<%=Infa%>
</td>
<td><b>Boleto Infante:</b></td>
<td colspan="2">
<%=reserva.getBoletonumero()%>
</td>

</tr>
<%}%>
<%}
                   aux++;
if (reserva.getEstado().trim().equals("XX"))
    
{
  Estado1="HK";
   color="red";
   colore="#CCFFFF"; 
}
else if(reserva.getEstado().trim().equals("HK"))
{
  Estado1="XX";
 color="#CCFFFF";     
  colore="red"; 
}
else if(reserva.getEstado().trim().equals("HL"))
{
  Estado1="XX";
  color="#FFCC99";
  colore="red"; 
}   
else if(reserva.getEstado().trim().equals("RR"))
{
  Estado1="XX";
  color="#00CCFF";
  colore="red"; 
}              
                   if (reserva.getBi()==0)
                   {
%>
<tr bgcolor="#CCFFFF">
<td bgcolor="<%=color%>"><b>
<%=reserva.getOrigen()+"-"+reserva.getDestino()+"-"+ reserva.getNumero() + "("+reserva.getEstado()+")"%>
</b>
</td>

<td colspan="4"></td>
</tr>
<%-----------

-------------%>
<%}
                   else
                   {%>
                   
                  
                   <%}}}%>
<input name="i" value="<%=i %>" 
type="hidden"  >
<input name="aux" value="<%=aux%>" 
type="hidden"  >




</table>

<table width="100%" align="center">        
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
<td colspan="5"><%=obs.getObservacion()%></td>
</tr>

<%}}%>
</table>
<table width="100%" align="center">         
   
<%------Fin Prueba-----------------%>
<tr align="center">

 <td align="center" colspan="2">
 <input  type="submit"  NAME="Grabar" value="Grabar Reserva">
 </td>
 <td align="center">
 <input  type="submit"  NAME="Salir" value="Salir">
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


