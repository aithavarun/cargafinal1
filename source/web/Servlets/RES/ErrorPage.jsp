<%@ page session="false"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page isErrorPage="true"%>

<html>
<head><title>Aerogal - Página de Error</title>
<link rel="stylesheet" href="stile.css">
</head>
<body>
<%----------------------------------
<div STYLE="position:absolute; top:0px; left:0px; width:849px;height=70">
<table width="100%" height="100%"  border="0">
  <tr>
    
    <td>
   
     <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="849" height="70">
        <param name="movie" value="/Aerogal/respaldos/logo.swf">
        <param name="quality" value="high">
        <PARAM NAME="Loop" VALUE="1">
        <PARAM NAME="Play" VALUE="1">
        <embed src="/Aerogal/respaldos/logo.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="849" height="70">
        </embed>
      </object>
    </td>
    </TR>
</table>
</div>
<div STYLE="position:absolute; top:80px; left:0px; width:849px;height=70">
<%@ include file="/WEB-INF/Banner.jsp"%>   
-------------%>

<table border="0" width="780"  align="center" cellborder="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" > 
    <td width="780" align="center" >
    <table border="0" width="100%"  align="center" cellborder="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
    <td align="center" >
      
<th>Ha ocurrido el siguiente error:  </th>
<pre>
<%=exception.getMessage() %>

<%

    exception.printStackTrace(new PrintWriter(out));
%>
</pre>
</td>
</table>
</td>
</table>
</body>
</html>
