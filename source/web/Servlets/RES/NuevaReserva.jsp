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


String Origen="";//request.getParameter("Origen"+String.valueOf(k));
String Destino="";//request.getParameter("Destino"+String.valueOf(k));
String Numero="";//request.getParameter("Numero"+String.valueOf(k));
String Mes="";//request.getParameter("Mes"+String.valueOf(k));
String Anio="";//request.getParameter("Anio"+String.valueOf(k));
String Dia="";//request.getParameter("Dia"+String.valueOf(k));

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



Calendar hoy = Calendar.getInstance();
int dia=hoy.get(Calendar.DATE);
int mes=hoy.get(Calendar.MONTH)+1;
int anio=hoy.get(Calendar.YEAR);

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
function ponedestino()
{
var morigen=eval("document.MantenimientoReservas.Origen");
var mdestino=eval("document.MantenimientoReservas.Destinor");
mdestino.value=morigen.value;
}
function poneorigen()
{
var morigen=eval("document.MantenimientoReservas.Destino");
var mdestino=eval("document.MantenimientoReservas.Origenr");
mdestino.value=morigen.value;
}

/**
 * funcion para saber cuantos dias tiene cada mes
 */
    function cuantosDias(mes, anyo)
    {
        var cuantosDias = 31;
        
        if (mes == 4 || mes == 6 || mes == 9 || mes == 11)
      cuantosDias = 30;
        if (mes == 2 && (anyo/4) != Math.floor(anyo/4))
      cuantosDias = 28;
        if (mes == 2 && (anyo/4) == Math.floor(anyo/4))
      cuantosDias = 29;
        return cuantosDias;
    }

 function validarfecha(dia,mes,anio)
   {
    
    if (mes=="")
        {
            alert("Mes es obligatorio" );
            return true;
        }
    
    if (anio=="")
        {
            alert("Año es obligatorio" );
            return true;
        }    
    if (mes >12)
     {
            alert("Mes no puede ser mayor de 12" );
            return true;
      
     }
     if (mes <=0)
     {
            alert("Mes no puede ser menor o igual a 0" );
            return true;
      
     }
     
    
     if (dia=="")
        {
            alert("Dia es obligatorio" );
            return true;
        }
        var cuantos=cuantosDias(mes,anio);
    
    if (dia >cuantos)
     {
            alert("Dia no puede ser mayor de " + cuantos );
            return true;
      
     }
     
      var fecha = new Date();
      var miFecha = new Date(anio,mes,dia); 
      /*
      if (fecha > miFecha)
      {
            alert("Fecha debe ser mayor que hoy");
            return true;
        }
      */
        return false;
   }

