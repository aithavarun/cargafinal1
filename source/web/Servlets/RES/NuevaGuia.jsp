<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>







<%@ include file="/WEB-INF/Banner.jsp"%>  
<%DecimalFormat f =new DecimalFormat("00");%>
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<%




String Origenr=request.getParameter("Origenr");
String Destinor=request.getParameter("Destinor");
String Numeror=request.getParameter("Numeror");
String Mesr=request.getParameter("Mesr");
String Anior=request.getParameter("Anior");
String Diar=request.getParameter("Diar");

String Mest=request.getParameter("Mest");
String Aniot=request.getParameter("Aniot");
String Diat=request.getParameter("Diat");

String Horat=request.getParameter("Horat"); 
String Minutost=request.getParameter("Minutost");


String Pax=request.getParameter("Pax");
String HD=request.getParameter("HD");
String CD=request.getParameter("CD");
String HF=request.getParameter("HF");
String INF=request.getParameter("INF");


String Nombre=request.getParameter("Nombre");
String Quiens=request.getParameter("Quiens");
String Telefono=request.getParameter("Telefono");
String Obs=request.getParameter("Obs");



int estado=0;
int k=0;


Calendar hoy = Calendar.getInstance();
int dia=hoy.get(Calendar.DATE);
int mes=hoy.get(Calendar.MONTH)+1;
int anio=hoy.get(Calendar.YEAR);
int hora=hoy.get(Calendar.HOUR_OF_DAY);
int minutos=hoy.get(Calendar.MINUTE);



if (Diar==null)
    Diar=String.valueOf(dia);
if (Mesr==null)
    Mesr=String.valueOf(mes);
if (Anior==null)
    Anior=String.valueOf(anio);

if (Diat==null)
    Diat=String.valueOf(dia);
if (Mest==null)
    Mest=String.valueOf(mes);
if (Horat==null)
    Horat="12";
if (Minutost==null)
    Minutost="00";
if (Aniot==null)
    Aniot=String.valueOf(anio);


if (Numeror==null)
    Numeror="";
if (Origenr==null)
    Origenr="";
if (Destinor==null)
    Destinor="";

if (Pax==null)
    Pax="1";

if (HD==null)
    HD="0";

if (CD==null)
    CD="0";
if (HF==null)
    HF="0";
if (INF==null)
    INF="0";



if (Nombre==null)
    Nombre="";

if (Quiens==null)
    Quiens="";
if (Telefono==null)
    Telefono="";

if (Obs==null)
    Obs="";


%>
<%------------------%>

<%------------%>

<%------------
  <%--------------------------  
 ---------%>    
<script LANGUAGE="JavaScript"> 

ahora       = new Date();

ahoraDay    = ahora.getDate();

ahoraMonth  = ahora.getMonth()+1;

ahoraYear   = ahora.getYear();



function selecliente(){ 
    x=document.MantenimientoReservas.Cliente.selectedIndex;
     
    <%/*document.MantenimientoReservas.Pdescuento.value=x;
    */%>
} 


</SCRIPT>

<table width="100%" align="left">
<tr>



<td valign="top" width="50%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/GuiaCarga/Grabar"  
name="MantenimientoReservas" onSubmit="return validar(this)" 
>
<tr>
<th colspan="6" >Nueva Guia de Carga</th>
</tr>
<% String error=model.getError();
String color="FFFFCC";
if (error !=null)
{%>
<tr class="error">
<th colspan="6" ><%=error%></th>
</tr>
<%}%>
<tr class="form1">
<th colspan="6" >¿DATOS DEL VUELO?</th>
</tr>
<%
{

if (color.equals("FFFFCC"))
   color="CCFFFF";
else
   color="FFFFCC"; 
%>
<tr>

</tr>
<tr bgcolor="<%=color%>">
<td>

<b>de: (Origen)</b></td>
<td><input name="Origen" value="" type="text" size="3"  maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();"></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);ponedestino();"></td> 
----------------%>
<td><b>a: (Destino)</b></td>
<td><input name="Destino" value="" type="text" size="3"  maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();" ></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);poneorigen();"></td> 
----------------%>
<td><b>No. Vuelo </b></td>
<td><input name="Numero"  type="text" value="" size="5"  maxlength="10">

</td> 
</tr>
<tr bgcolor="<%=color%>">
<td><b>Mes: </b></td>
<td><input name="Mes" value="<%=mes%>" type="text" size="2" maxlength="2" 
onChange="vermestexto(this.form.Mes<%=k%>.value, this.form.Anio<%=k%>.value);"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td><b>D&iacute;a: </b></td>
<td><input name="Dia" value="<%=dia%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td><b>A&ntilde;o: </b></td>
<td><input name="Anio" value="<%=anio%>" type="text" size="4" maxlength="4" 
onChange="vermestexto(this.form.Mes<%=k%>.value, this.form.Anio<%=k%>.value);"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<TD>
<A HREF="javascript:ventana1('Consulta',1);">Mostrar Vuelos</A>
</td>
</tr>
<%}%>

