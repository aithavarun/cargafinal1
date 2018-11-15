<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ page import="org.krysalis.barcode4j.webapp.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>
<% String moneda="USD";
String pais="ECU";
%>
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
                        new SimpleDateFormat("ddMMMM");
Cabecera contacto=model.getCabecera();
Usuarios usuario=model.getUsuarios();
int i=0;
int j=0;
int acceso=0;//model.AccesoCiudad(origen.trim().toUpperCase());
List listfp= model.getFormasp();
String ya="";
String documento="";
String obsefectivo="";
String obsch="";
String documentoch="";
String pagosrutas="";
float cotiz=1;
float porcentajeiva=12;
float equivalente=0;
int oneway=1;
float descuento=0;
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
	font-family: sans-serif, Helvetica, sans-serif;
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
var posy=-17.3;
var _h1 = "<html><head>";
var _h2 = "</head>";
var _b1 = "<body>";
var _b2 = "</div></body></html>";
//var _b3 = "</body></html>";
function imprSelec1(nombre)
{
var ficha = document.getElementById(nombre);
var ficha1 = document.getElementById('funcion');
var ficha2 = document.getElementById('inicio');
var ficha3 = document.getElementById('variables');
var ventimp = window.open(' ', 'popimpr');
ventimp.document.write(_h1+ficha1.innerHTML+_h2+_b1+ficha2.innerHTML+ficha3.innerHTML+ficha.innerHTML+_b2);
//ventimp.document.write( ficha1.innerHTML );
//ventimp.document.write( ficha2.innerHTML );
//ventimp.document.write(_h2+_b1);
//ventimp.document.write( ficha3.innerHTML );
//ventimp.document.write( ficha.innerHTML );
//ventimp.document.write( '</div>');
//ventimp.document.write('_b2');

ventimp.document.close();
ventimp.print( );
ventimp.close();
} 
function imprSelec(nombre)
{
var ficha = document.getElementById(nombre);
var ventimp = window.open(' ', 'popimpr');
ventimp.document.write( ficha.innerHTML );
ventimp.document.close();
ventimp.print( );
ventimp.close();
} 

</script>
</head>

<body bgcolor="#ffffff">

<script>
var posy=-17.3;

function poneposy(aumento)
{
    var posicion=posy+aumento;
    var xx=""+posicion;

    var yy="";
    yy="<div id='primeralinea' style='position:absolute; left:12cm;top:"+xx+"cm;font-size:10px; font-style:normal;'>";
    document.write(yy);
  
}

</script>

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
float sc=0;
int cuantos=0;

//String Impresion="ffdsfs"; 
j=0;
%>

<div id="principal" style=" @media:print;vertical-align:text-top; position:absolute; left:0cm; top:0cm; width:21.5cm; padding:0cm;  margin-left:0cm; 
margin-top:0cm; margin-bottom:0cm; margin-right:0cm; font-family:'sans-serif'; font-size:10px; font-style:normal;">



<%
long reservas=-1;  
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
            cuantos++;
            //origen=reserva.getOrigen();
            if (reserva.getValidez()==null)
                reserva.setValidez(hoy.getTime());
