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
<form method="post" action="<%=CONTROLLER%>/Aviones/Modificar"  name="MantenimientoAviones">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Avion</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getAviones();

String nombre="";
int capax=0;
float capcar=0;
int codigo=0;
int filam=0;
int columnam=0;
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Aviones avion=(Aviones) it.next();
          nombre=avion.getDescripcion();
          capax=avion.getCapacidadPax();
          capcar=avion.getCapacidadCarga();
          codigo=avion.getCodigo();
      }
 }

 model.BuscarAsientos(codigo);
 List lista = model.getAsientos();
 
 int columnas=8;
 int filas=30;
 
 int asientosm[][]=new int[filas][columnas];
 filas=1;
 if (lista != null) {
      Iterator itx = lista.iterator();
      while (itx.hasNext()) {
          Asientos asiento=(Asientos) itx.next();
          
          filam=asiento.getFila();
          columnam=asiento.getColumna();
          asientosm[filam][columnam]=1;
         // if (filam > filas)
              filas=filam+1;
      }
 
 }

 
%>
<input name="codigo"    type= "hidden"  value="<%=codigo%>"><td>
<tr>

<td>Nombre : </td>
<td><input name="Descripcion" type="text" size="10" maxlength="30" value="<%=nombre.trim()%>"><td>

</tr>
<tr>
<td>Capacidad Pasajeros :</td>
<td><input name="CapPax" value="<%=capax%>" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td>Capacidad Carga :</td>
<td><input name="CapCarga" value="<%=capcar%>" type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
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


<table width="50%" align="CENTER">
<tr>
<th>Mapa  de Asientos</th>
</tr>
</table>

<form method="post"  action="<%=CONTROLLER%>/Asiento/Guardar"  name="CrearAsientos">
<table width="50%" align="CENTER">
<tr><td align="center">
 <input  TYPE="submit"   NAME="Agregar" value="Agregar" align="CENTER" >
</td></tr>
<input name="Codigo"    type= "hidden"  value="<%=codigo%>"><td>
<tr>
<td>Fila      #:
<input name="Fila"  type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>



<td>Columna #:
<input name="Columna"  type="text" size="10" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>



<td>Grupo :
<input name="Grupo"  type="text" value="Y" size="2" maxlength="2" ><td>
</tr>

</table>




<table width="200" border="2"   align="center">

<% 
String ifl="<tr>";
String ffl="</tr>";
String ic="<td  bgcolor=\"#00FFFF\">";
String icsc="<td>";
String fc="</td>";
String linea="";

String columna[]={"A","B","C","-","D","E","F"};





int i=1;
int j=1;



while (i<filas) {
    linea=ifl+ffl;
    j=1;
    while (j<columnas) {
     if (columna[j-1]=="-" ) 
     linea=linea + icsc  +"_____"+ fc;  
     else
         if (asientosm[i][j]==1) 
         linea=linea + ic + i +columna[j-1]  + fc;  
         else
         linea=linea + icsc + fc;      
     j++;
    }
%>

<%=linea%>

<%
 
 i++;
}
%>

</table>



 

</form>
<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


