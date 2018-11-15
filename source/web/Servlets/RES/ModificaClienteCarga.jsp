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
<form method="post" action="<%=CONTROLLER%>/ClientesCarga/Modificar"  name="MantenimientoClientes">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Modificar  Cliente Carga</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getClientesCarga();
int codigo=0;
String nombre="";
String direccion="";
String ciudad="";
String telefono="";
String ruc="";
float credito=0;
String vendedor="";
float saldo=0;
float descuento=0;
float mindescuento=0;
String cuenta="";
String codigos="";



 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Clientesc clientec=(Clientesc) it.next();
          codigo=clientec.getCodigo();
          nombre=clientec.getNombre();
          direccion=clientec.getDireccion();
          ciudad=clientec.getCiudad();
          telefono=clientec.getTelefono();
          ruc=clientec.getRuc();
          credito=clientec.getCredito();
          vendedor=clientec.getVendedor();
          saldo=clientec.getSaldo();
          cuenta=clientec.getCuenta();
          codigos=clientec.getCodigos();
          descuento=clientec.getDescuento();
          mindescuento=clientec.getMindescuento();
          
          
      }
 }

%>

<tr>
<td>Codigo :</td>
<td><input name="codigos" type="text" size="10" maxlength="50" value="<%=codigos%>" > <td>
</tr>
<input name="codigo" value="<%=codigo%>" 
type="hidden"  >
<tr>
<td>Nombre :</td>
<td><input name="Nombre" type="text" size="50" maxlength="50" value="<%=nombre%>" > <td>
</tr>


<tr>
<td>Direccion :</td>
<td><input name="Direccion" type="text" size="50" maxlength="50" value="<%=direccion%>"><td>
</tr>


<tr>
<td>Ciudad :</td>
<td><input name="Ciudad" type="text" size="20" maxlength="20" value="<%=ciudad%>" ><td>
</tr>

<tr>
<td>Telefono :</td>
<td><input name="Telefono" type="text" size="20" maxlength="20" value="<%=telefono%>" ><td>
</tr>


<tr>
<td>RUC :</td>
<td><input name="Ruc" type="text" size="15" maxlength="15" value="<%=ruc%>"><td>
</tr>

<tr>
<td>Credito:</td>
<td><input name="Credito" type="text" size="15" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=credito%>" ><td>
</tr>

<tr>
<td>Vendedor  :</td>
<td><input name="Vendedor" type="text" size="15" maxlength="15" value="<%=vendedor%>" ><td>
</tr>

<tr>
<td>Saldo:</td>
<td><input name="Saldo" type="text" size="15" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=saldo%>"  ><td>
</tr>




<tr>
<td>Cuenta  :</td>
<td><input name="Cuenta" type="text" size="15" maxlength="15"  value="<%=cuenta%>" ><td>
</tr>
<tr>
<td><input type="checkbox" name="contribuyente" value="1"  >Contribuyente Especial</td>
<%-----------
value= "<%=cliente.getContribuyente()%>"
---------%>
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

<form  method="post" action="<%=CONTROLLER%>/Descuentoc/Nuevo"  name="Contratos">
 <table width="60%" align="center">
    <tr>
    <td valign="top">
     <th>Descuentos</th>
     </td>
    </tr>
  </table>
<%

%>
<input name="Codigocli" value="<%=codigo%>" 
type="hidden"  >

<table width="50%" align="center">

<tr>

<th>Origen </th>
<th>Destino </th>
<th>Descuento </th>
<th>Minimo </th>
</tr>
<%
 model.BuscarDescuentosc(codigo);

List listx = model.getDescuentosc();


 if (listx != null) {
      Iterator itx = listx.iterator();
      while (itx.hasNext()) {
          Descuentosc descuentosc=(Descuentosc) itx.next();
          String seleccionUrl=CONTROLLER+"/DescuentoCarga/Selecciona?codigo="+descuentosc.getCodigo();
        
 %>
 
 <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=descuentosc.getOrigen()%></td>
       <td> <%=descuentosc.getDestino()%></td>
        <td><%=f.format(descuentosc.getDescuento())%></td>
        <td><%=descuentosc.getMindescuento()%></td>
        
  </tr>    
 <%}}%>

<tr>
<td valign="top">
<p align="center"> 
<input TYPE="submit"    NAME="Nuevo" value="Nuevo">
</p> 
</td>
 </tr>
 


 
 
 
 
 
</table>
</form>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>
