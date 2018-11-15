<%@ page session="true" %>
<%@ page errorPage= "ErrorPage.jsp" %>
<%@ page import="com.aerogal.support.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<link rel="stylesheet" href="<%=BASEURL%>/estilo1.css">

<html>
<head>
<script LANGUAGE="JavaScript"> 
function alerta()
        {
         alert("Opción no disponible por el momento, por favor intentelo mas tarde");
        }
	function ValidateForm () {
        <%---------
            var doSubmit = true;

        if(isNaN(parseFloat(document.VuelosLista.totalAmount.value)) || parseFloat(document.VuelosLista.totalAmount.value) <= 0)
        {
        }

        if(isNaN(parseFloat(document.VuelosLista.invoiceNumber.value)) || parseFloat(document.VuelosLista.invoiceNumber.value) <= 0)
        {
        }

        if(doSubmit ==  true) 
            document.VuelosLista.submit();
	}
	function redondear(valor)
	{
	return Math.round(valor,2);
	alert (Math.round(valor,2));
	-------------%>
	
	
	alert("Remember your Booking Reference ("+ "<%=model.getBooking()%>" +") it will allow him to locate it within the system");
	return true;
	}



</SCRIPT>
<title>.:Aerogal:.</title>
</head>
<body bgcolor=#a0a0a0>

<%String Video=request.getParameter("Idioma");%>

<%@ include file="/WEB-INF/Banner.jsp"%>  
</table>   
<table border="0" width="780"  align="center" cellborder="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" >        

<td align="center" valign="top">


<%------<form  method="post" name="VuelosLista"
            action="Terminar"
              onSubmit="return ValidateForm();">
              ------%>
<input name="Video" id="Idioma" value="0" type= "hidden" >
<input name="vueloVias" value="<%=model.getVias()%>" type= "hidden">
<%-------<input name="vueloVias" value="<%=request.getParameter("vias")%>" type= "hidden">
------------Empieza JSP----------------%>
<% String aux=model.getOrigen();
   String aux1;
   String destino=model.getDestino();
   DecimalFormat f1 =new DecimalFormat("00");
   int pago=model.Pagado(model.getBooking());
