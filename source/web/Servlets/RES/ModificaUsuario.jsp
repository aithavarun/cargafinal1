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
<form method="post" action="<%=CONTROLLER%>/Usuarios/Modificar"  name="MantenimientoUsuarios">
<tr>
<td valign="top">
<table width="50%" align="CENTER">
<th>Modifica Usuario Usuario</th>
</table>

<table width="50%" align="CENTER">

<%DecimalFormat f =new DecimalFormat("0.00");
List list = model.getUsuariosl();
String nombre="";
String clave="";
String sucursal="";
String grupo="";
 String selecciona="";
int tipo=0;
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Usuarios usuariox=(Usuarios) it.next();
          nombre=usuariox.getNombre();
          clave=usuariox.getCodigo();
          if (clave==null)
              clave="";
          sucursal=usuariox.getSucursal().trim();
          grupo=usuariox.getGrupo().trim();
          tipo=usuariox.getTipo();
          
      }
 }

%>
<td>Nombre : </td>
<td><input name="Nombre" type="text" size="10"  value="<%=nombre.trim()%>" READONLY><td>
<tr>
<td>Clave : </td>
<td><input name="Clave" type="password" size="10" maxlength="30" value="<%=clave.trim()%>"><td>
</tr>
<tr>
<td>Tipo :<%=tipo%></td>
<td>
<select  name="Tipo" type="text" class='txt-arialimput'>
<%if (tipo==0)
      selecciona="selected";
else
      selecciona="";
%>
<option value="0"  <%=selecciona%> > Administrador</option>
<%if (tipo==1)
      selecciona="selected";
else
      selecciona="";
%>

<option value="1" <%=selecciona%>  > Supervisor</option>
<%if (tipo==2)
      selecciona="selected";
else
      selecciona="";
%>

<option value="2" <%=selecciona%> > Agente</option>
</select>
</td>
</tr>
<tr>
<td>Sucursal :<%=sucursal%></td>
<td><select  name="Sucursal" type="text" class='txt-arialimput'>
<%
 model.BuscarSucursales();
 List lists = model.getSucursales();

 if (lists != null) {
      Iterator it = lists.iterator();
      while (it.hasNext()) {
          Sucursales lsucursal=(Sucursales) it.next();
          if(sucursal.equals(lsucursal.getCodigo().trim()))
              selecciona="selected";
          else
              selecciona="";
          %>
          
         <option value="<%=lsucursal.getCodigo().trim()%>" <%=selecciona%>> <%=lsucursal.getDescripcion()%>  </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>

<tr>
<td>Grupo :</td>
<td><select  name="Grupo" type="text" class='txt-arialimput'>
<%
 model.BuscarGrupos();
 List listg = model.getGrupos();
 if (listg != null) {
      Iterator it = listg.iterator();
      while (it.hasNext()) {
          Grupos grupoc=(Grupos) it.next();
      if(grupo.equals(grupoc.getCodigo().trim()))
              selecciona="selected";
          else
              selecciona="";
          %>
          
         <option value="<%=grupoc.getCodigo().trim()%>"  <%=selecciona%> > <%=grupoc.getNombre()%>  </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>

<script language="JavaScript" type="text/javascript">
   MantenimientoUsuarios.Sucursal.options.value="<%=sucursal.trim()%>"
   MantenimientoUsuarios.Grupo.options.value="<%=grupo.trim()%>" 
   
  <%/* document.forms[0].Sucursal.options.value="<%=sucursal.trim()%   */%>
 
 </script>
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