<%---------------
--%>
<tr class="form1">
<th colspan="6" >GUIA DE CARGA </th>
</tr>

<tr>
<th colspan="6" >Datos De Recepcion:</th>
</tr>


<tr>
<td><b> Cliente : </b></td>
<td><select  name="Cliente" type="text" class='txt-arialimput' onchange="selecliente();">  

<%/*
<option value="-1">->Seleccione un Cliente<-</option>
*/%>
        
<%
 model.BuscarClientesCarga_sinEliminados();
 List list = model.getClientesCarga();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Clientesc clientec=(Clientesc) it.next();
          //Sucursales sucursal=(Sucursales) it.next();
      
          %>
          
         <option value=<%=clientec.getCodigo()%> > <%=clientec.getNombre() %>  </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>


<tr>
<td><b> Numero de Guia:</b></td><td><input name= "Nguia" id="Nguia" value="0"  type="text"  size="10" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY> 
</tr>
<tr>
<td>
                <b> Mes:</b></td><td><input name= "Mese" id="Mese" value="<%=mes%>"  type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
                
           
</td>
<td>
                <b> Dia:</b></td><td><input name= "Diae" id="Diae" value="<%=dia%>"  type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
              
</td>
<td>
                <b>Anio:</b></td><td><input name= "Anioe" id="Anioe" value="<%=anio%>"  type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
            
</td>

</tr>


<tr>
 <td>
     <b> Hora:</b></td><td><input name= "Hora" id="Minutos" value="<%=hora%>"  type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" > 
 </td>
 <td>
     <b> Minutos:</b></td><td><input name= "Minutos" id="Minutos" value="<%=minutos%>"  type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >   
 </td>
</tr>


<tr>
<td><b>Piezas: </b>
</td><td>
<input name="piezas" value=1  type="text" size="2" maxlength="8" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td><b>Peso: </b>
</td><td>
<input name="peso"  value=0  type="text" size="2" maxlength="8" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td><b>Peso Por Volumen: </b>
</td><td>
<input name="pesovolumen"  value=0  type="text" size="2" maxlength="8" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td ><input  type="submit"  name="Calcula" value="Calcular Desc. Tarif." onclick="salirsi();"></td>

</tr>

<tr>
<td><b>Contiene: </b></td>
<td >
<input name="Contiene" value="" type="text" size="30" maxlength="30" >
</td>
</tr>

<tr>
<td><b>Remitente: </b></td>
<td >
<input name="Remitente" value="" type="text" size="30" maxlength="30" >
</td>


<td><b>Destinatario: </b></td>
<td colspan="2">
<input name="Destinatario" value="" type="text" size="30" maxlength="30" >
</td>
</tr>

<tr>
<td><b>Ruc: </b></td>
<td >
<input name="Ruc" value="" type="text" size="30" maxlength="30" >
</td>


<td><b>Telefono: </b></td>
<td colspan="2">
<input name="Telefono" value="" type="text" size="30" maxlength="30" >
</td>
</tr>


<TR>
<td ><b>Direccion: </b></td>
<td colspan="2"> <input name="Direccion" value="" type="text" size=50" maxleng="100" >
</TD>
</TR>

<tr>
<td><b> Para Entrega En : </b></td>
<td><select  name="Entregaen" type="text" class='txt-arialimput'   >

        <option value=3 > Aeropuerto  </option> 
       
        <option value=1 > Domicilio  </option>
         
        <option value=2 > Oficina  </option>

        
 
     </select>

<td>

