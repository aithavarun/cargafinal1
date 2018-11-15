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
<%DecimalFormat f =new DecimalFormat("###,0.00");
float desde=0;
float hasta=0 ;
int minimo=0;
int tipo=0;
long codigo=0;
float tarifa=0;
float valorizacion=0;
float iva=0;
float seguro=0;
float descuento=0;
String tipoTarifa="";
Date fecha_creacion = new Date();
Date fecha_modificacion = new Date();
String dentrofuera="";
String auxminimo="";
String auxdentro="";
String auxfuera="";
int  valfijo=0;
String auxvalfijo="";

    List list = model.getTarifasCarga();
    if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
            
          Tarifasc tarifac=(Tarifasc) it.next();
          codigo=tarifac.getCodigo();
          desde=tarifac.getInicio();
          hasta=tarifac.getFin();
          minimo=tarifac.getMinimo();
          tarifa=tarifac.getTarifa();
          valorizacion=tarifac.getValorizacion();
          seguro=tarifac.getSeguro();
          iva=tarifac.getIva();
          tipo=tarifac.getSecuencialTipo();
          dentrofuera=tarifac.getContinente();
          valfijo=tarifac.getValorizfija();
          descuento=tarifac.getDescuento();
          tipoTarifa=tarifac.getTipo();
          fecha_creacion=tarifac.getFecha_creacion();
          fecha_modificacion=tarifac.getFecha_modificacion();
                           }
                     }
 if (valfijo==1)
    auxvalfijo ="checked";

 if (minimo==1)
    auxminimo ="checked";

 if (dentrofuera.equals("D"))
    auxdentro ="checked";
 else
    auxfuera="checked";
    
    
%>





<script LANGUAGE="JavaScript"> 


  

 
</SCRIPT>

<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/TarifasCarga/Modificar"  
name="MantenimientoTarifasCarga" onSubmit="return validar(this)" 
>
<tr>
<td valign="top">
<table width="100%" align="CENTER">
<th>Modifica Tarifa Carga</th>
</table>
<table width="50%" align="CENTER">
<%---------------

%>
-------------------------%>



<tr>
<td>Tipo Tarifa :</td>
<td><select  name="Tipo" type="text" class='txt-arialimput'>
<%
 model.BuscarTipostarifas();
 List listt = model.getTiposTarifas();
 if (listt != null) {
      Iterator it = listt.iterator();
      while (it.hasNext()) {
         Tipot tipot=(Tipot) it.next();
         String tipoTarifaList = tipot.getNombre().trim();
         if(tipoTarifa.trim().equals(tipoTarifaList)){
         %>
         <option value="<%=tipot.getSecuencial()%>" selected > <%=tipot.getNombre().trim()%>  </option>
         <%
         }
         %>
         <option value="<%=tipot.getSecuencial()%>" > <%=tipot.getNombre().trim()%>  </option>
   
 
 <%}}%>
 
     </select>

<td>

</tr>

<tr>
<td>Desde(K) :</td> 
<input name="codigo" type= "hidden"   value="<%=codigo%>">
<td><input name="Desde" value="<%=desde%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td>Hasta(K) :</td>
<td><input name="Hasta" value="<%=hasta%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td >Flete : </td>
<td  colspan="2" ><input name="Tarifa" value="<%=tarifa%>" type="text" size="3" maxlength="5" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>


<tr>
<td >Valorizacion : </td>
<td  colspan="2" ><input name="Valorizacion" value="<%=valorizacion%>" type="text" size="3" maxlength="5" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
Fijo Por Envio 
<input type="checkbox" name="Vfija" value= "1"  <%=auxvalfijo%>   >
</td>
</tr>


<tr>
<td >Seguro : </td>
<td  colspan="2" ><input name="Seguro" value="<%=seguro%>" type="text" size="3" maxlength="5" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td >Iva(%) : </td>
<td  colspan="2" ><input name="Iva" value="<%=iva%>" type="text" size="3" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td >Descuento(%) : </td>
<td  colspan="2" ><input name="Descuento" value="<%=descuento%>" type="text" size="3" maxlength="5" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>
<tr>
    <td>Fecha Creacion : </td>
    <td><input type="text" name="fecha_creacion" value="<%=fecha_creacion%>" disabled="true" ></label></td>
</tr>
<tr>
    <td>Fecha Modificacion : </td>
    <td><input type="text" name="fecha_creacion" value="<%=fecha_modificacion%>" disabled="true" ></label></td>
</tr>

<tr>
<td >Todo este rango paga la misma tarifa </td>
<td colspan="2">
<input type="checkbox" name="Minimo" value= "1"   <%=auxminimo%>  >
</td>
</tr>

<tr>
<td>Tarifa que se cobrara segun este en el continente </td>
<td colspan="2">
<input type="radio" name="DentroFuera"  <%=auxdentro%>  value= "D"     >Dentro </td>
<td>  
   <input type="radio" name="DentroFuera" <%=auxfuera%> value= "F"      >Fuera
</td>
</tr>
<table width="10%" align="center">
<tr>
<td>
 <input TYPE="submit"    NAME="Guardar" value="Guardar">
 </td>
 <td>
 <input  type="submit"  NAME="Salir" value="Salir">
 </td>
 </tr>


</td>
</tr>
</form>
<script language="JavaScript" type="text/javascript">
   MantenimientoTarifasCarga.Tipo.options.value="<%=tipo%>"
</script>
</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


