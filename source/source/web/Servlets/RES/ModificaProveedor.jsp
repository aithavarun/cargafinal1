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
<form method="post" action="<%=CONTROLLER%>/Proveedor/Modificar"  name="MantenimientoProveedores">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Proveedor</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getProveedores();
int codigo=0;
String nombre="";
String direccion="";
String contacto="";
String ciudad="";
String telefono="";
String ruc="";
String cuenta="";
float saldo=0;



 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Proveedores proveedor=(Proveedores) it.next();
          codigo=proveedor.getCodigo();
          nombre=proveedor.getRSocial();
          direccion=proveedor.getDireccion();
          contacto=proveedor.getContacto();
          ciudad=proveedor.getCiudad();
          telefono=proveedor.getTelefono();
          cuenta=proveedor.getCuenta();
          ruc=proveedor.getRuc();
          saldo=proveedor.getSaldo();
          
          
          
      }
 }

%>

<tr>
<td>Nombre :</td>
<td><input name="Nombre" type="text" size="50" maxlength="50" value="<%=nombre%>" > <td>
</tr>

<tr>
<td>RUC :</td>
<td><input name="Ruc" type="text" size="15" maxlength="15"  value="<%=ruc%>" ><td>
</tr>



<tr>
<td>Direccion :</td>
<td><input name="Direccion" type="text" size="50" maxlength="50" value="<%=direccion%>" ><td>
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
<td>Contacto :</td>
<td><input name="Contacto" type="text" size="30" maxlength="30" value="<%=contacto %>" ><td>
</tr>

<tr>
<td>Cuenta  :</td>
<td><input name="Cuenta" type="text" size="15" maxlength="15" value="<%=cuenta%>" ><td>
</tr>

<tr>
<td>Saldo:</td>
<td><input name="Saldo" type="text" size="15" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=saldo%>" ><td>
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

<form  method="post" action="<%=CONTROLLER%>/Contrato/Nuevo"  name="Contratos">
 <table width="100%" align="center">
    <tr>
    <td valign="top">
     <th>Contratos</th>
     </td>
    </tr>
  </table>
<%

%>
<table width="100%" align="center">

<tr>

<th>Motivo </th>
<th>Valor </th>
</tr>
<%
 model.BuscarContratos(codigo);
List listx = model.getContratos();


 if (listx != null) {
      Iterator itx = listx.iterator();
      while (itx.hasNext()) {
          Contratos contrato=(Contratos) itx.next();
          String seleccionUrl=CONTROLLER+"/Contratos/Selecciona?codigo="+contrato.getCodigo() ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=contrato.getMotivo()%></td>
       <td><%=f.format(contrato.getValor())%></td>
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





