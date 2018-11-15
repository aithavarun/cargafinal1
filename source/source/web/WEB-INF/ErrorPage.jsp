<%@ page session="false"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page isErrorPage="true"%>

<html>
<head><title>Aerogal - Página de Error</title>
<link rel="stylesheet" href="stile.css">
</head>
<body>

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
<tr>
<td>
<A HREF="javascript:window.history.back()"> Volver</A>

</td>
</tr>
</table>
</td>
</table>
</body>
</html>
