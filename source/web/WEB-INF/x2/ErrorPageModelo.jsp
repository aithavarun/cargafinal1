<%@ page session="false"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page isErrorPage="true"%>

<html>
<head><title>Aerogal - P�gina de Error</title>
<link rel="stylesheet" href="stile.css">
</head>
<body>
<div STYLE="position:absolute; top:0px; left:0px; width:849px;height=70">
<table width="100%" height="100%"  border="0">
  <tr>
    
    <td>
   <%------%> 
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
<h3> Error 
La sesi�n ha caducado por favor 
vuelva  a ingresar a  www.aerogal.com.ec
</h3>
<pre>
<%
    
    exception.printStackTrace(new PrintWriter(out));
%>
</pre>
</div>
</body>
</html>
