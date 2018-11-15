<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<form method="post" action="<%=CONTROLLER%>/Impresion/Buscar"  name="BuscarBooking" >
<table>
<tr>
<td>Booking :
<input name="boleto" type="text" size="20" maxlength="30"  ></td>
<td>
<input TYPE="submit"    NAME="Buscar" value="Buscar"></td>
</tr>
</table>
</form>




