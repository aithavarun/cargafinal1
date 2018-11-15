<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import ="java.text.DecimalFormatSymbols" %>
<%
DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
simbolos.setDecimalSeparator('.');
DecimalFormat f =new DecimalFormat("0.00",simbolos);%>

<%

java.util.Date mifechar;

int mesr=0;
int anior=0;
int diar=0;
int piezas=0;
float peso=0;
int totalpiezas=0;
float totalpeso=0;
String contiene="";
String remitente="";
String destinatario="";
float flete=0;
float edomicilio=0;
float tadicional=0;
float sadicional=0;
String obs="";
String lfecha="";
String lhora="";
int hora=0;
int minutos=0;
String origen="";
String destino="";
String equipo="";
String sucursal="";
String usuario="";
int numguia=0;
int donde=0;
String vuelo="";
double i=5.3;
long nummanifiesto=0;

java.util.Calendar inicior = java.util.Calendar.getInstance();

List list = model.getListaManifiestos();
List list1=model.getListaGuiasM();
//List list2=model.getPagosCarga();

if (list != null) {
      Iterator it = list.iterator();
     while (it.hasNext()) {
          Manifiesto manifiesto=(Manifiesto) it.next();
          
          mifechar=manifiesto.getFecha();
          inicior.setTime(mifechar);
          mesr =inicior.get(Calendar.MONTH)+1;
          anior=inicior.get(Calendar.YEAR);
          diar=inicior.get(Calendar.DATE);
          lfecha=diar +"/"+mesr +"/"+anior;
          totalpiezas=manifiesto.getPiezas();
          totalpeso=manifiesto.getPeso();
          obs=manifiesto.getObservacion();
          equipo=manifiesto.getEquipo();
          sucursal=manifiesto.getSucursal();
          usuario=manifiesto.getUsuario();
          origen=manifiesto.getOrigen();
          destino=manifiesto.getDestino();
          vuelo=manifiesto.getVuelo();
          nummanifiesto=manifiesto.getNumero();
      }
 }


%>


<script language="javascript">
function cerrarV(){
setTimeout("javascript: window.opener=''; window.close();",2000)
}
</script>


<HTML>
<HEAD>
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
<BODY  ONLOAD="window.print();window.location='<%=CONTROLLER%>/ReporteManifiestos/Buscar?Buscar=Buscar';" >
<DIV  style="position:absolute; left:4cm;top:2cm ">
<H1><%=sucursal%>    <%=usuario%> </H1>
</DIV>

<DIV  style="position:absolute; left:17cm;top:1.5cm ">
<H1><%=nummanifiesto%> </H1>
</DIV>


<DIV  style="position:absolute; left:4cm;top:2.9cm ">
<H1><%=origen%></H1>
</DIV>

<DIV  style="position:absolute; left:16cm; top:2.9cm ">
<H1><%=destino%></H1>
</DIV>

<DIV  style="position:absolute; left:4cm; top:3.8cm ">
<H1><%=equipo%></H1>
</DIV>


<DIV  style="position:absolute; left:10cm; top:3.8cm "> 
<H1><%=vuelo%></H1>
</DIV>

<DIV  style="position:absolute; left:15cm; top:3.8cm "> 
<H1><%=lfecha%></H1>
</DIV>



<%
   String domicilio="";
   String aeropuerto="";
   String oficina="";
   String transito="";
   if (list1 != null) 
  {
      Iterator itx = list1.iterator();
     while (itx.hasNext()) 
      {
           transito="";
           Guias guia=(Guias) itx.next();
           numguia=guia.getNumero();
           piezas=guia.getPiezas();
           peso=guia.getPeso();
           donde=guia.getEntregaen();
           destinatario=guia.getDestinatario();
            if(guia.getEntregaen()==1 )
             domicilio="X";
             else if(guia.getEntregaen()==2)
             oficina="X";
             else if(guia.getEntregaen()==3)
             aeropuerto="X";
           if (!(guia.getTransito().equals( guia.getDestino())))
               
                transito="T." + guia.getOrigen()+guia.getDestino();
          
%>
     
        <DIV  style="position:absolute; left:1 cm;top:<%=i%>cm ">
        <H1><%=numguia%></H1>
        </DIV>

        <DIV  style="position:absolute; left:3.5cm;top:<%=i%>cm ">
        <H1><%=piezas%></H1>
        </DIV>
        
        <DIV  style="position:absolute; right:13.8cm;top:<%=i%>cm ">
        <H1><%=f.format(peso)%> </H1>
        </DIV>
        
        
         <DIV  style="position:absolute; left:7.5cm;top:<%=i%>cm ">
        <H1><%=domicilio%></H1>
        </DIV>
         <DIV  style="position:absolute; left:9.5cm;top:<%=i%>cm ">
        <H1><%=oficina%></H1>
        </DIV>
         <DIV  style="position:absolute; left:10.3cm;top:<%=i%>cm ">
        <H1><%=aeropuerto%></H1>
        </DIV>
        
        
        <DIV  style="position:absolute; left:10.8cm;top:<%=i%>cm ">
        <H1><%=transito%></H1>
        </DIV>
        
        <DIV  style="position:absolute; left:12.8cm;top:<%=i%>cm ">
        <H1><%=destinatario%></H1>
        </DIV>



<%
    i+=0.5;
     domicilio="";
     aeropuerto="";
     oficina="";
   
     if (i>=24 && i<=25)
         i=34;
     
     }
  }
%>



<DIV  style="position:absolute; left:3.5cm; top:24.8cm "> 
<H1><%=totalpiezas%></H1>
</DIV>


<DIV  style="position:absolute; right:13.8cm;top:24.8cm ">
<H1><%=f.format(totalpeso)%></H1>
</DIV>

<DIV  style="position:absolute; left:2.5cm;top:26.3cm ">
<H1><%=obs%></H1>
</DIV>
<%
if (i>=34)
{
 %>
<DIV  style="position:absolute; left:3.5cm; top:52.8cm "> 
<H1><%=totalpiezas%></H1>
</DIV>


<DIV  style="position:absolute; right:13.8cm;top:52.8cm ">
<H1><%=f.format(totalpeso)%></H1>
</DIV>

<DIV  style="position:absolute; left:2.5cm;top:54.8cm ">
<H1><%=obs%></H1>
</DIV>




<%
}
%>


</BODY   >
 
</HTML>

