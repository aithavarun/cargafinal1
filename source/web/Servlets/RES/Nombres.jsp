<%@ page session="true" %>
<%@ page errorPage= "ErrorPage.jsp" %>
<%@ page import="com.aerogal.support.model.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<link rel="stylesheet" href="<%=BASEURL%>/estilo1.css">

<html>
<head>
<script LANGUAGE="JavaScript"> 

function validate(frm){

    if (frm.Nnombre.value=='')
    {
        alert("Es Obligatorio el nombre de quien reserva");
        return false;
    }    
   if (frm.NTelefono.value=='')
    {
        alert("Es Obligatorio el teléfono de quien reserva");
        return false;
    }    
    if (frm.Nemail.value=='')
    {
        alert("Es Obligatorio el e-mail de quien reserva");
        return false;
    }    
    <%
    int te=model.getAdultos();
    int m =0;
    
    for(m=1;m<=te;m++){ %>
      if(frm.adultos<%=m%>.value=='')
       {
         alert("Los Nombres de los pasajeros son obligatorios");
         frm.adultos<%=m%>.focus();
         return false;
       }
    <%}
     te=model.getNinios();%>
     
     <%if (te > 0)
     {  %>
         
        <%for(m=1;m<=te;m++){ %>
        
        if(frm.ninios<%=m%>.value=='')
       {
         alert("Los Nombres de los niños son obligatorios");
         frm.ninios<%=m%>.focus();
         return false;
       }
      <%}}%>  
      <%te=model.getInfantes();
        if (te>0)
           {%>
<%
                for( m=1;m<=te;m++){%>
                            if(frm.infantes<%=m%>.value=='')
                              {
                                    alert("Los Nombres de los infantes son obligatorios");
                                    frm.infantes<%=m%>.focus();
                                    return false;
                              }

             <%         }
            }          
%>


    return checkEMAIL(frm);
    
}
function checkEMAIL(frm)
  {
    var Byte="";
    var Arroba=0;
    var Punto=0;
    if (frm.Nemail.value.length==0) 
    {
      frm.Nemail.focus();
      alert("Debe introducir su direcci&oacute;n de e-mail");
      return(false);
    }
    for (var i=0;i<frm.Nemail.value.length;i++)
    {
      Byte=frm.Nemail.value.substring(i,i+1);
      if(Byte=="@")
        Arroba=Arroba+1;
      if (Byte==".")
        Punto=Punto+1;  
    }
    if (Arroba!=1 || Punto==0)
    {
      frm.Nemail.focus();  
      alert ("La dirección Email no es correcta");
      return(false);
    }
    return true;
  }
 

</SCRIPT>
<title>.:Aerogal - Reservaciones:.</title>
</head>
<body bgcolor=#a0a0a0>

<%String Video=request.getParameter("Idioma");%>
<%@ include file="/WEB-INF/Banner.jsp"%>           
</table>   
<table border="0" width="780"  align="center" cellborder="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" >        

<td align="center" valign="top">

<form  method="post" name="VuelosLista"
            action="<%=CONTROLLER%>/Nombres/Grabar"
              onSubmit="return validate(this);">


<%------------Prueba merchantv2------------%>

<INPUT TYPE=hidden NAME='invoiceNumber' VALUE='0'>
<INPUT TYPE=hidden NAME='totalAmount' VALUE='00'>
<INPUT TYPE=hidden NAME='extra' VALUE='Todo1 version 2'>
<INPUT TYPE=hidden NAME='tax' VALUE='0'>

<%------------fin Prueba merchantv2------------%>

<input name="Idioma" id="Idioma" value="0" type= "hidden" >
<%-------------Empieza JSP----------------%>

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
   <td colspan="3"><img name="<%=BASEURL%>/images/Forma_r1_c1" src="<%=BASEURL%>/images/nombres.gif" width="420" height="51" border="0" alt=""></td>
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
<tr>
<tH align="center">Adultos</th>
</tr>
</table>
<table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
<%----------%>
<tr>
<tH align="center">#</th>
<tH align="center">Nombres</th>
<th align="center">Boleto</th>
<th align="center">Tarifa</th>
</tr>
<%
List list=model.getTipos("FF");

        
    
    int i;
    int j;
    int tope=model.getAdultos();
    for( i=1;i<=tope;i++){
%>

<tr>
<td ><%=i%>:</td>
 <td align="left"><input name=adultos<%=i%> id=adultos<%=i%> type="text" size=15></td>
 <td align="left"><input name=adultosci<%=i%> id=adultosci<%=i%> type="text" size=15 onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
 <td> 
<select name="Nacion<%=i%>" class="imput-130" id="Nacion <%=i%>" align="left">
  <%-----------<option value='01'>Ecu</option>
  <option value='02'>Ext</option>------------%>
  <%if (list!=null){
    Iterator it =list.iterator();

    while (it.hasNext()){
        Tipos tipo=(Tipos) it.next();
        String codtipo=tipo.getTipoCodigo();
        String nomtipo=tipo.getTipoNombre();
    
    %>
  
  <option value='<%=codtipo%>'><%=nomtipo%></option>
  
  <%}}%>
  </select>
  
 </td>
</tr>
<%}%> 

