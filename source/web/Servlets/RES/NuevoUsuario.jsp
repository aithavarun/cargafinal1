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
<form method="post" action="<%=CONTROLLER%>/Usuarios/Guardar"  name="MantenimientoUsuarios">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Nuevo Usuario</th>
</table>
<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<td>Nombre :</td>
<td><input name="Nombre" type="text" size="10" maxlength="30"><td>
</tr>

<tr>
<td>Clave :</td>
<td><input name="Clave" type="password"   size="10" maxlength="30" ><td>
</tr>
<tr>
<td>Tipo :</td>
<td>
<select  name="Tipo" type="text" class='txt-arialimput'>
<option value="0" > Administrador</option>
<option value="1" > Supervisor</option>
<option value="2" > Agente</option>
</select>
</td>
</tr>
<tr>
<td>Sucursal :</td>
<td><select  name="Sucursal" type="text" class='txt-arialimput'>
<%
 model.BuscarSucursales();
 List lists = model.getSucursales();
 if (lists != null) {
      Iterator it = lists.iterator();
      while (it.hasNext()) {
          Sucursales sucursal=(Sucursales) it.next();
      
          %>
          
         <option value="<%=sucursal.getCodigo().trim()%>" > <%=sucursal.getDescripcion()%>  </option>
         
 
 <%}}%>
 
     </select>

</td>

</tr>


<tr>
<td>Grupo :</td>
<td><select  name="Grupo" type="text" class='txt-arialimput'>
<%
 model.BuscarGrupos();
 List list = model.getGrupos();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Grupos grupo=(Grupos) it.next();
      
          %>
          
         <option value="<%=grupo.getCodigo().trim()%>" > <%=grupo.getNombre()%>  </option>
         
 
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