if(aux!=null)
{
    
%>

<%-------------Empieza Graficos----------------%>
<table border="0" cellpadding="0" cellspacing="0" width="420" align="center">
<!-- fwtable fwsrc="Forma.png" fwbase="Forma.gif" fwstyle="Dreamweaver" fwdocid = "108974853" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="25" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="369" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="26" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/Forma_r1_c1" src="<%=BASEURL%>/images/Final.gif" width="420" height="51" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="51" border="0" alt=""></td>
  </tr>
   
  <tr>
   <td>
  
<img name="<%=BASEURL%>/images/Forma_r2_c1" src="<%=BASEURL%>/images/Forma_r2_c1.gif" width="25" height="340" border="0" alt="">
  
</td>
  
  
<td align="center">
  <%------------------------------%>

<%-------------fin Graficos----------------%>
<table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">

<h4 align="left">Booking reference : <%=model.getBooking()%></h4>

<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<td><%=model.getAdultos()%> - Adults</td>
<td ><%=model.getNinios()%>  - Childrens  </td>
<td ><%=model.getInfantes()%> - Infants  </td>
<%----------<td ><%=request.getParameter("nAdultos")%> - Adultos</td>
<td > <%=request.getParameter("nNinos")%>  - Ni&ntilde;os  </td>
<td > <%=request.getParameter("nInfantes")%> - Infantes  </td>
------------%>
</table>
<%-----------<h4 align="left"> Tarifa : <%=request.getParameter("Tarifa")%>  </h4>---%>
<h3 align="center"> Departure Flight  </h3>
<%
     
     
     String anio1=model.DiaSemana(model.getIdadia(),model.getIdames()-1,model.getIdaanio());
%>
<%--------------<input name="fechaIda" value="<%=fechaIda%>" type= "hidden" >----%>
<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr><td >Departure : <%=model.getNciudad(model.getOrigen())%> </td>
 <td>Arrival : <%=model.getNciudad(model.getDestino())%> </td></tr>
<tr><td > Date : <%=anio1%> </td><tr>
</table>
<%if (model.getVias()==2)
{%>
<h3 align="center"> Return Flyght  </h3>
<%
     
     
     anio1=model.DiaSemana(model.getVueltadia(),model.getVueltames()-1,model.getVueltaanio());
%>
<%--------------<input name="fechaIda" value="<%=fechaIda%>" type= "hidden" >----%>
<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr><td >Departure : <%=model.getNciudad(model.getDestino())%> </td>
 <td>Arrival : <%=model.getNciudad(model.getOrigen())%> </td></tr>
<tr><td > Date : <%=anio1%> </td><tr>

</table>
<% }}
else
{%>
<table border="0" cellpadding="0" cellspacing="0" width="420" align="center">
<!-- fwtable fwsrc="Forma.png" fwbase="Forma.gif" fwstyle="Dreamweaver" fwdocid = "108974853" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="25" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="369" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="26" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/Forma_r1_c1" src="<%=BASEURL%>/images/Final.gif" width="420" height="51" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="51" border="0" alt=""></td>
  </tr>
   
  <tr>
   <td>
  
<img name="<%=BASEURL%>/images/Forma_r2_c1" src="<%=BASEURL%>/images/Forma_r2_c1.gif" width="25" height="340" border="0" alt="">
  
</td>
  
  
<td align="center">
  <%------------------------------%>

<%-------------fin Graficos----------------%>
<table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">

<h4 align="left">Booking Reference : <%=model.getBooking()%></h4>
<table width='100%' border="0" align="center" cellpadding="1" cellspacing="1" >
<tr>
<th>ITINERARIES</th>
</tr>
</table>
<table width='100%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<tH align="center">Num</th>
<tH align="center">Departure</th>
<th align="center">Arrival</th>
<th align="center">Flight</th>
<tH align="center">Date</th>
<th align="center">Hour</th>
</tr>

    <%List listk = model.getReservas();
                
                //int estilo=0;
                int contador=0;%>
                <%
                if (listk != null) {%>
                <%
                    Iterator itk = listk.iterator();%>
                    <%
                    while (itk.hasNext()) {
                        Reservaciones reserva=(Reservaciones) itk.next();
                        aux1=reserva.getEstado();
                        aux1=aux1.toUpperCase();
                        aux1=aux1.trim();
                        aux="tablaborde";
                         contador++;
                        if (contador > 2)
                            continue;
                        //aux=vuelo.getHora();
                         //aux=aux.trim();
                        aux1=model.DiaSemana(reserva.getDia(),reserva.getMes()-1,reserva.getAnio());
                        //aux1=""+
                        //String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?booking="+reserva.getBooking()+"&vias="+reserva.getVias() ;
%>
<tr>
<td class="<%=aux%>"   align="center"><%=contador  %></td>
<td class="<%=aux%>" align="center"><%=model.getNciudad(reserva.getOrigen())%></td>
<td class="<%=aux%>" align="center"><%=model.getNciudad(reserva.getDestino())%></td>
<td class="<%=aux%>" align="center"><%=reserva.getNumero() %></td>
<td class="<%=aux%>" align="center"><%=aux1%></td>
<td class="<%=aux%>" align="center"><%= f1.format(reserva.getHora())+ ':' +  f1.format(reserva.getMinutos()) %></td>

</tr>           
<%}}%>
</table>

<%}%>

<table class="tablaborde"  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<th align="center"> Values </ht>
</table>
<table class="tablaborde"  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<tH align="center">Name</th>
<th align="center">Fare</th>
<th align="center">Tax Iva</th>
<tH align="center">Tax</th>
<th align="center">Insurance</th>
<th align="center">Total</th>

</tr>



<%


%>





