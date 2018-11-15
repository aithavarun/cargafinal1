<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>
<SCRIPT language="JavaScript" type="text/javascript">
    ahora       = new Date();
    ahoraDay    = ahora.getDate();
    ahoraMonth  = ahora.getMonth()+1;
    ahoraYear   = ahora.getYear();
   

 
 function envia(form ){
   if (form.Dia.value>31) 
  {
   alert("dia incorrecto");
   return false;

  } 

 else
   return true;

   }
   
   
function cuantosDias(mes, anyo)
    {
        var cuantosDias = 31;
        if (mes == 4 || mes == 6 || mes == 9 || mes == 11)
      cuantosDias = 30;
        if (mes == 2 && (anyo/4) != Math.floor(anyo/4))
      cuantosDias = 28;
        if (mes == 2 && (anyo/4) == Math.floor(anyo/4))
      cuantosDias = 29;
        return cuantosDias;
    }

function validames(campo) {
if (campo.value > 12) campo.value = 12;
}

function validadia(campo,mes, anyo) {
var dias;
dias=cuantosDias(mes,anyo);
if (campo.value > dias)  campo.value = cuantosDias(mes,anyo);
}
    
</SCRIPT>


<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<%
int codigo=0;
codigo =model.getCodproveedor();
//Contratos ocontrato

/*
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Proveedores oproveedor=(Proveedores) it.next();
          codigo=oproveedor.getCodigo();
          
      }
 }
 */

%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Contratos/Guardar"  name="MantenimientoContratos">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Contrato</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");%>

<tr>

<td><input name="Codigo" type= "hidden"  size="10" maxlength="30" value=<%=codigo%> READONLY ><td>
</tr>

<tr>
<td>Motivo :</td>
<td><input name="Motivo" type="text" size="30" maxlength="30"><td>

<tr>

<td>Fecha :</td>
<td>
                
                Dia<input name= "Dia" id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
            
               
                Mes<input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
              
                
                Anio<input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
            
</td>
</tr>


</tr>
<tr>
<td>Factura :</td>
<td><input name="Factura" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td>Valor :</td>
<td><input name="Valor" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
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
<SCRIPT language="JavaScript" type="text/javascript">
 MantenimientoContratos.Dia.value=ahoraDay;
 MantenimientoContratos.Mes.value=ahoraMonth;
 MantenimientoContratos.Anio.value=ahoraYear;
</SCRIPT >

</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


