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
          Boletopnl boleto=(Boletopnl) it1.next();
          
          
              
              cont1++;
         
          %>
 
      
           
       <Boleto<%=cont1%>><%=boleto.getBoleto() %></Boleto<%=cont1%>>
       <Nombre<%=cont1%>> <%=boleto.getNombre()%></Nombre<%=cont1%>>
       <Apellido<%=cont1%>><%=boleto.getApellido()%></Apellido<%=cont1%>>
       <Origen<%=cont1%>><%=boleto.getOrigen()%></Origen<%=cont1%>>
       <Destino<%=cont1%>><%=boleto.getDestino()%></Destino<%=cont1%>>
       <Asiento<%=cont1%>><%=boleto.getAsiento()%></Asiento<%=cont1%>>
       <Tipo<%=cont1%>><%=boleto.getTipo()%></Tipo<%=cont1%>>
       <Estado<%=cont1%>><%=boleto.getEstado()%></Estado<%=cont1%>>
       <Estadov<%=cont1%>><%=boleto.getEstadov()%></Estadov<%=cont1%>>
       <Rh<%=cont1%>><%=boleto.getRh()%></Rh<%=cont1%>>
       <Frecuente<%=cont1%>><%=boleto.getFrecuente()%></Frecuente<%=cont1%>>
       <Programacion<%=cont1%>><%=boleto.getProgramacion()%></Programacion<%=cont1%>>
       <Vuelo<%=cont1%>><%=boleto.getVuelo()%></Vuelo<%=cont1%>>
       <Fecha<%=cont1%>><%=boleto.getFecha()%></Fecha<%=cont1%>>
       <Numero<%=cont1%>><%=boleto.getNumero()%></Numero<%=cont1%>>
       
 <%}}%>
 
 <totalssr><%=cont1%></totalssr> 
</ssr>
</datos>




