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
int ptotal=0;

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
          
//         codigo=guia.getCodigo();
//         numerog=guia.getNumero();
//          
          flete =guia.getFlete();
          edomicilio=guia.getEdomicilio();
          tadicional=guia.getTransportea();
          sadicional=guia.getServicioa();
//         pesov=guia.getPesov();
          seguro=guia.getSeguro();
          descuento=guia.getDescuento();
          iva=guia.getIva();
          obs=guia.getObservacion();
          subtotal=flete+sadicional+seguro+edomicilio+tadicional;
          vdescuento= (subtotal *(descuento/100)); 
          subtotal=subtotal-vdescuento;
          total=guia.getTotal();
  
      }
 }


if (list1 != null) 
  {
      Iterator itx = list1.iterator();
     while (itx.hasNext()) 
      {
           Vuelosreserva vuelo=(Vuelosreserva) itx.next();
           origen=vuelo.getOrigen();
           destino=vuelo.getDestino();
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
<HEAD><TITLE>IMPRESION GUIA DE CARGA</TITLE>
<STYLE TYPE="text/css">
BODY   { background    : white}
H1   { color     : black;
font-weight   : bold;
font-size : 10pt;
line-height   : 10pt;
font-family   : Arial,Helvetica,sans-serif;}
P  { color     : black;
text--indent  : 0.5in;
font-size : 10pt;
font-family   : Times,serif;}
</STYLE>
</HEAD>
<BODY>
<DIV  style="position:absolute; left:14cm;top:1cm ">
<H1><%=contiene%></H1>
</DIV>

<DIV  style="position:absolute; left:0.5cm;top:1.5cm ">
<H1><%=lfecha%></H1>
</DIV>

<DIV  style="position:absolute; left:5cm; top:1.5cm ">
<H1><%=lhora%></H1>
</DIV>


<DIV  style="position:absolute; left:6.5cm; top:1.5cm ">
<H1><%=piezas%></H1>
</DIV>


<DIV  style="position:absolute; left:8cm;top:1.5cm ">
<H1><%=f.format(peso)%></H1>
</DIV>

<DIV  style="position:absolute; left:9.5cm;top:1.5cm ">
<H1><%=f.format(pesov)%></H1>
</DIV>


<DIV  style="position:absolute; left:14cm;top:1.5cm ">
<H1>S.V.D.</H1>
</DIV>

<DIV  style="position:absolute; left:3cm;top:2.5cm ">
<H1><%=remitente%></H1>
</DIV>

<DIV  style="position:absolute; left:11cm;top:2.5cm ">
<H1><%=destinatario%></H1>
</DIV>

<DIV  style="position:absolute; left:0.5cm;top:3cm ">
<H1><%=origen%></H1>
</DIV>


<DIV  style="position:absolute; left:3cm;top:3cm ">
<H1><%=telefono%></H1>
</DIV>


<DIV  style="position:absolute; left:7cm;top:3cm ">
<H1><%=destino%></H1>
</DIV>

<DIV  style="position:absolute; left:12cm;top:3cm ">
<H1><%=direccion%></H1>
</DIV>

<DIV  style="position:absolute; left:0.5cm;top:4cm ">
<H1><%=ruc%></H1>
</DIV>

<%

if (tipop.equals("EF") )
 ptotal=14;
 else
 ptotal=18;

%>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:5cm ">
<H1><%=f.format(flete)%>  </H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:5.4cm ">
<H1><%=f.format(edomicilio)%></H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:5.8cm ">
<H1><%=f.format(tadicional)%> </H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:6.2cm ">
<H1><%=f.format(sadicional)%></H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:6.6cm ">
<H1><%=f.format(seguro)%></H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:7cm ">
<H1><%=f.format(subtotal)%></H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:7.4cm ">
<H1><%=f.format(vdescuento)%></H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:7.8cm ">
<H1>0.00</H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:8.2cm ">
<H1><%=f.format(iva)%></H1>
</DIV>

<DIV  style="position:absolute; left:<%=ptotal%>cm;top:8.6cm ">
<H1><%=f.format(total)%> </H1>
</DIV>

</BODY> </HTML>

