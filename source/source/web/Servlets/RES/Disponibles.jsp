<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>





<%@ include file="/WEB-INF/Banner.jsp"%>  

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
    Origenr="GYE";
if (Destinor==null)
    Destinor="UIO";

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
      if (fecha > miFecha)
      {
            alert("Fecha debe ser mayor que hoy");
            return true;
        }
      
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
    int l=1;
    %>
        var origen=frm.Origen<%=l%>.value;
        var destino=frm.Destino<%=l%>.value;
        var numero=frm.Numero<%=l%>.value;
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
                 var dia=frm.Dia<%=l+1%>.value;
                var mes=frm.Mes<%=l+1%>.value;
                var anio=frm.Anio<%=l+1%>.value;
                
                var miFecha =new Date(anio,mes-1,dia); 
                if ( validarfecha(dia,mes,anio))
                 {

                    return false;
                 }
                 
                    
                    

                    
                
        }
<%%>
    
                
                
              
     
     
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

<table width="100%" align="left">
<tr>



<td valign="top" width="50%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/Disponibilidad/Buscar"  
name="MantenimientoReservas" onSubmit="return validar(this)">
<tr>
<th colspan="6" >Disponibilidad en vuelos</th>
</tr>
<% String error=model.getError();
String color="FFFFCC";
if (error !=null)
{%>
<tr class="error">
<th colspan="6" ><%=error%></th>
</tr>
<%}%>
<% 
int k=1;
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
    Origen="UIO";
if (Destino==null)
    Destino="GYE";

if (color.equals("FFFFCC"))
   color="CCFFFF";
else
   color="FFFFCC"; 
%>
<tr>
<td colspan="6" bgcolor="CCCCCC">Parametros</td>
</tr>
<tr bgcolor="<%=color%>">
<td><b>de: </b></td>
<td><input name="Origen<%=k%>" value="<%=Origen%>" type="text" size="3"  maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();"></td> 

<td><b>a: </b></td>
<td><input name="Destino<%=k%>" value="<%=Destino%>" type="text" size="3"  maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();"></td> 
<td><b>No. Vuelo </b></td>
<td><input name="Numero<%=k%>"  type="text" value="<%=Numero%>" size="5"  maxlength="10" onChange="javascript:this.value=this.value.toUpperCase();"></td> 
</tr>
<tr>
<th colspan="6" >Fecha Desde</th>
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
</tr>
<tr>
<th colspan="6" >Fecha Hasta</th>
</tr>
<% k++;
color="FFFFCC"; 
%>
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
</tr>


<%---------------



--%>

<%------------Prueba-------------%>
        
   
<%------Fin Prueba-----------------%>
<tr align="center">
<td align="center">
 <input TYPE="submit"    NAME="Buscar" value="Buscar" onclick="nosalir();">
 </td>
<%if (usuario.getTipo()<0)
  { 
    %>
<td align="center">
 <input TYPE="submit"    NAME="Colombia" value="Colombia" onclick="salirsi();">
 </td>
    
    <%}%>
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
<tr>
<td colspan="2">



<%
List list = model.getDisponibilidad();


%>


<table  width="100%">
<tr>
<th colspan="6" >Disponibilidad en vuelos</th>
</tr>
</table>
<table id="t1" class="sortable">
<tr>
<th>FECHA DE VUELO  </th>
<th>ORIGEN</th>
<th>DESTINO</th>
<th>NUMERO</th>
<th>TIPO</th>

<th>CAPACIDAD</th>
<th>OCUPACION</th>
<th>DIFERENCIA</th>
<th>ESTADO </th>

</tr>
<%
DecimalFormat f =new DecimalFormat("0");
String TITULO="" ;
int mdia=0;
int mdiaa=0;
java.util.Date mifecha;
/*
  Calendar inicio=Calendar.getInstance(); */
java.util.Calendar inicio = java.util.Calendar.getInstance();
String Mensaje="";
String color1="";
String estilo="";
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Disponibilidad disponibilidad=(Disponibilidad) it.next();
          mifecha=disponibilidad.getFecha();
          inicio.setTime(mifecha);
          mdia=inicio.get(Calendar.DATE);
          if (mdia!=mdiaa) 
          TITULO="-----";
          else
          TITULO="";   
          estilo="";
          if (disponibilidad.getEstado().trim().equals("A"))
          {
              Mensaje="Activo";
              color1="#66CCFF";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else if (disponibilidad.getEstado().trim().equals("X"))
          {
              Mensaje="Cancelado";
              color1="#FF0000";
              estilo="style='color:#FFFFFF '";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else if (disponibilidad.getEstado().trim().equals("H"))
          {
              Mensaje="En chequeo";
              color1="#666666";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else if (disponibilidad.getEstado().trim().equals("V"))
          {
              Mensaje="Volado";
              color1="#FF1100";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else if (disponibilidad.getEstado().trim().equals("C"))
          {
              Mensaje="Stop Booking";
              color1="#FF9900";
              //Blanco=String.valueOf(vuelo.getSuma());
          }
          else
          {
                Mensaje="";
               color1="#FFFFFF";
          }
          
          %>

  <tr align="right" bgcolor="<%=color1%>" <%=estilo%>>
        <td><%=disponibilidad.getFecha()%></td> 
        <td><%=disponibilidad.getOrigen()%></td>
        <td><%=disponibilidad.getDestino()%></td>
        <td><%=disponibilidad.getNumero()%></td>
        
        <td><%=disponibilidad.getTipo()%></td>
        
        <td><%=f.format(disponibilidad.getCapacidad())%></td>
        <td><%=f.format(disponibilidad.getCuantos())%></td>
        <td><%=f.format(disponibilidad.getCapacidad()-disponibilidad.getCuantos())%></td>
        <td><%=Mensaje%></td>  
        
         
  </tr>    
   
 <% mdiaa=mdia;
      }%>
       
<% 

 }%>        

          
</table>

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
<%-----------------------

-----------------------%>
</body>
</html>


