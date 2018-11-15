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

<DIV  style="position:absolute; left:18cm;top:0.0cm ">
    <span class="fc"><%=numguiafac%></span>
</DIV> 
    
<DIV  style="position:absolute; left:0.01cm;top:0.60cm ">
    <span class="fc"><%=lfecha%></span>
</DIV>

<DIV  style="position:absolute; left:3.1cm; top:0.60cm ">
    <span class="fc"><%=lhora%></span>
</DIV>

<DIV  style="position:absolute; left:5.5cm; top:0.60cm "> 
    <span class="fc"><%=piezas%></span>
</DIV>


<DIV  style="position:absolute; left:7.8cm;top:0.60cm ">
    <span class="fc"><%=f.format(peso)%></span>
</DIV>

<DIV  style="position:absolute; left:10.6cm;top:0.60cm ">
    <span class="fc"><%=f.format(pesov)%></span>
</DIV>

<DIV  style="position:absolute; left:13.0cm;top:0.1cm ">
    <span class="fc"><%=contiene%></span>
</DIV>

<DIV  style="position:absolute; left:15.5cm;top:0.60cm ">
    <span class="fc">S.V.D.</span>
</DIV>

<DIV  style="position:absolute; left:0.5cm;top:1.2cm ">
    <span class="fc"><%=remitente%></span>
</DIV>

<DIV  style="position:absolute; left:10.0cm;top:1.2cm ">
    <span class="fc"><%=destino%></span>
</DIV>

<DIV  style="position:absolute; left:14.5cm;top:1.2cm ">
    <span class="fc"><%=destinatario%></span>
</DIV>

<DIV  style="position:absolute; left:1.5cm;top:2.0cm ">
    <span class="fc"><%=origen%></span>
</DIV>


<DIV  style="position:absolute; left:5.5cm;top:2.0cm ">
    <span class="fc"><%=telefono%></span>
</DIV>


<DIV  style="position:absolute; left:14.5cm;top:2.0cm ">
    <span class="fc"><%=direccion%></span>
</DIV>

<DIV  style="position:absolute; left:2.0cm;top:2.8cm ">
    <span class="fc"><%=ruc%></span>
</DIV>

<DIV  style="position:absolute; left:11.0cm;top:2.8cm ">
    <span class="fc"><%=sucursal%></span>
</DIV>

<DIV  style="position:absolute; left:1.0cm;top:3.7cm ">
    <span class="fc"><%=obs%></span>
</DIV>
<%
if (guiafac.equals("G"))
{
%>
<DIV  style="position:absolute; left:17.5cm;top:4.3cm ">
    <span class="numbcolumn"><%=f.format(flete)%>  </span>
</DIV>
<DIV  style="position:absolute; left:1.0cm;top:4.3cm ">
    <span class="fc"><%=obs1%></span>
</DIV>
<DIV  style="position:absolute; left:17.5cm;top:4.9cm ">
    <span class="numbcolumn"><%=f.format(seguro)%></span>
</DIV>
<DIV  style="position:absolute; left:0.01cm;top:6.0cm ">
    <span class="fc"><%=usuariox%></span>
</DIV>

 <DIV  style="position:absolute; left:17.5cm;top:5.5cm "> 
     <span class="numbcolumn"><%=f.format(otros)%></span>
 </DIV> 
 <DIV  style="position:absolute; left:17.5cm;top:6.1cm ">
    <span class="numbcolumn"><%=f.format(subtotal)%></span>
 </DIV>
<% if (iva>0)
{
%>    
<DIV  style="position:absolute; left:15.5cm;top:7.2cm ">
    <span class="numbcolumn">12%</span>
</DIV>
<%
}
%>
<DIV  style="position:absolute; left:17.5cm;top:6.7cm ">
    <span class="numbcolumn">0.00</span>
</DIV>
<DIV  style="position:absolute; left:17.5cm;top:7.3cm ">
    <span class="numbcolumn"><%=f.format(iva)%></span>
</DIV>

<DIV  style="position:absolute; left:17.5cm;top:7.9cm ">
    <span class="numbcolumn"><%=f.format(total)%> </span>
</DIV>
<%
}    
%>
</BODY> </HTML>

