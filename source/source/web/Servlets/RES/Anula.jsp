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
<form method="post" action="<%=CONTROLLER%>/Reservaciones/Anular"  name="BuscarTarifas" >
<table width="50%" align="center">
<tr>
<th colspan="6">Anular Boletos</th>
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
<td>Boleto :
<input name="boleto" type="text" size="20" maxlength="30" value="0"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td>Obs :
<input name="observaciones" type="text" size="20" maxlength="30" value=""
></td>
</tr>
<tr>
<td>Tipo:
<select name='tipo'>
<option value='B' >BSP</option>
<option value='W'>web</option>
<option value='E'>Eticket</option>
<option value='A'>Aerogal</option>
<option value='R'>Revisi&oacute;n</option>
<option value='H'>Ch.Coorp.</option>
</select>
</td>

<td>

<input TYPE="submit"    NAME="Anular" value="Anular"></td>
</tr>

</table>
</form>



<form method="post" action="<%=CONTROLLER%>/Reservaciones/Anularpta"  name="AnularPtas" >
<table width="50%" align="center">
<tr>
<th colspan="6">Anular Prepagados</th>
</tr>
<%

String Pta=request.getParameter("pta");
if (Pta==null)
    Pta="0";
if (error !=null)
{%>
<tr class="error">
<th colspan="6" ><%=error%></th>
</tr>
<%}%>
<tr>
<td>Prepagado :
<input name="pta" type="text" size="20" maxlength="30" value="0"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td>Obs :
<input name="observacionesp" type="text" size="20" maxlength="30" value=""
></td>
</tr>
<tr>


<td>

<input TYPE="submit"    NAME="Anular" value="Anular"></td>
</tr>

</table>
</form>



<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


