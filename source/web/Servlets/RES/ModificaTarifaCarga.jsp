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
String Origen=request.getParameter("Origen");
String Destino=request.getParameter("Destino");
int minimo=0;
int tipo=0;
long codigo=0;
float tarifa=0;
float valorizacion=0;
float iva=0;
float seguro=0;




if (Origen==null)
{
    List list = model.getTarifasCarga();
    if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
            
          Tarifasc tarifac=(Tarifasc) it.next();
          codigo=tarifac.getCodigo();
          Origen=tarifac.getOrigen().trim();
          Destino=tarifac.getDestino().trim();
          minimo=tarifac.getMinimo();
          tarifa=tarifac.getTarifa();
          valorizacion=tarifac.getValorizacion();
          seguro=tarifac.getSeguro();
          iva=tarifac.getIva();
          tipo=tarifac.getTipo();
                           }
                     }
}




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
<table width="100%" align="CENTER">
<%---------------

%>
-------------------------%>

<tr>
<td>Origen :</td>
<input name="codigo" value="<%=codigo%>" type= "hidden"  >
<td><input name="Origen" value="<%=Origen%>" type="text" size="3" maxlength="3" ><td>
</tr>

<tr>
<td>Destino :</td>
<td><input name="Destino" value="<%=Destino%>" type="text" size="3" maxlength="3" ><td>
</tr>

<tr>
<td> Tipo : </td>
<td><select  name="Tipo" type="text" class='txt-arialimput'   >


          
         <option value=1 > Tarifa Normal  </option>
         
         <option value=2 > Tarifa Perecible  </option>
 
 
     </select>

<td>

</tr>


<tr>
<td >Minimo : </td>
<td  colspan="2" ><input name="Minimo" value="<%=minimo%>" type="text" size="3" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>


<tr>
<td >Tarifa : </td>
<td  colspan="2" ><input name="Tarifa" value="<%=tarifa%>" type="text" size="3" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>


<tr>
<td >Valorizacion : </td>
<td  colspan="2" ><input name="Valorizacion" value="<%=valorizacion%>" type="text" size="3" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>


<tr>
<td >Seguro : </td>
<td  colspan="2" ><input name="Seguro" value="<%=seguro%>"  type="text" size="3" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
</tr>

<tr>
<td >Iva : </td>
<td  colspan="2" ><input name="Iva" value="<%=iva%>"  type="text" size="3" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"><td>
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