</table>
<%
tope=model.getNinios();
if (tope > 0)
{%>

<table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<tH align="center">Ni&ntilde;os</th>
</TR>

</table>

<table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">

<tr>
<tH align="center">#</th>
<tH align="center">Nombres</th>
<th align="center">Boleto</th>
<th align="center">Tarifa</th>
</tr>

<%
    List list1=model.getTipos("HF");
    tope=model.getNinios();
    for( i=1;i<=tope;i++){
%>

<tr>
<td align="left"><%=i%>:</td>
<td><input align="left" name="ninios<%=i%>" id="ninios<%=i%>" type="text" size=15></td>
<td align="left"><input name="niniosci<%=i%>" id="niniosci<%=i%>" type="text" size=15 onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
 <td> <select name="NacionN<%=i%>" class="imput-130" id="NacionN<%=i%>" align="left">
 <%if (list1!=null){
    Iterator it =list1.iterator();

    while (it.hasNext()){
        Tipos tipo=(Tipos) it.next();
        String codtipo=tipo.getTipoCodigo();
        String nomtipo=tipo.getTipoNombre();
    
    %>

  <option value='<%=codtipo%>'><%=nomtipo%></option>

  <%}}%>
  </select>
 </td>
</tr>  

<%}%> 
</table>
<%}
tope=model.getInfantes();
if (tope>0)
{%>
<table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<tH align="center">Infantes</th>
</TR>
</table>
<table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<tH align="center">#</th>
<tH align="center">Nombres</th>
<th align="center">Boleto</th>
<th align="center">Tarifa</th>
</tr>

<%
    
    
    for( i=1;i<=tope;i++){
%>

<tr>
<td  ><%=i%>:</td>
 <td align="left"><input name=infantes<%=i%> id=infantes<%=i%> type="text" size=15></td>
<td align="left"><input name=infantesci<%=i%> id=infantesci<%=i%> type="text" size=15 onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
 <td> 
<select name="NacionI<%=i%>" class="imput-130" id="NacionI<%=i%>" align="left">
 
  <option value='01'>NACIONALES</option>
  <option value='02'>EXTRANJERO</option>
 
  </select></td>
</tr>
  
<%}%>
</table>
<%}%> 


<table  width='100%' border="0" align="center" cellpadding="0" cellspacing="0">
<th align="center">  Quien Reserva </th>
</TABLE>
<table  width='95%' border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td width="50%" class='txt-arialch'>Nombre:</td>
<td width="50%" class='txt-arialch' >Fono:</td>
</tr>
<tr><td width="50%" class='txt-arialch'><input name=Nnombre id=Nnombre type="text" size=20></td>
<td width="50%" class='txt-arialch'>
<input name=NTelefono id=NTelefono type="text" size=20 onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
</tr>

</table>
<table  width='95%' border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td width="50%" class='txt-arialch'>e-mail:</td>
<td width="50%" class='txt-arialch'>&nbsp;</td></tr>
<tr><td width="95%" class='txt-arialch'><input name=Nemail id=Nemail type="text" size=50></td></tr>
</table>
<table width='95%' border='0' cellpadding='2' cellspacing='0'>
  <td height="10" valign="top" class='txt-arialch'>&nbsp;</td>
  <td height="10" valign="top" class='txt-arialch'>&nbsp;</td>
  <td align="center" class='txt-arialch'>
  <input TYPE="SUBMIT" NAME="Send"  value="Guardar">
  </td>
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
   <table width="100%">
        <tr>
        <td color="cf223d">
        <font color="cf223d">Adultos:</font>
        </td>
        </tr>
        <tr>
        <td>
        Es necesario proporcionar los nombres de los pasajeros adultos que están reservando un cupo de viaje.
        Si los pasajeros poseen ya un boleto por favor ingrese el número
        del mismo en el espacio correspondiente. Seleccione la tarifa con la cual va ha adquirir el boleto.
        </td>
        </tr>
        <%
tope=model.getNinios();
if (tope > 0)
{%>

        <tr>
        <td color="cf223d">
        <font color="cf223d">Ni&ntilde;os</font>
        </td>
        </tr>
        <tr>
        <td>
        Es necesario proporcionar los nombres de los pasajeros niños(entre 2 y 11 años de edad) que están
        reservando un cupo de viaje. Si los pasajeros poseen ya un boleto por favor ingrese el número
        del mismo en el espacio correspondiente. Seleccione la tarifa con la cual va ha adquirir el boleto. 
        Este tipo de pasajero recibe un descuento sobre la tarifa normal de vuelo. 

        </td>
        </tr>
<%}%>
<%
tope=model.getInfantes();
if (tope>0)
{%>
        
        <tr>
        <td color="cf223d">
        <font color="cf223d">Infantes:</font>
        </td>
        </tr>
        <tr>
        <td>
        Es necesario proporcionar los nombres de los pasajeros infantes(entre 0 y 1 año de edad)  que están
        reservando un cupo de viaje. Si los pasajeros poseen ya un boleto por favor ingrese el número
        del mismo en el espacio correspondiente. Seleccione la tarifa con la cual va ha adquirir el boleto. 
        Este tipo de pasajero recibe un descuento sobre la tarifa normal de vuelo. 


        </td>
        </tr>
<%}%>        
        <tr>
        <td color="cf223d">
        <font color="cf223d"> Quien Reserva:</font>
        </td>
        </tr>
        <tr>
        <td>
        La siguiente información es obligatoria. Por favor ingrese los datos solicitados a continuación ya que 
        se utilizará la misma para informarle cualquier novedad con respecto a su reservación. 
        Para continuar con su reserva por favor presione el boton Guardar.



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

