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
<form method="post" action="<%=CONTROLLER%>/Tarifa/Buscar"  name="BuscarTarifas" >
<table width="90%" align="center">
<tr>
<th colspan="4">MANTENIMIENTO DE TARIFAS</th>
</tr>
<tr>
<td>Origen :
<input name="Origen" type="text" value="UIO" size="3" maxlength="3" ></td>
<td>Destino :
<input name="Destino" value ="GYE" type="text" size="3" maxlength="3" ></td>
<td>Base Tarifa :
<input name="Base" type="text" size="3" maxlength="3" ></td>
<td>
<input TYPE="submit"    NAME="Buscar" value="Buscar"></td>
</tr>

</table>
</form>


<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Tarifas/Nuevo"  name="MantenimientoTarifas">.
 
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("###,##0.00");%>
<tr>
<th>Base</th>
<th>Origen</th>
<th>Destino</th>
<th>Tipo</th>
<th>Clase</th>
<th>Restricciones</th>
<th>Validez</th>
<th>Tarifa</th>
<th>Iva</th>
<th>Seguro</th>
<th>Tasa</th>

</tr>
<%
 List list = model.getTarifas();
 int i=0;
 int j=1;
 String color="#efefef";
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Tarifas tarifa=(Tarifas) it.next();
          i++;
          /*if (j==1)
            j=2;
          else*/
          if (color.equals("#efefef"))
              color="#ffffff";
          else
            color="#efefef";  
              j=1;
          String seleccionUrl=CONTROLLER+"/Tarifas/Selecciona?codigo="+tarifa.getCodigo() ;
          
          %>
          
  <tr bgcolor="<%=color%>" >
  <%------------------
id="fila<%=i%>" onmouseOver="oscura(<%=i%>);" onmouseOut="oscura(0);">
      -------------------%>
       <td>
       <%--------------------------------------
       <span id="<%=i%><%=1%>" class="letra<%=j%>"  style="position:relative;">
       <layer width="100%" onmouseover="oscura(<%=i%>);" onmouseout="oscura(0)">
       ----------------------%>
        <A HREF="<%=seleccionUrl%>"> <%=tarifa.getBase()%></a>
        <%---------------------------
       </layer>
       </span>
       -------------------------%>
       </td>
        
       <td>
       
             <%=tarifa.getOrigen()%>
       
       </td>
       <td>
       <%=tarifa.getDestino()%>
       </td>
       <td>
       <%=tarifa.getTipo()%>
       </td>
       <td>
       <%=tarifa.getClase()%>
       </td>
       <td>
       <%=tarifa.getRestriccionesN()%>
       </td>
       
       <tD>
       <%=tarifa.getValidez()%>
       </td>
   <td>
       <%=f.format(tarifa.getValor())%>
       
   </td>
       <td>
        <%=f.format(tarifa.getIva())%>
       </td>
       <td>
       <%=f.format(tarifa.getSeguro())%>
       </td>
       <td>
       <%=f.format(tarifa.getTasa())%>
       </td>
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
</td>
</tr>
</form>
</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


