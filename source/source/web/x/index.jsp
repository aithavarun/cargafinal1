<%@ page session="true" %>
<%@ page import="com.aerogal.support.model.*" %>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/InitModel.jsp"%>

<html>
<head>

<title>Sistema de Reservaciones - Aerogal</title>
<meta http-equiv="Content-Type" content="text/html;">
<!--Fireworks MX 2004 Dreamweaver MX 2004 target.  Created Wed Nov 09 16:01:01 GMT-0500 (SA Pacific Standard Time) 2005-->

<style type="text/css">
<!--
.style10 {font-weight: bold}
.style14 {color: #000066; font-weight: bold; }
-->
</style>

</head>
<body bgcolor="#003366" >
<!-- Copiar dentro del tag BODY -->
<script language="JavaScript1.2">

// Maximizar Ventana por Nick Lowe (nicklowe@ukonline.co.uk)
window.moveTo(0,0);
if (document.all) {
top.window.resizeTo(screen.availWidth,screen.availHeight);
}
else if (document.layers||document.getElementById) {
if (top.window.outerHeight<screen.availHeight||top.window.outerWidth<screen.availWidth){
top.window.outerHeight = screen.availHeight;
top.window.outerWidth = screen.availWidth;
}
}

</script>

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <!-- fwtable fwsrc="Pruebas.png" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "197459359" fwnested="0" -->
  <tr>
    <td width="657"><img src="<%=BASEURL%>/images/Password/spacer.gif" width="643" height="1" border="0" alt=""></td>
    <td width="10"><img src="<%=BASEURL%>/images/Password/spacer.gif" width="3" height="1" border="0" alt=""></td>
    <td width="10"><img src="<%=BASEURL%>/images/Password/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
  <tr>
    <td rowspan="3"><img name="<%=BASEURL%>/images/Password/menu_r1_c1" src="<%=BASEURL%>/images/Password/menu_r1_c1.gif" width="643" height="140" border="0" alt=""></td>
    
    
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <form action="<%=CONTROLLER%>/Reservaciones/Pasword" method="post" name="Inicio"  >
    <td width="103" rowspan="3" valign="top" bgcolor="#FFFFFF">
      <table width="100%">
        <tr>
          <td class="style14" >Usuario:</td>
        </tr>
        <tr>
          <td><input name="Usuario" type="text" size="10" maxlength="15"></td>
        </tr>
        <tr>
          <td><span class="style14">Password:</span></td>
        </tr>
        <tr>
          <td><input name="Password" type="password" value="aerogal" size="10" maxlength="15"></td>
        </tr>
        <tr>
          <td><input name="Send" type="submit" class="style10" value="Ingresar" ></td>
        </tr>
    </table></td></form>
  </tr>
</table>
</body>
</html>
