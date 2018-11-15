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
String Codigo=request.getParameter("Codigo");
int dia=0;
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
          Dia=itinerario.getDia();
          dia=itinerario.getDian();
          Hora=String.valueOf(itinerario.getHora());
          Minutos=String.valueOf(itinerario.getMinuto());
          Tiempo=String.valueOf(itinerario.getTiempo());
          Codigo=String.valueOf(itinerario.getCodigo());
          
      }
 }
}
Dia=Dia.trim();
String Dian="";
if (Dia.equals("0"))
    Dian="Domingo";
else if (Dia.equals("1"))
    Dian="Lunes";
else if (Dia.equals("2"))
    Dian="Martes";
else if (Dia.equals("3"))
    Dian="Miercoles";
else if (Dia.equals("4"))
    Dian="Jueves";
else if (Dia.equals("5"))
    Dian="Viernes";
else if (Dia.equals("6"))
    Dian="Sabado";
else
    Dian="Indefinido";
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
<form method="post" action="<%=CONTROLLER%>/Itinerarios/Modificar"  
name="MantenimientoAviones" onSubmit="return validar(this)" 
>
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Modificar Itinerario</th>
</table>
<table width="50%" align="CENTER">
<%---------------

-------------------------%>
<input name="nOrigen" type= "hidden"   value="<%=nOrigen%>"><td>
<input name="Codigo" type= "hidden"   value="<%=Codigo%>"><td>
<input name="nDestino" type= "hidden"   value="<%=nDestino%>"><td>
<input name="Dia" type= "hidden"   value="<%=dia%>"><td>
<tr>
<td>Numero de Vuelo :</td>
<td colspan="2"><input name="Numero" value="<%=Numero%>" type="text" size="10" maxlength="30"><td>

</tr>
<tr>
<td>Origen :</td>
<td><input name="Origen" value="<%=Origen%>" type="text" size="3" maxlength="3" onchange="esciudad(Origen.value)"><td>
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
<%=Dia%>
<%-----------------
<select name='Dia'>
 <option value='0' >Domingo</option>
 <option value='1' >Lunes</option>
 <option value='2' >Martes</option>
 <option value='3' >Miercoles</option>
 <option value='4' >Jueves</option>
 <option value='5' >Viernes</option>
 <option value='6' >Sabado</option>
</select>
<script LANGUAGE="JavaScript"> 
comboDias = eval("document.MantenimientoAviones.Dia");
comboDias[<%=Dia%>].selected = true;
</SCRIPT>
------------------%>
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


