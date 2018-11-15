<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>

<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/xml" %>
<%DecimalFormat f =new DecimalFormat("00");%>
<%DecimalFormat f1 =new DecimalFormat("0000");%>
<?xml version="1.0" encoding="UTF-8"?>
<datos>

<ssr>
<%
 List list1 = model.getClientes();
 
 int cont1=0;
 long ccodigo=0;
 String Estado="";
 if (list1 != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          MatrizSSR vuelo=(MatrizSSR) it1.next();
          
          
              
              cont1++;
         
          %>
 
      
           
       <codigo<%=cont1%>><%=vuelo.getCodigo() %></codigo<%=cont1%>>
       <secuencial<%=cont1%>> <%=vuelo.getSecuencial()%></secuencial<%=cont1%>>
       <mascara<%=cont1%>><%=vuelo.getMascara()%></mascara<%=cont1%>>
       
 <%}}%>
 
 <totalssr><%=cont1%></totalssr> 
</ssr>
</datos>




