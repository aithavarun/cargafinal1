<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  
<SCRIPT language="JavaScript" >
    

 
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
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>

<form method="post" action="<%=CONTROLLER%>/Reservaciones/FechaBoletos"  name="Fechaboletos" >
<table width="50%" align="center">
<tr>
<th colspan="6">Fechas Boletos</th>
</tr>
<% String error=model.getError();

String Boleto=request.getParameter("boleto");
if (Boleto==null)
    Boleto="0";
if (error !=null)
{%>
<tr class="error">
<th colspan="6" ><%=error%></th>
</tr>
<%}%>
<tr>
<td colspan="7">Boleto :
<input name="boleto" type="text" size="20" maxlength="30" value="<%=Boleto%>"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td>
</tr>
<tr>
<td>Nueva Fecha del Boleto :</td>
<td>
Dia</td>
<td><input name= "Dia" id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
</td>
<td>Mes</td>
<td><input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
</td>
<td>Anio</td>
<td><input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td>Usuario</td>
<td><input name= "Usuario"  type="text"  size="20" maxlength="20" value="<%=usuario.getNombre()%>">
</td>

</tr>
<tr>
<td><input TYPE="submit"    NAME="Buscar" value="Guardar"></td>
</tr>
</table>
</form>


<form method="post" action="<%=CONTROLLER%>/Reservaciones/FechaPtas"  name="FechaPtas" >
<table width="50%" align="center">
<tr>
<th colspan="6">Fechas PtasPablo</th>
</tr>
<% String error2=model.getError();

String pta=request.getParameter("pta");
if (pta==null)
    pta="0";
if (error !=null)
{%>
<tr class="error">
<th colspan="6" ><%=error2%></th>
</tr>
<%}%>
<tr>
<td colspan="7">Pta :
<input name="pta" type="text" size="20" maxlength="30" value="<%=pta%>"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td>
</tr>
<tr>
<td>Nueva Fecha del Pta :</td>
<td>
Dia</td>
<td><input name= "Diap" id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
</td>
<td>Mes</td>
<td><input name= "Mesp" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
</td>
<td>Anio</td>
<td><input name= "Aniop" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td>Usuario</td>
<td><input name= "Usuariop"  type="text"  size="20" maxlength="20" value="<%=usuario.getNombre()%>">
</td>

</tr>
<tr>
<td><input TYPE="submit"    NAME="Buscar" value="Guardar"></td>
</tr>
</table>
</form>

<SCRIPT language="JavaScript">
ahora       = new Date();
ahoraDay    = ahora.getDate();
ahoraMonth  = ahora.getMonth()+1;
ahoraYear   = ahora.getYear();
Fechaboletos.Dia.value=ahoraDay;
Fechaboletos.Mes.value=ahoraMonth;
Fechaboletos.Anio.value=ahoraYear;
FechaPtas.Diap.value=ahoraDay;
FechaPtas.Mesp.value=ahoraMonth;
FechaPtas.Aniop.value=ahoraYear;
</SCRIPT >


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


