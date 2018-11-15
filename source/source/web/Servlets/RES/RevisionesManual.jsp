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
otros=eval(form.Tarifa.value)+eval(form.Q.value) + eval(form.Tasa.value)+ 
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



<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Revisiones/Guardar"  name="RevisionManual">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Revision Manual</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<td>Origen :</td>
<td><input name="Origen" type="text" size="3" maxlength="3"></td>

<td>Destino :</td>
<td><input name="Destino" type="text" size="3" maxlength="3"></td>

</tr>

<tr>
<td>Origen :</td>
<td><input name="Origen2" type="text" size="3" maxlength="3"></td>

<td>Destino :</td>
<td><input name="Destino2" type="text" size="3" maxlength="3"></td>

</tr>
</table>
<table width="50%" align="CENTER">
<tr>
<td>Fecha :</td>
<td>
Dia</td>
<td><input name= "Dia" id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);"  >
</TD>
<td>Mes</td>
<td><input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);" > 
</TD>
<td>Anio</td>
<td><input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
</table>

<table width="50%" align="CENTER">
<td>Apellido :</td>
<td><input name="Apellido" type="text" size="30" maxlength="30"></td>
<td>Nombre :</td>
<td><input name="Nombre" type="text" size="30" maxlength="30"></td>
</tr>

<tr>
<td>Boleto :</td>
<td><input name="Boleto" type="text" size="30" maxlength="30"></td>
<td>Boleto Anterior:</td>
<td><input name="Boletoant" type="text" value=0  size="30" maxlength="30"></td>
</tr>

<tr>
<td>Tarifa :</td>
<td><input name="Tarifa" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ONBLUR ="suma(this.form);">  <td>
</tr>

<tr>
<td>Q :</td>
<td><input name="Q" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ONBLUR ="suma(this.form);">  <td>
</tr>


<tr>
<td>Iva :</td>
<td><input name="Iva" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ONBLUR ="suma(this.form);"><td>
</tr>

<tr>
<td>Tasa :</td>
<td><input name="Tasa" type="text"  value =0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ONBLUR ="suma(this.form);"><td>
</tr>

<tr>
<td>Seguro :</td>
<td><input name="Seguro" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ONBLUR ="suma(this.form);"><td>
</tr>


<tr>
<td>Comision :</td>
<td><input name="Comision" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ONBLUR ="suma(this.form);"><td>
</tr>

<tr>
<td>S.C. :</td>
<td><input name="Sc" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ONBLUR ="suma(this.form);"><td>
</tr>


<tr>
<td>Penalidad :</td>
<td><input name="Penalidad" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ONBLUR ="suma(this.form);"></td>
</tr>

<tr bgcolor="#CCCCCC">
<td>Cash :</td>
<td><input name="Total" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td>
</tr>

<tr bgcolor="#CCCCCC">
<td>Tarjeta de Credito :</td>
<td><input name="Tc" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td>
</tr>


<tr bgcolor="#CCCCCC">
<td>Otros :</td>
<td><input name="Otros" type="text" value=0 size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td>
</tr>

 <tr>
<td>Observaciones :</td>
<td><input name="Observaciones" type="text" size="50" maxlength="100" ></td>
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
 RevisionManual.Dia.value=ahoraDay;
 RevisionManual.Mes.value=ahoraMonth;
 RevisionManual.Anio.value=ahoraYear;
 
 
 
 
</SCRIPT >

</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


