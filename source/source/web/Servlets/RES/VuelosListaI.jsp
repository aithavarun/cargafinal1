<%@ page session="true" %>
<%@ page errorPage= "ErrorPage.jsp" %>
<%@ page import="com.aerogal.support.model.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<link rel="stylesheet" href="<%=BASEURL%>/estilo1.css">

<html>
<head>
<script LANGUAGE="JavaScript"> 

function validate(frm){
    if (frm.vueloIda.value=="-1")
    {
        alert("It must select a flight of departure");
        return false;
    }    
    if (frm.vueloVias.value=="2")
    {
        if (frm.vueloRetorno.value=="-1")
        {
            alert("It must select a flight of Return");
            return false;
        }
    }
    
   
   return true;
    
}
function AnteriorIda()
 {
    var cuando=new Date(<%=model.getIdaanio()%>,<%=model.getIdames()%>-1,<%=model.getIdadia()%>-1);
    var fecha=new Date();
    var vias=<%=model.getVias()%>;
    var sale =0;
   
     if (fecha >= cuando)
        {
            alert("The reserves must have 24 hours of anticipation");
            sale=1;
        }
     
     if (sale==0)
        {
            location="<%=CONTROLLER%>/VuelosListas/dias?acion=1&Idioma=100";
        }    
 }
 function AnteriorVuelta()
 {
    var cuando=new Date(<%=model.getIdaanio()%>,<%=model.getIdames()-1%>,<%=model.getIdadia()%>);
    var fecha=new Date();
    var vias=<%=model.getVias()%>;
    var sale =0;
    if (vias==2)
    {
        var fecha=new Date(<%=model.getVueltaanio()%>,<%=model.getVueltames()-1%>,<%=model.getVueltadia()%>);
         
        if (fecha <= cuando)
            {
                alert("It cannot leave after returning");
                sale=1;
             }
     }
     if (sale==0)
        {
            location="<%=CONTROLLER%>/VuelosListas/dias?acion=2&Idioma=100";
        }    
    
 }
function SiguienteIda()
 {
    var cuando=new Date(<%=model.getIdaanio()%>,<%=model.getIdames()-1%>,<%=model.getIdadia()%>);
    var fecha=new Date();
    var vias=<%=model.getVias()%>;
    var sale =0;
    if (vias==2)
    {
        var fecha=new Date(<%=model.getVueltaanio()%>,<%=model.getVueltames()-1%>,<%=model.getVueltadia()%>);
         
        if (fecha <= cuando)
            {
                alert("It cannot leave after returning");
                sale=1;
             }
     }
     if (sale==0)
        {
            location="<%=CONTROLLER%>/VuelosListas/dias?acion=3&Idioma=100";
        }    
    
 }
 function SiguienteVuelta()
 {
    location="<%=CONTROLLER%>/VuelosListas/dias?acion=4&Idioma=100";
    
 }
</SCRIPT>
<title>Aerogal Reservations</title>
</head>
<body bgcolor=#a0a0a0>
<%String Video=request.getParameter("Video");%>
<%@ include file="/WEB-INF/Banner.jsp"%>           
</table>   
<table border="0" width="780"  align="center" cellborder="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" >        
<tr>
<td align="center">

<form  method="post" name="VuelosLista"
            action="<%=CONTROLLER%>/VuelosLista/Seguir"
              onSubmit="return validate(this);">
<input name="vueloIda" value="-1" type= "hidden" >
<input name="vueloRetorno" value="-1" type= "hidden" >
<input name="nvueloIda" value="-1" type= "hidden" >
<input name="nvueloRetorno" value="-1" type= "hidden" >
<input name="Idioma" id="Idioma" value="100" type= "hidden" >
<input name="vueloVias" value="<%=model.getVias()%>" type= "hidden">
<%------------Empieza JSP----------------%>
<%------------Dibujos-------------------%>
<table border="0" cellpadding="0" cellspacing="0" width="420" align="center">
<!-- fwtable fwsrc="Forma.png" fwbase="Forma.gif" fwstyle="Dreamweaver" fwdocid = "108974853" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="25" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="369" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="26" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/VuelosI" src="<%=BASEURL%>/images/VuelosI.gif" width="420" height="51" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="51" border="0" alt=""></td>
  </tr>
  <tr>
   <td>
   <%--------------