%>
<%
                   //}}
   if ((reservas!=reserva.getBoleto()) && (reservas > 0))
            { 
                posy+=0.4;
                jj++;
           //Impresion+="<p><a href=javascript:imprSelec('"+String.valueOf(reserva.getBoleto())+"')>"+ reserva.getApellido()+"/"+reserva.getNombre() +"</a></p>";
%>

<%-------------------------- retirar luego--------%>
<%@ include file="/Servlets/Boletodetalle.jsp"%>
<%-------------------------- retirar luego--------%>

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
                sc=0;
                pagosrutas="";
                descuento=0;
                 //posy=-5
                jj=0;
                posy=-0.4;
                origen=reserva.getOrigen();
            %> 

<div id="B<%=reserva.getBoleto()%>" style="position:absolute; left:0cm;top:<%=postotal%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <div id="origendestino<%=capa%>" style="position:absolute; left:12cm;top:9.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <span id="TTotal<%=capa%>">
        UIO-UIO
    </span>
    </div>
    <div id="cabecerafecha<%=capa%>" style="position:absolute; left:14.5cm;top:9.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
        AEROGAL-<%=FORMATOFECHA.format(hoy.getTime())%> 
    </div>
    <div id="cabeceranotend<%=capa%>" style="position:absolute; left:4cm;top:9.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
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
    <div id="cabeceranotendbr<%=capa%>" style="position:absolute; left:4cm;top:9.8cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
 <%if (usuario.getAcceso()==1)
         {%>
         BR=<%=model.getCotizacion()%>
         <%}%>
    </div>
    <div id="cabecerabooking<%=capa%>" style="position:absolute; left:12cm;top:9.8cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <%=contacto.getBooking()%>
    </div>
    <div id="cabeceraruc<%=capa%>" style="position:absolute; left:14.5cm;top:9.8cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
<%if (usuario.getAcceso()==1)
 {%>
    N.I.T.:900090331-2 <%=usuario.getNombre()%>
 <%}
else
{%>
    R.U.C.:1790727203001 <%=usuario.getNombre()%>
<%}%>
    </div>
    <div id="cabeceranit<%=capa%>" style="position:absolute; left:3cm;top:10cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
<% if(!contacto.getRuc().trim().equals(""))
  {%>
         <%if (usuario.getAcceso()==1)
         {%>
             N.I.T.:<%=contacto.getRuc()%> - Razon social:<%=contacto.getRazon()%>
         <%}
        else
        {%>
            R.U.C.:<%=contacto.getRuc()%> - Razon social:<%=contacto.getRazon()%>
        <%}%>

     
  <%}%> 
    </div>

    <div id="cabecerasucursal<%=capa%>" style="position:absolute; left:12cm;top:10.1cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <%=usuario.getSucursal()%>
    </div>

    <div id="cabeceraciudad<%=capa%>" style="position:absolute; left:14.5cm;top:10.1cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
<%if (usuario.getAcceso()==1)
 {%>
    BOGOTA - COLOMBIA
 <%}
else
{%>
    QUITO - ECUADOR 
<%}%>

    </div>


    <div id="cabeceranombre<%=capa%>" style="position:absolute; left:1cm;top:10.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <a href="javascript:imprSelec('B<%=String.valueOf(reserva.getBoleto())%>')"><%=reserva.getApellido()%>/<%=reserva.getNombre()%></a>
    </div>
    <div id="cabeceratour<%=capa%>" style="position:absolute; left:10cm;top:10.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <%=contacto.getTour()%> 
    </div>

   <%}
          
            else
                {
           
                 if (reserva.getSegurovias()==1)
                    reserva.setSeguro(0);
                if (reserva.getTasavias()==1)
                    reserva.setTasa(0);

            } 
   destino="";
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
  sc=reserva.getSc();
  descuento=(1-reserva.getDescuento())/100;
  if (q==0)
   pagosrutas+=reserva.getOrigen().trim()+" 2K "+String.valueOf(reserva.getValor())+" "+reserva.getDestino().trim()  + " 2K " ;   
  else
  pagosrutas+=reserva.getOrigen().trim()+" 2K "+String.valueOf(reserva.getValor())+" Q: "+String.valueOf(reserva.getCola())+" "+reserva.getDestino().trim()  + " 2K " ;//+ "ADC"+reserva.getSc();
  %>
    <div id="cabeceraviaje<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=model.EsCiudad(reserva.getOrigen().trim())%>
    </div>
    <div id="cabecera2k<%=capa%><%=jj%>" style="position:absolute; left:4.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                          
    2K
    </div>
<%if (!reserva.getNumero().trim().equals("OPEN"))
{
                     %>
    <div id="cabeceranumero<%=capa%><%=jj%>" style="position:absolute; left:5.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getNumero()%>
    </div>
    <div id="cabecerabase<%=capa%><%=jj%>" style="position:absolute; left:6.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getBase().trim().substring(0,1)%>
    </div>
    <div id="cabecerafechaviaje<%=capa%><%=jj%>" style="position:absolute; left:7.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(reserva.getFecha()).toUpperCase().substring(0,5)%>
    </div>
    <div id="cabecerahora<%=capa%><%=jj%>" style="position:absolute; left:8.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=f1.format(reserva.getHora())+":"+f1.format(reserva.getMinuto())%>
    </div>
    <div id="cabeceraok<%=capa%><%=jj%>" style="position:absolute; left:10cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OK
    </div>
    <div id="cabeceratarifabase<%=capa%><%=jj%>" style="position:absolute; left:11cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getBase()%>
    </div>
    <div id="cabeceradesde<%=capa%><%=jj%>" style="position:absolute; left:14.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(hoy.getTime()).toUpperCase().substring(0,5)%>
    </div>
    <div id="cabecerahasta<%=capa%><%=jj%>" style="position:absolute; left:16cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(reserva.getValidez()).toUpperCase().substring(0,5)%>
    </div>
    <div id="cabecera20<%=capa%><%=jj%>" style="position:absolute; left:17.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    20
    </div>
 
<%}
else
{%>
    <div id="cabecera" style="position:absolute; left:5.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getNumero()%>
    </div>
    <div id="cabecera" style="position:absolute; left:6.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getBase().trim().substring(0,1)%>
    </div>
    <div id="cabecera" style="position:absolute; left:7.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OPEN
    </div>
    <div id="cabecera" style="position:absolute; left:9.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OPEN
    </div>
    <div id="cabecera" style="position:absolute; left:10cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OPEN
    </div>
    <div id="cabecera" style="position:absolute; left:11cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getBase()%>
    </div>
    <div id="cabecera" style="position:absolute; left:14.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(hoy.getTime()).toUpperCase().substring(0,5)%>
    </div>
    <div id="cabecera" style="position:absolute; left:16cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(reserva.getValidez()).toUpperCase().substring(0,5)%>
    </div>
    <div id="cabecera" style="position:absolute; left:17.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    20
    </div>
    
<%}}}%> 
 <% posy+=0.4;
         jj++;
 %>         
<%-------------------------- retirar luego-------%>
<%@ include file="/Servlets/Boletodetalle.jsp"%>  


<%-------------------------- retirar luego--------%>
<%//}
if  (lista3.size()>0)  {%>
<%@ include file="/Servlets/Boletoinfante.jsp"%>    
<%}
%>  
</div>     
   
<p><a href="javascript:imprSelec('principal')">imprimir</a> 
<A HREF=" javascript: window.history. back() ">Salir</a> </p>

</body>
</html>













<%-------------------------------------------------%>
