<%@ page session="true" %>
<%@ page import="com.aerogal.support.model.*" %>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/InitModel.jsp"%>

<link rel="stylesheet" href="<%=BASEURL%>/estilo1.css">
<%--

The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>


    <head>
        <meta http-equiv="Content-Type" content="Content-type: text/html; charset='iso-8859-1'">
        <title>.:Aerogal:.</title>
    </head>
    
    <body  BGCOLOR=#a0a0a0>
    
    <%String Video=request.getParameter("Video");
    //Srting Inicio="/Servlets/Primera.jsp";
    int Vid=0;
    if (Video==null)
    {
        Video="0";
        //Video=BASEURL+"/respaldos/inicio.swf";
    }
    else
    {
        
     Vid=Integer.parseInt(Video);
    }
     
    
%>
    
    <%@ include file="/WEB-INF/Banner.jsp"%>           
    
    <%----------------------
    <DIV STYLE="position:absolute; top:145px; left:160px;   width:700px;">
    
    <% if (Vid ==5) 
     {%> 
    <table border="0" width="780"  align="center" cellborder="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" > 
    <td width="780" align="center" >
    <table border="0" width="100%"  align="center" cellborder="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
    <td align="center" >
    <%--------------------
      <%@ include file="/Servlets/itinerarios.jsp"%> 
      
          </td>
          </table>
          </td>
          </table>
     
      
     <%}
    else
    {%>
      -----------------------%>
    <table border="0" width="780"  align="center" cellborder="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" > 
    <td width="425"  valign="top">
    <table border="0" width="100%" valign="top" align="center" cellborder="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
    <td align="center" valign="top">
    
    <% if (Vid<100){%>
    
    <%@ include file="/Servlets/NoticiasE.jsp"%>           
     
    <%}
    else
    {%>
    <%@ include file="/Servlets/NoticiasE.jsp"%>           
    <%}%>
    </td>
    <%if ((Vid !=105) && (Vid!=5 ) )
    {%>
    
    </TABLE>
    </td>
    <td width="355"  align="right"  valign="top"  nowrap>
    <table border="0" width="100%"  align="center"   valign="top" cellborder="0" cellspacing="0" cellpadding="2" >
    <tr>
    <td>
    <% if (Vid>=100){%>
    <%------------
    <%@ include file="/Servlets/Primera.jsp"%>
    --------%>
    
    <%@ include file="/Servlets/First.jsp"%>    
      
    <%}
    else
    {%>
    
       
       <%@ include file="/Servlets/Primera.jsp"%>
       
    
           
    <%}%>
    </TD>
    </tr>
   
    
  
    
    <tr>
    
    <td align="center">
    <table width="100%">
    <tr>
    <td align="center">
    <%@ include file="/Servlets/Buscar.jsp"%>
    
      
      
    </td>
    <td align="center"><%@ include file="/Servlets/Consulta.jsp"%></td>
    
    <tr>
    <td>
     <%@ include file="/Servlets/agencia.jsp"%> 
    </td>
    </tr>
    
    </TABLE>
    </TD>
    </tr>
    <%}%> 
    
    </body>
</html>
