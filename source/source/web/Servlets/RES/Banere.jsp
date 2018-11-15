</td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="287" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="10"><img name="<%=BASEURL%>/images/Sistema/Sistema_r10_c2" src="<%=BASEURL%>/images/Sistema/Sistema_r10_c2.gif" width="724" height="16" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="16" border="0" alt=""></td>
  </tr>
 </table>
 
<table width="780" align="center" bgcolor="#ffffff">
 <tr>
   <%
       
         Usuarios usuario=model.getUsuarios();
        
        %>
  <th>
      <%=usuario.getNombre()+"--"+usuario.getSucursal()+"--"+usuario.getGrupo() %>
    </th>
   </tr>
   
  </table>
  <%--------------
<tr align="center">
   <script language="JavaScript1.2" src="http://www.altavista.com/static/scripts/translate_engl.js"></script>
   </tr>
----------------%>