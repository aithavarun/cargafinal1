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
String nOrigen=model.getNorigen();
String nDestino=model.getNdestino();
String Origen=request.getParameter("Origen");
String Destino=request.getParameter("Destino");
String Numero=request.getParameter("Numero");
String Hora=request.getParameter("Hora");
String Minutos=request.getParameter("Minutos");
String Dia=request.getParameter("Dia");
String Tiempo=request.getParameter("Tiempo");
if (nOrigen==null)
    nOrigen="";
if (nDestino==null)
    nDestino="";
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
if (Dia==null)
    Dia="0";
if (Tiempo==null)
    Tiempo="30";
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
<form method="post" action="<%=CONTROLLER%>/Itinerarios/Guardar"  
name="MantenimientoAviones" onSubmit="return validar(this)" 
>
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Itinerario</th>
</table>
<table width="50%" align="CENTER">
<%---------------
<%DecimalFormat f =new DecimalFormat("0.00");
String nOrigen=model.getNorigen();
String nDestino=model.getNdestino();
String Origen=request.getParameter("Origen");
String Destino=request.getParameter("Destino");
String Numero=request.getParameter("Numero");
String Hora=request.getParameter("Hora");
String Minutos=request.getParameter("Minutos");
String Dia=request.getParameter("Dia");
String Tiempo=request.getParameter("Tiempo");
if (nOrigen==null)
    nOrigen="";
if (nDestino==null)
    nDestino="";
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
if (Dia==null)
    Dia="0";
if (Tiempo==null)
    Tiempo="30";
%>
-------------------------%>
<input name="nOrigen" type= "hidden"   value="<%=nOrigen%>"><td>
<input name="nDestino" type= "hidden"   value="<%=nDestino%>"><td>
<tr>
<td>Numero de Vuelo :</td>
<td colspan="2"><input name="Numero" value="<%=Numero%>" type="text" size="10" maxlength="30"><td>

</tr>
<tr>
<td>Origen :</td>
<td><input name="Origen" value="<%=Origen%>" type="text" size="3" maxlength="3" ><td>
<td><%=nOrigen%></td>
</tr>
<tr>
<td>Destino :</td>
<td><input name="Destino" value="<%=Destino%>" type="text" size="3" maxlength="3" ><td>
<td><%=nDestino%></td>
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
<td>Dia :</td>
<td colspan="2">
<%-----
<select name='Dia'>
 <option value='0' >Sabado</option>
 <option value='1' >Domingo</option>
 <option value='2' >Lunes</option>
 <option value='3' >Martes</option>
 <option value='4' >Miercoles</option>
 <option value='5' >Jueves</option>
 <option value='6' >Viernes</option>
</select>
-----%>
<input type="checkbox" name="D0"  value= "0" >Sabado
<input type="checkbox" name="D1"  value= "1">Domingo
<input type="checkbox" name="D2"   value= "2" >Lunes
<input type="checkbox" name="D3"  value= "3" >Martes
<input type="checkbox" name="D4"  value= "4" >Miercoles
<input type="checkbox" name="D5"   value= "5" >Jueves
<input type="checkbox" name="D6"  value= "6" >Viernes


<script LANGUAGE="JavaScript"> 
//comboDias = eval("document.MantenimientoAviones.Dia");
//comboDias[<%=Dia%>].selected = true;
</SCRIPT>
</td>

</tr>

<tr>
<td>Tiempo de Vuelo (minutos) :</td>
<td colspan="2"><input name="Tiempo" type="text" size="10" maxlength="30" value="<%=Tiempo%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"   ><td>
</tr>
</table>
</td>
</tr>
<tr>
<td align="right">
<table width="10%" align="center">
<tr>
<td>
 <input TYPE="submit"    NAME="Guardar" value="Guardar">
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


