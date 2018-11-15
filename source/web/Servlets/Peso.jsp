<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%
List list = model.getListaPesp();

float kilos=0;       



 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
           //Balanza balanza=null;
          Balanza balanza=(Balanza)  it.next();
          //Free free=(Free) it.next();
          kilos=balanza.getPeso();
                   
          }
 }
%>
<%=kilos%> 
