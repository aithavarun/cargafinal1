
<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>





<%@ include file="/WEB-INF/Banner.jsp"%>  

<table width="100%" align="left">
<tr>


<td valign="top" width="100%" >

<table width="80%" align="CENTER">

<tr class="form1">
<th colspan="6" >Reserva</th>
</tr>
<tr class="form1">
<th colspan="6" ><%=model.getError()%></th>
</tr>


</table>

</td>
</tr>
</table>



<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