<img name="<%=BASEURL%>/images/Forma_r2_c1" src="<%=BASEURL%>/images/Forma_r2_c1.gif" width="25" height="340" border="0" alt="">
  -------------------%>
</td>
<td align="center">
  <%------------------------------%>
<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<th>Passengers:</th>   
</table>
<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<td><%=model.getAdultos()%> - Adults</td>
<td ><%=model.getNinios()%>  - childrens </td>
<td ><%=model.getInfantes()%> - Infants  </td>
</tr>
</table>
<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<th align="center"> Departure Flight </th>
</table>
<%
     /* String mes;
      String anio=request.getParameter("IdaMes");
      String anio1;
      String diad=request.getParameter("IdaDia");
      */
      int ddia=model.getIdadia();
      int dmes=model.getIdames();
      int danio=model.getIdaanio();
      DecimalFormat f1 =new DecimalFormat("00");
      /*mes=anio.substring(0,anio.indexOf('-'));
      anio1=anio.substring(anio.indexOf('-')+1, anio.length());
      dmes=Integer.parseInt(mes);
      danio=Integer.parseInt(anio1);
      ddia=Integer.parseInt(diad);
      String fechaIda= String.valueOf(dmes) + "/" + String.valueOf(ddia) +"/" + String.valueOf(danio);
 *
      anio1=model.DiaSemana(ddia,dmes-1,danio);*/
      String anio1=model.DiaSemana(ddia,dmes-1,danio);
      String Origen=model.getNciudad(model.getOrigen());
      String Destino=model.getNciudad(model.getDestino());
      //String anio1=String.valueOf(ddia)+" dia "+String.valueOf(dmes)+" mes " +String.valueOf(danio);
%>

<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr><td >Departure : <%=Origen%> </td>
 <td>Arrival : <%=Destino%> </td></tr>
<tr><td > Date : <%=anio1%> </td><tr>
</table>

<table class="tablaborde"  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<tH align="center">Hour</th>
<th align="center">Flight N.</th>
<th align="center">Airplane</th>
</tr>

<%
   List list = model.getVuelos();
   String aux;
   int estilo=0;
   int cont=0;
   if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Vuelos vuelo=(Vuelos) it.next();
          cont++;
          //String strUrl=vuelo.getCodigo();
          //f1.format(reserva.getHora())+ ':' +  f1.format(reserva.getMinutos()) 
          //aux=vuelo.getHora();
          aux=f1.format(vuelo.getHorai())+':'+f1.format(vuelo.getMinuto());
          aux=aux.trim();
if (estilo==0){%>
<tr>
<td align="center">
<input class="lineablanca"
name="vueloID"
type="radio"
value="<%=vuelo.getCodigo()%>"
onclick="vueloIda.value='<%=vuelo.getCodigo()%>' ; nvueloIda.value='<%=vuelo.getNumero()%>'">


<%=aux%></td>
<td align="center"><%= vuelo.getNumero()%></td>
<td align="center"><%= vuelo.getAvion()%></td>   
</tr>
<% estilo=1;} 
else{%>
<tr>
<td align="center" class="tablablanca">
<input class="lineaazul"
name="vueloID"
type="radio"
value="<%=vuelo.getCodigo()%>"
onclick="vueloIda.value='<%=vuelo.getCodigo()%>' ; nvueloIda.value='<%=vuelo.getNumero()%>' ;">

<%=aux%></td>
<td class="tablablanca" align="center"><%= vuelo.getNumero()%></td>
<td class="tablablanca" align="center"><%= vuelo.getAvion()%></td>   
</tr>
              
<% estilo=0;
}%>

<% }} %>
<%if (cont==0)
{%>
<h2 ><FONT COLOR="red">Flight not found</FONT> </h2>
<%}%>

