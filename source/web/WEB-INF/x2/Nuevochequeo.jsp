<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>

<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<%DecimalFormat f =new DecimalFormat("0000");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");

%>

<script LANGUAGE="JavaScript"> 


  
<%----------------------------------%>

function validar(frm){

<%-------------------------- 
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
    --------------%>
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
<form method="post" action="<%=CONTROLLER%>/Chequeo/Guardar"  
name="MantenimientoChequeo" onSubmit="return validar(this)" 
>
<tr>
<td valign="top">
<table width="80%" align="CENTER">
<th>Mantenimiento de Vuelo en Chequeo</th>
</table>
<table width="50%" align="CENTER">
<%
List list1 = model.getVueloreserva();
 
 //String Numero1="0";
 //chelsecuencial,chesorigen,chesdestino,chesnumero,cheihora,chedtfecha," +
  //            " chesestado,chesestacion,aviicodigo
 String Estado="";
 long codigo=0;
 long Avion=0;
String Origen="";
String Destino="";
String Numero="";
int Hora=0;
String Fecha="";
String Estacion="";
 if (list1 != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          Chequeo vuelo=(Chequeo) it1.next();
          
          codigo=vuelo.getCodigo();
          Numero=vuelo.getNumero();
          Origen=vuelo.getOrigen();
          Destino=vuelo.getDestino();
          Estacion=vuelo.getEstado();
          Hora=vuelo.getHora();
          Avion=vuelo.getPax();
          Estado=vuelo.getTipo().trim();
          Fecha=FORMATOFECHA.format(vuelo.getFecha());
      }
 }
          %>
<%-------------------------%>
<tr>
<td  colspan="2">Numero de Vuelo :</td>
<td colspan="3"><%=Numero%><td>

</tr>
<tr>
<td  colspan="2">Origen :</td>
<td><%=Origen%> <td>

</tr>
<tr>
<td colspan="2">Destino :</td>
  <td><%=Destino%><td>
</tr>
<tr>
<td  colspan="2">Hora </td>
<td  colspan="2" ><%=f.format(Hora)%><td>
</tr>

<tr>
<td  colspan="2">Fecha</td>
<td colspan="3"><%=Fecha%><td>
</tr>
<tr>
<td  colspan="2">Estado :</td>
<td colspan="5">
<select name='Estado'>
<% String Selecciona="";
if(Estado.equals("OPEN"))
    Selecciona="selected";
else
    Selecciona="";
%>
 <option value='OPEN' <%=Selecciona%> >Abierto</option>
<%
 if(Estado.equals("HOLD"))
    Selecciona="selected";
else
    Selecciona="";
%>
 <option value='HOLD' <%=Selecciona%> >En espera</option>
 <%
 if(Estado.equals("OPENB"))
    Selecciona="selected";
else
    Selecciona="";
%>

 <option value='OPENB' <%=Selecciona%> >Abierto e impresión del Pase a Bordo</option>
 <%
 if(Estado.equals("CLOSE"))
    Selecciona="selected";
else
    Selecciona="";
%>

 <option value='CLOSE' <%=Selecciona%> >Cerrado</option>
 </select>
</td>
</tr>
<tr>
<td colspan="2">Equipo Asignado:</td>
<td colspan="5">
<select name='Avion'>
<%
 List lista = model.getAviones();
 if (lista != null) {
      Iterator ita = lista.iterator();
      while (ita.hasNext()) {
          Aviones avion=(Aviones) ita.next();
         
          %>
          
 <option value='<%=avion.getCodigo()%>' ><%=avion.getDescripcion()%></option>
 
 <%}}%>
 </select>
</td>
</tr>
<tr>
<td colspan="2">Estacion de Chequeo </td>
<td colspan="3"><%=Estacion%><td>
</tr>
</table>
</td>
</tr>

<%------------
</table>
</td>
</tr>
--------%>
<tr>
<td align="center">
<table width="50%" align="center">
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


