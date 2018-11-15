<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>
<SCRIPT language="JavaScript" type="text/javascript">
    

    
</SCRIPT>


<%@ include file="/WEB-INF/Banner.jsp"%>  
<%
int codigo=0;
String codigocli = request.getParameter("Codigocli");


%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Free/Guardar"  name="MantenimientoFree">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th> Nuevo Free </th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");%>



<input name="Codigocli" type= "hidden"  value=<%=codigocli%> >


<tr>
<td>Dia :</td>

<td><select  name="Dia" type="text" class='txt-arialimput'   >

        <option value=1 > LUNES     </option> 
        <option value=2 > MARTES    </option>
        <option value=3 > MIERCOLES </option>
        <option value=4 > JUEVES    </option>
        <option value=5 > VIERNES   </option>
        <option value=6 > SABADO    </option>
        <option value=7 > DOMINGOS  </option>
 
     </select>

</td>
</tr>


<tr>
<td>Kilos :</td>
<td><input name="Kilos" type="text" size="10" value="0" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
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


