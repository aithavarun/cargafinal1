<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>






<%@ include file="/WEB-INF/Banner.jsp"%>  
<%DecimalFormat f =new DecimalFormat("0.00");%>
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
    for (int l=1;l<=2;l++)
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
   
      
         
    var Nombre=frm.Pax.value;
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
                     
 if (salir==2)
 {
                
      var total=parseFloat(document.getElementById("saldo").innerHTML);
       if (total!=0)
       {
            alert("Es necesario cancelar todo para grabar" );
            return false;
       }
 }    
     
    return true;
}
function salirsi()
   {
   
   
   salir = eval("document.MantenimientoReservas.salir");
   salir.value=1;
   
   
   }
function pagarsi()
   {
   
   
   salir = eval("document.MantenimientoReservas.salir");
   salir.value=2;
   
   
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

function ventana3(nombre){
    
        function Is() {
    var agent = navigator.userAgent.toLowerCase();
    this.ns = (navigator.appName == "Netscape");
    this.ie = (navigator.appName == "Microsoft Internet Explorer");
        }

var is = new Is();
var mes1=eval("document.MantenimientoReservas.Mes1");
var dia1=eval("document.MantenimientoReservas.Dia1");
var anio1=eval("document.MantenimientoReservas.Anio1");
var origen1=eval("document.MantenimientoReservas.Origen1");
var destino1=eval("document.MantenimientoReservas.Destino1");

var mes2=eval("document.MantenimientoReservas.Mes2");
var dia2=eval("document.MantenimientoReservas.Dia2");
var anio2=eval("document.MantenimientoReservas.Anio2");
var origen2=eval("document.MantenimientoReservas.Origen2");
var destino2=eval("document.MantenimientoReservas.Destino2");

var tipo=eval("document.MantenimientoReservas.Tipo");
var nac=eval("document.MantenimientoReservas.Nac");
var tarifa=eval("document.MantenimientoReservas.Tarifa");


var abrir="<%=CONTROLLER%>/Reservaciones/"+nombre+"?Mes1="+mes1.value+"&Dia1="+dia1.value+"&Anio1="+anio1.value+"&Origen1="+origen1.value+"&Destino1="+destino1.value;
abrir+="&Mes2="+mes2.value+"&Dia2="+dia2.value+"&Anio2="+anio2.value+"&Origen2="+origen2.value+"&Destino2="+destino2.value;
abrir+="&Tipo="+tipo.value+"&Nac="+nac.value+"&Tarifa="+tarifa.value+"&Cierra=1";

    if(is.ie) {
        
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )
    //obj.close();
        } 
    else if(is.ns) {
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )
       obj.close();
    }
   
   
}


function ventana2(nombre){
    
        function Is() {
    var agent = navigator.userAgent.toLowerCase();
    this.ns = (navigator.appName == "Netscape");
    this.ie = (navigator.appName == "Microsoft Internet Explorer");
        }

var is = new Is();
var mes1=eval("document.MantenimientoReservas.Mes1");
var dia1=eval("document.MantenimientoReservas.Dia1");
var anio1=eval("document.MantenimientoReservas.Anio1");
var origen1=eval("document.MantenimientoReservas.Origen1");
var destino1=eval("document.MantenimientoReservas.Destino1");

var mes2=eval("document.MantenimientoReservas.Mes2");
var dia2=eval("document.MantenimientoReservas.Dia2");
var anio2=eval("document.MantenimientoReservas.Anio2");
var origen2=eval("document.MantenimientoReservas.Origen2");
var destino2=eval("document.MantenimientoReservas.Destino2");

var tipo=eval("document.MantenimientoReservas.Tipo");
var nac=eval("document.MantenimientoReservas.Nac");
var tarifa=eval("document.MantenimientoReservas.Tarifa");


var abrir="<%=CONTROLLER%>/Reservaciones/"+nombre+"?Mes1="+mes1.value+"&Dia1="+dia1.value+"&Anio1="+anio1.value+"&Origen1="+origen1.value+"&Destino1="+destino1.value;
abrir+="&Mes2="+mes2.value+"&Dia2="+dia2.value+"&Anio2="+anio2.value+"&Origen2="+origen2.value+"&Destino2="+destino2.value;
abrir+="&Tipo="+tipo.value+"&Nac="+nac.value+"&Tarifa="+tarifa.value;

    if(is.ie) {
        
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )
    //obj.close();
        } 
    else if(is.ns) {
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )
       obj.close();
    }
   
   //var xx=eval(obj.document.BuscarTarifas.Origen);
   
   //alert(xx.value);
