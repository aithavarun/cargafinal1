<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ page contentType="text/xml" %>

<?xml version="1.0" encoding="UTF-8"?>
<Valida>
<%
       String usuarios;
         Usuarios usuario=model.getUsuarios();
         if (usuario==null)
             usuarios="";
         else
             usuarios=usuario.getNombre();
        %>

      <usuario><%=usuarios%></usuario>
      <sucursal><%=usuario.getSucursal()%></sucursal>
      <grupo><%=usuario.getGrupo() %></grupo>

</Valida>