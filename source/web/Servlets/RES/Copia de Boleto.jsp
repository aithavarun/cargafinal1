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
bcrequest.setFormat("jpeg");
bcrequest.setResolution("150");
bcrequest.setMsg("87879879");
String genbc = "http://www.aerogal.com.ec/barcode4j/"+bcrequest.toURL();
%>
<% 
Calendar hoy = Calendar.getInstance();
DecimalFormat f =new DecimalFormat("0.00");
DecimalFormat f1 =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("yy-MM-dd");
Cabecera contacto=model.getCabecera();
Usuarios usuario=model.getUsuarios();
int i=0;
int j=0;

List listfp= model.getFormasp();
String ya="";
String documento="";
String obsefectivo="";
String obsch="";
String documentoch="";
String pagosrutas="";
float platas=0;
if (listfp != null) {
      Iterator itlistfp= listfp.iterator();
      while (itlistfp.hasNext()) {
          Foramapagos forma=(Foramapagos) itlistfp.next();
          String formatipo=forma.getTipo().trim();
          if (formatipo.equals("EF"))
          {
              
              obsefectivo=forma.getObservaciones();
          }
          else if (formatipo.equals("CJ"))
          {
              
              ya+=" " + forma.getObservaciones();
          }
          else if (formatipo.trim().equals("CH"))
          {
              
              obsch=forma.getObservaciones();
              documento+="CH"+forma.getDocumento()+"-"+forma.getObservaciones();
          }
          else if (formatipo.equals("MP"))
          {
              
              ya+=" " + forma.getObservaciones();
              documento+=" "+forma.getDocumento();
          }
          else if (formatipo.equals("CR"))
          {
              
              ya+=" " + forma.getObservaciones();
              documento+=" "+forma.getDocumento();
          }
          else if (formatipo.equals("PT"))
          {
              
              ya+=" " + forma.getObservaciones();
              documento+=" "+forma.getDocumento();
          }
          else if (formatipo.equals("OT"))
          {
              
              ya+=" " + forma.getObservaciones();
              documento+=" "+forma.getDocumento();
          }
          %>
          <%
          
      }
 }
List listtc= model.getTarjetas();
//list.size()+1;
//int clientesl[]=new int[x];
String Tc="";
String obstc="";
String q1="";
if (listtc != null) {
      Iterator itlisttc= listtc.iterator();
      while (itlisttc.hasNext()) {
          Tarjetas tarjetas=(Tarjetas) itlisttc.next();
          
          //x=cliente.getContribuyente();
          //clientesl[y]=cliente.getCodigo();
          
          if (tarjetas.getValor()>0)
          {
          //tc[conttc]=String.valueOf(tarjetas.getValor());
          if (tarjetas.getTipo().trim().equals("A"))
              q1="American Express";
          if (tarjetas.getTipo().trim().equals("D"))
              q1="Dinners Club";
          if (tarjetas.getTipo().trim().equals("V"))
              q1="Visa";
          if (tarjetas.getTipo().trim().equals("M"))
              q1="Master Card";
          
          Tc+=" - "+tarjetas.getBaucher();
          //tcn[conttc]=String.valueOf(tarjetas.getNumero());
          obstc+="CC "+ q1 + " - " + tarjetas.getNumero();
          }
          %>
          <%
          
      }
 }
documento+=obstc;
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

</head>
<body bgcolor="#ffffff">
<%
List lista2 = model.getReservaestado();
List lista3 = model.getTarifainante();
//List lista = model.getVueloreserva();
int total=(lista2.size())+1;
int margen=(lista2.size())*18;
//String TarifaString[]= new String[total+1];
double postotal=-17.3;
int capa=0;
float seguro=0;
float tasa=0;
float valor=0;
float q=0;
float valormasq=0;
float iva=0;
j=0;
%>
<div id="principal"    
style="@media:print; vertical-align:text-top; position:absolute; left:0; top:0; width:21.5cm; padding:0;  margin-left:0; 
margin-top:0; margin-bottom:0; margin-right:0; font-family:'Times New Roman'; font-size:10px; font-style:normal;   " >

<%
long reservas=0;  
double posy=-0.4;
String destino="";
   int jj=0;
   pagosrutas="";
   platas=0;
   float segunda=0;//;reserva.getValor();
   String origen="";//reserva.getOrigen();
