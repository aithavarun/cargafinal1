<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<link rel="stylesheet" href="<%=BASEURL%>/estilo1.css">
<html>
<head>


<script LANGUAGE="JavaScript"> 
function Imprimir()
{  
//alert("Imprimir");
if (window.print) 
{
    window.print() ;  
//Lama a una funcion predeterminada en el navegador para imprimir la pagina 
}
}
 
function validate(frm)
{
        return true;    
}
</SCRIPT>
<title>Aerogal Confirmacion Venta</title>
</head>
<body bgcolor=white lang=ES
  >
 
<!--[if gte mso 9]><xml>
 <v:background id="_x0000_s1025" o:bwmode="white" o:targetscreensize="800,600">
  <v:fill src="/WEB-INF/IMAGES/fondorayas.jpg" o:title="fondo rayas" type="frame"/>
 </v:background></xml><![endif]-->
<form  method="post" name="VuelosLista"
            action="Terminar">
            <input name="Idioma" id="Idioma" value="0" type= "hidden" >
            <%//int acion=model.getAcion();%>
            <%
            List listk = model.getReservas();
                String nombre="";%>
                
                <%
                if (listk != null) {%>
                <%
                    Iterator itk = listk.iterator();%>
                    <%
                    while (itk.hasNext()) {
                        Reservaciones reserva=(Reservaciones) itk.next();
                        nombre=reserva.getSx();
                        continue;
                    }
                }
             DecimalFormat f =new DecimalFormat("00");
             String Video=request.getParameter("Idioma");
            String origen=request.getParameter("confirmationNumber");
            String destino=request.getParameter("totalAmount");
            String booking=model.getBooking();//request.getParameter("tax");
            String con="con";
            String codigo=model.getErrorW();
            
            String fecha="01/01/2005";
            //String pasajero=request.getParameter("pasajero");
            Usuarios usr=model.getAgencias();
            if (origen==null)
            {
                //busco autorizacion
                origen=codigo;
               /* if (codigo.lastIndexOf("Autorización No:")>0)
                {
                    con="con";
                }
                else
                {
                    con="sin";
                }*/
                
            }
            else if (origen.equals("0"))
            {
                origen="********No se Efectuo la Transacción - Error en la Confirmación********";
                con="sin";
            }    
            
            if (destino==null)
                destino="";
            
            if (booking==null)
                booking="";
            
            
                     
            %>
<%-----
<%@ include file="/WEB-INF/Banner.jsp"%>             
-----%>             
<DIV id="form" STYLE="position:absolute; top:0px; left:0px; width:695px;color=blue; font-family: Tahoma, Verdana, Arial; 
font-size: 16px" align="center" >                         
<table width='80%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<td  align="center">
<h4>AEROLINEAS GALAPAGOS S.A. AEROGAL</h4>
</td>
</tr>
<tr>
<td  align="center">
<h2>Matriz av. Amazonas 7797 y Juan Holguin telfs:2920-495</h2>
</td>
</tr>
<tr>

<td  align="center">
<h2>Aptdo. Postal 17-01-2944 E-mail aerogal@aerogal.com.ec</h2>

</td>
</tr>
<tr>

<td  align="center">
<h2>fax 2430-487 Quito - Ecuador</h2>
</td>
</tr>
<tr>

<td  align="center">
<h2>RUC:1790727203001</h2>
</td>
</tr>
<tr>

<td  align="center">
<h2>TICKET ELECTRONICO - <%=booking%></h2>
</td>
</tr>


</table>
<table width='80%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<td width="50%">NOMBRE TARJETA HABIENTE:
<%=nombre%></td>
<td width="50%" align="right">QUITO - ECUADOR</TD>
</TR>

<tr>
<td width="100%" align="left">AUTORIZACION : 
<%=origen%></TD>


</TR>

<tr>
<td>
<H2>LOS DATOS DEL VIAJE SON:</H2>
</td>
</TR>
<TR>
<td width="50%">CODIGO DE RESERVA :
<%=booking%></td>
<td width="50%" align="right">SUCURSAL : MATRIZ</TD>
</TR>

</table>

<%-------------------Fin Datos Iniciales---------------%>





