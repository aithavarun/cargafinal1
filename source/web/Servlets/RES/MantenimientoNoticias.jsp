<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<link rel="stylesheet" href="<%=BASEURL%>/estilo1.css">
<html>
<head>


<script LANGUAGE="JavaScript"> 

function validate(frm)
{
        return true;    
}
</SCRIPT>
<title>Aerogal Intranet</title>
</head>
<body bgcolor=#a0a0a0
  >
 
<!--[if gte mso 9]><xml>
 <v:background id="_x0000_s1025" o:bwmode="white" o:targetscreensize="800,600">
  <v:fill src="/WEB-INF/IMAGES/fondorayas.jpg" o:title="fondo rayas" type="frame"/>
 </v:background></xml><![endif]-->
 <%----------------------------------------
<form  method="post" name="IntranetReservas"
            action="<%=CONTROLLER%>/Intranet/Password" onSubmit="return validate(this)">
            <input name="Idioma" id="Idioma" value="0" type= "hidden" >
            -----------------------------%>


            <%
            
             DecimalFormat f =new DecimalFormat("00");
             String Video=request.getParameter("Idioma");
            %>
 <%@ include file="/WEB-INF/Banner.jsp"%>       
</table>   

<table border="0" cellpadding="0" cellspacing="0" width="780" align="center">
<!-- fwtable fwsrc="<%=BASEURL%>/images/FormaAgencias.png" fwbase="<%=BASEURL%>/images/FormaAgencias.gif" fwstyle="Dreamweaver" fwdocid = "2019518708" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="21" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="721" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="38" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/FormaAgencias_r1_c1" src="<%=BASEURL%>/images/MantenimientoNoticias.gif" width="780" height="88" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="88" border="0" alt=""></td>
  </tr>
  <tr>
   <td background="<%=BASEURL%>/images/FormaAgencias_r2_c1.gif">&nbsp;</td>
   <td  valign="top" bgcolor="#ffffff" align="center"> 
   
    <table   width='100%' border="0" align="center" cellpadding="1" cellspacing="1" valign="top">        
    <tr>
    <td align="center">
                <table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1" >
                <tr>
                <th>Titulo</th>
                <th>Fecha</th>
                <th>Parrafo</th>
                </tr>
                <tr>
                <%
   List list = model.getNoticias();
   if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Noticias noticia=(Noticias) it.next();
          String seleccionUrl=CONTROLLER+"/Noticias/Nueva?Codigo="+String.valueOf(noticia.getCodigo()) ;
      
      %>        <tr>
                <td><A HREF="<%=seleccionUrl%>"><%=noticia.getTitulo()%></td>
                <td><%=noticia.getFecha()%></td>
                <td><%=noticia.getParrafo()%></td>
                </tr>
                <%}}%>
                
                
                </table>
                <table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1" >
                <tr>
                <form  method="post" name="NoticiasNueva"
                action="<%=CONTROLLER%>/Noticias/Nueva" onSubmit="return validate(this)">
                
                <td><input align="center" TYPE="SUBMIT" NAME="Nuevo"  value=":: Ingresar Noticia ::"  ></td>
                <td><input align="center" TYPE="SUBMIT" NAME="Salir"  value=":: Salir ::" ></td>
                </form>
                </tr>
                </table>
    </td>
    </tr>
    </table>
   </td>
   <td background="<%=BASEURL%>/images/FormaAgencias_r2_c3.gif">&nbsp;</td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/FormaAgencias_r3_c1" src="<%=BASEURL%>/images/FormaAgencias_r3_c1.gif" width="780" height="51" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="51" border="0" alt=""></td>
  </tr>
  </table>

</body>
</html>
