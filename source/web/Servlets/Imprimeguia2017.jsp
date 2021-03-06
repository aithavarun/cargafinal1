<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%
DecimalFormat f =new DecimalFormat("0.00");
java.util.Date mifechar;

int mesr=0;
int anior=0;
int diar=0;
int piezas=0;
float peso=0;
String contiene="";
String remitente="";
String destinatario="";
float flete=0;
float edomicilio=0;
float tadicional=0;
float sadicional=0;
float pesov=0;
float seguro=0;
float descuento=0;
float iva =0;
String obs="";
String obs1="";
String obsaux="";
int lonobs=0;

float subtotal=0;
float vdescuento=0;
float total=0;
String lfecha="";
String lhora="";
int hora=0;
int minutos=0;
String origen="";
String destino="";
String telefono =""; 
String direccion="";
String ruc="";
String tipop="";
float pagoe =0;
float pagoc=0;
float otros=0;
String sucursal="";
int ptotal=0;
String domicilio="";
String oficina="";
String aeropuerto="";
String guiafac="";
String usuariox="";
long numguiafac=0;
java.util.Calendar inicior = java.util.Calendar.getInstance();

Usuarios usuario=model.getUsuarios();

List list = model.getGuiasLista();
List list1=model.getVueloreserva();
List list2=model.getPagosCarga();

if (list != null) {
      Iterator it = list.iterator();
     while (it.hasNext()) {
          Guias guia=(Guias) it.next();
          contiene=guia.getContiene();
          mifechar=guia.getFecha();
          inicior.setTime(mifechar);
          mesr =inicior.get(Calendar.MONTH)+1;
          anior=inicior.get(Calendar.YEAR);
          diar=inicior.get(Calendar.DATE);
          lfecha=diar +"/"+mesr +"/"+anior;
          hora=guia.getHora();
          minutos=guia.getMinutos();
          lhora=hora+":"+minutos;
          piezas=guia.getPiezas();
          peso=guia.getPeso();
          pesov=guia.getPesov(); 
          remitente=guia.getRemitente();
          destinatario=guia.getDestinatario();
          telefono =guia.getTelefono();
          direccion=guia.getDireccion();
          ruc=guia.getRuc();
          origen=guia.getOrigen();
          destino=guia.getDestino();
          guiafac=guia.getTipo(); 
          flete =guia.getFlete();
          edomicilio=guia.getEdomicilio();
          tadicional=guia.getTransportea();
          sadicional=guia.getServicioa();
          seguro=guia.getSeguro();
          iva=guia.getIva();
          obsaux=guia.getObservacion().trim();
          lonobs=obsaux.length();
          obs=obsaux;
          otros=guia.getOtros();
          //obs1=obsaux;
          
          if (lonobs>50)
          {
          obs=obsaux.substring(0,50);
           if (lonobs>51)
          obs1=obsaux.substring(50,lonobs);
          }
          subtotal=flete+sadicional+seguro+edomicilio+tadicional+otros;
          vdescuento=guia.getDescuento(); 
          subtotal=subtotal-vdescuento;
          total=guia.getTotal();
          otros=guia.getOtros();
          
          sucursal=guia.getSucursal();
         // usuariox=guia.getUsuario();
          usuariox=usuario.getNombreCompleto();
          numguiafac=guia.getNumero();
          if (guia.getEntregaen()==1)
                domicilio="X";
          else if (guia.getEntregaen()==2)
                  oficina="X";
          else if (guia.getEntregaen()==3)
                  aeropuerto="X";
  
      }
 }


if (list1 != null) 
  {
      Iterator itx = list1.iterator();
     while (itx.hasNext()) 
      {
           Vuelosreserva vuelo=(Vuelosreserva) itx.next();
          // origen=vuelo.getOrigen();
           //destino=vuelo.getDestino();
     }
  }



if (list2 != null)
{
    Iterator ity=list2.iterator();
    while(ity.hasNext())
    {
        Pagosc pagos=(Pagosc) ity.next();
        tipop= pagos.getTipo();
        if (tipop.equals("EF") )
              pagoe+=pagos.getValor();
        else
              pagoc+=pagos.getValor();
        
    }    
    
}  


%>


