<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>

<SCRIPT language="JavaScript" type="text/javascript">
    ahora       = new Date();
    ahoraDay    = ahora.getDate();
    ahoraMonth  = ahora.getMonth()+1;
    ahoraYear   = ahora.getYear();
   
function suma(form)
{
var total;
var otros;
total=0;
otros=0;
otros=eval(form.Tarifa.value) + eval(form.Tasa.value)+ 
      eval(form.Iva.value)+ eval(form.Seguro.value)-
      eval(form.Comision.value)+ 
      eval(form.Sc.value);
total=eval(form.Penalidad.value)
form.Otros.value=otros;
form.Total.value=total;

}
 
 function envia(form ){
   if (form.Dia.value>31) 
  {
   alert("dia incorrecto");
   return false;

  } 

 else
   return true;

   }
   
   
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

function validames(campo) {
if (campo.value > 12) campo.value = 12;
}

function validadia(campo,mes, anyo) {
var dias;
dias=cuantosDias(mes,anyo);
if (campo.value > dias)  campo.value = cuantosDias(mes,anyo);
}
    
</SCRIPT>


<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Equipaje/Guardar"  name="MantenimientoEquipaje">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Exceso de Equipaje </th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");%>

<tr>
<td>Fecha :</td>
<td>Dia
<input name= "Dia" id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);"  >
Mes
<input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);" > 
Anio
<input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
</tr>

<tr>
<td>Numero:</td>
<td><input name="Numero" type="text" size="10" maxlength="20"><td>
</tr>
<tr>
<td>Origen :</td>
<td><input name="Origen" type="text" size="3" maxlength="3"><td>
</tr>

<tr>
<td>Destino :</td>
<td><input name="Destino" type="text" size="3" maxlength="3"><td>
</tr>


<tr>
<td>Valor :</td>
<td><input name="Valor" value=0 type="text" size="10" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ><td>
</tr>

<tr>
<td>IVA :</td>
<td><input name="Iva" type="text" value=0 size="10" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"  ><td>
</tr>

<tr>
<td>Efectivo :</td>
<td><input name="Efectivo" value=0 type="text" size="30" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"  ><td>
</tr>

<tr>
<td>Tarjeta de Credito :</td>
<td><input name="Tarjeta" value=0 type="text" size="15" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"  ><td>
</tr>



<tr>
<td>Observacion  :</td>
<td><input name="Observacion" type="text" size="55" maxlength="100" ><td>
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
<SCRIPT language="JavaScript" type="text/javascript">
 MantenimientoEquipaje.Dia.value=ahoraDay;
 MantenimientoEquipaje.Mes.value=ahoraMonth;
 MantenimientoEquipaje.Anio.value=ahoraYear;
  
</SCRIPT >
</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


