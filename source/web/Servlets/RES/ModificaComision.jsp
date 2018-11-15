<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>



<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Comision/Modificar"  name="MantenimientoComisiones">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Modifica Comision</th>
</table>
<table width="50%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");

List list = model.getComisiones();


int codigo=0;
int clicodigo=0;
String Tarifa="";
float Valor=0;


/*Calendar inicio=Calendar.getInstance(); */



 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Comision comision=(Comision) it.next();
          
          codigo=comision.getCodigo();
          clicodigo=comision.getCodigocli();
          Tarifa=comision.getBase();
          Valor=comision.getValor();
          
          
          }
 }

%>

<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Comision/Guardar"  name="MantenimientoContratos">
<tr>
<td valign="top">

<table width="50%" align="CENTER">
<input name="Codigo" type= "hidden"  value=<%=codigo%> >
<tr>
<td>Tarifa Base:</td>
<td><select name='Tarifas'>

<% List listx =model.getReservaestado();
if (listx != null) {
      Iterator itx = listx.iterator();
      while (itx.hasNext()) {
          String Base=(String) itx.next();
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
<td><input name="Valor" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value=<%=Valor%>  ><td>
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


