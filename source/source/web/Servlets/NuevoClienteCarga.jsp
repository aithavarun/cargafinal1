<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="/WEB-INF/Banner.jsp"%>  

<script LANGUAGE="JavaScript"> 
function validar(frm){
 //alert ("hola");
 //alert (frm.salir.value);
 if (frm.salir.value=="0" )
 {
 
 if (frm.Codigo.value=="")
     {
       alert("Ingrese un codigo para el cliente");
        return false;
     }
     
 
     if (frm.Nombre.value=="")
     {
       alert("Ingrese el nombre o razón social del cliente");
        return false;
     }
 
     
     
     if (frm.Direccion.value=="")
     {
       alert("Ingrese la direccion del cliente");
        return false;
     }
     
     if (frm.Telefono.value=="")
     {
       alert("Ingrese el telefono del cliente");
        return false;
     }
     
     if (frm.Ruc.value=="")
     {
       alert("Ingrese el RUC o cedula de identidad del cliente");
        return false;
     }
  }  
   return true;
}

function parasalir()
  {
    
    MantenimientoClientes.salir.value=1;
    
  }

</script> 

<html>


    <h1>amanteur</h1>

<%DecimalFormat f =new DecimalFormat("0.00");%>


<form method="post" action="<%=CONTROLLER%>/ClientesCarga/Guardar"  name="MantenimientoClientes" onSubmit="return validar(this)">
<table width="100%" align="center">
<tr>
<td valign="top">
<th> Nuevo Cliente Carga</th>
</td></tr>
</table>

<table width="50%" align="CENTER">
<tr>
<td>Codigo:</td>
<td><input name="Codigo" type="text" size="10" value=""  maxlength="50"><td>
</tr>
<tr>
<td>Nombre :</td>
<td><input name="Nombre" type="text" value="" size="50" maxlength="50"><td>
</tr>





<tr>
<td>Direccion :</td>
<td><input name="Direccion" type="text" size="50"  value="" maxlength="50"><td>
</tr>


<tr>
<td>Ciudad :</td>
<td><select  name="Ciudad" type="text" class='txt-arialimput'>
<%
 model.BuscarCiudades();
 List list = model.getCiudades();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Ciudades ciudad=(Ciudades) it.next();
      
          %>
          
         <option value="<%=ciudad.getCodigo()%>" > <%=ciudad.getNombre().trim()%>  </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>

<tr>
<td>Telefono :</td>
<td><input name="Telefono" type="text" size="20"  value="" maxlength="20" ><td>
</tr>

<tr>
<td>Contacto :</td>
<td><input name="Contacto" type="text" size="30" value="" maxlength="30" ><td>
</tr>

<tr>
<td>RUC :</td>
<td><input name="Ruc" type="text" size="15" value="" maxlength="15" ><td>
</tr>

<tr>
<td>Correo :</td>
<td><input name="CliCorreo" type="text" size="15" value="" maxlength="100" ><td>
</tr>

<tr>
<td>Credito ($):</td>
<td><input name="Credito" type="text" size="15" value="0" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ><td>
</tr>

<tr>
<td>Vendedor  :</td>
<td><input name="Vendedor" type="text" value="" size="15" maxlength="15" ><td>
</tr>

<tr>
<td>Saldo:</td>
<td><input name="Saldo" type="text"  value="0" size="15" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ><td>
</tr>

<tr>
<td>Cliente compra a  </td>
<td colspan="2">
<input type="radio" name="CreditoContado" value= "CR"  checked     >Credito
    <input type="radio" name="CreditoContado" value= "CO">Contado
   
</td>
</tr>


<tr>
<td>Cuenta  :</td>
<td><input name="Cuenta" type="text" value="0" size="15" maxlength="15" ><td>
</tr>



<input name="Descuento" type="hidden" value="0" size="15" maxlength="15" >



<input name="Minimo" type="hidden" value="0" size="15" maxlength="15" ><td>
</tr>

<tr>
<td>Tipo Tarifa :</td>
<td><select  name="Tipo" type="text" class='txt-arialimput'>
<%
 model.BuscarTipostarifas();
 List listt = model.getTiposTarifas();
 if (listt != null) {
      Iterator it = listt.iterator();
      while (it.hasNext()) {
          Tipot tipot=(Tipot) it.next();
      
          %>
          
         <option value="<%=tipot.getSecuencial()%>" > <%=tipot.getNombre().trim()%>  </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>


<tr>
<td><input type="checkbox" name="Contribuyente" value= "1" >Contribuyente Especial</td>

</tr>
<%/*%>
<tr>
<td>Día Gratis: </td>
<td><input type="checkbox" name="Lunes" value= "1" >Lunes
    <input type="checkbox" name="Martes" value= "2" >Martes
    <input type="checkbox" name="Miercoles" value= "3" >Miercoles
    <input type="checkbox" name="Jueves" value= "4" >Jueves
    <input type="checkbox" name="Viernes" value= "5" >Viernes
    <input type="checkbox" name="Sabado" value= "6" >Sabado
    <input type="checkbox" name="Domingo" value= "7" >Domingo
</td>
</tr>

<tr>
<td>Gratis Hasta(K) :</td>
<td><input name="Hasta" type="text" value="0" size="15" maxlength="15" ><td>
</tr>
<%*/%>

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
 
  <input name="salir" value="0" type="hidden">
  
 <td>
 <input  type="submit"  NAME="Salir" value="Salir" onclick="parasalir();">
 </td>
 </tr>
</table>
</td>
</tr>
</form>

</table>

<table width="80%" align="CENTER">
    <% String error=model.getError();
String color="FFFFCC";
if (error !=null)
{%>
<tr class="error">
<th colspam="3" ><%=error%></th>
</tr>
<%}%>
</TABLE>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


