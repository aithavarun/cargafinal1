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
<%DecimalFormat f =new DecimalFormat("###,0.00");


%>

<script LANGUAGE="JavaScript"> 


  <%--------------------------  
        
----------------------------------%>
function validar(frm){

    var tiempo=frm.Base.value;
    if (tiempo=="")
        {
            alert("Tarifa Base  es obligatorio " );
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
        
    
    return true;
}
function round(x) {
	return Math.round(x*100)/100;
}
function ponIva()
{
    
   Iva = eval("document.MantenimientoTarifas.Iva");
    Valor = eval("document.MantenimientoTarifas.Valor");
    Cola = eval("document.MantenimientoTarifas.Q");
    var calculo=parseFloat(Valor.value)+parseFloat(Cola.value);
    Iva.value=round(calculo*.12);
    
}
function anulo()
{
    
    
    R0 = eval("document.MantenimientoTarifas.R0");
    //alert(R0.checked);
    if (R0.checked)
    {
     R = eval("document.MantenimientoTarifas.R1");
     R.checked=0;
     R.disabled=1;
     R = eval("document.MantenimientoTarifas.R10");
     R.checked=0;
     R.disabled=1;
     R = eval("document.MantenimientoTarifas.R100");
     R.checked=0;
     R.disabled=1;
     R = eval("document.MantenimientoTarifas.R1000");
     R.checked=0;
     R.disabled=1;
    }
    else
    {
    R = eval("document.MantenimientoTarifas.R1");
     R.checked=1;
     R.disabled=0;
     R = eval("document.MantenimientoTarifas.R10");
     R.checked=1;
     R.disabled=0;
     R = eval("document.MantenimientoTarifas.R100");
     R.checked=1;
     R.disabled=0;
     R = eval("document.MantenimientoTarifas.R1000");
     R.checked=1;
     R.disabled=0;
    }
    <%--------------
    if (R0.value)
    Valor = eval("document.MantenimientoTarifas.Valor");
    Iva.value=round(Valor.value*.12);
    -------------%>
}

 <%------------------
       alert(<%=Dia%>);
        comboDias = eval("document.MantenimientoAviones.Dia");
        comboDias[<%=Dia%>].selected = true;
       alert(<%=Dia%>);
 --------------%>

 
</SCRIPT>
<script>
    var f = new Date();
    var formatFecha = f.getFullYear()+"-"+(f.getMonth()+1)+"-"+f.getDate();
    document.getElementsByName("formatFecha").value = formatFecha;
</script>

<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/TarifasCarga/Guardar"  
name="MantenimientoTarifasCarga" onSubmit="return validar(this)" 
>
<tr>
<td valign="top">
<table width="100%" align="CENTER">
<th>Nueva Tarifa Carga</th>
</table>


<table width="50%" align="CENTER">
<%---------------

%>
-------------------------%>



<tr>
<td>Tipo Tarifa :</td>
<td><select  name="Tipo" type="text" class='txt-arialimput'>
<%
 model.BuscarTipostarifas();
 List list = model.getTiposTarifas();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Tipot tipot=(Tipot) it.next();
      
          %>
          
         <option value="<%=tipot.getSecuencial()%>" > <%=tipot.getNombre().trim()%>  </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>

<tr>
<td>Desde(K) :</td>
<td><input name="Desde" value="0" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td>Hasta(K) :</td>
<td><input name="Hasta" value="0" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td >Flete : </td>
<td  colspan="2" ><input name="Tarifa" value="0" type="text" size="3" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>

</tr>


<tr>
<td >Valorizacion : </td>
<td  colspan="2" ><input name="Valorizacion" value="0" type="text" size="3" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
 Fijo Por Envio 
<input type="checkbox" name="Vfija" value= "1"     >
</td>
</tr>


<tr>
<td >Seguro : </td>
<td  colspan="2" ><input name="Seguro" value="0.1" type="text" size="3" maxlength="5" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td >Iva(%) : </td>
<td  colspan="2" ><input name="Iva" value="0" type="text" size="3" maxlength="5" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td >Descuento(%) : </td>
<td  colspan="2" ><input name="Descuento" value="0" type="text" size="3" maxlength="5" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td >Todo este rango paga la misma tarifa </td>
<td colspan="2">
<input type="checkbox" name="Minimo" value= "1"     >
</td>
</tr>

<tr>
<td>Tarifa que se cobrara segun este en el continente </td>
<td colspan="2">
<input type="radio" name="DentroFuera" value= "D"  checked     >Dentro </td>
<td>
   <input type="radio" name="DentroFuera" value= "F"     >Fuera
</td>
</tr>
<tr>
<% 
 Date fecha = new Date();
 java.sql.Date fecha_creacion = new java.sql.Date(fecha.getTime());
 %>
<td>Fecha Creacion: </td>
<td>
    <input value="<%=fecha_creacion%>" disabled="true" ></input>
</td>
</tr>
<table width="40%" align="center">
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


