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
<table width="80%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/Reservas/Confirmar"  
name="ConfirmarReservas"  
>
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
<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Grupo:</b></td>
<td colspan="3">
<%=contacto.getGrupo().trim()%>
</td>
<td colspan="1"><b>Clase:</b></td>
<td colspan="1">
<%=contacto.getClase().trim()%>
</td>
</tr>



<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >
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


<tr class="form1">
<th colspan="6" >Pasajeros</th>
</tr>
<tr>

<th colspan="2" >Apellido/Nombre</th>
<th >Tipo</th>
<th >Cedula</th>
<th >Infante</th>
<th >Contador</th> 
</tr>

<%
  List lista2 = model.getReservaestado();
  String Cedula="";
  String Apellido="";
  String Infante="";
  String Tipo="";
  String Estado1="";
  
  contador=0;
  int i=0;
  long reservacodigo=0;
              if  (lista2 != null)  {
                    Iterator itr = lista2.iterator();
                   while (itr.hasNext()) {
                        Reservaestado reserva=(Reservaestado) itr.next();
                   Cedula="";  
                   Infante="";
                   Apellido=reserva.getApellido()+" "+reserva.getNombre();
                   Tipo=reserva.getTipo();
                   if (reserva.getCedula()!=null)
                                Cedula=reserva.getCedula();
                   if (reserva.getInfante()!=null)
                                Infante=reserva.getInfante();
                   /*
                   if (contador==0)
                   {
                       Estado1=reserva.getEstado();
                       
                       if (titulo1.equals(""))
                        contador=0;
                       else
                        contador++;   
                   }
                   else
                   {
                     Estado2=reserva.getEstado();
                       contador=0;  
                   }*/
                   
                   if(reservacodigo!=reserva.getReservacodigo())
                   {
                       i++;
                       reservacodigo=reserva.getReservacodigo();
                       //Estado1+reserva.getOrigen()+ " - " +reserva.getDestino() +" - " +reserva.getNumero()+"("+reserva.getEstado()+")";
if (!Estado1.equals(""))
{
%>
<tr >
<td bgcolor="#FFFFCC" colspan="6"><%=Estado1%> 
</tr>                   

<%}%>
<tr bgcolor="#CCFFFF">

<td colspan="2" ><%=Apellido%></td>       
<td><%=Tipo%></td>
<td><%=Cedula%></td>
<td><%=Infante%></td>
<td><%=i%></td>
</tr>

<%
                   Estado1="";
                   }
Estado1=Estado1+reserva.getOrigen()+ " - " +reserva.getDestino() +" - " +reserva.getNumero()+"("+reserva.getEstado()+")";
%>

     <%              }}%>

<%if (!Estado1.equals(""))
{
%>
<tr >
<td bgcolor="#FFFFCC" colspan="6"><%=Estado1%> 
</tr>                   

<%}%>
<%------------Prueba-------------%>
</table>
<%------------Prueba-------------%>
<table width="80%" align="center">        
<tr class="form1">
<tH colspan="3">
Observaciones
</tH>
</tr>

<%
String observa="";
String url="";
String derecha="";
 lista = model.getReservas();
              if  (lista != null)  {
                    Iterator ito = lista.iterator();
                   while (ito.hasNext()) {
                        Observaciones obs=(Observaciones) ito.next();
                        observa=obs.getObservacion();
                    url="";    
                    derecha="";
                   if (observa.indexOf("Booking")>0)
                   {
                        url=observa.substring(0,observa.indexOf("Booking")-1);
                        
                        derecha=observa.substring(observa.indexOf("Booking"),observa.length());
                        observa=derecha;
                        derecha=derecha.replace("Booking:","buscar=");
                        url=url+" "+"<a class='enblanco' href='"+CONTROLLER+"/Reservaciones/Booking?"+derecha+"'>"+observa+"</a>";
                   }
                   else
                       url=observa;
                         
%>
<tr bgcolor="#99FFFF">
<td><%=obs.getUsuario()%></td>
<td><%=obs.getFecha()%></td>
<td><%=obs.getHora()%></td>
</tr>
<tr bgcolor="#CCFFCC">
<td colspan="3"><%=url%></td>
</tr>

<%}}%>
</table>
<table width="80%" align="center">         
   
<%------Fin Prueba-----------------%>
<tr align="center">
<td align="center">
 <input TYPE="submit"    NAME="Nueva" value="Nueva Reserva">
 </td>
 <td align="center" colspan="1">
 <input  type="submit"  NAME="Modificar" value="Modificar Viaje">
 </td>
 <td align="center" colspan="1">
 
 <input  type="submit"  NAME="Nombres" value="Modificar Estados y  Nombres">
 </td>
 </tr>
 <tr>
 
 <td align="center" colspan="2">
 <input  type="submit"  NAME="Tarifas" value="Fijar Tarifas">
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


