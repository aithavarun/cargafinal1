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
<form method="post" action="<%=CONTROLLER%>/Ciudad/Modificar"  name="MantenimientoCiudades">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Ciudad</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getCiudades();
String codigo="";
String nombre="";
String continente="";
float impuesto=0;
float tasa=0;
float seguro=0;
int web=0;
int scodigo=0;

 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Ciudades ciudad=(Ciudades) it.next();
          codigo=ciudad.getCodigo();
          nombre=ciudad.getNombre();
          impuesto=ciudad.getImpuesto();
          tasa=ciudad.getTasa();
          seguro=ciudad.getSeguro();
          web=ciudad.getWeb();
          continente=ciudad.getContinente();
      }
 }

%>
<tr>
<td>Codigo : </td>
<td> <input name="Codigo" type= "text"  size="10" maxlength="5"  value="<%=codigo%>" READONLY><td>
</tr>

<tr>
<td>Nombre :</td>
<td><input name="Descripcion" type="text" size="30" maxlength="30" value="<%=nombre%>"><td>

</tr>

<tr>
<td>Impuesto :</td>
<td><input name="impuesto" type="text" size="10" maxlength="12" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=impuesto%>"><td>
</tr>

<tr>
<td>Seguro :</td>
<td><input name="seguro" type="text" size="10" maxlength="12" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=seguro%>"><td>
</tr>

<tr>
<td>Tasa :</td>
<td><input name="tasa" type="text" size="10" maxlength="12" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=tasa%>"><td>
</tr>

<%
String  chequeo="";
if (web==1)
    chequeo="CHECKED";
%>
<input name="web" type="hidden"  size="1" maxlength="1"  value=1    >


<tr>
<td>Continente:</td>
<td><select  name="Continente" type="text" class='txt-arialimput'   >

        <option value=D > Dentro  </option> 
       
        <option value=F > Fuera  </option>
                
       
     </select>
<td>
</tr>

<script>

MantenimientoCiudades.Continente.options.value="<%=continente%>"

</script>

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