</table>
<table width='95%' border='0' cellpadding='0' cellspacing='0'>
 
  <tr>
  <td align="right" class='txt-arialch'>
  <input TYPE="BUTTON" NAME="AnteriorI" onClick=AnteriorIda() value="<- Previous Day"></td>
  <td align="right" class='txt-arialch'>
  <input TYPE="BUTTON" NAME="SigiuenteI" onClick=SiguienteIda() value="Next Day ->"></td>
  <tr></tr>
  </tr>
  <tr>
<td>&nbsp;</td>
</tr>
 <tr>
<td>&nbsp;</td>
</tr>
</table>
 <%-------------------------%>
<%----Regreso---%>



<% 
int viavia=model.getVias();
//String Vias=request.getParameter("vias");
//viavia=Integer.parseInt(Vias);      
if (viavia==2)
{
      
      /*anio1=request.getParameter("vueltaMes");
      String Anio;
      diad=request.getParameter("vueltaDia");
      mes=anio1.substring(0,anio1.indexOf('-'));
      Anio=anio1.substring(anio1.indexOf('-')+1, anio1.length());
      dmes=Integer.parseInt(mes);
      danio=Integer.parseInt(Anio);
      ddia=Integer.parseInt(diad);*/
      /*fechaIda=String.valueOf(dmes) + "/" + String.valueOf(ddia) +"/" + String.valueOf(danio);*/
      ddia=model.getVueltadia();
      dmes=model.getVueltames();
      danio=model.getVueltaanio();
      String anio2=model.DiaSemana(ddia,dmes-1,danio);
      cont=0;
      //String anio2=String.valueOf(ddia)+" dia "+String.valueOf(dmes)+" mes " +String.valueOf(danio);
%>


<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<th align="center"> Return flight </th>
</table>
<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<td>&nbsp;</td>
</tr>
<tr><td >Departure : <%=Destino%> </td>
 <td>Arrival : <%=Origen%> </td></tr>
<tr><td > Date : <%=anio2%> </td><tr>
</table>


<table class="tablaborde"  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<tH align="center">Hour</th>
<th align="center">Flight N.</th>
<th align="center">Airplane</th>
</tr>

<%
   List list1 = model.getVuelosR();
   String aux1;
   int estilo1=0;
   
   if (list != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
         //request.setAttribute("codigo", it.next());
         cont++;
          Vuelos vuelo1=(Vuelos) it1.next();
          //String strUrl1=vuelo1.getCodigo();
          //aux1=vuelo1.getHora();
          aux1=f1.format(vuelo1.getHorai())+':'+f1.format(vuelo1.getMinuto());
          aux1=aux1.trim();
if (estilo1==0){%>
<tr>
<td align="center">
<input class="lineablanca"
name="vueloIDR"
type="radio"
value="<%=vuelo1.getCodigo()%>"
onclick="vueloRetorno.value='<%=vuelo1.getCodigo()%>' ; nvueloRetorno.value='<%=vuelo1.getNumero()%>';"
><%=aux1%></td>
<td align="center"><%= vuelo1.getNumero()%></td>
<td align="center"><%= vuelo1.getAvion()%></td>   
</tr>
<% estilo1=1;} 
else{%>
<tr>
<td align="center" class="tablablanca">
<input class="lineaazul"
name="vueloIDR"
type="radio"
value="<%=vuelo1.getCodigo()%>"
onclick="vueloRetorno.value='<%=vuelo1.getCodigo()%>' ; nvueloRetorno.value='<%=vuelo1.getNumero()%>';"
><%=aux1%></td>
<td class="tablablanca" align="center"><%= vuelo1.getNumero()%></td>
<td class="tablablanca" align="center"><%= vuelo1.getAvion()%></td>   
</tr>
              
<% estilo1=0;
}%>

<% }} 
if (cont==0)
{%>
<h2 ><FONT COLOR="red"> Flight of Return nonavailable</FONT> </h2>
<%}%>
</table>
<table width='95%' border='0' cellpadding='0' cellspacing='0'>
 <tr></tr>
  <tr>
  <td align="right" class='txt-arialch'>
  <input TYPE="BUTTON" NAME="AnteriorI" onClick=AnteriorVuelta() value="<- Previous Day"></td>
  <td align="right" class='txt-arialch'>
  <input TYPE="BUTTON" NAME="SigiuenteI" onClick=SiguienteVuelta() value="Next Day ->"></td>
  <tr></tr>
  </tr>
  </table>