<HTML>
<HEAD>
<!-- <TITLE>IMPRESION GUIA DE CARGA</TITLE> -->
        <style type="text/css">
            body   { background:#FFF;
                     margin:0; padding:0;}
            .fc   { color     : black;
                    font-weight   : bold;
                    font-size : 9pt;
                    line-height   : 9pt;
                    font-family   : sans-serif;}
            p  { color     : black;
                 text--indent  : 0.5in;
                 font-size : 12pt;
                 font-family   : Times,serif;}
            .numbcolumn {color     : black;
                    font-weight   : bold;
                    font-size : 10pt;
                    font-family   : sans-serif;}
            .bordes{position:absolute; left:0cm;top:0cm; border:#000 solid 2px; visibility:hidden; }
            @media print {
                /* style sheet for print goes here */
                body   { background:#FFF;
                         margin:0; padding:0; background-image:none;}
            }

        </style>
</HEAD>
<BODY ONLOAD="window.print();window.location='<%=CONTROLLER%>/Guias/Guias-';">

 <DIV  style="position:absolute; left:17cm;top:0.80cm "> 
    <span class="fc"><%=numguiafac%></span>
 </DIV> 

    
<DIV  style="position:absolute; left:1.5cm;top:1.95cm ">
    <span class="fc"><%=lfecha%></span>
</DIV>

<DIV  style="position:absolute; left:4.8cm; top:1.95cm ">
    <span class="fc"><%=lhora%></span>
</DIV>

<DIV  style="position:absolute; left:7.2cm; top:1.95cm "> 
    <span class="fc"><%=piezas%></span>
</DIV>


<DIV  style="position:absolute; left:9.1cm;top:1.95cm ">
    <span class="fc"><%=f.format(peso)%></span>
</DIV>

<DIV  style="position:absolute; left:11.4cm;top:1.95cm ">
    <span class="fc"><%=f.format(pesov)%></span>
</DIV>

<DIV  style="position:absolute; left:13.0cm;top:1.75cm ">
    <span class="fc"><%=contiene%></span>
</DIV>

<DIV  style="position:absolute; left:15.5cm;top:1.95cm ">
    <span class="fc">S.V.D.</span>
</DIV>

<DIV  style="position:absolute; left:2.0cm;top:2.9cm ">
    <span class="fc"><%=remitente%></span>
</DIV>

<DIV  style="position:absolute; left:10.0cm;top:2.9cm ">
    <span class="fc"><%=destino%></span>
</DIV>

<DIV  style="position:absolute; left:14.5cm;top:2.9cm ">
    <span class="fc"><%=destinatario%></span>
</DIV>

<DIV  style="position:absolute; left:2.5cm;top:3.6cm ">
    <span class="fc"><%=origen%></span>
</DIV>


<DIV  style="position:absolute; left:5.5cm;top:3.6cm ">
    <span class="fc"><%=telefono%></span>
</DIV>


<DIV  style="position:absolute; left:14.5cm;top:3.6cm ">
    <span class="fc"><%=direccion%></span>
</DIV>

<DIV  style="position:absolute; left:2.0cm;top:4.5cm ">
    <span class="fc"><%=ruc%></span>
</DIV>

<DIV  style="position:absolute; left:11.0cm;top:4.5cm ">
    <span class="fc"><%=sucursal%></span>
</DIV>


<!-- <DIV  style="position:absolute; left:16.2cm;top:4cm "> -->
<%-- <H1><%=domicilio%></H1> --%>
<!-- </DIV> -->
<!-- <DIV  style="position:absolute; left:18.0cm;top:4cm "> -->
<%-- <H1><%=oficina%></H1> --%>
<!-- </DIV> -->
<!-- <DIV  style="position:absolute; left:19.7cm;top:4cm "> -->
<%-- <H1><%=aeropuerto%></H1> --%>
<!-- </DIV> -->


<DIV  style="position:absolute; left:1.0cm;top:5.3cm ">
    <span class="fc"><%=obs%></span>
</DIV>
<%
 
if (tipop.equals("EF") )
 ptotal=14;
 else
 ptotal=18;
 
%>


<%

if (guiafac.equals("G"))
{
%>



<DIV  style="position:absolute; left:17.0cm;top:5.5cm ">
    <span class="numbcolumn"><%=f.format(flete)%>  </span>
</DIV>

<%%>
<DIV  style="position:absolute; left:1.0cm;top:5.8cm ">
    <span class="fc"><%=obs1%></span>
</DIV>
<%%>

<%-- <DIV  style="position:absolute; left:<%=ptotal%>cm;top:5.5cm "> --%>
<%-- <H1><%=f.format(edomicilio)%></H1> --%>
<!-- </DIV> -->

<%-- <DIV  style="position:absolute; left:<%=ptotal%>cm;top:6.0cm "> --%>
<%-- <H1><%=f.format(sadicional)%> </H1> --%>
<!-- </DIV> -->


<DIV  style="position:absolute; left:17.0cm;top:6.0cm ">
    <span class="numbcolumn"><%=f.format(seguro)%></span>
</DIV>

<DIV  style="position:absolute; left:0.9cm;top:7.1cm ">
    <span class="fc"><%=usuariox%></span>
</DIV>

 <DIV  style="position:absolute; left:17.0cm;top:6.5cm "> 
     <span class="numbcolumn"><%=f.format(otros)%></span>
 </DIV> 
 <DIV  style="position:absolute; left:17.0cm;top:7.1cm ">
    <span class="numbcolumn"><%=f.format(subtotal)%></span>
 </DIV>

<!--<DIV  style="position:absolute; left:17.0cm;top:6.9cm ">
<H1><%=f.format(vdescuento)%></H1>
</DIV>-->

<% if (iva>0)
{
%>    

<DIV  style="position:absolute; left:15.0cm;top:8.2cm ">
    <span class="numbcolumn">12%</span>
</DIV>

<%
}
%>
<DIV  style="position:absolute; left:17.0cm;top:7.6cm ">
    <span class="numbcolumn">0.00</span>
</DIV>
<DIV  style="position:absolute; left:17.0cm;top:8.2cm ">
    <span class="numbcolumn"><%=f.format(iva)%></span>
</DIV>

<DIV  style="position:absolute; left:17.0cm;top:8.8cm ">
    <span class="numbcolumn"><%=f.format(total)%> </span>
</DIV>

<%
}
else if (guiafac.equals("F"))
{
    
%>
<DIV  style="position:absolute; left:17.0cm;top:5.5cm ">
    <span class="numbcolumn"><%=f.format(flete)%>  </span>
</DIV>
 
<%-- <DIV  style="position:absolute; left:<%=ptotal%>cm;top:5.4cm "> --%>
<%-- <H1><%=f.format(edomicilio)%></H1> --%>
<!-- </DIV> -->
 
<%-- <DIV  style="position:absolute; left:<%=ptotal%>cm;top:5.8cm "> --%>
<%-- <H1><%=f.format(tadicional)%> </H1> --%>
<!-- </DIV> -->
 
<%-- <DIV  style="position:absolute; left:<%=ptotal%>cm;top:6.2cm "> --%>
<%-- <H1><%=f.format(sadicional)%></H1> --%>
<!-- </DIV> -->
 
<DIV  style="position:absolute; left:17.0cm;top:6.0cm ">
    <span class="numbcolumn"><%=f.format(seguro)%></span>
</DIV>
  <DIV  style="position:absolute; left:17.0cm;top:6.5cm "> 
     <span class="numbcolumn"><%=f.format(otros)%></span>
 </DIV> 
<DIV  style="position:absolute; left:17.0cm;top:7.1cm ">
    <span class="numbcolumn"><%=f.format(subtotal)%></span>
</DIV>
 
<!--<DIV  style="position:absolute; left:17.0cm;top:6.9cm ">
<H1><%=f.format(vdescuento)%></H1>
</DIV>-->
 
<DIV  style="position:absolute; left:17.0cm;top:7.6cm ">
    <span class="numbcolumn">0.00</span>
</DIV>

<% if (iva>0)
{
%>    

<DIV  style="position:absolute; left:15cm;top:8.2cm ">
    <span class="numbcolumn">12%</span>
</DIV>

<%
}
%>
<!--<DIV  style="position:absolute; left:17.0cm;top:7.6cm ">
    <span class="numbcolumn">0.00</span>
</DIV> -->
<DIV  style="position:absolute; left:17.0cm;top:8.2cm ">
    <span class="numbcolumn"><%=f.format(iva)%></span>
</DIV>
 
<DIV  style="position:absolute; left:17.0cm;top:8.8cm ">
    <span class="numbcolumn"><%=f.format(total)%> </span>
</DIV>

  

<%
}
%>



</BODY> </HTML>

