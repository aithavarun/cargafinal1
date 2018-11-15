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
<%DecimalFormat f =new DecimalFormat("0.00");
String Origen=request.getParameter("Origen");
String Destino=request.getParameter("Destino");
String Numero=request.getParameter("Numero");
String Hora=request.getParameter("Hora");
String Minutos=request.getParameter("Minutos");
String Dia=request.getParameter("Dia");
String Mes=request.getParameter("Mes");
String Anio=request.getParameter("Anio");

if (Origen==null)
    Origen="";
if (Destino==null)
    Destino="";
if (Numero==null)
    Numero="0";
if (Hora==null)
    Hora="12";
if (Minutos==null)
    Minutos="00";

//Dia=Dia.trim();
%>

<script LANGUAGE="JavaScript"> 


  <%--------------------------  
        
----------------------------------%>
function validar(frm){

    var tiempo=frm.Tiempo.value;
    if (tiempo=="")
        {
            alert("Tiempo de vuelo es obligatorio " );
            return false;
        }
    
    var origen=frm.Origen.value;
    if (origen=="")
        {
            alert("Origen de vuelo es obligatorio " );
            return false;
        }
    
    var destino=frm.Destino.value;
    if (destino=="")
        {
            alert("Destino de vuelo es obligatorio " );
            return false;
        }
    if (origen==destino)
    {
            alert("Origen debe se distinto a Destino de vuelo  " );
            return false;
    }    
    var numero=frm.Numero.value;
    if (numero=="")
        {
            alert("Numero de vuelo es obligatorio " );
            return false;
        }
    var hora=frm.Hora.value;
    if (hora=="")
        {
            alert("Hora es obligatoria " );
            return false;
        }
    if (hora > 23)
    {
        alert("Hora entre un rango de 0-23 " + hora);
        return false;
    }    
    var minuto=frm.Minutos.value;
    if (minuto=="")
        {
            alert("Minutos son obligatorios " );
            return false;
        }
    if (minuto > 59)
    {
        alert("Minuto entre un rango de 0-59 " + hora);
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
<form method="post" action="<%=CONTROLLER%>/Vuelo/Guardar"  
name="MantenimientoAviones" onSubmit="return validar(this)" 
>
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Vuelo</th>
</table>
<table width="50%" align="CENTER">

<input name="Dia" type= "hidden"   value="<%=Dia%>">
<input name="Mes" type= "hidden"   value="<%=Mes%>">
<input name="Anio" type= "hidden"   value="<%=Anio%>">
<tr>
<td>Numero de Vuelo :</td>
<td colspan="2"><input name="Numero" value="<%=Numero%>" type="text" size="10" maxlength="30" onChange="javascript:this.value=this.value.toUpperCase();"><td>

</tr>
<tr>
<td>Origen :</td>
<td><input name="Origen" value="<%=Origen%>" type="text" size="3" maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();"><td>

</tr>
<tr>
<td>Destino :</td>
<td><input name="Destino" value="<%=Destino%>" type="text" size="3" maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();"><td>

</tr>
<tr>
<td>Hora (0-23):</td>
<td  colspan="2" ><input name="Hora" value="<%=Hora%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td >Minutos (0-59) :</td>
<td colspan="2"><input name="Minutos" value="<%=Minutos%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>
<tr>
<td>
Estado:
</td>
<td>
<select name='Estado'>
<option value='A' >Activo</option>
<option value='C' >Stop Booking</option>
<option value='X' >Cancelado</option>
 </select>
</td>
</tr>

<tr>
<td>Tiempo de Vuelo (minutos) :</td>
<td colspan="2"><input name="Tiempo" type="text" size="10" maxlength="30" value="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"   ><td>
</tr>
<tr>
<td>
N&uacute;mero de infantes permitido:
</td>
<td>
<input name="Infantes" value="4" type="text" size="1" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>
<Tr>
<td>
Capacidad de Pasajeros:
</td>
<td>
<input name="Pax" value="100" type="text" size="3" maxlength="3" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>
</td>
</tr>
<tr>
<td>
Avion:
</td>
<td>
<select name='Avion'>
<%
 String selecciona="";   
 List list1 = model.getAviones();
 if (list1 != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          Aviones avion=(Aviones) it1.next();
          
         
              selecciona="";
          %>
          
 <option value='<%=avion.getCodigo()%>' <%=selecciona%>><%=avion.getDescripcion()%>  </option>
 
 <%}}%>
 </select>
</td>
</tr>

</table>
<tr>
<td align="right">
<table width="10%" align="center">
<tr>
<td>
 <input TYPE="submit"    NAME="Grabar" value="Guardar">
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