function validar(frm){

var salir = frm.salir.value;




var cont=0;
var origenr="";
var destinor="";
var miFechaActual = new Date(<%=anio%>,<%=mes%>-1,<%=dia%>); 

 if (salir==1)
 {
        return true;
 }


    <%
    for (int l=1;l<=6;l++)
    {%>
        var origen=frm.Origen<%=l%>.value;
        var destino=frm.Destino<%=l%>.value;
        var numero=frm.Numero<%=l%>.value;
        
        var ch=frm.Open<%=l%>.checked;
        
        if (numero!="")
        {
            cont++;
             if (origen=="")
                {
                    alert("origen es obligatorio" );
                    return false;
                }

            if (destino=="")
                {
                        alert("destino es obligatorio" );
                        return false;
                }
             if (origen.toUpperCase()==destino.toUpperCase())
                {
                    alert("origen no puede ser igual a destino" );
                    return false;
                }
                    var dia=frm.Dia<%=l%>.value;
                    var mes=frm.Mes<%=l%>.value;
                    var anio=frm.Anio<%=l%>.value;
                
                    var miFecha =new Date(anio,mes-1,dia); 
                    if ( validarfecha(dia,mes,anio))
                    {

                        return false;
                    }
                    if (miFechaActual > miFecha)
                        {
                        alert("Fecha de Destino <%=l%>  no puede ser menor que fecha de destino anterior o menor a fecha actual : " + miFechaActual+ " >  "+ miFecha);
                        return false;
            
                        }
                    else
                    {
                        miFechaActual = new Date(anio,mes-1,dia); 
                    }
                   
                   if (origen.toUpperCase()==origenr.toUpperCase())
                            {
                                    alert("origen no puede ser iguales" );
                                    return false;

                            }
                                else
                            {
                                origenr=origen;
                            }
                    if (destino.toUpperCase()==destinor.toUpperCase())
                            {
                                    alert("destino no puede ser iguales" );
                                    return false;

                            }
                            else
                            {
                                destinor=destino;
                            }

                    
                
        }
        if (ch)
        {
            cont++;
           if (origen=="")
                {
                    alert("origen es obligatorio" );
                    return false;
                }

            if (destino=="")
                {
                        alert("destino es obligatorio" );
                        return false;
                }
             if (origen.toUpperCase()==destino.toUpperCase())
                {
                    alert("origen no puede ser igual a destino" );
                    return false;
                }
        }
<%}%>
    if (cont==0)
    {
          alert("Debe al menos existir un destino de vuelo" );
            return false;
    }
    var Pax=frm.Pax.value;
    var HD=frm.HD.value;
    var HF=frm.HF.value;
    var CD=frm.CD.value;
    var INF=frm.INF.value;
    if (Pax+HD+HF+CD==0)
        {
            alert("Número de pasajeros es obligatorio" );
            return false;
        }
        
     if (INF>1)
        {
            alert("Máximo un infante por grupo" );
            return false;
        }
    
    var Nombre=frm.Nombre.value;
    if (Nombre=="")
        {
            alert("El Nombre es obligatorio" );
            return false;
        }
     var telefono=frm.Telefono.value;
    if (telefono=="")
        {
            alert("El telefono es obligatorio" );
            return false;
        }
    
     var Quiens=frm.Quiens.value;
    if (Quiens=="")
        {
            alert("Quien solicita es obligatorio" );
            return false;
        }   
     var Horat=frm.Horat.value;
     if (Horat=="")
     {
            alert("Hora es obligatorio" );
            return false;
     }
     if (Horat >23)
     {
            alert("Hora es menor de 24" );
            return false;
     }
    if (Horat <0)
     {
            alert("Hora es mayor de 0" );
            return false;
     }
    var Minutost=frm.Minutost.value;
     if (Minutost=="")
     {
            alert("Minutos es obligatorio" );
            return false;
     }
     if (Minutost >59)
     {
            alert("Minutos es menor de 60" );
            return false;
     }
    if (Minutost <0)
     {
            alert("Minutos es mayor de 0" );
            return false;
     }
     
     
     
      dia=frm.Diat.value;
      mes=frm.Mest.value;
      anio=frm.Aniot.value;
     if ( validarfecha(dia,mes,anio))
     {
        
        return false;
     }
                
                
              
     
     
    return true;
}
function salirsi()
   {
   
   
   salir = eval("document.MantenimientoReservas.salir");
   salir.value=1;
   
   
   }
function nosalir()
{
    
    salir = eval("document.MantenimientoReservas.salir");
    salir.value=0;
}

</SCRIPT>
 <%------------------
       alert(<%=Dia%>);
        comboDias = eval("document.MantenimientoAviones.Dia");
        comboDias[<%=Dia%>].selected = true;
       alert(<%=Dia%>);
 

 

--------------%>
<SCRIPT language="JavaScript 1.2" type="text/javascript">
  
    function ventana1(nombre,k){
    
        function Is() {
    var agent = navigator.userAgent.toLowerCase();
    this.ns = (navigator.appName == "Netscape");
    this.ie = (navigator.appName == "Microsoft Internet Explorer");
        }

var is = new Is();
var mes=eval("document.MantenimientoReservas.Mes"+k);
var dia=eval("document.MantenimientoReservas.Dia"+k);
var anio=eval("document.MantenimientoReservas.Anio"+k);
var origen=eval("document.MantenimientoReservas.Origen"+k);
var destino=eval("document.MantenimientoReservas.Destino"+k);
var abrir="<%=CONTROLLER%>/Reservaciones/"+nombre+"?Mes="+mes.value+"&Dia="+dia.value+"&Anio="+anio.value+"&Origen="+origen.value+"&Destino="+destino.value;
    if(is.ie) {
        
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )

        } 
    else if(is.ns) {
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )

    }
   
}


      
</SCRIPT>
<table width="100%" align="left">
<tr>



