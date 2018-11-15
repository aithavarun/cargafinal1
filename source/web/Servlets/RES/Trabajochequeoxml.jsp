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
                  
       <codigo<%=cont1%>><%=vuelo.getCodigo() %></codigo<%=cont1%>>
       <numero<%=cont1%>> <%=vuelo.getNumero()%></numero<%=cont1%>>
       <origen<%=cont1%>><%=vuelo.getOrigen()%></origen<%=cont1%>>
       <destino<%=cont1%>><%=vuelo.getDestino()%></destino<%=cont1%>>
       <hora<%=cont1%>><%=f1.format(vuelo.getHora())%></hora<%=cont1%>>
       <estado<%=cont1%>><%=vuelo.getTipo()%></estado<%=cont1%>>
       <estadov<%=cont1%>><%=vuelo.getEstadov()%></estadov<%=cont1%>>
        <origenn<%=cont1%>><%=vuelo.getOrigenn()%></origenn<%=cont1%>>
       <destinon<%=cont1%>><%=vuelo.getDestinon()%></destinon<%=cont1%>>
       <aeropuerto<%=cont1%>><%=vuelo.getAeropuerto()%></aeropuerto<%=cont1%>>
       <%----------------
       
        <codigoavion<%=cont1%>><%=vuelo.getCodavion()%></codigoavion<%=cont1%>>
      ------------------%>
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
              estado=Estado;
          }
%>
  
  <estadopnl<%=cont1%>><%=estado%></estadopnl<%=cont1%>>
  <tipo<%=cont1%>><%=tipo%></tipo<%=cont1%>>
  <pax<%=cont1%>><%=vuelo.getPax()%></pax<%=cont1%>>
 
 <%}}%>
 
 <totalchequeo><%=cont1%></totalchequeo> 
</chequeo>
<asientos>
<%
  List lista2 = model.getAsientos();
  int filas=model.getMaximafila();
  int columnas=model.getMaximacolumna();
  int ci=0;%>

  <%String Asiento="";
  if  (lista2 != null)  {
       Iterator itr = lista2.iterator();
       while (itr.hasNext()) {
            Asientos asiento=(Asientos) itr.next();
            ci++;
            if (filas<asiento.getFila())
                filas=asiento.getFila();
            if (columnas<asiento.getColumna())
                columnas=asiento.getColumna();
        %>
       <fila<%=ci%>><%=asiento.getFila()%></fila<%=ci%>>
       <columna<%=ci%>><%=asiento.getColumna()%></columna<%=ci%>>
       <nombre<%=ci%>><%=asiento.getAsienton()%></nombre<%=ci%>>
       <grupo<%=ci%>><%=asiento.getGrupo()%></grupo<%=ci%>>
 <%
       }
  }
  %>
<total><%=ci%></total>  
<filas><%=filas%></filas>
<columnas><%=columnas%></columnas>
</asientos>

<pnl>
<%
  List lista3 = model.getProveedores();
  ci=0;%>

  <%;
  if  (lista3 != null)  {
       Iterator itpnl = lista3.iterator();
       while (itpnl.hasNext()) {
            PNL pnl=(PNL) itpnl.next();
            ci++;
            
        %>
       <asiento<%=ci%>><%=pnl.getAsiento()%></asiento<%=ci%>>
       <codigo<%=ci%>><%=pnl.getCodigo()%></codigo<%=ci%>>
       <nombre<%=ci%>><%=pnl.getNombre()%></nombre<%=ci%>>
       <apellido<%=ci%>><%=pnl.getApellido()%></apellido<%=ci%>>
       <tipo<%=ci%>><%=pnl.getTipo()%></tipo<%=ci%>>
       <estado<%=ci%>><%=pnl.getEstado()%></estado<%=ci%>>
       <grupo<%=ci%>><%=pnl.getGrupo()%></grupo<%=ci%>>
       <boleto<%=ci%>><%=pnl.getBoleto()%></boleto<%=ci%>>
       <boletoi<%=ci%>><%=pnl.getBoletoi()%></boletoi<%=ci%>>
       <infante<%=ci%>><%=pnl.getInfante()%></infante<%=ci%>>
       <frecuente<%=ci%>><%=pnl.getFrecuente()%></frecuente<%=ci%>>
       <maletas<%=ci%>><%=pnl.getMaletas()%></maletas<%=ci%>>
       <peso<%=ci%>><%=pnl.getPeso()%></peso<%=ci%>>
       <taquilla<%=ci%>><%=pnl.getTaquilla()%></taquilla<%=ci%>>
       <bording<%=ci%>><%=pnl.getBording()%></bording<%=ci%>>
 <%
       }
  }
  %>
<total><%=ci%></total>  
</pnl>

<ocupacion>
<%
  List lista4 = model.getReservasi();
  ci=0;%>

  <%;
  if  (lista4 != null)  {
       Iterator itocupacion= lista4.iterator();
       while (itocupacion.hasNext()) {
            Chequeopnl pnl=(Chequeopnl) itocupacion.next();
            ci++;
            
        %>
       <asiento<%=ci%>><%=pnl.getAsiento()%></asiento<%=ci%>>
       <origen<%=ci%>><%=pnl.getOrigen()%></origen<%=ci%>>
       <destino<%=ci%>><%=pnl.getDestino()%></destino<%=ci%>>
       <pax<%=ci%>><%=pnl.getPax()%></pax<%=ci%>>
       <tipo<%=ci%>><%=pnl.getTipo()%></tipo<%=ci%>>
       <estado<%=ci%>><%=pnl.getEstado()%></estado<%=ci%>>
       <peso<%=ci%>><%=pnl.getPeso()%></peso<%=ci%>>
     <%
       }
  }
  %>
<totalocupacion><%=ci%></totalocupacion>  
</ocupacion>
<avion>
<%
String nombre="";
int capax=0;
float capcar=0;
List list = model.getAviones();
if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Aviones avion=(Aviones) it.next();
          nombre=avion.getDescripcion();
          capax=avion.getCapacidadPax();
          capcar=avion.getCapacidadCarga();
         
      }
 }
  %>
<nombreavion><%=nombre%></nombreavion>
<paxavion><%=capax%></paxavion>
<cargaavion><%=capcar%></cargaavion>  
</avion>
</datos>




