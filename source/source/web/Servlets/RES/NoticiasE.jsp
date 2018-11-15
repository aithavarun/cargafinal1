
<meta http-equiv="Content-Type" content="Content-type: text/html; charset='ISO-8859-1'">
<!--Fireworks MX 2004 Dreamweaver MX 2004 target.  Created Fri Sep 23 17:17:24 GMT-0500 2005-->
<style type="text/css">
<!--
.stylec1 {
	color: #003b6b;
	font-size: 14px;
}
.stylec2 {
	font-size: 14px;
	color: #003b6b;
}
-->
</style>

<%if (Vid<100)
{%>

<table border="0" cellpadding="0" cellspacing="0" width="420">
<!-- fwtable fwsrc="<%=BASEURL%>/images/Contactanos.png" fwbase="Contactanos.gif" fwstyle="Dreamweaver" fwdocid = "1148172801" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="14" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="380" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="26" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/Contactanos_r1_c1" src="<%=BASEURL%>/images/Noticias.gif" width="420" height="61" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="61" border="0" alt=""></td>
  </tr>
  <tr>
   <td><img name="<%=BASEURL%>/images/Contactanos_r2_c1" src="<%=BASEURL%>/images/Contactanos_r2_c1.gif" width="14" height="1" border="0" alt=""></td>
   
   <td valign="top" align="center">
   
   <%
   List list = model.getNoticias();
   String Archivo="";
   if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Archivo="";
          Noticias noticia=(Noticias) it.next();
          Archivo=noticia.getArchivo();
          
          if (Archivo==null)
                    Archivo="";
         Archivo=Archivo.trim();           
      %> 
      <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">   
      <tr>
       <td align="center">
      
       <h3  class="stylec1"><%=noticia.getTitulo()%></h3>
       </td>
       </tr>
       </table>
       <%if (!Archivo.equals("") )
       {%>
       <table  align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
         <tr><td align="center"><img  src="<%=BASEURL%>/images/<%=Archivo%>" width="207" height="129"></td></tr>
         </table>
       <%}%>
       <table border="0" cellpadding="0" cellspacing="0" width="100%">
       <tr>
       <td width="100%"  class="stylec1" align="justify">
       <%=noticia.getParrafo()%>
       </td>
      </tr>
      </table>
   <%}}%>   
   
   </td>
   <td background="<%=BASEURL%>/images/Forma_r2_c3.gif"></td>
   <%---------------------
   <td><img name="<%=BASEURL%>/images/Contactanos_r2_c3" src="<%=BASEURL%>/images/Contactanos_r2_c3.gif" width="26" height="1" border="0" alt=""></td>
   ---------------------%>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="319" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/Contactanos_r3_c1" src="<%=BASEURL%>/images/Contactanos_r3_c1.gif" width="420" height="40" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="40" border="0" alt=""></td>
  </tr>
</table>

<%}
else
{%>
<table border="0" cellpadding="0" cellspacing="0" width="420">
<!-- fwtable fwsrc="<%=BASEURL%>/images/Contactanos.png" fwbase="Contactanos.gif" fwstyle="Dreamweaver" fwdocid = "1148172801" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="14" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="380" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="26" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/ContactanosI_r1_c1" src="<%=BASEURL%>/images/News.gif" width="420" height="61" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="61" border="0" alt=""></td>
  </tr>
  <tr>
   <td><img name="<%=BASEURL%>/images/Contactanos_r2_c1" src="<%=BASEURL%>/images/Contactanos_r2_c1.gif" width="14" height="1" border="0" alt=""></td>
   <td valign="top" align="center">
   
   <%
   List list = model.getNoticias();
   String Archivo="";
   if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Archivo="";
          Noticias noticia=(Noticias) it.next();
          Archivo=noticia.getArchivo();
          if (Archivo==null)
                    Archivo="";
          Archivo=Archivo.trim();
      
      %> 
      <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">   
      <tr>
       <td align="center">
      
       <h3  class="stylec1"><%=noticia.getTituloIngles()%></h3>
       </td>
       </tr>
       </table>
       <%if (!Archivo.equals("") )
       {%>
       <table  align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
         <tr><td align="center"><img  src="<%=BASEURL%>/images/<%=Archivo%>" width="207" height="129"></td></tr>
         </table>
       <%}%>
       <table border="0" cellpadding="0" cellspacing="0" width="100%">
       <tr>
       <td width="100%"  class="stylec1" align="justify">
       <%=noticia.getNoticia()%>
       </td>
      </tr>
      </table>
   <%}}%>   
   
   </td>
    <td background="<%=BASEURL%>/images/Forma_r2_c3.gif"></td>
    <%------------------
   <td><img name="<%=BASEURL%>/images/Contactanos_r2_c3" src="<%=BASEURL%>/images/Contactanos_r2_c3.gif" width="26" height="1" border="0" alt=""></td>
   ---------------------%>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="319" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/Contactanos_r3_c1" src="<%=BASEURL%>/images/Contactanos_r3_c1.gif" width="420" height="40" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="40" border="0" alt=""></td>
  </tr>
</table>

<%}%>
