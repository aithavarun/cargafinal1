<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ page import="org.krysalis.barcode4j.webapp.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>

<% 
Calendar hoy = Calendar.getInstance();
DecimalFormat f =new DecimalFormat("0.00");
DecimalFormat f1 =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("yyyy-MM-dd");
Cabecera contacto=model.getCabecera();
Usuarios usuario=model.getUsuarios();
int i=0;
int j=0;
%>
<html>
<head>
<title>Aerogal Boleto Electronico</title>
<meta http-equiv="Content-Type" content="text/html;">
<!--Fireworks MX 2004 Dreamweaver MX 2004 target.  Created Fri Mar 03 10:09:11 GMT-0500 (SA Pacific Standard Time) 2006-->
<style type="text/css">
<!--
.style9 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8px;
	font-style: normal;
	line-height: normal;
	font-variant: normal;
	text-transform: capitalize;
	color: #000099;
	border: #000099; 
        border-style: none; 
        border-top-width: 0px; 
        border-right-width: 0px; 
        border-bottom-width: 0px; 
        border-left-width: 0px;
        th { color:#ffffff;}

}


-->
</style>
<link href="<%=BASEURL%>/images/Sistema/Level2_Verdana_Forms.css" rel="stylesheet" type="text/css">
<script>
function imprSelec(nombre)
{
var ficha = document.getElementById(nombre);
var ventimp = window.open(' ', 'fdds');
ventimp.document.write('<HTML><BODY>');
ventimp.document.write( ficha.innerHTML );
ventimp.document.write('</BODY></HTML>');
ventimp.document.close();
//ventimp.print( );
//ventimp.close();
} 
</script>
</head>
<body bgcolor="#ffffff">
 <%
bcrequest.setFormat("jpeg");
bcrequest.setResolution("150");
bcrequest.setMsg(String.valueOf(contacto.getNumeropta()));
String genbc = "http://www.aerogal.com.ec/barcode4j/"+bcrequest.toURL();
%>
<div id="pta">



<table border="0" cellpadding="0" cellspacing="0" width="643">
<!-- fwtable fwsrc="e-pta.png" fwbase="e-pta.gif" fwstyle="Dreamweaver" fwdocid = "2022658131" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="240" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="106" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="297" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td><img name="<%=BASEURL%>/images/epta_r1_c1" src="<%=BASEURL%>/images/e-pta_r1_c1.gif" width="240" height="140" border="0" alt=""></td>
   <td><img name="<%=BASEURL%>/images/epta_r1_c2" src="<%=BASEURL%>/images/e-pta_r1_c2.gif" width="106" height="140" border="0" alt=""></td>
   <td><img src="<%=genbc%>"/></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="140" border="0" alt=""></td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="643">
<tr class="form1">
<th colspan="8" >Grupo y Contacto</th>
</tr>
<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Booking Reference:</b></td>
<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >
<input name="codigopta" value="<%=contacto.getCodigopta()%>" 
type="hidden"  >

<td ><b><%=contacto.getBooking()%></b></td> 
<td>Quien Solicita:</td>
<td><%=contacto.getQuiens()%></td> 
<td>Telefono:</td>
<td colspan="3"><%=contacto.getTelefono()%>
</td>
</tr>
<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Sucursal:</b></td>
<td ><b><%=contacto.getSucursal()%></b></td> 
<td>Quien Paga el PTA:</td>
<td><%=contacto.getNombrepta()%></td> 
<td>Fecha:</td>
<td colspan="3"><%=FORMATOFECHA.format(contacto.getFecha())%>
</td>
</tr>
<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Grupo:</b></td>
<td colspan="7">
<%=contacto.getGrupo().trim()%>
</td>

</tr>

</table>
<table border="0" cellpadding="0" cellspacing="0" width="643">
<tr class="form1">
<th colspan="8" >Viaje</th>

</tr>
</tr>
<tr >
<th colspan="2" >Fecha</th>
<th >Origen</th>
 <th >Destino</th>
 <th >Numero</th>
 <th >Hora</th>
 <th >Avion</th>
</tr>


<%