<%}%>



<%----Botones----------%>
 
 

  
<table width='95%' border='0' cellpadding='0' cellspacing='0'>
  <td height="10" valign="top" class='txt-arialch'>&nbsp;</td>
  <td height="10" valign="top" class='txt-arialch'>&nbsp;</td>
  <td align="center" class='txt-arialch'>
  <input TYPE="SUBMIT" NAME="Send"  value="Continue">
  </form></td>
  </tr>
</table>


<%---------------------Dibujos---------------------%>
</td>
<td background="<%=BASEURL%>/images/Forma_r2_c3.gif">
<%------------------
<img name="<%=BASEURL%>/images/Forma_r2_c3" src="<%=BASEURL%>/images/Forma_r2_c3.gif" width="26" height="340" border="0" alt="">
---------------------%>
</td>
   <td><img src="spacer.gif" width="1" height="340" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/Forma_r3_c1" src="<%=BASEURL%>/images/Forma_r3_c1.gif" width="420" height="29" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="29" border="0" alt=""></td>
  </tr>
</table>
</form>
</td>
<%-------------Ayuda---------------%>
<td valign="top">
<table border="0" cellpadding="0" cellspacing="0" width="320"  >
<!-- fwtable fwsrc="Ayuda.png" fwbase="Ayuda.gif" fwstyle="Dreamweaver" fwdocid = "1278664230" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="25" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="268" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="27" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
<tr>
   <td rowspan="2" background="<%=BASEURL%>/images/Ayuda_r1_c1.gif" >
   <%----
    <img name="<%=BASEURL%>/images/Ayuda_r1_c1" src="<%=BASEURL%>/images/Ayuda_r1_c1.gif" width="25" height="404" border="0" alt="">
    ---%>
   </td>
   
   <td colspan="3"><img name="<%=BASEURL%>/images/Ayuda_r1_c2" src="<%=BASEURL%>/images/Ayuda_r1_c2.gif" width="295" height="20" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="20" border="0" alt=""></td>
  </tr>
  <tr>
   <td bgcolor="#FFFFCC"
   aling="justify">
       Please it selects to the itinerary of its trip choosing the hour of the flight that you wish to reserve. The bellboys by day following and previous Day allow to change the date him of the trip. When the date of the itinerary is chosen please presses the button to continue. 
  </td>
  <td colspan="2" background="<%=BASEURL%>/images/Ayuda_r2_c3.gif"></td> 
   <%---<td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="286" border="0" alt=""></td>---%>
  </tr>
  <tr>
  
   <td colspan="3"><img name="<%=BASEURL%>/images/Ayuda_r3_c1" src="<%=BASEURL%>/images/Ayuda_r3_c1.gif" width="320" height="98" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="98" border="0" alt=""></td>
  </tr>
</table>

</td>
</tr>

</table>
<%---------------Ciuudades
</div> 
<DIV STYLE="position:absolute; top:155px; left:500px; width:350px;"> 
<%-----<%@ include file="/Servlets/CUE.jsp"%>             -----%>
<%---------------
<table class="tablaborde"  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<tH align="center"><%=model.getNciudad(Origen)%></th>
</tr>
<TR>
<TD>
<img src="<%=BASEURL%>/images/<%=Origen%>.png" width="350px"  height="262.5px"> 
</TD>
</TR>
</TABLE>
<table class="tablaborde"  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<tH align="center"><%=model.getNciudad(Destino)%></th>
</tr>
<TR>
<TD>
<img src="<%=BASEURL%>/images/<%=Destino%>.png" width="350px"  height="262.5px"> 
</TD>
</TR>
</TABLE>


</div>
----------------------%>   
<%---------------
<DIV STYLE="position:absolute; top:150px; left:270px; width:500px;align=right;">
    
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400"align="right">
        <param name="movie" value="<%=BASEURL%>/respaldos/itinerarios.swf">
        <param name="quality" value="high">
        <embed src="<%=BASEURL%>/respaldos/itinerarios.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"align="right"></embed>
      </object>
   
    </div>
 ----------------------%>   
</body>
</html>

