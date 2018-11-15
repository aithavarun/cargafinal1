<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat,java.text.DecimalFormat,java.text.SimpleDateFormat" %>

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
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Sboletos/Modificar"  name="MantenimientoStockBoletos">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Stock de Boletos</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getSboletos();
String sucursal="";
String tipo="";
long bolini=0;
long bolfin=0;
long secuencia=0;
int codigo=0;
long uso=0;
int dia=0;
int mes=0;
int anio=0;
java.util.Date mifecha;
/*
  Calendar inicio=Calendar.getInstance(); */
java.util.Calendar inicio = java.util.Calendar.getInstance();

 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Sboletos sboleto=(Sboletos) it.next();
          codigo=sboleto.getCodigo();
          sucursal=sboleto.getSucursal();
          tipo=sboleto.getTipo();
          bolini=sboleto.getBolini();
          bolfin=sboleto.getBolfin();
          secuencia=sboleto.getSecuencia();
          uso=sboleto.getUso(); 
          mifecha=sboleto.getFecha();
          inicio.setTime(mifecha);
          mes =inicio.get(Calendar.MONTH)+1;
          anio=inicio.get(Calendar.YEAR);
          dia=inicio.get(Calendar.DATE);
          /*inicio.set(mifecha);*/
      }
 }

%>
<input name="codigo" type= "hidden"   value="<%=codigo%>" READONLY><td>
<tr>

<tr>
<td>Sucursal :</td>
<td><input name="Sucursal" type="text" size="10" maxlength="30" value="<%=sucursal.trim()%>" READONLY ><td>
</tr>

<tr>
<td>Tipo :</td>
<td><select  name="Tipo" type="text" class='txt-arialimput'  >
         <option value='AU'>AUTOMATICO </option>
         <option value='MA'>MANUAL </option>
         <option value='CH'>CHEQUERA </option>
         <option value='ET'>E-TIKET</option>
          <option value='PT'>PTA</option>
 
     </select>

<td>
</tr>

<script language="JavaScript" type="text/javascript">
 
   MantenimientoStockBoletos.Tipo.options.value="<%=tipo.trim()%>" 
      
 
 </script>

<tr>
<td>Boleto Inicial :</td>
<td><input name="Bolini" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=bolini%>"><td>
</tr>

<tr>
<td>Boleto Final :</td>
<td><input name="Bolfin" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=bolfin%>" ><td>
</tr>

<tr>
<td>Secuencia :</td>
<td><input name="Secuencia" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="<%=secuencia%>" ><td>
</tr>

<tr>
<td>Fecha :</td>
<td  >
                Dia<input name= "Dia" id="Dia" type="text"  size="2" value="<%=dia%>" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
              
                Mes<input name= "Mes" id="Mes" type="text"  size="2" value="<%=mes%>"  maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
                
                
                Anio<input name= "Anio" id="Anio" type="text"  size="4" value="<%=anio%>" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>


</tr>

<tr>
<td>Actual en Uso :</td>
<%
String  chequeo="";
if (uso==1)
    chequeo="CHECKED";
%>
<td><input name="Uso" TYPE="checkbox"  size="1" maxlength="1" value="1"  <%=chequeo%> ><td>
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