%>
<%   
  if  (lista2 != null)  {
      Iterator itr = lista2.iterator();
      while (itr.hasNext()) {
            Tarifasreservas reserva=(Tarifasreservas) itr.next();
            i++;
            //TarifaString[i]=reserva.getBase();
            segunda=reserva.getValor();
            //origen=reserva.getOrigen();
            
%>
<%
                   //}}
   if ((reservas!=reserva.getBoleto()) && (reservas > 0))
            { 
                posy+=0.4;
                jj++;
           
%>

<%@ include file="/Servlets/Boletodetalle.jsp"%>
<%}%>

<%
            //if (reservas!=reserva.getReservacodigo())
            if (reservas!=reserva.getBoleto())
            {
                i=0;
                platas=0;
                reservas=reserva.getBoleto();
                postotal+=17.3;
                capa++;    
                seguro=0;
                tasa=0;
                valor=0;
                q=0;
                iva=0;
                pagosrutas="";
                 //posy=-5
                jj=0;
                posy=-0.4;
                origen=reserva.getOrigen();
            %> 

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

   <%}
   
   destino="";
   //jj=0;
   //pagosrutas="";
   
   segunda=reserva.getValor();
   
     posy+=0.4  ; 
      j++; 
       jj++;
  seguro+=reserva.getSeguro();
  tasa+=reserva.getTasa();
  valor+=reserva.getValor()*(1-reserva.getDescuento()/100);
  q+=reserva.getCola();
  iva+=reserva.getIva()*(1-reserva.getDescuento()/100);
  destino=reserva.getDestino(); 
  platas+=(reserva.getValor()*(1-reserva.getDescuento()/100)+reserva.getCola());
  if (q==0)
   pagosrutas+=reserva.getOrigen().trim()+" 2K "+String.valueOf(reserva.getValor())+" "+reserva.getDestino().trim()  + " 2K " ;   
  else
  pagosrutas+=reserva.getOrigen().trim()+" 2K "+String.valueOf(reserva.getValor())+" Q: "+String.valueOf(reserva.getCola())+" "+reserva.getDestino().trim()  + " 2K " ;
  /*
   if  (lista != null)  {
                    Iterator itv = lista.iterator();
                   while (itv.hasNext()) {
                        Vuelosreserva vuelo=(Vuelosreserva) itv.next();
      
                 //posy+=0.4  ;                            
                 destino=vuelo.getDestino();        
                 pagosrutas+=reserva.getOrigen().trim()+" 2K "+String.valueOf(reserva.getValor())+reserva.getDestino().trim() +" 2K ";
                         platas+=reserva.getValor();
                   }}*/%>
<div id="cabecera" style="position:absolute; left:0.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
  <%=reserva.getOrigen()%>
</div>
<div id="cabecera" style="position:absolute; left:4.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                          
2K
</div>
<%if (!reserva.getNumero().trim().equals("OPEN"))
{
                     %>

<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=reserva.getNumero()%>
</div>
<div id="cabecera" style="position:absolute; left:6.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=reserva.getBase().trim().substring(0,1)%>
</div>
<div id="cabecera" style="position:absolute; left:7.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=FORMATOFECHA.format(reserva.getFecha())%>
</div>
<div id="cabecera" style="position:absolute; left:8.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=f1.format(reserva.getHora())+":"+f1.format(reserva.getMinuto())%>
</div>
<div id="cabecera" style="position:absolute; left:10cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
OK
<%------------------------
<%=reserva.getEstado()%>
-----------%>
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
else
{%>
<div id="cabecera" style="position:absolute; left:5.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=reserva.getNumero()%>
</div>
<div id="cabecera" style="position:absolute; left:6.5cm;top:<%=postotal+12+posy%>cm ;font-family:'Times New Roman'; font-size:10px; font-style:normal;">                        
<%=reserva.getBase().trim().substring(0,1)%>
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

<%---------------
<%@ include file="/Servlets/BoletoInd.jsp"%>
<span lang=ES-EC style='font-size:12.0pt;font-family:"Times New Roman";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:ES-EC;mso-fareast-language:
ES;mso-bidi-language:AR-SA'><br clear=all style='mso-special-character:line-break;page-break-before:always'>
</span>

------------------%>
<%}}}%> 
 <% posy+=0.4;
         jj++;%>
<%@ include file="/Servlets/Boletodetalle.jsp"%>  
<%
if  (lista3.size()>0)  {%>
<%@ include file="/Servlets/Boletoinfante.jsp"%>                
<%}
%>       
</div>            
<%--------------------------

<%@ include file="/Servlets/Boletodetalle.jsp"%>
<script language="JavaScript"> 
graba();
function graba()
{
 var nombre="";
 <%
 for (i=1;i<=total-1;i++)
 {%>
   nombre="Base<%=i%>";
    document.getElementById("Base<%=i%>").innerHTML="<%=TarifaString[i]%>" ;
 <%}%>
 }
 </script>
 <%--------------------
<form method="post" action="<%=CONTROLLER%>/Reservas/Confirmar"  
name="ConfirmarReservas"  
>
<tr>
<td align="center">
 <input  type="submit"  NAME="Salir" value="Terminar">
 </td>
 </tr>
 </form>
-----------%>
</body>
</html>













<%-------------------------------------------------%>
