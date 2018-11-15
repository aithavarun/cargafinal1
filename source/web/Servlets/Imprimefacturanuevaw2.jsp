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
long numfactura=0;
Usuarios usuario=model.getUsuarios();
java.util.Calendar inicior = java.util.Calendar.getInstance();

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
          descuento=guia.getDescuento();
          iva=guia.getIva();
          //obs=guia.getObservacion();
          obsaux=guia.getObservacion().trim();
          lonobs=obsaux.length();
          obs=obsaux;
          if (lonobs>50)
          {
          obs=obsaux.substring(0,50);
           if (lonobs>51)
           obs1=obsaux.substring(50,lonobs);
          }
          
          subtotal=flete+sadicional+seguro+edomicilio+tadicional;
          //vdescuento= (subtotal *(descuento/100)); 
          subtotal=subtotal-vdescuento;
          //usuariox=guia.getUsuario();
          usuariox=usuario.getNombreCompleto();
          total=guia.getTotal();
          otros=guia.getOtros();
          sucursal=guia.getSucursal();
          numfactura=guia.getNumero();
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
{tipop="XX";
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
<HEAD><TITLE>IMPRESION GUIA DE CARGA</TITLE>
<STYLE TYPE="text/css">
BODY   { background    : white}
H1   { color     : black;
font-weight   : bold;
font-size : 11pt;
line-height   : 9pt;
font-family   : sans-serif;}
P  { color     : black;
text--indent  : 0.5in;
font-size : 12pt;
font-family   : Times,serif;}
</STYLE>
</HEAD>
<BODY ONLOAD="window.print();window.location='<%=CONTROLLER%>/Guias/Guias-';">
    
 
<DIV  style="position:absolute; left:22cm;top:0.5cm ">
<H1><%=numfactura%></H1>
</DIV>

<DIV  style="position:absolute; left:18cm;top:1cm ">
<H1><%=contiene%></H1>
</DIV>

<DIV  style="position:absolute; left:0.5cm;top:1.5cm">
<H1><%=lfecha%></H1>
</DIV>

<DIV  style="position:absolute; left:3.3cm; top:1.5cm">
<H1><%=lhora%></H1>
</DIV>


<DIV  style="position:absolute; left:6.5cm; top:1.5cm"> 
<H1><%=piezas%></H1>
</DIV>


<DIV  style="position:absolute; left:10cm;top:1.5cm">
<H1><%=f.format(peso)%></H1>
</DIV>

<DIV  style="position:absolute; left:13.5cm;top:1.3cm">
<H1><%=f.format(pesov)%></H1>
</DIV>

<DIV  style="position:absolute; left:20cm;top:55px">
<H1>S.V.D.</H1>
</DIV>

<DIV  style="position:absolute; left:5cm;top:2cm">
<H1><%=remitente%></H1>
</DIV>

<DIV  style="position:absolute; left:17.5cm;top:2cm">
<H1><%=destinatario%></H1>
</DIV>

<DIV  style="position:absolute; left:1cm;top:2.528cm">
<H1><%=origen%></H1>
</DIV>

<DIV  style="position:absolute; left:5cm;top:2.528cm">
<H1><%=telefono%></H1>
</DIV>


<DIV  style="position:absolute; left:12.5cm;top:2.528cm">
<H1><%=destino%></H1>
</DIV>

<DIV  style="position:absolute; left:17.8cm;top:2.528cm">
<H1><%=direccion%></H1>
</DIV>

<DIV  style="position:absolute; left:1.5cm;top:3.1cm ">
<H1><%=ruc%></H1>
</DIV>

<DIV  style="position:absolute; left:11cm;top:3.1cm ">
<H1><%=sucursal%></H1>
</DIV>


<DIV  style="position:absolute; left:16.2cm;top:3.1cm ">
<H1><%=domicilio%></H1>
</DIV>
<DIV  style="position:absolute; left:18cm;top:3.1cm ">
<H1><%=oficina%></H1>
</DIV>
<DIV  style="position:absolute; left:19.8cm;top:3.1cm ">
<H1><%=aeropuerto%></H1>
</DIV>


<DIV  style="position:absolute; left:1cm;top:4cm ">
<H1><%=obs%></H1>
</DIV>
<%
 //ptotal=13;
 //ptotal=16;
if (tipop.trim().equals("CR"))
    ptotal=18;
 else
    ptotal=16;
 %>

<DIV  style="position:absolute; left:18.706cm;top:4.048cm">
<H1><%=f.format(flete)%> </H1>
</DIV>
 



<DIV  style="position:absolute; left:18.706cm;top:4.63cm">
<H1><%=f.format(edomicilio)%></H1>
</DIV>
 
  <%%>
<DIV  style="position:absolute; left:1cm;top:5.5cm ">
<H1><%=obs1%></H1>
</DIV>
<%%>

 
<DIV  style="position:absolute; left:18.706cm;top:5.106cm">
<H1><%=f.format(tadicional)%> </H1>
</DIV>
 
<DIV  style="position:absolute; left:18.706cm;top:5.503cm">
<H1><%=f.format(sadicional)%></H1>
</DIV>
 
<DIV  style="position:absolute; left:18.706cm;top:5.953cm">
<H1><%=f.format(seguro)%></H1>
</DIV>
 
<DIV  style="position:absolute; left:1cm;top:6.429cm">
<H1><%=usuariox%></H1>
</DIV>

<DIV  style="position:absolute; left:18.706cm;top:6.429cm">
<H1><%=f.format(subtotal)%></H1>
</DIV>
 
<DIV  style="position:absolute; left:18.706cm;top:6.773cm">
<H1><%=f.format(descuento)%></H1>
</DIV>
 
<% if(otros>0)
    {
    %>
<DIV  style="position:absolute; left:<%=(ptotal-3)%>cm;top:7.303cm; left: 622px;">
<H1> Imp. SCY </H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal+2.7%>cm;top:7.4cm ">
<H1><%=f.format(otros)%></H1>
</DIV>
<%
}
else
{
%>
<DIV  style="position:absolute; left:<%=ptotal%>cm;top:7.303cm; left: 707px;">
<H1>0.00</H1>
</DIV>
<%}%>

<% if (iva>0)
{
%>    
 
<DIV  style="position:absolute; left:<%=(16-2.5)%>cm;top:7.699cm; left: 629px;">
<H1><%=12%></H1>
</DIV>  

<%
}
%>
 

<DIV  style="position:absolute; left:18.706cm;top:7.699cm">
<H1><%=f.format(iva)%></H1>
</DIV>
 
<DIV  style="position:absolute; left:18.706cm;top:8.096cm">
<H1><%=f.format(total)%></H1>
</DIV>
</BODY> 
</HTML>

