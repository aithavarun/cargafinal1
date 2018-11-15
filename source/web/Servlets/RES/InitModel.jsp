<jsp:useBean
    id="model"
    scope="session"
    class="com.aerogal.support.model.WebModel" >

<% model.init(application); %>
</jsp:useBean>

<%
    String BASEURL = request.getContextPath();
    String CONTROLLER=BASEURL+"/servlet/controller";
 %>