<%---------<table width='100%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<th>Transaccion ejecutada <%=con%> exito para los siguientes pasajeros</th>
</tr>
<table width='100%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
--------------%>
<table width='95%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<th>ITINERARIOS</th>
</tr>
<table width='95%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<tH align="center">Num</th>
<tH align="center">Origen</th>
<th align="center">Destino</th>
<th align="center">Vuelo</th>
<tH align="center">Fecha</th>
<th align="center">Hora</th>
</tr>

             
                <%List list = model.getReservas();
                String aux;
                String aux1;
                int estilo=0;
                int contador=0;%>
                <%
                if (list != null) {%>
                <%
                    Iterator it = list.iterator();%>
                    <%
                    while (it.hasNext()) {
                        Reservaciones reserva=(Reservaciones) it.next();
                        aux1=reserva.getEstado();
                        aux1=aux1.toUpperCase();
                        aux1=aux1.trim();
                        aux="tablaborde";
                         contador++;
                        if (contador > 2)
                            continue;
                        //aux=vuelo.getHora();
                         //aux=aux.trim();
                        aux1=model.DiaSemana(reserva.getDia(),reserva.getMes()-1,reserva.getAnio());
                        //aux1=""+
                        String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?booking="+reserva.getBooking()+"&vias="+reserva.getVias() ;
%>
<tr>
<td class="<%=aux%>"   align="center"><%=contador  %></td>
<td class="<%=aux%>" align="center"><%=reserva.getOrigen()%></td>
<td class="<%=aux%>" align="center"><%=reserva.getDestino()%></td>
<td class="<%=aux%>" align="center"><%=reserva.getNumero() %></td>
<td class="<%=aux%>" align="center"><%=aux1%></td>
<td class="<%=aux%>" align="center"><%= f.format(reserva.getHora())+ ':' +  f.format(reserva.getMinutos()) %></td>

</tr>               
<%}}
aux="tablaverde";%>


<%------------------Primera Tabla Final -------------%>

<%------------------Segunda Tabla Inicio 


<table width='60%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<tH align="center">Numero Confirmacion</th>
<tH align="center">Valor Total</th>
<th align="center">IVA</th>
</tr>
<tr>
<td class="<%=aux%>"   align="center"><%=origen  %></td>
<td class="<%=aux%>" align="center"><%=destino%></td>
<td class="<%=aux%>" align="center"><%=booking%></td>

</tr>
</table>
-------------%>
<%-------------------------Segundo bloque nombrese y valores ---%>

<table class="tablaborde"  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<th align="center"> PASAJEROS </th>
</tr>
</table>
<table class="tablaborde"  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">
<tr>
<tH align="center">Nombre</th>
<th align="center">Tarifa</th>
<th align="center">Iva</th>
<tH align="center">Tasa</th>
<th align="center">Seg.</th>
<th align="center">Subtotal</th>

</tr>



<%


%>





<%
   List listt = model.getTarifasi();
   //String aux;
   //String aux1;
   double TotalT=0.0;
   double TotalI=0.0;
   double ValorT=0.0;
   double SeguroT=0.0;
   double TasaT=0.0;
   DecimalFormat f1 =new DecimalFormat("0.00");
   //int estilo=0;
   if (list != null) {
      Iterator itT = listt.iterator();
      while (itT.hasNext()) {
          Tarifas tarifa=(Tarifas) itT.next();
          //String strUrl=vuelo.getCodigo();
          aux1=tarifa.getNombre();
          //aux1=aux1.toLowerCase();
  if(aux1!=null)
{
    aux=tarifa.getNombre();          
    
}
    else
    {
    aux="Total";
    TotalT=tarifa.getTotal();
    ValorT=tarifa.getValor();
    TotalI=tarifa.getIva();
    TasaT=tarifa.getTasa();
    SeguroT=tarifa.getSeguro();
    estilo=1;
}        
if (estilo==0){%>
<tr class="lineablanca">
<td align="LEFT"><%=aux%></td>
<td align="center"><%= f1.format(tarifa.getValor())%></td>
<td align="center"><%= f1.format(tarifa.getIva())%></td>   
<td align="center"><%= tarifa.getTasa()%></td>   
<td align="center"><%= tarifa.getSeguro()%></td>   
<td align="center"><%= f1.format(tarifa.getTotal())%></td>   

</tr>
<% estilo=0;} 
else{%>
<%-----------
<tr>
<td class="tablablanca" align="center"><%=aux%></td>
<td class="tablablanca" align="center"><%= f1.format(tarifa.getValor())%></td>
<td class="tablablanca" align="center"><%= f1.format(tarifa.getIva())%></td>   
<td class="tablablanca" align="center"><%= tarifa.getTasa()%></td>   
<td class="tablablanca" align="center"><%= tarifa.getSeguro()%></td>   
<td class="tablablanca" align="center"><%=  f1.format(tarifa.getTotal())%></td>   
</tr>
---------%>              
<% estilo=0;

}%>

<% }} %>
<%------</table>
<table  width='95%' border="0" align="center" cellpadding="1" cellspacing="1">


