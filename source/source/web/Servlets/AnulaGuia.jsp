<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<script>
function validar(){ 
//var siAceptar = "Se ha pulsado Aceptar"
//var siCancelar = "Se ha pulsado Cancelar"
if ( confirm ("Esta seguro de Anular ?"))
{
return true;
}
else
{
alert("Se ha pulsado Cancelar");
return false;
}



}

</script>


<html>


<%@ include file="/WEB-INF/Banner.jsp"%>  

<form method="post" action="<%=CONTROLLER%>/Reservaciones/AnularGuia"  name="AnularGuia" onSubmit="return validar(this)" >

<table width="80%" align="center" >
<th colspan="6">Lista  de Guias a Anular</th>
<tr>
<th > Nª Guia</th>
<th > Piezas</th>
<th > Peso</th>
<th > Destino</th>
<th > Contiene</th>
<th > Destinatario</th>
<th > Remitente</th>    
<th > Ruta</th>
<th > Tipo</th>

</tr>

<%
 List lista = model.getGuiasLista();
 
 int secuencial=0;
 String filascolor="";
 String Destino="";
 String Ruta1="";
 String Ruta2="";
 String Origen1="";
 String Vuelo ="";
 float totalopz1=0;
 float totalopz2=0;
 float totalops1=0;
 float totalops2=0;
 
 
 float totalpz=0;
 float totalps=0;
if (lista != null){
     Iterator itr = lista.iterator();
      while (itr.hasNext()){
             secuencial++;
             Guias guia=(Guias) itr.next();              
             String seleccionUrl=CONTROLLER+"/Reservaciones/AnularGuia?guia="+guia.getNumero() +"&Anular=Anular" +"&Tipo="+ guia.getTipo()+"&observaciones=Anulado";
             if(guia.getEntregaen()==1 )
             Destino="Domicilio";
             else if(guia.getEntregaen()==2)
             Destino="Oficina";
             else if(guia.getEntregaen()==3)
             Destino="Aeropuerto";
             
             //if (guia.getNumerov().trim().equals(""))
                 Vuelo=guia.getTipo();
             //else
              //   Vuelo=guia.getNumerov();
                 
             
             totalpz+=guia.getPiezas();
             totalps+=guia.getPeso();
             
             if (Origen1.equals("") || Origen1.equals(guia.getOrigen()))
             { 
                 Ruta1=guia.getOrigen();
                 totalopz1+=guia.getPiezas();
                 totalops1+=guia.getPeso();
                 Origen1=guia.getOrigen();
             }
             else
             {
                 totalopz2+=guia.getPiezas();    
                 totalops2+=guia.getPeso();
                 Ruta2=guia.getOrigen();
             }
             
             
             
             
             %>
             <tr   bgcolor="<%=filascolor%>">
             <td><b><A HREF="<%=seleccionUrl%>" onclick ="return validar(this)"> <%=guia.getNumero()%>   </a></b></td>
             <td><%=guia.getPiezas()%></td>             
             <td><%=guia.getPeso()%></td>
             
             <td><%=Destino%></td>
             
             <td><%=guia.getContiene()%></td>
             <td><%=guia.getDestinatario()%></td>
             <td><%=guia.getRemitente()%></td>
             <td><%=guia.getOrigen() + " - " + guia.getDestino()  %></td>
             <td><%=Vuelo%></td>
             
            </tr>   
 
             <%}}%> 
 
         
 
            
 
 
</table>

<table width="50%" align="center">
<% String error=model.getError(); %>
<%/*%>
<tr>
<th colspan="6">Anular Guias de Carga</th>
</tr>




<td>Guia de Carga :
<input name="guia" type="text" size="20" maxlength="30" value="0"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td>Tipo:
<select  name="Tipo" type="text" class='txt-arialimput'>
  <option value="G" > Guia de Remision  </option>
  <option value="F" > Factura  </option>
</select>
</td>

<td>Obs :
<input name="observaciones" type="text" size="20" maxlength="30" value=""></td>


</tr>
<tr>

<td>

<input TYPE="submit"    NAME="Anular" value="Anular">
<input TYPE="submit"    NAME="Salir" value="Salir"></td>
</tr>

<%*/%>

</table>
</form>


<%@ include file="/WEB-INF/Banere.jsp"%>
</body>
</html>


