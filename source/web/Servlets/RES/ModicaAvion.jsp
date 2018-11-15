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
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Aviones/Modificar"  name="MantenimientoAviones">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Avion</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getAviones();
String nombre="";
int capax=0;
float capcar=0;
int codigo=0;
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Aviones avion=(Aviones) it.next();
          nombre=avion.getCodigo();
          capax=avion.getCapacidadPax();
          capcar=avion.getCapacidadCarga();
          codigo=avion.getCodigo();
      }
 }

%>
<input name="codigo" type="hiden"  value=<%=codigo%>><td>
<tr>
<td>Nombre :</td>
<td><input name="Descripcion" type="text" size="10" maxlength="30" value=<%=nombre%>><td>

</tr>
<tr>
<td>Capacidad Pasajeros :</td>
<td><input name="CapPax" value=<%capax%> type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td>Capacidad Carga :</td>
<td><input name="CapCarga" value=<%capcar%> type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
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