<%------------Infantes --------------%>
<%
   List list1 = model.getTarifasif();
   String auxi;
   String auxi1;
   
   //DecimalFormat f =new DecimalFormat("0.00");
   estilo=0;
   if (list != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          Tarifas tarifa=(Tarifas) it1.next();
          //String strUrl=vuelo.getCodigo();
          auxi1=tarifa.getNombre();
          //aux1=aux1.toLowerCase();
  if(auxi1!=null)
{
    auxi=tarifa.getNombre();          
    
}
    else
    {
    auxi="Total";
    
    TotalT+=tarifa.getTotal();
    ValorT+=tarifa.getValor();
    TotalI+=tarifa.getIva();
    TasaT+=tarifa.getTasa();
    SeguroT+=tarifa.getSeguro();
    estilo=1;
}        
if (estilo==0){%>
<tr >
<td class="lineablanca" align="left"><%=auxi%></td>
<td class="lineablanca" align="center"><%= f1.format(tarifa.getValor())%></td>
<td class="lineablanca" align="center"><%= f1.format(tarifa.getIva())%></td>   
<td class="lineablanca" align="center"><%= tarifa.getTasa()%></td>   
<td class="lineablanca" align="center"><%= tarifa.getSeguro()%></td>   
<td class="lineablanca" align="center"><%= f1.format(tarifa.getTotal())%></td>   

</tr>
<% estilo=0;} 
else{%>
            
<% estilo=0;
}%>

<% }} %>
<%--Total Final----------%>
<tr>
<td class="tablablanca" align="center">TOTAL</td>
<td class="tablablanca" align="center"><%= f1.format(ValorT)%></td>
<td class="tablablanca" align="center"><%= f1.format(TotalI)%></td>   
<td class="tablablanca" align="center"><%= f1.format(TasaT)%></td>   
<td class="tablablanca" align="center"><%= f1.format(SeguroT)%></td>   
<td class="tablablanca" align="center"><%=  f1.format(TotalT)%></td>   
</tr>

<%------------%>
</table>
<table width='100%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<td  align="center">
<h4>Le recordamos que el (los) pasajero(s) debe(n) presentarce en el aeropuerto con una (1) hora de anticipación a la salida del vuelo.
</h4>
</td>
</tr>
</table>

<table width='100%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<td  align="center">
<h4>Debo y pagaré incondicionalmente y sin protesto al emisor el 
total de este pagaré  más los impuestos legales, así como los intereses 
y cargos por servicio, en el lugar y  fecha que se convenga. 
En caso de mora pagaré la tasa máxima autorizada por el emisor 
Declaro que el producto de esta transacción no será utilizado en actividades de lavado de dinero y activos.
</h4>
</td>
</tr>
</table>
<h4><table width='100%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<td  align="center">
<h4>
IMPORTANTE 
</h4>
</td>
</tr>
<tr>
<td  align="center">
<h4>

Al firmar este documento ratifico que soy el 
titular de la tarjeta de crédito con la que se efectuó la compra. 
Con la compra de este tiquete, el tarjeta habiente y/o el 
pasajero declara(n) que conoce(n) y acepta(n) sin restricciones las 
condiciones del contrato de tranporte que forma parte integral del mismo, 
aplicables al transporte de acuerdo a la ruta convenida.	

</h4>
</td>
</tr>
</table>

<table width='95%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<th>ESPACIO PARA USO DEL TARJETA - HABIENTE</th>
</tr>
<table width='95%' border="0" align="center" cellpadding="2" cellspacing="2" >
<TR>
<TD></TD>
</TR>
<TR>
<TD></TD>
</TR>

<TR>
<TD></TD>
</TR>

<TR>
<TD></TD>
</TR>


<TR>
<TD></TD>
</TR>
<TR>
<TD></TD>
</TR>
<TR>
<TD></TD>
</TR>


<tr>

<tD align="center">______________________________</tD>
<tD align="center">______________________________</tD>
<tD align="center">______________________________</tD>
</tr>

<tr>

<tD align="center">FIRMA DEL COMPRADOR</tD>
<tD align="center">NUMERO DE CEDULA</tD>
<tD align="center">TELEFONO</tD>
</tr>

</table>

<table width='95%' border="0" align="center" cellpadding="2" cellspacing="2" >
<TR>
<TD></TD>
</TR>
<TR>
<TD></TD>
</TR>

<TR>
<TD></TD>
</TR>

<TR>
<TD></TD>
</TR>


<TR>
<TD></TD>
</TR>
<TR>
<TD></TD>
</TR>
<TR>
<TD></TD>
</TR>


<tr>

<tD align="center">______________________________</tD>
<tD align="center">______________________________</tD>
<tD align="center">CORRIENTE</tD>
<tD align="center">NINGUNO</tD>
</tr>

<tr>
<tD align="center">NUMERO DE TARJETA</tD>
<tD align="center">FECHA DE EXPIRACION</tD>
<tD align="center">TIPO DE CREDITO</tD>
<tD align="center">PLAZO DE CREDITO</tD>
</tr>

</table>
<table width='100%' border="0" align="center" cellpadding="2" cellspacing="2" >
<tr>
<td  align="center">


</td>
</tr>
</table>


<table width='60%' border="0" align="center" cellpadding="2" cellspacing="2" >
<td>
<input align="right" TYPE="button" NAME="Imprime"  value=":: Imprimir ::" onClick="Imprimir()" >
</td>
<td>
<input align="right" TYPE="SUBMIT" NAME="Vuelos"  value=":: Salir ::">
</td>
</div>
</form>
</body>
</html>