<%
   List list = model.getTarifasi();
   //String aux;
   //String aux1;
   double TotalT=0.0;
   double TotalI=0.0;
   DecimalFormat f =new DecimalFormat("0.00");
   int estilo=0;
   if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Tarifas tarifa=(Tarifas) it.next();
          //String strUrl=vuelo.getCodigo();
          aux1=tarifa.getNombre();
          //aux1=aux1.toLowerCase();
  if(aux1!=null)
{
    aux=tarifa.getNombre();          
    
}
    else
    {
    aux="Total";
    TotalT=tarifa.getTotal();
    TotalI+=tarifa.getIva();
}        
if (estilo==0){%>
<tr class="lineablanca">
<td align="center"><%=aux%></td>
<td align="center"><%= f.format(tarifa.getValor())%></td>
<td align="center"><%= f.format(tarifa.getIva())%></td>   
<td align="center"><%= tarifa.getTasa()%></td>   
<td align="center"><%= tarifa.getSeguro()%></td>   
<td align="center"><%= f.format(tarifa.getTotal())%></td>   

</tr>
<% estilo=1;} 
else{%>
<tr>
<td class="tablablanca" align="center"><%=aux%></td>
<td class="tablablanca" align="center"><%= f.format(tarifa.getValor())%></td>
<td class="tablablanca" align="center"><%= f.format(tarifa.getIva())%></td>   
<td class="tablablanca" align="center"><%= tarifa.getTasa()%></td>   
<td class="tablablanca" align="center"><%= tarifa.getSeguro()%></td>   
<td class="tablablanca" align="center"><%=  f.format(tarifa.getTotal())%></td>   
</tr>
              
<% estilo=0;
}%>

<% }} %>
</table>


<%------------Infantes --------------%>
<%
   List list1 = model.getTarifasif();
   String auxi;
   String auxi1;
   int infG=0;
   //DecimalFormat f =new DecimalFormat("0.00");
   estilo=0;
   if (list != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          Tarifas tarifa=(Tarifas) it1.next();
          //String strUrl=vuelo.getCodigo();
          infG++;
          auxi1=tarifa.getNombre();
          //aux1=aux1.toLowerCase();
  if(auxi1!=null)
{
    auxi=tarifa.getNombre();          
    
}
    else
    {
    auxi="Total Infants";
    TotalT+=tarifa.getTotal();
    TotalI+=tarifa.getIva();
}        
          
if (estilo==0){%>
<%if (infG==1)
{%>
<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<h3 align="center">  Valores  Infantes </h3>
<%}%>
<tr >
<td class="lineablanca" align="center"><%=auxi%></td>
<td class="lineablanca" align="center"><%= f.format(tarifa.getValor())%></td>
<td class="lineablanca" align="center"><%= f.format(tarifa.getIva())%></td>   
<td class="lineablanca" align="center"><%= tarifa.getTasa()%></td>   
<td class="lineablanca" align="center"><%= tarifa.getSeguro()%></td>   
<td class="lineablanca" align="center"><%= f.format(tarifa.getTotal())%></td>   

</tr>
<% estilo=1;} 
else{%>
<tr>
<td class="tablablanca" align="center"><%=auxi%></td>
<td class="tablablanca" align="center"><%= f.format(tarifa.getValor())%></td>
<td class="tablablanca" align="center"><%= f.format(tarifa.getIva())%></td>   
<td class="tablablanca" align="center"><%= tarifa.getTasa()%></td>   
<td class="tablablanca" align="center"><%= tarifa.getSeguro()%></td>   
<td class="tablablanca" align="center"><%=  f.format(tarifa.getTotal())%></td>   
</tr>
            
<% estilo=0;
}%>

<% }} %>
<%--Total Final----------%>

<%------------%>
<%if (infG!=0)
{%>
</table>
<%}%>
<table  width='95%' border='0' cellpadding='2' cellspacing='2' align="center">
<td align="right">
   <h1><font color="red">Total Tax IVA = <%= f.format(TotalI)%> </FONT></H1>
</td>
</tr>  
<tr>
<td align="right">
   <h1><font color="red">Total Reservations = <%= f.format(TotalT)%></FONT></H1>  