int contador=0;
String Origen="";
String Destino="";
int oneway=1;
long codigo1=0;
float porcentajeiva=12;
String vale="";
 List lista = model.getVueloreserva();
              if  (lista != null)  {
                    Iterator itv = lista.iterator();
                   while (itv.hasNext()) {
                        Vuelosreserva vuelo=(Vuelosreserva) itv.next();
                        
                            if (contador==0)
                                Origen=vuelo.getOrigen().trim();
                        Destino=vuelo.getDestino().trim();
                         contador++;
                        codigo1=vuelo.getCodigo();
                    
%>
<tr class="vuelo">

<input name="codigo<%=contador%>" value="<%=codigo1%>" 
type="hidden" >
<input name="cambia<%=contador%>" value="<%=vale%>" 
type="hidden"  >

<td colspan="2"><b><%=FORMATOFECHA.format(vuelo.getFecha())%></b>
<td colspan="1"><%=vuelo.getOrigen()%></td>
<td colspan="1"><%=vuelo.getDestino()%></td>
<td><%=vuelo.getNumero()%></td>
<td colspan="1"><%=f1.format(vuelo.getHora())+":"+f1.format(vuelo.getMinuto())%></td>
<td><%=vuelo.getAvion()%></td>
</tr>


<%}}%>
</table>
<%
// aumentado por q
int acceso=model.AccesoCiudad(Origen.trim().toUpperCase());
porcentajeiva=12;
if (Origen.equals(Destino))
    oneway=2;
 if (acceso==1)
 {
     if (oneway==2)
         porcentajeiva=8;
     else
         porcentajeiva=16;
 }

porcentajeiva=porcentajeiva/100;

%>

<table border="0" cellpadding="0" cellspacing="0" width="643">
<tr class="form1">
<th colspan="11" >Pasajeros</th>
</tr>

<tr >
<th colspan="1" >No.</th>
<th colspan="2">Apellido / Nombre</th>
 <th >Tipo</th>
 <th >Nac</th>
 <th >Tarifa</th>
 <th >Q</th>
 <th >Sc</th>
 <th >Iva</th>
 <th >Seguro</th>
 <th >Tasa</th>
 <th >Total</th>
 
</tr>
<%
List lista2 = model.getReservaestado();

int total=(lista2.size())+1;
String TarifaString[]= new String[total+1];
j=0;
float Valor=0;
float Sc=0;
float Iva=0;
float Seguro=0;
float Tasa=0;
float qq=0;
long reservas=0;  
  if  (lista2 != null)  {
      Iterator itr = lista2.iterator();
      while (itr.hasNext()) {
            Tarifasreservas reserva=(Tarifasreservas) itr.next();
            
            TarifaString[i]=reserva.getBase();
             if (reservas==reserva.getBoletocodigo())
             {
                 if (reserva.getSegurovias()==1)
                    reserva.setSeguro(0);
                if (reserva.getTasavias()==1)
                    reserva.setTasa(0);
             }
            //if (reservas!=reserva.getReservacodigo())
           // reserva.getBoletocodigo()
            if (reservas!=reserva.getBoletocodigo())
            {
                
                reservas=reserva.getBoletocodigo();
                i++;
                  

                
            %> 
            

<tr bgcolor="#CCFFFF">            
<td colspan="1"><b><%=i%>-</b></td>
<td colspan="2">
<%=reserva.getApellido().trim()%>

/<%=reserva.getNombre().trim()%>
</td>
<td>
<%=reserva.getTipo()%>
</td>
<td>
<%=reserva.getClase()%>
</td>
<td colspan="6">
       </td>
</tr>
<%}
//if (reserva.getBi()==0)
Valor+=reserva.getValor();
 Sc+=reserva.getSc();
Iva+=(reserva.getValor()+reserva.getCola())*porcentajeiva;
Seguro+=reserva.getSeguro();
Tasa+=reserva.getTasa();            
qq+=reserva.getCola();
%>
<tr>
<td colspan="5"><%=reserva.getOrigen()%>-<%=reserva.getDestino()%></td>
 <td align="right" ><%=f.format(reserva.getValor())%></td>
 <td align="right" ><%=f.format(reserva.getCola())%></td>
        <td align="right" ><%=f.format(reserva.getSc())%></td>
        <td align="right" ><%=f.format((reserva.getValor()+reserva.getCola())*porcentajeiva)%></td>
        <td align="right" ><%=f.format(reserva.getSeguro())%></td>
        <td align="right" ><%=f.format(reserva.getTasa())%></td>
        <td align="right" ><%=f.format(reserva.getTasa()+reserva.getSeguro()+reserva.getValor()+(reserva.getValor()+reserva.getCola())*porcentajeiva+reserva.getCola())%></td>
    </tr>  
            <%}}%>
            
