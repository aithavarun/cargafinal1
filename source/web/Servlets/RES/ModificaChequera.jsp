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
<form method="post" action="<%=CONTROLLER%>/Chequeras/Modificar"  name="MantenimientoChequeras">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Modifica Chequera</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List listx = model.getChequeras();

int desde=0;
int hasta=0;
int codigo=0;
int fac=0;
int dia=0;
int mes=0;
int anio=0;
String ncliente="";
String nusuario="";
String observa="";
String suc="";

java.util.Date mifecha;
/*
  Calendar inicio=Calendar.getInstance(); */
java.util.Calendar inicio = java.util.Calendar.getInstance();

 if (listx != null) {
      Iterator itx = listx.iterator();
      while (itx.hasNext()) {
          Chequeras chequera=(Chequeras) itx.next();
          //nombre=chequera.getDescripcion();
          //capax=avion.getCapacidadPax();
          //capcar=avion.getCapacidadCarga();
          codigo=chequera.getCodigo();
          desde=chequera.getDesde();
          hasta=chequera.getHasta();
          fac=chequera.getFactura();
          ncliente=chequera.getCliente();
          observa=chequera.getObserva();
          nusuario=chequera.getUsuario();
          mifecha=chequera.getFecha();
          suc=chequera.getSucursal();
          inicio.setTime(mifecha);
          mes =inicio.get(Calendar.MONTH)+1;
          anio=inicio.get(Calendar.YEAR);
          dia=inicio.get(Calendar.DATE);
          
          
      }
 }

%>
<input name="Codigo" type= "hidden"   value="<%=codigo%>" READONLY>

<tr>
<td>Sucursal :</td>
<td><select  name="Sucursal" type="text" class='txt-arialimput'>
<%
 model.BuscarSucursales();
 List list = model.getSucursales();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Sucursales sucursal=(Sucursales) it.next();
      
          %>
          
         <option value=<%=sucursal.getCodigo()%> > <%=sucursal.getDescripcion()%>  </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>



<tr>
<td>Cliente :</td>
<td><input name="Cliente" type="text" size="30" maxlength="30" value="<%=ncliente%>" ><td>
</tr>

<tr>
<td>Fecha :</td>
<td>
                
                Dia<input name= "Dia" id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" value=<%=dia%>  READONLY>
            
               
                Mes<input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);" value=<%=mes%> READONLY> 
              
                
                Anio<input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value=<%=anio%> READONLY>
            
</td>
</tr>

<td>Desde : </td>
<td><input name="Desde" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=desde%>"><td>

</tr>
<tr>
<td>Hasta :</td>
<td><input name="Hasta"  type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=hasta%>"><td>
</tr>

<tr>
<td>Factura: </td>
<td><input name="Factura" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=fac%>" ><td>
</tr>

<tr>
<td>Observacion:  </td>
<td><input name="Observacion" type="text" size="30" maxlength="30" value="<%=observa.trim()%>" ><td>
</tr>

<tr>
<td>Usuario: </td>
<td><input name="Usuario" type="text" size="10" maxlength="30" value="<%=nusuario%>" READONLY><td>
</tr>

<script language="JavaScript" type="text/javascript">
   MantenimientoChequeras.Sucursal.options.value="<%=suc.trim()%>"
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