</tr>



<tr>
<td><b> Tipo : </b></td>
<td><select  name="Tipo" type="text" class='txt-arialimput'   >


          
         <option value=1 > Tarifa Normal  </option>
         
         <option value=2 > Tarifa Perecible  </option>
 
 
     </select>

<td>

</tr>


<tr>
<td><b>Porcentaje De Decuento: </b></td>
<td colspan="2"><input name="Pdescuento" value=0 type="text" size="20"  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>

</td> 
</tr>




<tr class="form1">
<th colspan="6" >Pagos </th>
</tr>

<tr>
<td><b>Flete: </b></td>
<td colspan="2"  ><input name="Flete" value=0 align="right" type="text" size="20" READONLY ></td> 
</tr>

<tr>
<td><b>Entrega Domicilio: </b></td>
<td colspan="2"><input name="Edomicilio" value=0 type="text" size="20"  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">*
</td> 
</tr>


<tr>
<td><b>Transp Adicional: </b></td>
<td colspan="2"><input name="Tadicional" value=0
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
type="text" size="20"  maxlength="30">*</td> 
</tr>

<tr>
<td><b>Servicio Adicional: </b></td>
<td colspan="2"  ><input name="Sadicional"  value=0   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>


<tr>
<td><b>Seguros: </b></td>
<td colspan="2"  ><input name="Seguros"  value=0   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>


<tr>
<td><b>Descuentos: </b></td>
<td colspan="2"  ><input name="Pdescuentos"  value=0   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>



<tr>
<td><b>Subtotales: </b></td>
<td colspan="2"  ><input name="Subtotales"  value=0   type="text" size="20" align="right"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>




<tr>
<td><b>Iva: </b></td>
<td colspan="2"  ><input name="Iva"  value=0   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>




<tr>
<td><b>Totales: </b></td>
<td colspan="2"  ><input name="totales"  value=0   type="text" size="20" align="right"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>

<tr>
<td><b>Obs: </b></td>
<td colspan="5"><textarea name="Observacion" type="text"  cols="80" rows="2"></textarea></td>
</tr>
<tr>


</td>



<tr align="center">
<td align="center">
 
 </td>
 
 <td align="center">
 <input name="salir" value="0" 
type="hidden"  >
 <input  type="submit"  NAME="Salir" value="Salir" onclick="salirsi();">
 </td>
 </tr>
 </form>
 
</table>
</td>

<td valign="top" align="left" width="70%">
<table width="50%"  >
<%@ include file="/WEB-INF/Calendario.jsp"%>

</table>
<%------------
<table width="100%"  >
<%@ include file="/Servlets/VistaItinerario.jsp"%>

</table>
<%-----------------------------%>
</td>
</tr>
</table>


<SCRIPT language="JavaScript 1.2" type="text/javascript">
  
    function ventana1(nombre,k){
    
        function Is() {
    var agent = navigator.userAgent.toLowerCase();
    this.ns = (navigator.appName == "Netscape");
    this.ie = (navigator.appName == "Microsoft Internet Explorer");
        }

var is = new Is();
var mes=eval("document.MantenimientoReservas.Mes");
var dia=eval("document.MantenimientoReservas.Dia");
var anio=eval("document.MantenimientoReservas.Anio");
var origen=eval("document.MantenimientoReservas.Origen");
var destino=eval("document.MantenimientoReservas.Destino");
var abrir="<%=CONTROLLER%>/Reservaciones/"+nombre+"?Mes="+mes.value+"&Dia="+dia.value+"&Anio="+anio.value+"&Origen="+origen.value+"&Destino="+destino.value;
    if(is.ie) {
        
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )

        } 
    else if(is.ns) {
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )

    }
   
}


      
</SCRIPT>

<script LANGUAGE="JavaScript"> 
 var mmes=eval("document.MantenimientoReservas.Mes");
  var manio=eval("document.MantenimientoReservas.Anio");
  var mmess=mmes.value;
 
 var manios=manio.value;
vermestexto(mmess,manios);
 mmes=eval("document.MantenimientoReservas.Origen");
  manio=eval("document.MantenimientoReservas.Destino");
 mmess=mmes.value;
 
 manios=manio.value;

//veritinerariotexto(mmess,manios);

</SCRIPT>  

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


