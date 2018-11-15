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

function validate(frm){

    if (document.Intranet.Booking.value=='')
    {
        alert("Es Obligatorio el Booking Reference");
        return false;
    }    
    return true;
}
</SCRIPT>
<title>Aerogal Intranet</title>
</head>
<body bgcolor=#a0a0a0
  >
 
<!--[if gte mso 9]><xml>
 <v:background id="_x0000_s1025" o:bwmode="white" o:targetscreensize="800,600">
  <v:fill src="/WEB-INF/IMAGES/fondorayas.jpg" o:title="fondo rayas" type="frame"/>
 </v:background></xml><![endif]-->
<form  method="post" name="Intranet"
            action="<%=CONTROLLER%>/Intranet/Consultar" onSubmit="return validate(this)">
            <input name="Idioma" id="Idioma" value="0" type= "hidden" >
            

            
<%int acion=model.getAcion();%>
            <%
            
             DecimalFormat f1 =new DecimalFormat("00");
             String Video=request.getParameter("Idioma");
            String origen=request.getParameter("origen");
            String destino=request.getParameter("destino");
            String booking=request.getParameter("booking");
            String pasajero=request.getParameter("pasajero");
            String aux="";
            String aux1="";
            Usuarios usr=model.getAgencias();
            String accion=request.getParameter("accion");
            if (origen==null)
                origen="";
            
            if (destino==null)
                destino="";
            
            if (booking==null)
                booking="";
            
            if (pasajero==null)
                pasajero="";
            if (accion!=null)
                acion=Integer.parseInt(accion);
            else
                acion=-1;
            %>
 <%@ include file="/WEB-INF/Banner.jsp"%>       
</table>   

<table border="0" cellpadding="0" cellspacing="0" width="780" align="center">
<!-- fwtable fwsrc="<%=BASEURL%>/images/FormaAgencias.png" fwbase="<%=BASEURL%>/images/FormaAgencias.gif" fwstyle="Dreamweaver" fwdocid = "2019518708" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="21" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="721" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="38" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/FormaAgencias_r1_c1" src="<%=BASEURL%>/images/Intranet.gif" width="780" height="88" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="88" border="0" alt=""></td>
  </tr>
  <tr>
   <td background="<%=BASEURL%>/images/FormaAgencias_r2_c1.gif">&nbsp;</td>
   <td  valign="top" bgcolor="#ffffff" align="center"> 
   
    <table   width='100%' border="0" align="center" cellpadding="1" cellspacing="1" valign="top">        
    <td align="center" width="30%">
            <table width='80%' border="0"  cellpadding="1" cellspacing="1" align="center">
            <%-----------------------------%>
            <tr>
              <td><span class="style2">C&oacute;digo de Reserva: </span></td>
             <td>&nbsp;</td>
            </tr>
             <tr>
               <td width="40%"><input size="15" name= "Booking" id="Booking" type="text" class="entrada" value="<%=model.getBooking()%>"> </td>
               <td width="40%">&nbsp;</td>
             </tr>
             <tr>
             <td>
             <input type="SUBMIT" name="Send"  value="Consultar"></td>
              </tr>
              <%--------------------%>       
            </table>
        </td>    
        <td align="center" width="70%">
        <%--------------------------------------%>
        <table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">

            <h4 align="left">Codigo de Reserva : <%=model.getBooking()%></h4>
            <table width='100%' border="0" align="center" cellpadding="1" cellspacing="1" >
            <tr>
            <th>ITINERARIOS</th>
            </tr>
            </table>
            <table width='100%' border="0" align="center" cellpadding="2" cellspacing="2" >
            <tr>
            <tH align="center">Num</th>
            <tH align="center">Origen</th>
            <th align="center">Destino</th>
            <th align="center">Vuelo</th>
            <tH align="center">Fecha</th>
            <th align="center">Hora</th>
            </tr>

                    <%List listk = model.getReservas();

                                //int estilo=0;
                                int contador=0;%>
                                <%
                                if (listk != null) {%>
                                <%
                                    Iterator itk = listk.iterator();%>
                                    <%
                                    while (itk.hasNext()) {
                                        Reservaciones reserva=(Reservaciones) itk.next();
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
                                        //String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?booking="+reserva.getBooking()+"&vias="+reserva.getVias() ;
                %>
                <tr>
                <td class="<%=aux%>"   align="center"><%=contador  %></td>
                <td class="<%=aux%>" align="center"><%=model.getNciudad(reserva.getOrigen())%></td>
                <td class="<%=aux%>" align="center"><%=model.getNciudad(reserva.getDestino())%></td>
                <td class="<%=aux%>" align="center"><%=reserva.getNumero() %></td>
                <td class="<%=aux%>" align="center"><%=aux1%></td>
                <td class="<%=aux%>" align="center"><%= f1.format(reserva.getHora())+ ':' +  f1.format(reserva.getMinutos()) %></td>

                </tr>           
                <%}}%>
                </table>