<tr bgcolor="#5599FF">
<td colspan="5"><b>Totales</b>
</td>
<td align="right" ><%=f.format(Valor)%></td>
<td align="right" ><%=f.format(qq)%></td>
        <td align="right" ><%=f.format(Sc)%></td>
        <td align="right" ><%=f.format(Iva)%></td>
        <td align="right" ><%=f.format(Seguro)%></td>
        <td align="right" ><%=f.format(Tasa)%></td>
        <td align="right" ><%=f.format(Tasa+Seguro+Valor+Iva+qq)%></td>
 </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="643">
<tr class="form1">
<th colspan="11" >Forma de Pago</th>
</tr>

<tr >
<th colspan="1" >Tipo</th>
<th colspan="1">Documento</th>
 <th >Valor</th>
 <th >Observaciones</th>
 </tr>
<% List listfp= model.getFormasp();
String np="";
if (listfp != null) {
      Iterator itlistfp= listfp.iterator();
      while (itlistfp.hasNext()) {
          Foramapagos forma=(Foramapagos) itlistfp.next();
          String formatipo=forma.getTipo().trim();
          np="";
          if (formatipo.equals("EF"))
          {
              np="Efectivo";
              //obsefectivo=forma.getObservaciones();
          }
          else if (formatipo.equals("CJ"))
          {
              np="Canje";//=String.valueOf(forma.getValor());
              //proveedores=forma.getObservaciones();
          }
          else if (formatipo.equals("CH"))
          {
              np="Cheque";//=String.valueOf(forma.getValor());
              //obsch=forma.getObservaciones();
              //documentoch=forma.getDocumento();
          }
          else if (formatipo.equals("MP"))
          {
              np="Mpd";//=String.valueOf(forma.getValor());
              //obsmpd=forma.getObservaciones();
              //documentompd=forma.getDocumento();
          }
          else if (formatipo.equals("CR"))
          {
              np="Credito";//=String.valueOf(forma.getValor());
              //obscr=forma.getObservaciones();
              //documentocr=forma.getDocumento();
          }
          
          else if (formatipo.equals("OT"))
          {
              np="Otros";//=String.valueOf(forma.getValor());
              //obsotros=forma.getObservaciones();
              //documentootros=forma.getDocumento();
          }
           if (!formatipo.equals("PT"))
           {
          %>
          <tr class="vuelo">
          <td><%=np%></td>
          
          <td><%=forma.getDocumento()%></td>
          <td><%=forma.getValor()%></td>
          <td><%=forma.getObservaciones()%></td>
          </tr>
          
          <%}
          
      }
 }%>
<% List listtc= model.getTarjetas();
//list.size()+1;
//int clientesl[]=new int[x];
String Tc="";
String obstc="";
String q="";
if (listtc != null) {
      Iterator itlisttc= listtc.iterator();
      while (itlisttc.hasNext()) {
          Tarjetas tarjetas=(Tarjetas) itlisttc.next();
          q="";
          if (tarjetas.getTipo().equals("A"))
              q="American Express";
          if (tarjetas.getTipo().equals("D"))
              q="Dinners Club";
          if (tarjetas.getTipo().equals("V"))
              q="Visa";
          if (tarjetas.getTipo().equals("M"))
              q="Master Card";
          if (!q.equals(""))
          {
          %>
          <tr class="vuelo">
          <td><%=q%></td>
          <td><%=tarjetas.getNumero()%></td>
          <td><%=tarjetas.getValor()%></td>
          <td><%=tarjetas.getBaucher()%></td>
          </tr>
          <%}
          
      }
 }
%>

<form method="post" action="<%=CONTROLLER%>/Reservas/Confirmar"  
name="ConfirmarReservas"  
>
<tr>
<td align="center">
 <input  type="submit"  NAME="Salir" value="Terminar">
 </td>
 </tr>
 </form>

</table>
</div>
<%----------------------------------------
<p><a href="javascript:imprSelec('pta')">imprimir</a>  
------------------------------%>
</body>
</html>