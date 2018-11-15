<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<%DecimalFormat f =new DecimalFormat("00");
String nOrigen=model.getNorigen();
String nDestino=model.getNdestino();
String Origen=request.getParameter("Origen");
String Destino=request.getParameter("Destino");
String Numero=request.getParameter("Numero");
String Hora=request.getParameter("Hora");
String Minutos=request.getParameter("Minutos");
String Dia=request.getParameter("Dia");
String Tiempo=request.getParameter("Tiempo");
String Codigo=request.getParameter("Codigo");
String Infantes=request.getParameter("Infantes");
String Pax=request.getParameter("Pax");
if (Origen==null)
{
    List list = model.getItinerarios();
    if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Itinerarios itinerario=(Itinerarios) it.next();
          Origen=itinerario.getOrigen();
          Destino=itinerario.getDestino();
          Numero=String.valueOf(itinerario.getNumero());
          Dia=String.valueOf(itinerario.getDian());
          Hora=String.valueOf(itinerario.getHora());
          Minutos=String.valueOf(itinerario.getMinuto());
          Tiempo=String.valueOf(itinerario.getTiempo());
          Codigo=String.valueOf(itinerario.getCodigo());
          
      }
 }
}
Dia=Dia.trim();
String Dian="";
if (Dia.equals("1")) 
    Dian="Domingo";
else if (Dia.equals("2"))
    Dian="Lunes";
else if (Dia.equals("3"))
    Dian="Martes";
else if (Dia.equals("4"))
    Dian="Miercoles";
else if (Dia.equals("5"))
    Dian="Jueves";
else if (Dia.equals("6"))
    Dian="Viernes";
else if (Dia.equals("0"))
    Dian="Sabado";
else
    Dian="Indefinido";
if (Infantes==null)
    Infantes="4";
if (Pax==null)
    Pax="100"; //Cambiado 145 por 100 pc.
%>

<script LANGUAGE="JavaScript"> 

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

  <%--------------------------  
        
----------------------------------%>
function validar(frm){

    var Pax=frm.Pax.value;
    if (Pax=="")
        {
            alert("Número de pasajeros es obligatorio" );
            return false;
        }
    
    var Infantes=frm.Infantes.value;
    if (Infantes=="")
        {
            alert("El número de infantes es obligatorio" );
            return false;
        }
    
    var Mes=frm.Mes.value;
    if (Mes=="")
        {
            alert("Mes de programación es obligatorio" );
            return false;
        }
    var Anio=frm.Anio.value;
    if (Anio=="")
        {
            alert("Anio de programación es obligatorio" );
            return false;
        }    
    if (Mes >12)
     {
            alert("Mes no puede ser mayor de 12" );
            return false;
      
     }
     if (Mes <=0)
     {
            alert("Mes no puede ser menor o igual a 0" );
            return false;
      
     }
    var Mesd=frm.Mesd.value;
    if (Mesd=="")
        {
            alert("Mes de programación es obligatorio" );
            return false;
        }
    var Aniod=frm.Aniod.value;
    if (Aniod=="")
        {
            alert("Anio de programación es obligatorio" );
            return false;
        }    
    if (Mesd >12)
     {
            alert("Mes no puede ser mayor de 12" );
            return false;
      
     }
     if (Mesd <=0)
     {
            alert("Mes no puede ser menor o igual a 0" );
            return false;
      
     } 
     
      var diad=frm.Diad.value;
     if (diad=="")
        {
            alert("Dia de programación es obligatorio" );
            return false;
        }
    var cuantos=cuantosDias(Mesd,Aniod);
    
    if (diad >cuantos)
     {
            alert("Dia no puede ser mayor de " + cuantos );
            return false;
      
     }
     if (diad <=0)
     {
            alert("Dia no puede ser menor o igual a 0" );
            return false;
      
     }
    var diaf=frm.Diaf.value;
     if (diaf=="")
        {
            alert("Dia de programación es obligatorio" );
            return false;
        }
     cuantos=cuantosDias(Mes,Anio);
    if (diaf >cuantos)
     {
            alert("Dia no puede ser mayor de " + cuantos );
            return false;
      
     }
     if (diaf <=0)
     {
            alert("Dia no puede ser menor o igual a 0" );
            return false;
      
     }
    
    
    return true;
}

 <%------------------
       alert(<%=Dia%>);
        comboDias = eval("document.MantenimientoAviones.Dia");
        comboDias[<%=Dia%>].selected = true;
       alert(<%=Dia%>);
 --------------%>

 
