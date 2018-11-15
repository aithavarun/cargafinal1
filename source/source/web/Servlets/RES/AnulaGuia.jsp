<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  

<form method="post" action="<%=CONTROLLER%>/Reservaciones/AnularGuia"  name="AnularGuia" >
<table width="50%" align="center">
<tr>
<th colspan="6">Anular Guias de Carga</th>
</tr>
<% String error=model.getError();

/*
String Boleto=request.getParameter("boleto");
if (Boleto==null)
    Boleto="0";
if (error !=n */ %>
<tr>

<td>Guia de Carga :
<input name="guia" type="text" size="20" maxlength="30" value="0"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td>Obs :
<input name="observaciones" type="text" size="20" maxlength="30" value=""
></td>
</tr>
<tr>

<td>

<input TYPE="submit"    NAME="Anular" value="Anular">
<input TYPE="submit"    NAME="Salir" value="Salir"></td>
</tr>

</table>
</form>


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


