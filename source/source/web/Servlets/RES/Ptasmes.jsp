<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.*" %>
<%@ include file="/WEB-INF/Banner.jsp"%>  
<% 
String musuario=request.getParameter("Ciudad");
if (musuario==null)
        musuario=usuario.getSucursal();
musuario=musuario.substring(0,3);
String sololerr="READONLY";
if (usuario.getTipo()<=1 )
    sololerr="";
%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Reservaciones/Prepagos"  name="ReportedeVentas">
<tr>
<th colspan="2">PREPAGADOS A RECIBIR</th>
</tr>
<tr>
<td>Ciudad donde se retira el Boleto</td>
 <td><input type="text"    NAME="Ciudad" value=<%=musuario%> <%=sololerr%> >
</td>
  <td colspan="1">
 <input TYPE="submit"    NAME="Buscar" value="Buscar">
 </td>
 </tr>
</form >
</table>

  <table width="100%" border="0">
    <tr bordercolor="#FFFFFF">
      <th colspan="6" bgcolor="#0099FF"><span class="style3">Resultados</span></th>
    </tr>
    </table>
    <table id="t1" class="sortable">
    <tr bgcolor="#FFFFCC">
      <th>Sec</th>
       <th>Booking</th>
      <th>Apellido</th>
      <th>Nombre</th>
      <th>Fecha Reserva</th>
       <th>Fono</th>
      <th>Tipo</th>
      <th>Sucursal</th>
      <th>Pagado</th>
      <th>Boleto</th>
      <th>Pta</th>
      
    </tr>
 
<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>    
<%List lista2 = model.getReservaestado();

//int total=(lista2.size())+1;

int j=0;
long codigo=0;
String suc1="";
String suc2="";
String fecha="";
  if  (lista2 != null)  {
      Iterator itr = lista2.iterator();
      while (itr.hasNext()) {
            Casitotal reservas=(Casitotal) itr.next();
            j++;
            
            String seleccionUrl=CONTROLLER+"/Repventas/Selecciona?i=12&codigo="+String.valueOf(reservas.getCodigo());
            //if (reservas!=reserva.getReservacodigo())
              if (codigo!=reservas.getCodigor())
              {
                codigo=reservas.getCodigor();
                /*
                if (reservas.getSucursalptaenvia()==null)
                    suc1="";
                if (reservas.getSucursalpta()==null)
                    suc2="";
                fecha="";
                if (reservas.getFechav()!=null)
                    fecha=FORMATOFECHA.format(reservas.getFechav());
*/ 
                long boleto=reservas.getBoleto();
                if (boleto <0)
                    boleto=0;
                //String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?codigo="+String.valueOf(reservas.getCodigo()) ;
            %>     
    
    
    <tr bgcolor="#CCCCCC">
      <td><%=j%></td>
      <td><b><A HREF="<%=seleccionUrl%>"> <%=reservas.getBooking()%></a></b></td>
      <td><%=reservas.getApellido()%></td>
      <td><%=reservas.getNombre()%></td>
      <td><%=FORMATOFECHA.format(reservas.getFecha())%></td>
      <td><%=reservas.getTelefono()%></td>
      <td><%=reservas.getTipo()%></td>
      <td><%=reservas.getSucursal()%></td>
      <td><%=reservas.getEstado()%></td>
      <td><%=boleto%></td>
      <td><%=reservas.getPta()%></td>
      
    
    <%}%>
    <%------------------
    <tr bgcolor="#66FFFF">
      <td><%=reservas.getOrigen()%></td>
      <td><%=reservas.getDestino()%></td>
      
      <td><%=fecha%></td>
      <td><%=reservas.getNumero()%></td>
      <td><%=f.format(reservas.getHora())%>:<%=f.format(reservas.getMinuto())%></td>
      <td><%=reservas.getEstado()%></td>
    </tr>
   -----------------------%> 
<%}
  }
%>    
  </table>
  </td>
</tr>
</table>

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>
