<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>


<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Revision/Modificar"  name="MantenimientoRevisiones">
<tr>
<td valign="top">
<table width="100%" align="CENTER">
<th>Revisar Boleto</th>
</table>
<table width="100%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
DecimalFormat f1 =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");
List list = model.getBase();
int contador=0;
long reserva=0;
String lectura="";
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Boletorevision boleto=(Boletorevision) it.next();
          contador++;
          Calendar hoy=Calendar.getInstance();
                hoy.setTime(boleto.getFechavuelo());
                int dia=hoy.get(Calendar.DATE);
                int mes=hoy.get(Calendar.MONTH)+1;
                int anio=hoy.get(Calendar.YEAR);
          if (reserva!=boleto.getReservacodigo())
          {
                reserva=boleto.getReservacodigo();
                lectura="";
                
                if (boleto.getRnombre()==1)
                    lectura="READONLY";
                lectura="";
%>
<tr>
<td colspan="8">
Restricciones:<%=boleto.getRestriccionesN()%>
</td>
</tr>
<tr>
<td>Apellido : </td>
<td> <input name="apellido" type= "text"  size="20" maxlength="25"  value="<%=boleto.getApellido().trim()%>"  <%=lectura%>><td>
</tr>
<tr>
<td>Nombre : </td>
<td> <input name="nombre" type= "text"  size="20" maxlength="25"  value="<%=boleto.getNombre().trim()%>" <%=lectura%>><td>
</tr>
<td>Cedula : </td>
<td> <input name="cedula" type= "text"  size="20" maxlength="25" 
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
 value="<%=boleto.getCedula().trim()%>" <%=lectura%>><td>
</tr>
<input name="nombreant" value="<%=boleto.getNombre()%>" 
type="hidden"  >
<input name="apellidoant" value="<%=boleto.getApellido()%>" 
type="hidden"  >
<input name="codigor" value="<%=boleto.getReservacodigo()%>" 
type="hidden"  >
<input name="codigo" value="<%=boleto.getCodigo()%>" 
type="hidden"  >
<input name="cedulaant" value="<%=boleto.getCedula()%>" 
type="hidden"  >
<input name="tipo" value="<%=boleto.getTipo()%>" 
type="hidden"  >
<tr>
<td>Boleto a revisar:</td>
<td><%=boleto.getBoleto()%><td>
<input name="boleto" value="<%=boleto.getBoleto()%>" 
type="hidden"  >
</tr>

<tr >
<td>Validez:</td>
<td><%=FORMATOFECHA.format(boleto.getValidez())%></td>
<tr>
<td>Penalidad : </td>
<td>% <input name="procentaje" type= "text"  size="3" maxlength="5"  value="0" 
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
<td> Valor: <input name="valor" type= "text"  size="10" maxlength="10"  value="0" 
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>
<%-----------
<td colspan="1"><b>Mes: </b>
<input name="Mes<%=contador%>" value="<%=mes%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>D&iacute;a: </b>
<input name="Dia<%=contador%>" value="<%=dia%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
<td><b>A&ntilde;o: </b>
<input name="Anio<%=contador%>" value="<%=anio%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
------------%>
</tr>
<tr class="form1">
<th colspan="8" >Datos del Viaje</th>
</tr>
</table>
<table width="100%" align="CENTER">
<tr>

<th >Origen</th>
 <th >Destino</th>
 <th >Numero</th>
 <th >Hora</th>
  <th colspan="4">Fecha</th>
</tr>

<% 
lectura="";
if (boleto.getRcambio()==1)
                    lectura="READONLY";
          }%>
            
<td>
<input name="Origen<%=contador%>"  value="<%=boleto.getOrigen()%>" 
type="text" size="3" maxlength="3" <%=lectura%>>
<input name="Origenant<%=contador%>" value="<%=boleto.getOrigen()%>" 
type="hidden"  >

</td>
<td>
<input name="Destino<%=contador%>" value="<%=boleto.getDestino()%>" 
type="text" size="3" maxlength="3" <%=lectura%>>
<input name="Destinoant<%=contador%>" value="<%=boleto.getDestino()%>" 
type="hidden"  >

</td>

<td>
<input name="Numero<%=contador%>" value="<%=boleto.getNumero()%>" 
type="text" size="5" maxlength="5" <%=lectura%> >
<input name="Numeroeant<%=contador%>" value="<%=boleto.getNumero()%>" 
type="hidden"  >

