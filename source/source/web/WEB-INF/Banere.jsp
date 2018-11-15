 
<table width="780" align="center" bgcolor="#ffffff">
 <tr>
   <%
       
         //Usuarios usuario=model.getUsuarios();
        Calendar FECHPIE = Calendar.getInstance();
        %>
  <th>
      <%=usuario.getNombre()+"--"+usuario.getSucursal()+"--"+usuario.getGrupo() %> - <%=FECHPIE.getTime()%> COTIZACION PESOS <%=cotiz%>
	  <br/>
	  Versi&oacute;n <%= application.getInitParameter("appVersion") %>
    </th>
    
   </tr>
 <tr>
 <SCRIPT LANGUAGE="JavaScript">
<!--
function imprimir() {
if (window.print)
window.print()
else
alert("Disculpe, su navegador no soporta esta opción.");
}
// -->
</SCRIPT>
<TD>
<A HREF="javascript:imprimir()" style="color: #000;">Imprimir Página Web</A>
</td>
 </tr>
  </table>

  <%--------------
   <%model.Limpiarlistas();%> 
<tr align="center">
   <script language="JavaScript1.2" src="http://www.altavista.com/static/scripts/translate_engl.js"></script>
   </tr>
----------------%>