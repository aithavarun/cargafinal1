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
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Blacklists/Modificar"  name="MantenimientoBlacklist">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Modifica  Black List</th>
</table>

<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getBlacklists();
long numero=0;
String nombre="";
String ruta="";
String observa="";
int mes=0;
int dia=0;
int anio=0;
String sucursal=""; 

java.util.Date mifecha;
/*
  Calendar inicio=Calendar.getInstance(); */
java.util.Calendar inicio = java.util.Calendar.getInstance();

if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Blacklists blacklist=(Blacklists) it.next();
          numero=blacklist.getNumero();
          nombre=blacklist.getNombre();
          ruta=blacklist.getRuta();
          observa=blacklist.getObserva();
          mifecha=blacklist.getFecha();
          inicio.setTime(mifecha);
          mes =inicio.get(Calendar.MONTH)+1;
          anio=inicio.get(Calendar.YEAR);
          dia=inicio.get(Calendar.DATE);
          sucursal=blacklist.getSucursal();
     }
 }

%>

<tr>
<td>Numero : </td>
<td><input name="Numero" type="text" size="15" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value=<%=numero%>  READONLY ><td>

</tr>
<tr>
<td>Nombre Pasajero :</td>
<td><input name="Nombre" type="text" size="30" maxlength="30" value="<%=nombre%>"> <td>
</tr>

<tr>
<td>Ruta :</td>
<td><input name="Ruta" type="text" size="30" maxlength="30" value="<%=ruta%>" ><td>
</tr>

<tr>
<td>Observacion :</td>
<td><input name="Observa" type="text" size="30" maxlength="30" value="<%=observa%>" ><td>
</tr>

<tr>
<td>Fecha :</td>
<td>
                
                Dia<input name= "Dia" id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" value=<%=dia%> >
            
               
                Mes<input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);" value=<%=mes%> > 
              
                
                Anio<input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value=<%=anio%> >
            
</td>
</tr>


<tr>
<td>Sucursal :</td>
<td><select  name="Sucursal" type="text" class='txt-arialimput'>
<%
 model.BuscarSucursales();
 List listx = model.getSucursales();
 if (list != null) {
      Iterator itx = listx.iterator();
      while (itx.hasNext()) {
          Sucursales lsucursal=(Sucursales) itx.next();
      
          %>
          
         <option value=<%=lsucursal.getCodigo()%> > <%=lsucursal.getDescripcion()%>  </option>
         
 
 <%}}%>
 
     </select>

<td>

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


