<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<script LANGUAGE="JavaScript"> 
function validar(frm){
 //alert ("hola");
 
 if (frm.salir.value=="0")
 {
 //alert ("o"+ frm.Ruc.value + "p");
     
  if (frm.codigos.value=="")
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



<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/ClientesCarga/Modificar"  name="MantenimientoClientes" onSubmit="return validar(this)">
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
String clicorreo="";
float credito=0;
String vendedor="";
int contribuyente=0;
float saldo=0;
float descuento=0;
float mindescuento=0;
String cuenta="";
String codigos="";
int diagratis=0;
float gratishasta=0;
int tipotarifa=0;
String auxlunes="" ;
String auxmartes="" ;
String auxmiercoles="" ;
String auxjueves="" ;
String auxviernes="" ;
String auxsabado="" ;
String auxdomingo="" ;
String auxdiagratis="";
String auxcontribuyente="";
String creditocontado="";
String auxcredito="";
String auxcontado="";
//String auxfree="";



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
          contribuyente=clientec.getContribuyente();
          descuento=clientec.getDescuento();
          mindescuento=clientec.getMindescuento();
          diagratis=clientec.getDiagratis();
          gratishasta=clientec.getGratisHasta();
          tipotarifa=clientec.getTipotarifa();
          creditocontado=clientec.getCreditoContado();
          clicorreo = clientec.getClicorreo();
          
      }
 }

auxdiagratis=String.valueOf(diagratis);

if (auxdiagratis.contains("1"))
    auxlunes="checked";

if (auxdiagratis.contains("2"))
    auxmartes="checked";

if (auxdiagratis.contains("3"))
    auxmiercoles="checked";

if (auxdiagratis.contains("4"))
    auxjueves="checked";

if (auxdiagratis.contains("5"))
    auxviernes="checked";
    
if (auxdiagratis.contains("6"))
    auxsabado="checked";
    
if (auxdiagratis.contains("7"))
    auxdomingo="checked";


if (contribuyente==1)
    auxcontribuyente="checked";

%>

<tr>
<td>Codigo :</td>
<td><input name="codigos" type="text" size="10" maxlength="50" value="<%=codigos%>" readonly> <td>
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
<td><select  name="Ciudad" type="text" class='txt-arialimput'>
<%
 model.BuscarCiudades();
 List listc = model.getCiudades();
 if (listc != null) {
      Iterator it = listc.iterator();
      while (it.hasNext()) {
          Ciudades ciudad1=(Ciudades) it.next();
      
          %>
         
         <option value="<%=ciudad1.getCodigo()%>" >   <%=ciudad1.getNombre().trim()%>  </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>


<tr>
<td>Telefono :</td>
<td><input name="Telefono" type="text" size="20" maxlength="20" value="<%=telefono%>" ><td>
</tr>


<tr>
<td>RUC :</td>
<td><input name="Ruc" type="text" size="15" maxlength="15" value="<%=ruc.trim()%>"><td>
</tr>

<tr>
<td>Correo :</td>
<td><input name="CliCorreo" type="text" size="15" maxlength="100" value="<%=clicorreo.trim()%>"><td>
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

<%
if (creditocontado.equals("CR"))
    auxcredito ="checked";
 else 
    auxcontado="checked";

%>

<tr>
<td>Cliente compra a  </td>
<td colspan="2">
   <input type="radio" name="CreditoContado" value= "CR"  <%=auxcredito%> value= "CR"  >Credito
   <input type="radio" name="CreditoContado" <%=auxcontado%> value= "CO">Contado
   
</td>
</tr>


<tr>
<td>Cuenta  :</td>
<td><input name="Cuenta" type="text" size="15" maxlength="15"  value="<%=cuenta%>" ><td>
</tr>

<input name="Descuento" type="hidden" value="0" size="15" maxlength="15" >



<input name="Minimo" type="hidden" value="0" size="15" maxlength="15" >


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
<td><input type="checkbox" name="Contribuyente" <%=auxcontribuyente%> value= "1" >Contribuyente Especial</td>

</tr>
<%/*%>
<tr>y
<td>Día Gratis: </td>
<td><input type="checkbox" name="Lunes" <%=auxlunes%> value= "1" >Lunes 
    <input type="checkbox" name="Martes" <%=auxmartes%>  value= "2" >Martes
    <input type="checkbox" name="Miercoles" <%=auxmiercoles%> value= "3" >Miercoles
    <input type="checkbox" name="Jueves" <%=auxjueves%> value= "4" >Jueves
    <input type="checkbox" name="Viernes" <%=auxviernes%> value= "5" >Viernes
    <input type="checkbox" name="Sabado" <%=auxsabado%> value= "6" >Sabado
    <input type="checkbox" name="Domingo"  <%=auxdomingo%> value= "7" >Domingo
</td>
</tr>

<tr>
<td>Gratis Hasta(K) :</td>
<td><input name="Hasta" type="text" value="<%=gratishasta%>" size="15" maxlength="15" ><td>
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

<script language="JavaScript" type="text/javascript">
   MantenimientoClientes.Tipo.options.value="<%=tipotarifa%>"
</script>

<script language="JavaScript" type="text/javascript">
   MantenimientoClientes.Ciudad.options.value="<%=ciudad.trim()%>"
</script>
</table>

<form  method="post" action="<%=CONTROLLER%>/Free/Nuevo"  name="Contratos">
 <table width="60%" align="center">
    <tr>
    <td valign="top">
     <th>DIAS GRATIS</th>
     </td>
    </tr>
  </table>

<input name="Codigocli" value="<%=codigo%>" 
type="hidden"  >

<table width="50%" align="center">

<tr>

<th>Dia </th>
<th>Kilos </th>

</tr>
<%
// model.BuscarDescuentosc(codigo);

model.BuscarDfrees(codigo);
List listx = model.getListaFree();
String dias="";

 if (listx != null) {
      Iterator itx = listx.iterator();
      while (itx.hasNext()) {
          
         Free free=(Free) itx.next();
          String seleccionUrl=CONTROLLER+"/FreeCarga/Selecciona?codigo="+free.getCodigo();
        
      switch( free.getDia()){
     case 1 :
        dias="LUNES";
        break;
     case 2:
        dias="MARTES";
        break;
     case 3:
        dias="MIERCOLES";
        break;
     case 4:
        dias="JUEVES";
        break;
     case 5:
        dias="VIERNES";
        break;
     case 6:
        dias="SABADO";
        break;
     case 7:
        dias="DOMINGO";
        break;
        
     
       default : 
        dias="ERROR";
        break;
  }

 %>
 
 <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=dias%></td>
       <td> <%=free.getKilos()%></td>
        
        
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
