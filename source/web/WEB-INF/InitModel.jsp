<jsp:useBean
    id="model"
    scope="session"
    class="com.aerogal.support.model.WebModel" >

<% model.init(application); %>
</jsp:useBean>




<jsp:useBean id="bcrequest" class="org.krysalis.barcode4j.webapp.BarcodeRequestBean" scope="session"/>
<jsp:setProperty name="bcrequest" property="*"/>

<%
    String BASEURL = request.getContextPath();
    String CONTROLLER=BASEURL+"/servlet/controller";
    int cargar=0;
    int descargar=0;
 %>
