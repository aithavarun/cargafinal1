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
<form method="post" action="<%=CONTROLLER%>/Descuento/Modificar"  name="MantenimientoDescuentos">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Modifica Descuento</th>
</table>
<table width="50%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");

List list = model.getDescuentosc();


        
long codigo=0;
long clicodigo=0;
String origen="";
String destino="";
float descuento=0;
float mindescuento=0;

//String Tarifa="";
//float Valor=0;


/*Calendar inicio=Calendar.getInstance(); */



 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          
          Descuentosc descuentosc=(Descuentosc) it.next();
          
          
          codigo=descuentosc.getCodigo();
          clicodigo=descuentosc.getClicodigo();
          origen=descuentosc.getOrigen();
          destino=descuentosc.getDestino();
          descuento=descuentosc.getDescuento();
          mindescuento=descuentosc.getMindescuento();
          
          
          }
 }

%>

<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Descuento/Guardar"  name="MantenimientoDescuentos">
<tr>
<td valign="top">

<table width="50%" align="CENTER">
<input name="Codigo" type= "hidden"  value=<%=codigo%> >
<tr>

<tr>
<td>Origen :</td>
<td><input name="Origen" type="text"  size="3" value =<%=origen%>  maxlength="3" ><td>
</tr>

<tr>
<td>Destino :</td>
<td><input name="Destino" type="text" size="3" value=<%=destino%>  maxlength="3" ><td>
</tr>

<tr>
<td>Descuento :</td>
<td><input name="Descuento" type="text" size="10"  value=<%=descuento%>  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>


<tr>
<td>Minimo Para Descuento :</td>
<td><input name="Mindescuento" type="text"  size="10" value=<%=mindescuento%>  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
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


