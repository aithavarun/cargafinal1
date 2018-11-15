<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>





<%@ include file="/WEB-INF/Banner.jsp"%> 
<% 
Calendar hoy = Calendar.getInstance();
int dia=hoy.get(Calendar.DATE);
int mes=hoy.get(Calendar.MONTH)+1;
int anio=hoy.get(Calendar.YEAR);
int salir=0;

%>
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
 var contador=frm.CONTADOR.value;
    <%
    for (int l=1;l<=6;l++)
    {%>
        var origen=frm.Origen<%=l%>.value;
        var destino=frm.Destino<%=l%>.value;
        var numero=frm.Numero<%=l%>.value;
        var auxca=frm.cambia<%=l%>.value;
        var ch=false;
        if (contador<=<%=l%>)
            frm.Open<%=l%>.checked;
        if ((numero!="") && (auxca!="readonly"))
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
        
        if (!(frm.Numero<%=l%>.disabled))
        {
        cont++;
        }
<%}%>
    if (cont==0)
    {
          alert("Debe al menos existir un destino de vuelo" );
            return false;
    }
    
     var telefono=frm.Telefono.value;
    if (telefono=="")
        {
            alert("El telefono es obligatorio" );
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
   
   
   salir = eval("document.ModificarReservas.salir");
   salir.value=1;
   
   
   }
function nosalir()
{
    
    salir = eval("document.ModificarReservas.salir");
    salir.value=0;
}

</SCRIPT>


<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>

<table width="100%" align="left">

<% String error=model.getError();
String color="FFFFCC";
if (error !=null)
{%>
<tr class="error">
<th colspan="6" ><%=error%></th>
</tr>
<%}%>


<tr>



<td valign="top" width="100%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/Reservas/Modificar"  
name="ModificarReservas"   onSubmit="return validar(this)" 
>
<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="8" >Modificar Reserva</th>
</tr>
<tr class="form1">
<th colspan="8" >Grupo y Contacto</th>
</tr>
<TR bgcolor="#CCCCCC">
<% Cabecera contacto=model.getCabecera();
Calendar fecha=contacto.getFechatc();
        //fecha.setTime(contacto.getFechat());
        int aniot=fecha.get(Calendar.YEAR);
        int mest=fecha.get(Calendar.MONTH)+1;
        int diat=fecha.get(Calendar.DATE);

%>
<td colspan="1"><b>Booking Reference:</b></td>
<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >
<td ><b><%=contacto.getBooking()%></b></td> 
<td>Quien Solicita:</td>
<td><%=contacto.getQuiens()%></td> 
<td>Telefono:</td>
<td colspan="3"><input name="Telefono" value="<%=contacto.getTelefono()%>" type="text" size="10" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>
<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Sucursal:</b></td>
<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >
<td ><b><%=contacto.getSucursal()%></b></td> 
<td>Quien Reserva:</td>
<td><%=contacto.getQuienr()%></td> 
<td>Fecha:</td>
<td colspan="3"><%=FORMATOFECHA.format(contacto.getFecha())%>
</td>
</tr>

<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Grupo:</b></td>
<td colspan="2"><input name="Grupo" onChange="javascript:this.value=this.value.toUpperCase();"
value="<%=contacto.getGrupo().trim()%>" type="text" size="30" maxlength="40">
</td>

<td><b>Clase:</b></td>
<td colspan="4">
<%String selecciona1=contacto.getClase();
String selecciona="";
if (selecciona1==null)
    selecciona1="";
else
    selecciona1=selecciona1.trim();
%>
<select name='Clase'>
<%if (selecciona1.equals("Y"))
    selecciona="SELECTED";
else
    selecciona="";
%>
<option value='Y' <%=selecciona%> >Y</option>
<%if (selecciona1.equals("B"))
    selecciona="SELECTED";
else
    selecciona="";
%>