<%-----------   
--------------%>
    //apagar();
    //obj.close();
    totales();
}

function apagar()
{
    var iva=eval("document.MantenimientoReservas.iva");
    var valor=eval("document.MantenimientoReservas.valor");
    var q=eval("document.MantenimientoReservas.q");
    var seguro=eval("document.MantenimientoReservas.seguro");
    var tasa=eval("document.MantenimientoReservas.tasa");
    document.getElementById("apagar").innerHTML=parseFloat(iva.value)+parseFloat(valor.value)+parseFloat(tasa.value)+parseFloat(seguro.value)+parseFloat(q.value);
    totales();
}

function pagados()
{
var efectivo=eval("document.MantenimientoReservas.efectivo");
var cheque=eval("document.MantenimientoReservas.cheque");
var mpd=eval("document.MantenimientoReservas.mpd");
var tc1=eval("document.MantenimientoReservas.tc1");
var otros=eval("document.MantenimientoReservas.otros");
var credito=eval("document.MantenimientoReservas.credito");
document.getElementById("pagado").innerHTML=parseFloat(efectivo.value)+parseFloat(cheque.value)+parseFloat(mpd.value)+parseFloat(tc1.value)+parseFloat(otros.value)+parseFloat(credito.value);
totales();
}
function totales()
{
        //alert("totales");
        document.getElementById("saldo").innerHTML=parseFloat(document.getElementById("apagar").innerHTML)-parseFloat(document.getElementById("pagado").innerHTML);
        document.getElementById("saldo").innerHTML=Math.round(parseFloat(document.getElementById("saldo").innerHTML) * 100) / 100 ;
}
</SCRIPT>
<table width="100%" align="left">
<tr>



<td valign="top" width="50%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/Venta/Grabar"  
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
<% for (int k=1;k<=2;k++)
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
<th colspan="6" >Pasajeros</th>
</tr>
<tr>
<td><b>Apellido/Nombre: </b></td>
<td >
<input name="Pax" value="" type="text" size="30" maxlength="60" onChange="javascript:this.value=this.value.toUpperCase();">
</td>
<td>
<select name='Tipo'>
<option value='FF' >FF</option>
<option value='CD' >CD</option>
<option value='HD' >HD</option>
<option value='HF' >HF</option>
</select>
</td>
<td>NAC
<select name='Nac'>
<option value='*' >*</option>
<option value='NAC' >NAC</option>
<option value='EXT' >EXT</option>
</select>
</td>
</tr>
<tr>
<td><b>Infante: </b></td>
<td colspan="1">
<input name="INF" value="" type="text" size="30" maxlength="30" onChange="javascript:this.value=this.value.toUpperCase();">
</td>

</tr>
<TR>
<td><b>Tarifa: </b></td>
<td colspan="1"><input name="Tarifa" value="" type="text" size="20"  onchange="javascript:ventana2('Trifac');javascript:totales();" ></td> 
<TD>
<A HREF="javascript:ventana2('Trifac');">Recalcular Tarifas</A>
</td>
<TD>
<A HREF="javascript:ventana3('Trifac');">Consultar Tarifas</A>
</td>

</tr>
<%-------------------Valores tarifas------------------%>
<tr>
<th>Tarifa</th>
<th>Q</th>
<th>IVA</th>
<th>Seguro</th>
<th>Tasa</th>
</tr>
<Tr>
<td><input name="valor" value="0" type="text" size="5" onchange="apagar()" readonly></td>
<td><input name="q" value="0" type="text"  size="5" onchange="apagar()" readonly></td>
<td><input name="iva" value="0" type="text"  size="5" onchange="apagar()" readonly></td>
<td><input name="seguro" value="0" type="text"  size="5" onchange="apagar()" readonly></td>
<td><input name="tasa" value="0" type="text"  size="5" onchange="apagar()" readonly></td>
</Tr>
<tr>
<th colspan="6">INFANTES</th>
</tr>
<Tr>
<td><input name="valori" value="0" type="text" size="5" onchange="apagar()" readonly></td>
<td><input name="qi" value="0" type="text"  size="5" onchange="apagar()" readonly></td>
<td><input name="ivai" value="0" type="text"  size="5" onchange="apagar()" readonly></td>
<td><input name="seguroi" value="0" type="text"  size="5" onchange="apagar()" readonly></td>
<td><input name="tasai" value="0" type="text"  size="5" onchange="apagar()" readonly></td>
</Tr>
<%-------------------Formas de pago------hidden------------%>
<tr  valign="top">
<th >Valor</th>
<th>Documento</th>
<th>Observaciones</th>
<th colspan="2" >Resumen</th>
</tr>
<tr class="form1">
<th colspan="3" >Efectivo</th>
<th colspan="1">Descripcion</th>
<th colspan="1">Valor</th>
</tr>
<tr>
<td>
<input name="efectivo" value="0" onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>

