<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>


<script LANGUAGE="JavaScript"> 
function validar(frm){
//alert ("hola");
 //alert (frm.salir.value);
 if (frm.salir.value=="0" )
 {
 
    if (frm.Codigo.value=="")
     {
       alert("Ingrese un codigo para la sucursal");
        return false;
     }
     
 
     if (frm.Descripcion.value=="")
     {
       alert("Ingrese la descripcion de la sucursal");
        return false;
     }
     
     if (frm.Manifiesto.value=="")
       {
       frm.Manifiesto.value=0;
      }
      
     var errorRangoGuia= "Ingrese adecuadamente Rango de Guía indicando rango inferior y superior sepadaros por '-'\n\
            \n\Ejemplo: 1-999";
      if (frm.Rguia.value=="")
     {
       alert(errorRangoGuia);
        return false;
     }
    else
    {
        var rGuiaSplited = frm.Rguia.value.split('-');
        if(rGuiaSplited.length!=2){
      alert(errorRangoGuia);
        return false;
        }
        else{
           if(isNaN(rGuiaSplited[0])||isNaN(rGuiaSplited[1])){
            alert(errorRangoGuia);
            return false;
        }
        }   
    }
    var errorRangoFactura= "Ingrese adecuadamente Rango de Factura indicando rango inferior y superior sepadaros por '-'\n\
            \n\Ejemplo: 1-999"; 
      if (frm.Rfactura.value=="")
     {
      alert(errorRangoFactura);
        return false;
     }
   else
    {
        var rFacturaSplited = frm.Rfactura.value.split('-');
        if(rFacturaSplited.length!=2){
          alert(errorRangoFactura);
        return false;
        }
        else{
           if(isNaN(rFacturaSplited[0])||isNaN(rFacturaSplited[1])){
             alert(errorRangoFactura);
            return false;
        }
        }   
    }
 
  }  
   return true;
}

function parasalir()
  {
    
    MantenimientoSucursal.salir.value=1;
    
  }

  </script>



<html>

<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Sucursal/Modificar"  name="MantenimientoSucursal" onSubmit="return validar(this)">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Modifica Sucursal</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getSucursales();
String codigo="";
String nombre="";
long guia=0;
long manifiesto=0;
String serie="";
long numguia=0;
long numfactura=0;
String rguia="";
String rfactura="";

 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Sucursales sucursal=(Sucursales) it.next();
          codigo=sucursal.getCodigo();
          nombre=sucursal.getDescripcion();
          //guia=sucursal.getGuia();
         manifiesto=sucursal.getManifiesto();
         serie=sucursal.getSerie();
         numfactura=sucursal.getNumfac();
         numguia=sucursal.getNumguia();
         if(sucursal.getRangoguia() != null){
         rguia=sucursal.getRangoguia();
         }
         if(sucursal.getRangofactura() != null){
         rfactura=sucursal.getRangofactura();
         }
      }
 }

%>
<tr>
<td>Codigo : </td>
<td><input name="Codigo" type="text" size="10" maxlength="6" value="<%=codigo.trim()%>" READONLY><td>
</tr>

<tr>
<td>Descripcion : </td>
<td><input name="Descripcion" type="text" size="30" maxlength="30" value="<%=nombre.trim()%>"><td>
</tr>

<%--tr>
<td>Secuencia Guia : </td>
<td><input name="Guia" type="text" size="10" maxlength="5" value="<%=guia%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"><td>
</tr>

<tr>
<td>Secuencia Factura : </td>
<td><input name="Factura" type="text" size="10" maxlength="5" value="<%=factura%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"><td>
</tr--%>

<tr>
<td>Serie : </td>
<td><input name="Serie" type="text" size="10" maxlength="10" value="<%=serie%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"><td>
</tr>

<tr>
<td>Manifiesto : </td>
<td><input name="Manifiesto" type="text" size="10" maxlength="10" value="<%=manifiesto%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ><td>
</tr>


<tr>
<td>Número Guía : </td>
<td><input name="Nguia" type="text" size="10" maxlength="10" value="<%=numguia%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ><td>
</tr>

<tr>
<td>Número Factura : </td>
<td><input name="Nfactura" type="text" size="10" maxlength="10" value="<%=numfactura%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ><td>
</tr>

<tr>
<td>Rango Guía : </td>
<td><input name="Rguia" type="text" size="10" maxlength="100" value="<%=rguia.trim()%>"><td>
</tr>

<tr>
<td>Rango Factura : </td>
<td><input name="Rfactura" type="text" size="10" maxlength="100" value="<%=rfactura.trim()%>"><td>
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
  <input name="salir" value="0" type="hidden">
 <input  type="submit"  NAME="Salir" value="Salir"  onclick="parasalir();">
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


