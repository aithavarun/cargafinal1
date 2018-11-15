<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/xml" %>
<%DecimalFormat f =new DecimalFormat("0000");%>
<%DecimalFormat f1 =new DecimalFormat("0000");%>

<?xml version="1.0" encoding="UTF-8"?>
<%SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");

%>


<%
List list1 = model.getVueloreserva();
 
String Dia=request.getParameter("Dia");
         String Mes=request.getParameter("Mes");
         String Anio=request.getParameter("Anio");
         int dia=0;
         int mes=0;
         int anio=0;
         Calendar hoy=Calendar.getInstance();
        
         if (Dia==null)
             dia=hoy.get(Calendar.DATE);
         else
             dia=Integer.parseInt(Dia);
         
         if (Mes==null)
             mes=hoy.get(Calendar.MONTH)+1;
         else
             mes=Integer.parseInt(Mes);
         
         if (Anio==null)
             anio=hoy.get(Calendar.YEAR);
         else
             anio=Integer.parseInt(Anio);
         
 String Estado="";
 long codigo=0;
 long Avion=0;
String Origen="";
String Destino="";
String Numero="";
int Hora=0;
String Fecha="";
String Estacion="";
 if (list1 != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          Chequeo vuelo=(Chequeo) it1.next();
          
          codigo=vuelo.getCodigo();
          Numero=vuelo.getNumero();
          Origen=vuelo.getOrigen();
          Destino=vuelo.getDestino();
          Estacion=vuelo.getEstado();
          Hora=vuelo.getHora();
          Avion=vuelo.getPax();
          Estado=vuelo.getTipo().trim();
          Fecha=FORMATOFECHA.format(vuelo.getFecha());
      }
 }
          %>
<Datos>          
<Avionant><%=Avion%></Avionant>
<codigo><%=codigo%></codigo>
<dia><%=dia%></dia>
<mes><%=mes%></mes>
 <anio><%=anio%><anio>
 <numero><%=Numero%></numero>
<origen><%=Origen%></origen>
<destino><%=Destino%></destino>
<hora><%=f.format(Hora)%></hora>
<fecha><%=Fecha%></fecha>
<estado><%=Estado%></estado>
<estacion><%=Estacion%></estacion>
</Datos>
<Aviones>
<%
 List lista = model.getAviones();
 int contador=0;
 if (lista != null) {
      Iterator ita = lista.iterator();
      while (ita.hasNext()) {
          Aviones avion=(Aviones) ita.next();
          contador++;
          %>
          
<codigo<%=contador%>><%=avion.getCodigo()%></codigo<%=contador%>>
<descripcion<%=contador%>><%=avion.getDescripcion()%></descripcion<%=contador%>>
 
 <%}}%>
 <contador><%=contador%></contador>
 </Aviones>