</SCRIPT>

<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Vuelos/Modificar"  
name="MantenimientoVuelos" onSubmit="return validar(this)" 
>
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<th>Programaci&oacute;n de Vuelos</th>
</table>
<table width="90%" align="CENTER">
<input name="Codigo" type= "hidden"   value="<%=Codigo%>"><td>
<input name="Origen" type= "hidden"   value="<%=Origen%>"><td>
<input name="Destino" type= "hidden"   value="<%=Destino%>"><td>
<input name="Hora" type= "hidden"   value="<%=Hora%>"><td>
<input name="Minutos" type= "hidden"   value="<%=Minutos%>"><td>
<input name="Dia" type= "hidden"   value="<%=Dia%>"><td>
<input name="Numero" type= "hidden"   value="<%=Numero%>"><td>
<%---------------


<input name="nOrigen" type= "hidden"   value="<%=nOrigen%>"><td>

<input name="nDestino" type= "hidden"   value="<%=nDestino%>"><td>
-------------------------%>
<tr>
<td><b>Numero de Vuelo :</b></td>
<td><%=Numero%></td>
<td><b>Dia :</b></td>
<td><%=Dian%></TD>
<td><b>Hora: </b></td>
<td><%=f.format(Integer.parseInt(Hora))%> : <%=f.format(Integer.parseInt(Minutos))%></TD>
        <%---<input name="Numero" value="<%=Numero%>" type="text" size="10" maxlength="30"><td>
-----%>
</tr>
<tr>
<td><b>Origen :</b></td>
<td><%=Origen%></td>
<td><%=nOrigen%></td>
<td><b>Destino :</b></td>
<td><%=Destino%></td>
<td><%=nDestino%></td>
</tr>
<tr>
<td colspan="3"><b>Tiempo de Vuelo (minutos) :</b></td>
<td colspan="2" align="left"><%=Tiempo%><td>
</tr>
<tr>
<td><b>
Programado desde :
</b></td>
<td>
<%=model.getDesde()%>
</td>
<td><b>
hasta :
</b></td>
<td>
<%=model.getHasta()%>
</td>

</tr>
<tr>
<td><b>
N&uacute;mero de infantes permitido:
</b></td>
<td>
<input name="Infantes" value="<%=Infantes%>" type="text" size="1" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>
Capacidad de Pasajeros:
</b></td>
<td>
<input name="Pax" value="<%=Pax%>" type="text" size="3" maxlength="3" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>
Avion:
</b></td>
<td>
<select name='Avion'>
<%
 model.BuscarAviones();
 List list1 = model.getAviones();
 if (list1 != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          Aviones avion=(Aviones) it1.next();
          String seleccionUrl=CONTROLLER+"/Aviones/Selecciona?codigo="+avion.getCodigo() ;
          %>
          
 <option value='<%=avion.getCodigo()%>' ><%=avion.getDescripcion()%></option>
 
 <%}}%>
 </select>
</td>
</tr>
<tr>
<td><b>
Programar Desde:
</b></td>
<td>(mes)
<input name="Mesd" value="1" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">

</td>
<td>(dia)
<input name="Diad" value="1" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">

</td>
<td>(a&ntilde;o)
<input name="Aniod" value="2007" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>
<tr>
<td><b>
Hasta:
</b></td>
<td>(mes)
<input name="Mes" value="12" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">

</td>
<td>(dia)
<input name="Diaf" value="1" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">

</td>
<td>(a&ntilde;o)
<input name="Anio" value="2007" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

</tr>


</table>
</td>
</tr>
<tr>
<td align="right">
<table width="10%" align="center">
<tr>
<td>
 <input TYPE="submit"    NAME="Programar" value="Programar">
 </td>
 <td>
 <input  type="submit"  NAME="Salir" value="Salir">
 </td>
 </tr>
</table>
</td>
</tr>
</form>

</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