</td>  
</tr>
</table>
<table  width='100%' border="0"  cellpadding="0" cellspacing="0">
<TR>
<TD ALIGN="JUSTIFY" class="tablablanca">
<font size=".002pt">

To you to make the payment of the values generated by the reserve, implicitamente is accepting
<a  HREF="/Aerogal/Servlets/contrato.html" target="_blanck" style="color:red;">Terms and Conditions</a> of the national aerial transportation
</font>
</td>
</TR>
<tr>
<TD ALIGN="JUSTIFY" class="tablablanca">
&nbsp;
</td>
</tr>

<%--------------
<tr>

  <td height="10" valign="top" class='txt-arialch'>&nbsp;</td>
  <td height="10" valign="top" class='txt-arialch'>&nbsp;</td>
  
  <td align="center" class='txt-arialch'>
  <input TYPE="SUBMIT" NAME="Send"  value="Terminar">
  </td>
  
  
  </tr>
  ------------------------%>
  </table>
  


<%if (pago==0)
{%>
  <%-------------Todo Uno ----------------%>
<INPUT TYPE=hidden NAME='extra' VALUE='Todo1 version 2'>
<INPUT TYPE=hidden NAME='tax' VALUE="2.36">
<INPUT TYPE=hidden NAME='invoiceNumber' VALUE="0">
<INPUT TYPE=hidden NAME='totalAmount' VALUE="0">
<table  class="tablaborde" width="100%" border="0" cellspacing="1" cellpadding="2" align="center">
	<tr align="center">
		<td align="center"><IMG src="<%=BASEURL%>/images/epagos_diners.gif" border="0" alt=""></TD>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</TABLE>


<%!
	int invNum=900;
%>
<%
        String items = "una lechuga, dos tomates, tres zanahorias";
	String invoiceNumber = model.getBooking();//request.getParameter("invoiceNumber");
	String totalAmount = String.valueOf(Math.rint(TotalT*100)/100);//request.getParameter("totalAmount");
	String tax = String.valueOf(Math.rint(TotalI*100)/100);//request.getParameter("tax");
	String extra = "Todo1 version 2";//request.getParameter("extra");
	String date = new java.util.Date().toString();
        String path="/usr/local/jakarta-tomcat/webapps/Aerogal/WEB-INF/lib/Todo1.jar";
        String url="https://www5.todo1.com/todo1v2/FrontServlet";
       //String url="https://208.62.245.139/todo1v2/FrontServlet";
        //String path="/Tomcat4/webapps/Aerogal/WEB-INF/lib/Todo1.jar";//"/usr/local/jakarta-tomcat/webapps/Aerogal1/WEB-INF/lib/Todo1.jar";
%>
<%@ taglib uri = "/WEB-INF/lib/META-INF/taglib.tld" prefix = "todo1"%>
<p align = "center">Select the Bank in which it wishes to pay:</p>

<TABLE  class="tablaborde" align="center" border=0 width="60%">
<TR>
<TH colspan =4 align="center">
Pague en: 
</TH>

</TR>
<TR>
<%---
<TD>
Banco Pichincha Debitcard payment
</TD>
---%>
<TD align = "center">
<IMG src="<%=BASEURL%>/images/diners2.gif" border="0" alt="">
</TD>

<TD align = "center">
<IMG src="<%=BASEURL%>/images/logo_visa.gif" border="0" alt="">
</TD>
<%--------------Botones mios ------------
<tr>

<TD align = "center"><input TYPE="SUBMIT" NAME="Send"  value="e-pagos" onclick="alerta()"></td>
<TD align = "center"><input TYPE="SUBMIT" NAME="Send"  value="e-pagos" onclick="alerta()"></td>
</tr>
</TABLE>
<%-------------Fin Botones Mios------------%>
<%------------------------Botones de todouno-------------------%>
</TR>
<!--   serverUrl="http://msfv.todo1.com/NASApp/todo1v2/FrontServlet" -->
<!--   serverUrl="http://208.62.245.139/NASApp/todo1v2/FrontServlet" -->
<!--   serverUrl="http://192.168.57.35/NASApp/todo1v2/FrontServlet" -->
<!--   serverUrl="http://192.168.57.205/NASApp/todo1v2/FrontServlet" -->
<!--   serverUrl="http://192.168.32.10/NASApp/todo1v2/FrontServlet" -->
 <!-- tax = "<%= tax%>" -->
<!--  extra = "<%= extra%>" -->
<TR>
<%-----%>
<%-----"/usr/local/jakarta-tomcat/webapps/Aerogal1/WEB-INF/lib/Todo1.jar"---%>
<TD align = "center">
<todo1:dinnersClubButton  
  serverUrl="https://www5.todo1.com/todo1v2/FrontServlet"
  path = "<%=path%>"
 invoiceNumber = "<%= invoiceNumber%>"
  tax = "<%= tax%>" 
  extra = "<%= extra%>" 
  totalAmount = "<%= totalAmount %>"/>
  <jsp:useBean 
   id="banco" 
   class="com.aerogal.support.model.Todo1" >
   </jsp:useBean>    
   <jsp:setProperty
     name="banco"
     property="invoiceNumber"
   value="this.invoiceNumber.value"/>
</TD>


<%----
<tr>
<TD>
<IMG src="<%=BASEURL%>/images/diners2.gif" border="0" alt=""></TD>
</TD>
---%>
<%--------------------------botonesdetodouno
<TD align = "center">
<todo1:dinnersClubButton  
  serverUrl="https://208.62.245.139/todo1v2/FrontServlet"
  path = "<%=path%>"
  invoiceNumber = "<%= invoiceNumber%>"
  tax = "<%= tax%>" 
  extra = "<%= extra%>" 
  totalAmount = "<%= totalAmount %>"/>
</TD>
<%----
</tr>
<tr>
<TD>
<IMG src="<%=BASEURL%>/images/logo_visa.gif" border="0" alt=""></TD>
</TD>
---%>
<%--------------------------botonesdetodouno ----%>
<TD align = "center">
<todo1:visaButton 
  serverUrl="https://www5.todo1.com/todo1v2/FrontServlet"
  path ="<%=path%>"
  invoiceNumber = "<%= invoiceNumber %>"
  tax = "<%= tax%>" 
  extra = "<%= extra%>" 
  totalAmount = "<%= totalAmount %>"/>
</TD>

</tr>
</table>
<form  method="post" name="VuelosLista"
            action="Terminar"
              onSubmit="return ValidateForm();">
<table width="100%">
<tr>

  <td align="center" class='txt-arialch'>
  <input TYPE="SUBMIT" NAME="Send"  value="Finish">
  </td>
  
  
  </tr>


</TABLE>

<%---Fin Todo1-----------------------%>

<%}%>

  
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
   <table width="100%">
<tr>
		<td>&nbsp;</td>
		</tr>
<tr>
<td align="justify">
<p>
The booking reference is his grarantía of fitted available.
</p>
</td>
</tr>
<tr>
<td align="justify">

With the booking reference the search reserve in the initial page 

</td>
</tr>

<tr>
<td height="10" valign="top" class='txt-arialch'>&nbsp;</td>
</tr>
<tr>
<td align="justify">

For its greater comfort, we recommended to appear in the points of sale of airports one hour before the exit of the flight.</td>
</tr>
<tr>
<td align="justify">
Of not appearing it will lose its reserve and it will have to transact in the main offices of AEROGAL the return of the value of the ticket with the respective penalty.

</td>
</tr>

<tr>
<td height="10" valign="top" class='txt-arialch'>&nbsp;</td>
</tr>
<tr>
<td align="justify"><font  color="red" > 

IMPORTANT: This transaction is personal and instransferible, to retire its (s) ticket (s) the habiente card must appear in the points of sale of the airports carrying its card and identity card. If you choose to pay to the ticket the Total Reserve she will load automatically to his credit card.

</font>

</td>
</tr>



    </table>    
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
</table>

</body>
</html>
