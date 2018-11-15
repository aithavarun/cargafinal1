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
        <%---------------------
       <fila<%=ci%>><%=asiento.getFila()%></fila<%=ci%>>
       <columna<%=ci%>><%=asiento.getColumna()%></columna<%=ci%>>
       <nombre<%=ci%>><%=asiento.getAsienton()%></nombre<%=ci%>>
       <grupo<%=ci%>><%=asiento.getGrupo()%></grupo<%=ci%>>
       ---------------------------%>
       <<%=asiento.getAsienton()%>><%=asiento.getGrupo()%></<%=asiento.getAsienton()%>>
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
       <origen<%=ci%>><%=pnl.getOrigen()%></origen<%=ci%>>
       <destino<%=ci%>><%=pnl.getDestino()%></destino<%=ci%>>
       <fecha<%=ci%>><%=pnl.getFecha()%></fecha<%=ci%>>
       
 <%
       }
  }
  %>
<total><%=ci%></total>  
</pnl>

</datos>




