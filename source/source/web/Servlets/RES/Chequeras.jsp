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

<SCRIPT language="JavaScript" >
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

<%
//Usuarios usuario=model.getUsuarios();
String musuario=usuario.getNombre();
java.util.Date mifecha;
java.util.Calendar inicio = java.util.Calendar.getInstance();
int mes=0;
int dia=0;
int anio=0;
mifecha=inicio.getTime();
%>





<form method="post" action="<%=CONTROLLER%>/Chequeras/Nuevo"  name="MantenimientoChequeras">
<table width="100%" align="center">

<tr>
<td>Fecha :</td>
<td>
Dia</td>
<td><input name= "Dia" id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
</td>
<td>Mes</td>
<td><input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
</td>
<td>Anio</td>
<td><input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>


<tr>
<td>
 Usuario:
 </td>
 <td >
 <input type="text"    NAME="Usuario" value="<%=musuario%>">
  </td>
  <td colspan="4">
 <input TYPE="submit"    NAME="Buscar" value="Buscar">
 </td>
 </tr>




</table>

<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="6">CHEQUERAS COORPORATIVAS</th>
</tr>
<tr>
</table>
<table width="90%" align="CENTER" id="t1ch" class="sortable">
<th>Desde</th>
<th>Hasta</th>
<th>Cliente</th>
<th>Observacion</th>
<th>Sucursal</th>
<th>Usuario</th>
</tr>
<%
 List list = model.getChequeras();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Chequeras chequera=(Chequeras) it.next();
          String seleccionUrl=CONTROLLER+"/Chequeras/Selecciona?codigo="+chequera.getCodigo() ;
          %>
  <tr>
      
        <td><A HREF="<%=seleccionUrl%>"> <%=chequera.getDesde()%></td>
        <td><%=chequera.getHasta()%></td>
        <td><%=chequera.getCliente()%></td>
        <td><%=chequera.getObserva()%></td>
        <td><%=chequera.getSucursal()%></td>
        <td><%=chequera.getUsuario()%></td>
       
  </tr>    
 <%}}%>

</table>
</td>
</tr>
<tr>
<td align="center">
<table width="10%" align="center">
<td>
 <input TYPE="submit"    NAME="Nuevo" value="Nuevo">
 </td>
 <%-----------------
 <td>
 <input  type="submit"  NAME="Salir" value="Salir">
 </td>
 -----------------%>
</table>
</form>

<SCRIPT language="JavaScript">
MantenimientoChequeras.Dia.value=ahoraDay;
MantenimientoChequeras.Mes.value=ahoraMonth;
MantenimientoChequeras.Anio.value=ahoraYear;

</SCRIPT >

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