<td valign="top" width="50%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/Reservas/Grabar"  
name="MantenimientoReservas" onSubmit="return validar(this)" 
>
<tr>
<th colspan="6" >Nueva Reserva</th>
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
<th colspan="6" >¿A d&oacute;nde y cu&aacute;ndo desea viajar?</th>
</tr>
<% for (int k=1;k<=6;k++)
{
Origen=request.getParameter("Origen"+String.valueOf(k));
Destino=request.getParameter("Destino"+String.valueOf(k));
Numero=request.getParameter("Numero"+String.valueOf(k));
Mes=request.getParameter("Mes"+String.valueOf(k));
Anio=request.getParameter("Anio"+String.valueOf(k));
Dia=request.getParameter("Dia"+String.valueOf(k));
if (Dia==null)
    Dia=String.valueOf(dia);
if (Mes==null)
    Mes=String.valueOf(mes);
if (Anio==null)
    Anio=String.valueOf(anio);
if (Numero==null)
    Numero="";
if (Origen==null)
    Origen="";
if (Destino==null)
    Destino="";

if (color.equals("FFFFCC"))
   color="CCFFFF";
else
   color="FFFFCC"; 
%>
<tr>
<td colspan="6" bgcolor="CCCCCC">Destino <%=k%>
<input type="checkbox" name="Open<%=k%>" value= "Open<%=k%>"><b>Click si Tramo es Abierto</b>
</td>
</tr>
<tr bgcolor="<%=color%>">
<td>

<b>de: (Origen)</b></td>
<td><input name="Origen<%=k%>" value="<%=Origen%>" type="text" size="3"  maxlength="3"></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);ponedestino();"></td> 
----------------%>
<td><b>a: (Destino)</b></td>
<td><input name="Destino<%=k%>" value="<%=Destino%>" type="text" size="3"  maxlength="3"></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);poneorigen();"></td> 
----------------%>
<td><b>No. Vuelo </b></td>
<td><input name="Numero<%=k%>"  type="text" value="<%=Numero%>" size="5"  maxlength="10">

</td> 
</tr>
<tr bgcolor="<%=color%>">
<td><b>Mes: </b></td>
<td><input name="Mes<%=k%>" value="<%=Mes%>" type="text" size="2" maxlength="2" 
onChange="vermestexto(this.form.Mes<%=k%>.value, this.form.Anio<%=k%>.value);"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td><b>D&iacute;a: </b></td>
<td><input name="Dia<%=k%>" value="<%=Dia%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td><b>A&ntilde;o: </b></td>
<td><input name="Anio<%=k%>" value="<%=Anio%>" type="text" size="4" maxlength="4" 
onChange="vermestexto(this.form.Mes<%=k%>.value, this.form.Anio<%=k%>.value);"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<TD>
<A HREF="javascript:ventana1('Consulta',<%=k%>);">Mostrar Vuelos</A>
</td>
</tr>
<%}%>
<%---------------



--%>
<tr class="form1">
<th colspan="6" >No. Pasajeros</th>
</tr>
<tr>
<td><b>Adultos: </b></td>
<td >
<input name="Pax" value="<%=Pax%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td><b>Ni&ntilde;os: </b></td>
<td >
<input name="HF" value="<%=HF%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td><b>Tercera Edad: </b></td>
<td >
<input name="CD" value="<%=CD%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>
<tr>
<td><b>Discapacitados: </b></td>
<td >
<input name="HD" value="<%=HD%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>


<td><b>Infantes: </b></td>
<td colspan="2">
<input name="INF" value="<%=INF%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>
<tr class="form1">
<th colspan="6" >Grupo y Contacto</th>
</tr>
<TR>

