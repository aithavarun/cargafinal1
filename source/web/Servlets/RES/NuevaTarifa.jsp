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
String nOrigen=model.getNorigen();
String nDestino=model.getNdestino();
String Origen=request.getParameter("Origen");
String Destino=request.getParameter("Destino");
String Base=request.getParameter("Base");
String Tipo=request.getParameter("Tipo");
String Clase=request.getParameter("Clase");
String Estado=request.getParameter("Estado");
String Validez=request.getParameter("Validez");
String R0=request.getParameter("R0");
String R1=request.getParameter("R1");
String R10=request.getParameter("R10");
String R100=request.getParameter("R100");
String R1000=request.getParameter("R1000");
String Valor=request.getParameter("Valor");
String Iva=request.getParameter("Iva");
String Seguro=request.getParameter("Seguro");
String Tasa=request.getParameter("Tasa");
String Cola=request.getParameter("Q");
String Restriccionesn=request.getParameter("Restriccionesn");
int clase=0;
int tipo=0;
int estado=0;
if (Restriccionesn==null)
    Restriccionesn="";

if (nOrigen==null)
    nOrigen="";
if (nDestino==null)
    nDestino="";
if (Origen==null)
    Origen="";
if (Destino==null)
    Destino="";
if (Base==null)
    Base="";
if (Tipo==null)
    Tipo="FF";
if (Clase==null)
    Clase="";
if (Validez==null)
    Validez="12";
if (Estado==null)
    Estado="";
if (R0!=null)
    R0="checked";
if (R1!=null)
    R1="checked";
if (R10!=null)
    R10="checked";
if (R100!=null)
    R100="checked";
if (R1000!=null)
    R1000="checked";
if (Valor==null)
    Valor="0.00";
if (Iva==null)
    Iva="0.00";
if (Seguro==null)
    Seguro="1";
if (Tasa==null)
    Tasa="2";
if (Cola==null)
    Cola="0";
if (Clase.equals("NAC"))
    clase=1;
else if (Clase.equals("EXT"))
    clase=2;

if (Tipo.equals("CD"))
    tipo=1;
else if (Tipo.equals("HD"))
    tipo=2;
else if (Tipo.equals("CH"))
    tipo=3;
else if (Tipo.equals("INF"))
    tipo=4;

if (Estado.equals("W"))
    estado=1;
else if (Estado.equals("X"))
    estado=2;
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

<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Tarifas/Guardar"  
name="MantenimientoTarifas" onSubmit="return validar(this)" 
>
<tr>
<td valign="top">
<table width="100%" align="CENTER">
<th>Nueva Tarifa</th>
</table>
<table width="100%" align="CENTER">
<%---------------

%>
-------------------------%>
<input name="nOrigen" type= "hidden"   value="<%=nOrigen%>"><td>
<input name="nDestino" type= "hidden"   value="<%=nDestino%>"><td>
<tr>
<td>Tarifa Base :</td>
<td colspan="2"><input name="Base" value="<%=Base%>" type="text" size="10" maxlength="30"><td>

</tr>
<tr>
<td>Origen :</td>
<td><input name="Origen" value="<%=Origen%>" type="text" size="3" maxlength="3" ><td>
<td align="left"><%=nOrigen%></td>
</tr>
<tr>
<td>Destino :</td>
<td><input name="Destino" value="<%=Destino%>" type="text" size="3" maxlength="3" ><td>
<td align="left"><%=nDestino%></td>
</tr>
<td>Tipo :</td>
<td colspan="2">
<select name='Tipo'>
 <option value='FF' >Adulto</option>
 <option value='CD' >3era. Edad</option>
 <option value='HD' >Discapacitados</option>
 <option value='HF' >Ni&ntilde;os</option>
 <option value='INF' >Infantes</option>
 </select>

</td>
<tr>
<td >Validez d&iacute;as</td>
<td  colspan="2" ><input name="Validez" value="<%=Validez%>" type="text" size="3" maxlength="3" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td>Clase</td>
<td colspan="2">
<select name='Clase'>
 <option value='*' >Todos</option>
 <option value='NAC' >Nacional</option>
 <option value='EXT' >Extranjero</option>
 
</select>
</td>
<tr>
<td>Estado:</td>
<td colspan="2">
<select name='Estado'>
 <option value='A' >Activa</option>
 <option value='W' >Web</option>
 <option value='X' >Cancelada</option>
 
</select>
</td>
<script LANGUAGE="JavaScript"> 
comboClase = eval("document.MantenimientoTarifas.Clase");
comboClase[<%=clase%>].selected = true;
comboTipo = eval("document.MantenimientoTarifas.Tipo");
comboTipo[<%=tipo%>].selected = true;
comboEstado = eval("document.MantenimientoTarifas.Estado ");
comboEstado[<%=estado %>].selected = true;
</SCRIPT>
</tr>
<tr>
<td >Restricciones :</td>
<td colspan="2">
<input type="checkbox" name="R0" <%=R0%> value= "0"     onclick="anulo()">Ninguna
<input type="checkbox" name="R1" <%=R1%> value= "1">Cambio Nombre
<input type="checkbox" name="R10"  <%=R10%> value= "10" >Cambio Ruta
<input type="checkbox" name="R100" <%=R100%> value= "100" >Extenci&oacute;n de Tiempo
<input type="checkbox" name="R1000" <%=R1000%> value= "1000" >P&eacute;rdida de Boleto

</td>
</tr>
<tr>
<td>Restricciones Texto:</td>
<td><input name="Restriccionesn" value="<%=Restriccionesn%>" type="text" size="50" maxlength="50" ><td>

</tr>


<tr>
<td>Tarifa:</td>
<td colspan="2"><input name="Valor" type="text" size="10" maxlength="30" value="<%=Valor%>" 
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"  onchange="ponIva();" ><td>
</tr>
<tr>
<td>Q.</td>
<td colspan="2"><input name="Q" type="text" size="10" maxlength="30" value="<%=Cola%>" 
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"  onchange="ponIva();" ><td>
</tr>

<tr>
<td>I.V.A.:</td>
<td colspan="2"><input name="Iva" type="text" size="10" maxlength="30" value="<%=Iva%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"   ><td>
</tr>
<tr>
<td>Seguro:</td>
<td colspan="2"><input name="Seguro" type="text" size="10" maxlength="30" value="<%=Seguro%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"   ><td>
</tr>

<tr>
<td>Tasa:</td>
<td colspan="2"><input name="Tasa" type="text" size="10" maxlength="30" value="<%=Tasa%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"   ><td>
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


