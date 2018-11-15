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
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<%
int codigo=0;
String codigocli = request.getParameter("Codigocli");
//Contratos ocontrato

/*
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Proveedores oproveedor=(Proveedores) it.next();
          codigo=oproveedor.getCodigo();
          
      }
 }
 */

%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Comision/Guardar"  name="MantenimientoContratos">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nueva Comision</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");%>



<input name="Codigocli" type= "hidden"  value=<%=codigocli%> >


<tr>
<td>Tarifa Base:</td>
<td><select name='Tarifas'>

<% List list =model.getReservaestado();
if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          String Base=(String) it.next();
          //codigo=Base;
          %>
          <option value='<%=Base%>' ><%=Base%></option>
          <%
      }
 }%>
</select></td>
</tr>

<tr>
<td>% de Comision :</td>
<td><input name="Valor" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
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