<td colspan="2">
<input name="obsefectivo" value=""  
type="text" size="30">
</td>
<td colspan="1" bgcolor="#FFCC00">
    valor a pagar:
</td>
<td colspan="1" bgcolor="#FFCC00">
<span id="apagar"  style="position:relative;">
0
</span>
</td>
</tr>

<tr class="form1">
<th colspan="3" >Cheque</th>
<td colspan="1" bgcolor="#FFCC00">
    (-) valor pagado:
</td>
<td colspan="1" bgcolor="#FFCC00">
<span id="pagado"  style="position:relative;">
0
</span>
</td>

</tr>
<tr>
<td>
<input name="cheque" value="0"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="1">
<input name="documentoch" value=""  
type="text" size="10">

<td colspan="1">
<input name="obsch" value=""  
type="text" size="20">
</td>
<td colspan="1" bgcolor="#FFCC00">
    Saldo:
</td>
<td colspan="1" bgcolor="#FFCC00">
<span id="saldo"  style="position:relative;">
0
</span>
</td>



</tr>
<tr class="form1">
<th colspan="3" >MPD</th>
<% if (usuario.getAcceso()==1)
{%>

<td colspan="2" bgcolor="#FFCC00">
    Saldo Pesos:
</td>
<td colspan="2" bgcolor="#FFCC00">
<span id="saldopesos"  style="position:relative;">
0
</span>
</td>

   
<%}%>

</tr>
<tr>
<td>
<input name="mpd" value="0"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="1">
<input name="documentompd" value=""  
type="text" size="10">

<td colspan="1">
<input name="obsmpd" value=""  
type="" size="20">
</td>
</tr>

<tr class="form1">
<th colspan="3" >Credito</th>
</tr>
<tr>
<td>
<input name="credito" value="0"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="1">
<input name="documentocredito" value=""  
type="text" size="10">

<td colspan="1">
<input name="obscredito" value=""  
type="text" size="20">
</td>
</tr>
<tr class="form1">
<th colspan="3" >Otros</th>
</tr>
<tr>
<td>
<input name="otros" value="0"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="1">
<input name="documentootros" value=""  
type="text" size="10">

<td colspan="1">
<input name="obsotros" value=""  
type="text" size="20">
</td>
</tr>


</tr>
<tr class="form1">
<th colspan="4" >Tarjeta de Credito</th>
</tr>
<tr >
<th >Valor</th>
<th>Numero</th>
<th colspan="1">Banco</th>
<th>Boucher</th>
</tr>

<tr>
<td>
<input name="tc1" value="0"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<input name="tcn1" value="0"  
type="text" size="8" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<select name='Tc1'>
<option value='v' >Visa</option>
<option value='a' >American Express</option>
<option value='d' >Dinners Club</option>
<option value='m' >Master Card</option>
</select>
</td>
<td colspan="1">        
<input name="obstc1" value=""  
type="text" size="15">
</td>
</tr>


<tr class="form1">
<th colspan="4" >Adicionales</th>
</tr>
<tr>
<th colspan="2">
RUC
</th>
<th colspan="2">
Razon Social
</th>

</tr>
<tr>
<td colspan="2">
<input name="Ruc" value=""  
type="text" size="15" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="2">
<input name="Razonsocial" value=""  
type="text" size="30">
</tr>
<tr>
<th colspan="4">
Tour Code
</th>
</tr>
<tr>
<td colspan="4">
<input name="Tourcode" value=""  
type="text" size="30">
</td>
</tr>



<tr>
<td><b>Sol. por: </b></td>
<td colspan="2"><input name="Quiens" value="PAX" type="text" size="20"  maxlength="30"></td> 
<td><b>Tel&eacute;fono: </b></td>
<td colspan="2"><input name="Telefono" value="<%=Telefono%>"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
type="text" size="20"  maxlength="30"></td> 
</tr>
<tr>
<td><b>Obs: </b></td>
<td colspan="5"><textarea name="Obs" cols="80" rows="2"><%=Obs%></textarea></td>
</tr>

<tr align="center">
<td align="center">
 <input TYPE="submit"    NAME="Reservar" value="Reservar" onclick="nosalir();">
 </td>
 <td align="center">
 <input TYPE="submit"    NAME="Nombres" value="Boletos" onclick="pagarsi();">
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



</SCRIPT>  

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


