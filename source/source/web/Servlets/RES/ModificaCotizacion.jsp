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
<form method="post" action="<%=CONTROLLER%>/Cotizacion/Modificar"  name="MantenimientoCotizaciones">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Modifica Cotizacion </th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getCotizaciones();

long sec=0;
float cambio=0;
String moneda="";
int dia=0;
int mes=0;
int anio=0;

        
java.util.Date mifecha;
/*
  Calendar inicio=Calendar.getInstance(); */
java.util.Calendar inicio = java.util.Calendar.getInstance();


 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Cotizaciones cotizacion=(Cotizaciones) it.next();
          sec=cotizacion.getSecuencial();
          cambio=cotizacion.getCambio();
          mifecha=cotizacion.getFecha();
          inicio.setTime(mifecha);
          mes =inicio.get(Calendar.MONTH)+1;
          anio=inicio.get(Calendar.YEAR);
          dia=inicio.get(Calendar.DATE);
          moneda=cotizacion.getMoneda();
          
          
          
      }
 }

%>

<input name="secuencial"    type= "hidden"  value="<%=sec%>">

<tr>
<td>Cambio:</td>
<td><input name="Cambio"  value=<%=cambio%> type="text" size="10" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td>Fecha :</td>
<td>Dia
<input name= "Dia"  id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" value =<%=dia%>  >
Mes
<input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);" value =<%=mes%>  > 
Anio
<input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value =<%=anio%> >
</td>
</tr>

<tr>
<td>Moneda :</td>
<td><input name="Moneda" type="text" size="10" maxlength="10" value =<%=moneda%> ><td>
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



</form>

</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