<option value='B' <%=selecciona%> >B</option>
<%if (selecciona1.equals("M"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='M' <%=selecciona%> >M</option>
<%if (selecciona1.equals("P"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='P' <%=selecciona%> >P</option>
<%if (selecciona1.equals("Q"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='Q' <%=selecciona%> >Q</option>
<%if (selecciona1.equals("V"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='V' <%=selecciona%> >V</option>

<%if (selecciona1.equals("X"))
    selecciona="SELECTED";
else
    selecciona="";
%>
<option value='X' <%=selecciona%> >X</option>

<%if (selecciona1.equals("Z"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='Z' <%=selecciona%> >Z</option>


<%if (selecciona1.equals("L"))
    selecciona="SELECTED";
else
    selecciona="";
%>


<option value='L' <%=selecciona%> >L</option>

</select>
</td>

</tr>



<tr>
<th colspan="8" >Time Limit </th>
</tr>
<td colspan="1"><b>Mes: </b>
<input name="Mest" value="<%=mest%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>D&iacute;a: </b>
<input name="Diat" value="<%=diat%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>A&ntilde;o: </b>
<input name="Aniot" value="<%=aniot%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>Hora: </b>
<input name="Horat" value="<%=contacto.getHorat()%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td colspan="1"><b>Minutos: </b>
<input name="Minutost" value="<%=contacto.getMinutot()%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>


</table>
<table width="100%" align="CENTER">


<tr class="form1">
<th colspan="8" >Datos del Viaje</th>

</tr>
<tr >

<th  colspan="3">Fecha</th>
<th >Origen</th>
 <th >Destino</th>
 <th >Numero</th>
 <th >Hora</th>
 <th >Avion</th>
</tr>

<%

int contador=0;

long codigo1=0;
String vale="";
 List lista = model.getVueloreserva();
              if  (lista != null)  {
                    Iterator itv = lista.iterator();
                   while (itv.hasNext()) {
                        Vuelosreserva vuelo=(Vuelosreserva) itv.next();
                        
                        fecha=model.TimestamptoCalendar(vuelo.getFecha());
                        
                         anio=fecha.get(Calendar.YEAR);
                         mes=fecha.get(Calendar.MONTH)+1;
                         dia=fecha.get(Calendar.DATE);
                         int anioh=hoy.get(Calendar.YEAR);
                         int mesh=hoy.get(Calendar.MONTH)+1;
                         int diah=hoy.get(Calendar.DATE);
                         //hoy=null;
                         //hoy.set(anio,mes-1,dia,0,0);
                         //fecha.set(anio,mes-1,dia,0,0);
                         
                         if (fecha.compareTo(hoy)>=0)
                            vale="";
                        else
                        {
                          if ((anio==anioh) && (mes==mesh) && (dia==diah))
                            vale="";
                          else
                            vale="readonly";
                        } 
                         contador++;
                        codigo1=vuelo.getCodigo();
                    
%>
<tr class="vuelo">
<input name="codigo<%=contador%>" value="<%=codigo1%>" 
type="hidden" >
<input name="cambia<%=contador%>" value="<%=vale%>" 
type="hidden"  >
<input name="Open<%=contador%>" value="<%=vale%>" 
type="hidden"  >
<td colspan="1"><b>Mes: </b>
<input name="Mes<%=contador%>"  <%=vale%> value="<%=mes%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>D&iacute;a: </b>
<input name="Dia<%=contador%>" <%=vale%> value="<%=dia%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>A&ntilde;o: </b>
<input name="Anio<%=contador%>" <%=vale%> value="<%=anio%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td>
<input name="Origen<%=contador%>" <%=vale%> value="<%=vuelo.getOrigen()%>" 
type="text" size="3" maxlength="3" >
</td>
<td>
<input name="Destino<%=contador%>" <%=vale%> value="<%=vuelo.getDestino()%>" 
type="text" size="3" maxlength="3" >
</td>
<td>
<input name="Numero<%=contador%>" <%=vale%> value="<%=vuelo.getNumero()%>" 
type="text" size="3" maxlength="3" >

</td>
<td><%=f.format(vuelo.getHora())+":"+f.format(vuelo.getMinuto())%></td>
<td><%=vuelo.getAvion()%> <input type="checkbox" name="Borrar<%=contador%>" value= "Borrar"><b>Click si Tramo es Borrado</b></td>
</tr>
<%}}%>


<input name="CONTADOR" value="<%=contador+1%>" 
type="hidden" >

<%for  (int nn=contador+1;nn<=6;nn++)
{%>
<tr class="vuelo">
<input name="codigo<%=nn%>" value="0" 
type="hidden"  >
<input name="cambia<%=nn%>" value="" 
type="hidden"  >
<td colspan="1"><b>Mes: </b>
<input name="Mes<%=nn%>" value="" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>D&iacute;a: </b>
<input name="Dia<%=nn%>" value="" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>A&ntilde;o: </b>
<input name="Anio<%=nn%>" value="" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>



</td>       
             
<td>
<input name="Origen<%=nn%>" value="" 
type="text" size="3" maxlength="3" >
</td>
<td>
<input name="Destino<%=nn%>" value="" 
type="text" size="3" maxlength="3" >
</td>
<td>
<input name="Numero<%=nn%>" value="" 
type="text" size="3" maxlength="3" >

</td>
<td colspan="2"><input type="checkbox" name="Open<%=nn%>" value= "Open<%=nn%>"><b>Click si Tramo es Abierto</b></td>

</tr>

<%}%>

</table>
<%----------------- valido
 <%@ include file="/Servlets/Reservas.jsp"%>
<%------------Prueba-------------%>

<table width="100%" align="center">        
<tr class="form1">
<tH colspan="3">
Observaciones
</tH>
</tr>
<tr>
<td colspan="3" align="center"><textarea name="Obs" cols="100" rows="3"></textarea></td>

</TR>
<%
String observa="";
String url="";
String derecha="";
 lista = model.getReservas();
              if  (lista != null)  {
                    Iterator ito = lista.iterator();
                   while (ito.hasNext()) {
                        Observaciones obs=(Observaciones) ito.next();
                        observa=obs.getObservacion();
                    url="";    
                    derecha="";
                   if (observa.indexOf("Booking")>0)
                   {
                        url=observa.substring(0,observa.indexOf("Booking")-1);
                        
                        derecha=observa.substring(observa.indexOf("Booking"),observa.length());
                        observa=derecha;
                        derecha=derecha.replace("Booking:","buscar=");
                        url=url+" "+"<a class='enblanco' href='"+CONTROLLER+"/Reservaciones/Booking?"+derecha+"'>"+observa+"</a>";
                   }
                   else
                       url=observa;
                         
%>
<tr bgcolor="#99FFFF">
<td><%=obs.getUsuario()%></td>
<td><%=obs.getFecha()%></td>
<td><%=obs.getHora()%></td>
</tr>
<tr bgcolor="#CCFFCC">
<td colspan="3"><%=url%></td>
</tr>

<%}}%>


</table>
<table width="100%" align="center">           
<%------Fin Prueba-----------------%>
<tr align="center">
<td align="center">
 <input TYPE="submit"    NAME="Grabar" value="Grabar" onclick="nosalir();">
 </td>
 <td align="center">
 <input TYPE="submit"    NAME="Nombres" value="Estados y Nombres" onclick="nosalir();">
 </td>
<td align="center" >
 <input  type="submit"  NAME="Dividir" value="Dividir Grupos" onclick="salirsi();">
 </td>
 <td align="center">
 <input  type="submit"  NAME="Salir" value="Salir" onclick="salirsi();">
 </td>
 </tr>
 <tr>
 <td align="center" colspan="2" >
 <input  type="submit"  NAME="Descuentos" value="Fijar Descuentos y Service Charge" onclick="salirsi();">
 </td>
 <td align="center" colspan="2" >
 <input  type="submit"  NAME="Ventas" value="Fijar Tarifas" onclick="nosalir();">
 </td>
 <input name="salir" value="0" 
type="hidden"  >
 
 </tr>
 </form>
 
</table>
</td>
</tr>
</table>


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


