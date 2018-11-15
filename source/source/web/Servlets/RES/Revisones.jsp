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
<form method="post" action="<%=CONTROLLER%>/Revision/Buscar"  name="BuscarTarifas" >

<table width="50%" align="center">
<tr>
<th colspan="6">REVISONES</th>
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
<input name="boleto" type="text" size="20" maxlength="30" value="<%=Boleto%>"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td>
<input TYPE="submit"    NAME="Buscar" value="Buscar"></td>
</tr>

</table>
</form>


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


