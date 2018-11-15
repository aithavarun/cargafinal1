<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  

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
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Clientesf/Modificar"  name="MantenimientoClientesfrecuentes">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Datos Pasajero Frecuente</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getClientesf();
long tarjeta=0 ;
String pin="";
String nombre="";
String empresa="";
java.util.Date Fecha;
String ocupacion="";
String cargo="";
String direccion="";
String telefono="";
String mail="";
int corporativo=0;   
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
          Clientesf clientef=(Clientesf) it.next();
          tarjeta=clientef.getTarjeta();
          pin=clientef.getPin();
          nombre=clientef.getNombre();
          empresa=clientef.getEmpresa();
          mifecha=clientef.getFecha();
          ocupacion=clientef.getOcupacion();
          cargo=clientef.getCargo();
          direccion=clientef.getDireccion();
          telefono=clientef.getTelefono();
          mail=clientef.getMail();
          corporativo=clientef.getCorporativo();
          
          inicio.setTime(mifecha);
          mes =inicio.get(Calendar.MONTH)+1;
          anio=inicio.get(Calendar.YEAR);
          dia=inicio.get(Calendar.DATE);
      }
 }

%>

<tr>
<td>Tarjeta Millas:</td>
<td><input name="Tarjeta" type="text" size="10" maxlength="20" value="<%=tarjeta%>" READONLY > <td>
</tr>

<tr>
<td>P.I.N.:</td>
<td><input name="Pin" type="text" size="15" maxlength="15" value="<%=pin%>" ><td>
</tr>

<tr>
<td>Nombre :</td>
<td><input name="Nombre" type="text" size="40" maxlength="40" value="<%=nombre%>" ><td>
</tr>

<tr>
<td>Empresa :</td>
<td><input name="Empresa" type="text" size="40" maxlength="40" value="<%=empresa%>" ><td>
</tr>

<tr>
<td>Fecha :</td>
<td>
                
                Dia<input name= "Dia" id="Dia" type="text"  size="2" maxlength="2"  value="<%=dia%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
            
               
                Mes<input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" value="<%=mes%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
              
                
                Anio<input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" value="<%=anio%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
            
</td>
</tr>

<tr>
<td>Ocupacion :</td>
<td><input name="Ocupacion" type="text" size="20" maxlength="20" value="<%=ocupacion%>" ><td>
</tr>

<tr>
<td>Cargo :</td>
<td><input name="Cargo" type="text" size="20" maxlength="20" value="<%=cargo%>" ><td>
</tr>


<tr>
<td>Direccion :</td>
<td><input name="Direccion" type="text" size="50" maxlength="50" value="<%=direccion%>" ><td>
</tr>




<tr>
<td>Telefono :</td>
<td><input name="Telefono" type="text" size="20" maxlength="20" value="<%=telefono%>" ><td>
</tr>

<tr>
<td>Mail :</td>
<td><input name="Mail" type="text" size="40" maxlength="40" value="<%=mail%>" ><td>
</tr>
<%
String  chequeo="";
if (corporativo==1)
    chequeo="CHECKED";
%>

<tr>
<td><input type="checkbox" name="Corporativo" value= "1" <%=chequeo%>  >Cliente Corporativo</td>

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

<form  method="post" action="<%=CONTROLLER%>/Millas/Nuevo"  name="Millas Acumuladas">
 <table width="60%" align="center">
    <tr>
    <td valign="top">
     <th>Millas</th>
     </td>
    </tr>
  </table>
<%

%>
<input name="Codigotarjeta" value="<%=tarjeta%>" 
type="hidden"  >

<table width="50%" align="center">

<tr>

<th>Origen </th>
<th>Destino </th>
<th>Saldo </th>
</tr>
<%

model.BuscarMillajes(tarjeta);
List listx = model.getContratos();


 if (listx != null) {
      Iterator itx = listx.iterator();
      while (itx.hasNext()) {
          Millaje millas=(Millaje) itx.next();
          String seleccionUrl=CONTROLLER+"/Millas/Selecciona?tarjeta="+millas.getTarjeta() ;
          %>
  <tr>
      
       <td><A HREF="<%=seleccionUrl%>"> <%=millas.getOrigen()%></td>
        <td><%=millas.getDestino()%></td>
       <td><%=f.format(millas.getSaldo())%></td>
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





