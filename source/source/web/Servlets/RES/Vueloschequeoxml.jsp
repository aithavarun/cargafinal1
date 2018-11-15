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
<Disponibles>
<%
 List list = model.getVuelos();
 String Numero="0";
 String Fondo="#ffffff";
 int cont=0;
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Vueloc vuelo=(Vueloc) it.next();
          String seleccionUrl=CONTROLLER+"/Vuelo/Selecciona?codigo="+vuelo.getCodigo() ;
          if (!Numero.equals(vuelo.getNumero()))
          {
              Numero=vuelo.getNumero();
              if (Fondo!="#ffffff")
                  Fondo="#ffffff";
              else
                  Fondo="#66CCFF";
          }
          cont++;
          %>
  
      
       <url<%=cont%>><%=seleccionUrl%></url<%=cont%>> 
       <codigo<%=cont%>><%=vuelo.getCodigo() %></codigo<%=cont%>>
       <numero<%=cont%>><%=vuelo.getNumero()%></numero<%=cont%>>
       <origen<%=cont%>><%=vuelo.getOrigen()%></origen<%=cont%>>
       <destino<%=cont%>><%=vuelo.getDestino()%></destino<%=cont%>>
       <hora<%=cont%>><%=f.format(vuelo.getHora())+f.format(vuelo.getMinuto())%></hora<%=cont%>>
       <avion<%=cont%>><%=vuelo.getAvion()%></avion<%=cont%>>
       <capacidad<%=cont%>><%=vuelo.getPax()%></capacidad<%=cont%>>
      <reservados<%=cont%>><%=vuelo.getPaxreservados()%> </reservados<%=cont%>>
   
 <%}}%>
 <totaldisponibles><%=cont%></totaldisponibles> 


</Disponibles>

<chequeo>
<%
 List list1 = model.getVueloreserva();
 
 int cont1=0;
 long chequeov=0;
 String Estado="";
 if (list1 != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          Chequeo vuelo=(Chequeo) it1.next();
          String seleccionUrl=CONTROLLER+"/Chequeo/Selecciona?codigo="+vuelo.getCodigo() ;
          
              
              cont1++;
          chequeov=vuelo.getCodigo();
          %>
 
      
       <url><%=seleccionUrl%></url> 
      
       <codigo<%=cont1%>><%=vuelo.getCodigo() %></codigo<%=cont1%>>
       <numero<%=cont1%>> <%=vuelo.getNumero()%></numero<%=cont1%>>
       <origen<%=cont1%>><%=vuelo.getOrigen()%></origen<%=cont1%>>
       <destino<%=cont1%>><%=vuelo.getDestino()%></destino<%=cont1%>>
       <hora<%=cont1%>><%=f1.format(vuelo.getHora())%></hora<%=cont1%>>
       <estado<%=cont1%>><%=vuelo.getEstadov()%></estado<%=cont1%>>
       
      
  
  <%
          String tipo="";
          String estado="";
          
          if (vuelo.getEstado()==null)
              estado="";
          else
              estado=vuelo.getEstado();
          if (vuelo.getTipo()==null)
              tipo="";
          else
              tipo=vuelo.getTipo();
          if (Estado.equals(estado))
          {
              estado="";
          }
          else
          {
              
              Estado=vuelo.getEstado();
              if (Estado==null)
                  Estado="";
              estado=Estado;
          }
%>
  
  <estadopnl<%=cont1%>><%=estado%></estadopnl<%=cont1%>>
  <tipo<%=cont1%>><%=tipo%></tipo<%=cont1%>>
  <pax<%=cont1%>><%=vuelo.getPax()%></pax<%=cont1%>>
  
 <%}}%>
 
 <totalchequeo><%=cont1%></totalchequeo> 
</chequeo>
</datos>




