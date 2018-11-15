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
 
    if (frm.Nombre.value=="")
     {
       alert("Ingrese un codigo para el tipo de tarifa");
        return false;
     }
     
 
     if (frm.Observacion.value=="")
     {
       alert("Ingrese la descripcion del tipo de tarifa");
        return false;
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
<form method="post" action="<%=CONTROLLER%>/Tipost/Modificar"  name="MantenimientoSucursal" onSubmit="return validar(this)">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Tipos Tarifas</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getTipoTarifa();
String nombre="";
String observacion="";
long secuencial=0;
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Tipot tipot=(Tipot) it.next();
          
          nombre=tipot.getNombre();
          observacion=tipot.getObservacion();
          secuencial=tipot.getSecuencial();
          
      }
 }

%>
<input name="Codigo" type="HIDDEN" size="5" maxlength="30" value="<%=secuencial%>" >

<tr>
<td>Nombre : </td>
<td><input name="Nombre" type="text" size="30" maxlength="30" value="<%=nombre.trim()%>" READONLY><td>
</tr>

<tr>
<td>Observacion : </td>
<td><input name="Observacion" type="text" size="70" maxlength="70" value="<%=observacion.trim()%>"><td>
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
 <input  type="submit"  NAME="Salir" value="Salir" onclick="parasalir();">
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


