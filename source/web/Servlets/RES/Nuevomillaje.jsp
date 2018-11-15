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
codigo =model.getCodtarjeta();

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
<form method="post" action="<%=CONTROLLER%>/Millas/Guardar"  name="MantenimientoMillas">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Millaje</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");%>



<input name="Codigo" type= "hidden"  value=<%=codigo%> >

<tr>
<td>Origen :</td>
<td><input name="Descripcion" type="text" size="3" maxlength="3"><td>

</tr>

<tr>
<td>Destino :</td>
<td><input name="Descripcion" type="text" size="3" maxlength="3"><td>
</tr>



<tr>
<td>Num. Vuelo :</td>
<td><input name="Numvuelo" type="text" size="5" maxlength="5" ><td>
</tr>

<tr>
<td>Millas :</td>
<td><input name="Millas" type="text" size="5" maxlength="5" ><td>
</tr>


<tr>
<td>Obervacion :</td>
<td><input name="Observacion" type="text" size="30" maxlength="30" ><td>
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