</td>

<%---------------
---------------------%>
<td><%=f1.format(boleto.getHora())+":"+f1.format(boleto.getMinuto())%></td>



<td colspan="1"><b>Mes: </b>
<input name="Mes<%=contador%>" value="<%=mes%>" <%=lectura%> type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
<input name="Mesant<%=contador%>" value="<%=mes%>"
type="hidden"  >

</td>
<td><b>D&iacute;a: </b>
<input name="Dia<%=contador%>" value="<%=dia%>" <%=lectura%> type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
<input name="Diaant<%=contador%>" value="<%=dia%>" 
type="hidden"  >

</td>
<td><b>A&ntilde;o: </b>
<input name="Anio<%=contador%>" value="<%=anio%>" <%=lectura%> type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
<input name="Anioant<%=contador%>" value="<%=anio%>"
type="hidden"  >

</td>
</tr>
<tr bgcolor="#CCFFFF">
<td>Tarifa:</td>
<td><%=boleto.getValor()%></td>
<td>Iva:</td>
<td><%=boleto.getIva()%></td>
<td>Seguro:</td>
<td><%=boleto.getSeguro()%></td>
<td>Tasa:</td>
<td><%=boleto.getTasa()%></td>
<td>Sc:</td>
<td><%=boleto.getSc()%></td>
<td> % Descuento:</td>
<td><%=boleto.getDescuento()%></td>
<input name="Base<%=contador%>" value="<%=boleto.getBase()%>" 
type="hidden"  >
<input name="vuelo<%=contador%>" value="<%=boleto.getVuelocodigo()%>" 
type="hidden"  >
<input name="programacion<%=contador%>" value="<%=boleto.getProgramacioncodigo()%>" 
type="hidden"  >
<input name="base<%=contador%>" value="<%=boleto.getBase()%>" 
type="hidden"  >
</tr>
<%--------------------%>
<tr bgcolor="#CCFFFF">
<td colspan="8">
<select name='Tipo<%=contador%>' >
<%--------------------
 onchange="cambia(document.TarifasReservas.Tipo<%=codigo1%>.options[document.TarifasReservas.Tipo<%=codigo1%>.selectedIndex].value
,document.TarifasReservas.Tipo<%=codigo1%>.options[document.TarifasReservas.Tipo<%=codigo1%>.selectedIndex].text)">
--------------%>
<%

//model.TraerTarifas(vuelo.getOrigen(),vuelo.getDestino());
model.TraerTarifasNacTipo(boleto.getOrigen(),boleto.getDestino(),boleto.getNacionalidad(),boleto.getTipo(),"Y");

List listas = model.getTarifas();
String Base="";
String Basei="";
String Origen="";
String Destino="";
String selecciona="";
if  (listas != null)  {
    Iterator itvs = listas.iterator();
    while (itvs.hasNext()) { 
                       
       Tarifas tarifa=(Tarifas) itvs.next();
       
       if (tarifa.getBase()!=null)
                Base=tarifa.getBase().trim();
       
            if (boleto.getBase()!=null)
                Basei=boleto.getBase().trim(); 
            if (Base.equals(Basei))
                selecciona="SELECTED";
            else
                selecciona="";
      /* if (!Base.equals(tarifa.getBase().trim()))
       {
           
            Base=tarifa.getBase().trim();*/
                   %>
                   <%-------------
                  <option value='<%=tarifa.getBase().trim()+"."+tarifa.getTipo().trim()+"."+boleto.getNacionalidad().trim()%>'  >
                  ----------%>
                   <option value='<%=tarifa.getBase()%>' <%=selecciona%>  >
                    <%=tarifa.getBase().trim()%> - <%=f.format(tarifa.getValor())+ " Iva: " +
                    f.format(tarifa.getIva()) + " Seguro : " +f.format(tarifa.getSeguro())+" Tasa:"+f.format(tarifa.getTasa())+" Validez: "+ tarifa.getValidez() +" meses"%>
                   </option>
       <% 
       /*}*/%>
       
       
    <% }
}%>
</select>
</td>
</tr>
<%--------------------%>
<%}}%>
<input name="v" value="<%=contador%>" 
type="hidden"  >
</table>
</td>
</tr>
<tr>
<td align="right">
<table width="10%" align="center">
<tr>
<td>
 <input TYPE="submit"    NAME="Guardar" value="Calcular Pago">
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


