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
<form method="post" action="<%=CONTROLLER%>/TarifaCarga/Buscar"  name="BuscarTarifas" >
<table width="90%" align="center">
<tr>
<th colspan="4">MANTENIMIENTO DE TARIFAS CARGA</th>

</table>
</form>


<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/TarifasCarga/Nuevo"  name="MantenimientoTarifas">
 
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("###,##0.00");%>
<tr>
 <th>Tipo</th>
<th>Desde(k)</th>
<th>Hasta(k)</th>
<th>Es Minimo</th>
<th>Tarifa</th>
<th>Seguro</th>
<th>Valorizacion</th>
<th>Iva</th>
<th>Dentro/Fuera Continente</th>


</tr>
<%
 List list = model.getTarifasCarga();
 int i=0;
 int j=1;
 String color="#efefef";
 String mitipo="";
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Tarifasc tarifac=(Tarifasc) it.next();
          i++;
          /*if (j==1)
            j=2;
          else*/
          if (color.equals("#efefef"))
              color="#ffffff";
          else
            color="#efefef";  
              j=1;
          String seleccionUrl=CONTROLLER+"/TarifasCarga/Selecciona?codigo="+tarifac.getCodigo() ;
         /* if (tarifac.getTipo()==1)
             mitipo="Tarifa Normal";
          else
             mitipo="Tarifa Perecible";*/
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
        <A HREF="<%=seleccionUrl%>"> <%=tarifac.getTipo() %> </a>
        <%---------------------------
       </layer>
       </span>
       -------------------------%>
       </td>
        
       <td>
       
              <%=tarifac.getInicio()%>
       
       </td>
       
       <td>
       
              <%=tarifac.getFin()%>
       
       </td>
       <td>
       
       <%=tarifac.getMinimo()%>
       </td>
       <td>
       <%=tarifac.getTarifa()%>
       </td>
       <td>
       <%=tarifac.getSeguro()%>
       </td>
       <td>
       <%=tarifac.getValorizacion()%>
       </td>
       
       <tD>
       <%=tarifac.getIva()%>
       </td>
   
      
       
       <tD>
       <%=tarifac.getContinente()%>
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