<%-----------------------------------------%>
                                    <table class="tablaborde"  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
                                    <th align="center"> Valores </ht>
                                    </table>
                                    <table class="tablaborde"  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
                                    <tr>
                                    <tH align="center">Nombre</th>
                                    <th align="center">Tarifa</th>
                                    <th align="center">Iva</th>
                                    <tH align="center">Tasa</th>
                                    <th align="center">Seg.</th>
                                    <th align="center">Total</th>

                                    </tr>



                                    <%


                                    %>





                                    <%
                                       List list = model.getTarifasi();
                                       //String aux;
                                       //String aux1;
                                       double TotalT=0.0;
                                       double TotalI=0.0;
                                       DecimalFormat f =new DecimalFormat("0.00");
                                       int estilo=0;
                                       if (list != null) {
                                          Iterator it = list.iterator();
                                          while (it.hasNext()) {
                                              Tarifas tarifa=(Tarifas) it.next();
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
                                        TotalI+=tarifa.getIva();
                                    }        
                                    if (estilo==0){%>
                                    <tr class="lineablanca">
                                    <td align="center"><%=aux%></td>
                                    <td align="center"><%= f.format(tarifa.getValor())%></td>
                                    <td align="center"><%= f.format(tarifa.getIva())%></td>   
                                    <td align="center"><%= tarifa.getTasa()%></td>   
                                    <td align="center"><%= tarifa.getSeguro()%></td>   
                                    <td align="center"><%= f.format(tarifa.getTotal())%></td>   

                                    </tr>
                                    <% estilo=1;} 
                                    else{%>
                                    <tr>
                                    <td class="tablablanca" align="center"><%=aux%></td>
                                    <td class="tablablanca" align="center"><%= f.format(tarifa.getValor())%></td>
                                    <td class="tablablanca" align="center"><%= f.format(tarifa.getIva())%></td>   
                                    <td class="tablablanca" align="center"><%= tarifa.getTasa()%></td>   
                                    <td class="tablablanca" align="center"><%= tarifa.getSeguro()%></td>   
                                    <td class="tablablanca" align="center"><%=  f.format(tarifa.getTotal())%></td>   
                                    </tr>

                                    <% estilo=0;
                                    }%>

                                    <% }} %>
                                    </table>


                                    <%------------Infantes --------------%>
                                    <%
                                       List list1 = model.getTarifasif();
                                       String auxi;
                                       String auxi1;
                                       int infG=0;
                                       //DecimalFormat f =new DecimalFormat("0.00");
                                       estilo=0;
                                       if (list != null) {
                                          Iterator it1 = list1.iterator();
                                          while (it1.hasNext()) {
                                              Tarifas tarifa=(Tarifas) it1.next();
                                              //String strUrl=vuelo.getCodigo();
                                              infG++;
                                              auxi1=tarifa.getNombre();
                                              //aux1=aux1.toLowerCase();
                                      if(auxi1!=null)
                                    {
                                        auxi=tarifa.getNombre();          

                                    }
                                        else
                                        {
                                        auxi="Total Infantes";
                                        TotalT+=tarifa.getTotal();
                                        TotalI+=tarifa.getIva();
                                    }        

                                    if (estilo==0){%>
                                    <%if (infG==1)
                                    {%>
                                    <table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
                                    <h3 align="center">  Valores  Infantes </h3>
                                    <%}%>
                                    <tr >
                                    <td class="lineablanca" align="center"><%=auxi%></td>
                                    <td class="lineablanca" align="center"><%= f.format(tarifa.getValor())%></td>
                                    <td class="lineablanca" align="center"><%= f.format(tarifa.getIva())%></td>   
                                    <td class="lineablanca" align="center"><%= tarifa.getTasa()%></td>   
                                    <td class="lineablanca" align="center"><%= tarifa.getSeguro()%></td>   
                                    <td class="lineablanca" align="center"><%= f.format(tarifa.getTotal())%></td>   

                                    </tr>
                                    <% estilo=1;} 
                                    else{%>
                                    <tr>
                                    <td class="tablablanca" align="center"><%=auxi%></td>
                                    <td class="tablablanca" align="center"><%= f.format(tarifa.getValor())%></td>
                                    <td class="tablablanca" align="center"><%= f.format(tarifa.getIva())%></td>   
                                    <td class="tablablanca" align="center"><%= tarifa.getTasa()%></td>   
                                    <td class="tablablanca" align="center"><%= tarifa.getSeguro()%></td>   
                                    <td class="tablablanca" align="center"><%=  f.format(tarifa.getTotal())%></td>   
                                    </tr>

                                    <% estilo=0;
                                    }%>

                                    <% }} %>
                                    <%--Total Final----------%>

                                    <%------------%>
                                    <%if (infG!=0)
                                    {%>
                                    </table>
                                    <%}%>
                                    <table  width='100%' border='0' cellpadding='2' cellspacing='2' align="center">
                                    <td align="right">
                                       <h1><font color="red">Total IVA = <%= f.format(TotalI)%> </FONT></H1>
                                    </td>
                                    </tr>  
                                    <tr>
                                    <td align="right">
                                       <h1><font color="red">Total Reservas = <%= f.format(TotalT)%></FONT></H1>  
                                    </td>  
                                    </tr>
                                    </table>
                                    
                                    <table class="tablaborde"  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
                                    <th>Confirmacion de Pagos</th>
                                    </table>
                                    
                                    <table class="tablaborde"  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
                                    <tr>
                                    <tH align="center">Numero</th>
                                    <th align="center">Volado</th>
                                    </tr>    
                                    
                                    <%
                                       List listc = model.getConfirmacion();
                                       int volado=0;
                                       String AccionVuelo="Sin Volar";
                                       String Boton="";
                                       
                                       //DecimalFormat f =new DecimalFormat("0.00");
                                       
                                       if (listc != null) {
                                          Iterator it1c = listc.iterator();
                                          while (it1c.hasNext()) {
                                              Confirmacion confirma=(Confirmacion) it1c.next();
                                              //String strUrl=vuelo.getCodigo();
                                              if (confirma.getVuelo()==1)
                                              {
                                                  AccionVuelo="Volado primera Via";
                                                  if (contador==2)
                                                  {
                                                      Boton="2-Grabar vuelo segunda via";
                                                      volado=2;
                                                  }
                                                  else if(contador==1)
                                                      Boton="";
                                              }
                                              else if((confirma.getVuelo()==2))
                                              {
                                                  AccionVuelo="Volado dos Vias";
                                                  Boton="";
                                              }   
                                              else if((confirma.getVuelo()==0))
                                              {
                                                  AccionVuelo="Sin Volar";
                                                  if(contador!=0)
                                                  {
                                                      Boton="1-Grabar vuelo primera via";
                                                  volado=1;
                                                  }
                                                  else
                                                      Boton="";
                                              }
                                              %>
        <%----------------------------------------%>
        
                                    <tr>
                                    <td><%=confirma.getNumero()%></td>
                                    <td><%=AccionVuelo%></td>
                                    </tr>
                                    <%}}%>
                                    </table>
                                    <table class="tablaborde"  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
                                    <td  align="center">
                                        <%if (Boton.equals(""))
                                        {%>
                                        &nbsp;
                                        <%}else{%>
                                        <input name="voladoS" id="voladoS" value="<%=volado%>" type= "hidden" >             
                                        <input type="SUBMIT" name="Volado" id="Volado"  value="<%=Boton%>"></td>
                                        
                                        <%}%>
                                    </table>   
        </td>
    </table>
   </td>
   <td background="<%=BASEURL%>/images/FormaAgencias_r2_c3.gif">&nbsp;</td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/FormaAgencias_r3_c1" src="<%=BASEURL%>/images/FormaAgencias_r3_c1.gif" width="780" height="51" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="51" border="0" alt=""></td>
  </tr>
  </table>
</form>
</body>
</html>
