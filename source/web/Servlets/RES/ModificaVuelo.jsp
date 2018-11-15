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
String Origen="";
String Destino="";
String Numero="";
String Mes=request.getParameter("Mes");
String Anio=request.getParameter("Anio");
String Dia=request.getParameter("Dia");

String Codigo=request.getParameter("codigo");
String Infantes="";
String Pax="";
String Estado="";
int codavion=0;
int estado=0;
int Hora=0;
int Minutos=0;
java.util.Date fecha=null;
Calendar calendario=Calendar.getInstance(); 

    List list = model.getVuelos();
    if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Vuelos vuelo=(Vuelos) it.next();
          Origen=vuelo.getOrigen();
          Destino=vuelo.getDestino();
          Numero=vuelo.getNumero();
          Hora=(vuelo.getHora());
          Estado=vuelo.getEstado();
          Minutos=(vuelo.getMinuto());
          Pax=String.valueOf(vuelo.getPax());
          Infantes=String.valueOf(vuelo.getInfantes());
          fecha=vuelo.getFecha();
          calendario.setTime(vuelo.getFecha());
          codavion=vuelo.getCodavion();
          Dia=String.valueOf(calendario.get(Calendar.DATE));
          Mes=String.valueOf(calendario.get(Calendar.MONTH)+1);
          Anio=String.valueOf(calendario.get(Calendar.YEAR));
          //Tiempo=String.valueOf(itinerario.getTiempo());
          //Codigo=String.valueOf(itinerario.getCodigo());
          
      }
 }

if (Estado.equals("C"))
    estado=1;
else if (Estado.equals("X")) 
    estado=2;
%>

<script LANGUAGE="JavaScript"> 

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
    
     var Hora=frm.Hora.value;
     if (Hora=="")
     {
            alert("Hora es obligatorio" );
            return false;
     }
     if (Hora >23)
     {
            alert("Hora es menor de 24" );
            return false;
     }
    if (Hora <0)
     {
            alert("Hora es mayor de 0" );
            return false;
     }
    var Minutos=frm.Minutos.value;
     if (Minutos=="")
     {
            alert("Minutos es obligatorio" );
            return false;
     }
     if (Minutos >59)
     {
            alert("Minutos es menor de 60" );
            return false;
     }
    if (Minutos <0)
     {
            alert("Minutos es mayor de 0" );
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
<form method="post" action="<%=CONTROLLER%>/Vuelos/Guardar"  
name="MantenimientoVuelos" onSubmit="return validar(this)" 
>
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<th>Programaci&oacute;n de Vuelos</th>
</table>
<table width="90%" align="CENTER">
<td><input name="Codigo" type= "hidden"   value="<%=Codigo%>"></td>
<td><input name="Dia" type= "hidden"   value="<%=Dia%>"></td>
<td><input name="Mes" type= "hidden"   value="<%=Mes%>"></td>
<td><input name="Anio" type= "hidden"   value="<%=Anio%>"></td>
<%---------------


<input name="nOrigen" type= "hidden"   value="<%=nOrigen%>"><td>

<input name="nDestino" type= "hidden"   value="<%=nDestino%>"><td>
-------------------------%>
<tr>
<td><b>Numero de Vuelo :</b></td>
<td><%=Numero%></td>

<td><b>Fecha de Vuelo :</b></td>
<td><%=fecha%></td>

</tr>
<tr>
<td><b>Origen :</b></td>
<td><%=Origen%></td>

<td><b>Destino :</b></td>
<td><%=Destino%></td>
</tr>
<tr>
<td><b>Hora:</b></td>
<td><input name="Hora" value="<%=f.format(Hora)%>" type="text" size="2"  maxlength="2"></td> 
<td><b>Minutos:</b></td>
<td><input name="Minutos" value="<%=f.format(Minutos)%>"type="text" size="2"  maxlength="2"></td> 
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
</tr>
<tr>
<td><b>
Avion:
</b></td>
<td>
<select name='Avion'>
<%
 String selecciona="";   
 List list1 = model.getAviones();
 if (list1 != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          Aviones avion=(Aviones) it1.next();
          String seleccionUrl=CONTROLLER+"/Aviones/Selecciona?codigo="+avion.getCodigo() ;
          if (codavion==avion.getCodigo())
              selecciona="SELECTED";
          else
              selecciona="";
          %>
          
 <option value='<%=avion.getCodigo()%>' <%=selecciona%>><%=avion.getDescripcion()%>  </option>
 
 <%}}%>
 </select>
</td>
<td><b>
Estado:
</b></td>
<td>
<select name='Estado'>
<option value='A' >Activo</option>
<option value='C' >Stop Booking</option>
<option value='X' >Cancelado</option>
 </select>
</td>
<script LANGUAGE="JavaScript"> 
comboEstado= eval("document.MantenimientoVuelos.Estado");
comboEstado[<%=estado%>].selected = true;
</SCRIPT>
</tr>


</table>
</td>
</tr>
<tr>
<td align="right">
<table width="10%" align="center">
<tr>
<td>
 <input TYPE="submit"    NAME="Grabar" value="Grabar">
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


