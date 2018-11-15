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
<form method="post" action="<%=CONTROLLER%>/Contrato/Modificar"  name="MantenimientoCiudades">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Ciudad</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getContratos();
int codigo=0;
String motivo="";
int dia=0;
int mes=0;
int anio=0;
float valor=0;
int factura=0;

java.util.Date mifecha;
/*
  Calendar inicio=Calendar.getInstance(); */
java.util.Calendar inicio = java.util.Calendar.getInstance();


 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Contratos contrato=(Contratos) it.next();
          codigo=contrato.getCodigo();
          motivo=contrato.getMotivo();
          /*dia=contrato.getDia();
          mes=contrato.ge
          
          */
          factura=contrato.getFactura();
          valor=contrato.getValor();
          mifecha=contrato.getFecha();
          inicio.setTime(mifecha);
          mes =inicio.get(Calendar.MONTH)+1;
          anio=inicio.get(Calendar.YEAR);
          dia=inicio.get(Calendar.DATE);
          
          }
 }

%>

<tr>

<td><input name="Codigo" type= "hidden"   size="10" maxlength="30" value=<%=codigo%> READONLY ><td>
</tr>

<tr>
<td>Motivo :</td>
<td><input name="Motivo" type="text" size="30" maxlength="30" value=<%=motivo%> ><td>

<tr>

<td>Fecha :</td>
<td>
                
                Dia<input name= "Dia" id="Dia" type="text"  size="2" value=<%=dia%>   maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
            
               
                Mes<input name= "Mes" id="Mes" type="text"  size="2"  value=<%=mes%>  maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
              
                
                Anio<input name= "Anio" id="Anio" type="text"  size="4"     value=<%=anio%>  maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
            
</td>
</tr>


</tr>
<tr>
<td>Factura :</td>
<td><input name="Factura" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value=<%=factura%>  ><td>
</tr>

<tr>
<td>Valor :</td>
<td><input name="Valor" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value=<%=valor%> ><td>
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