<td><b>Nombre: </b></td>
<td colspan="2"><input name="Nombre" value="<%=Nombre%>" type="text" size="50"  ></td> 
</tr>
<tr>
<td><b>Sol. por: </b></td>
<td colspan="2"><input name="Quiens" value="<%=Quiens%>" type="text" size="20"  maxlength="30"></td> 
<td><b>Tel&eacute;fono: </b></td>
<td colspan="2"><input name="Telefono" value="<%=Telefono%>"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
type="text" size="20"  maxlength="30"></td> 
</tr>
<tr>
<td><b>Obs: </b></td>
<td colspan="5"><textarea name="Obs" cols="40" rows="4"><%=Obs%></textarea></td>
</tr>
<tr>
<td><b>Clase:</b></td>
<td>
<%String xselecciona1=request.getParameter("Clase");
String xselecciona="";
if (xselecciona1==null)
    xselecciona1="";%>
<select name='Clase'>
<%if (xselecciona1.equals("Y")) 
    xselecciona="SELECTED";
else
    xselecciona="";
%>
<option value='Y' <%=xselecciona%> >Y</option>
<%if (xselecciona1.equals("B"))
    xselecciona="SELECTED";
else
    xselecciona="";
%>

<option value='B' <%=xselecciona%> >B</option>
<%if (xselecciona1.equals("M"))
    xselecciona="SELECTED";
else
    xselecciona="";
%>


<option value='M' <%=xselecciona%> >M</option>
<%if (xselecciona1.equals("P"))
    xselecciona="SELECTED";
else
    xselecciona="";
%>


<option value='P' <%=xselecciona%> >P</option>
<%if (xselecciona1.equals("Q"))
    xselecciona="SELECTED";
else
    xselecciona="";
%>


<option value='Q' <%=xselecciona%> >Q</option>
<%if (xselecciona1.equals("V"))
    xselecciona="SELECTED";
else
    xselecciona="";
%>


<option value='V' <%=xselecciona%> >V</option>

<%if (xselecciona1.equals("X"))
    xselecciona="SELECTED";
else
    xselecciona="";
%>
<option value='X' <%=xselecciona%> >X</option>

<%if (xselecciona1.equals("Z"))
    xselecciona="SELECTED";
else
    xselecciona="";
%>


<option value='Z' <%=xselecciona%> >Z</option>
<%if (xselecciona.equals("L"))
    xselecciona="SELECTED";
else
    xselecciona="";
%>


<option value='L' <%=xselecciona%> >L</option>
</select>
</td>
</TR>
<tr class="form1">
<th colspan="6" >Time Limit</th>
</tr>

<tr>
<td><b>Mes: </b></td>
<td><input name="Mest" value="<%=Mest%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td><b>D&iacute;a: </b></td>
<td><input name="Diat" value="<%=Diat%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td><b>A&ntilde;o: </b></td>
<td><input name="Aniot" value="<%=Aniot%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>

</TR>
<tr>
<td><b>Hora: </b></td>
<td><input name="Horat" value="<%=Horat%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td><b>Minutos: </b></td>
<td><input name="Minutost" value="<%=Minutost%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>

</TR>
<%------------Prueba-------------%>
        
   
<%------Fin Prueba-----------------%>
<tr align="center">
<td align="center">
 <input TYPE="submit"    NAME="Grabar" value="Grabar" onclick="nosalir();">
 </td>
 <td align="center">
 <input  type="submit"  NAME="Nombres" value="Ingresar Nombres" onclick="nosalir();">
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

<td valign="top" align="left" width="50%">
<table width="100%"  >
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
<script LANGUAGE="JavaScript"> 
 var mmes=eval("document.MantenimientoReservas.Mes1");
  var manio=eval("document.MantenimientoReservas.Anio1");
  var mmess=mmes.value;
 
 var manios=manio.value;
vermestexto(mmess,manios);
 mmes=eval("document.MantenimientoReservas.Origen1");
  manio=eval("document.MantenimientoReservas.Destino1");
 mmess=mmes.value;
 
 manios=manio.value;

//veritinerariotexto(mmess,manios);

</SCRIPT>  

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


