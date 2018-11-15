<%--
  Copyright (c) 2002 by Phil Hanna
  All rights reserved.
  
  You may study, use, modify, and distribute this
  software for any purpose provided that this
  copyright notice appears in all copies.
  
  This software is provided without warranty
  either expressed or implied.
--%>
<%@ page session="false" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title>Form Parameters</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<h1>Form Parameters</h1>
<table border="1" cellpadding="3" cellspacing="0">
<tr>
   <th width="200">Name</th>
   <th width="200">Value</th>
</tr>
<%
   Enumeration enames = request.getParameterNames();
   while (enames.hasMoreElements()) {
      String name = (String) enames.nextElement();
      String[] values = request.getParameterValues(name);
      if (values != null) {
         for (int i = 0; i < values.length; i++) {
            String value = values[i];
%>
<tr>
   <td><%= name %></td>
   <td><%= value %></td>
</tr>
<%
         }
      }
   }
%>
<tr>
<td>
<A HREF="javascript:window.history.back()"> Volver</A>

</td>
</tr>
</table>
</body>
</html>
