<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.*" %> 

<%@ include file="/WEB-INF/Banner.jsp"%>  
<script language="JavaScript">

function contar() {

/**/
var totalpiezas=0;
var totalpeso=0;
var i=0;

var manifiesto=eval("document.all.Secuencial");


/**/
for (i=1;i<=parseInt(manifiesto.value);i++)
{
    var guia=eval('document.all.Guia'+i);
    var TotalPiezasObjeto=document.getElementById("Piezas"+i).innerHTML;
    var TotalPesoObjeto=document.getElementById("Peso"+i).innerHTML;
    
    if (guia.checked)
    {
        totalpeso=totalpeso+parseFloat(TotalPesoObjeto);
        totalpiezas=totalpiezas+parseInt(TotalPiezasObjeto);
    }
}

var total=eval("document.all.TotalPiezas");
var totalp=eval("document.all.TotalPeso");

total.value=totalpiezas;
totalp.value=totalpeso;

}
</script>


<%
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
String usuariox="";
int numguia=0;
int donde=0;
String vuelo="";
long secmanifiesto=0;
long nummanifiesto=0;

java.util.Date mifechar;
java.util.Calendar inicior = java.util.Calendar.getInstance();
List list = model.getListaManifiestos();
List list1=model.getGuiasLista();


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
          usuariox=manifiesto.getUsuario();
          origen=manifiesto.getOrigen();
          destino=manifiesto.getDestino();
          vuelo=manifiesto.getVuelo();
          secmanifiesto=manifiesto.getCodigo();
          nummanifiesto=manifiesto.getNumero();
      }
 }


%>


<% String Numero=request.getParameter("Numero");
        String Dia=request.getParameter("Dia");
        String Mes=request.getParameter("Mes");
        String Anio=request.getParameter("Anio");
        
        Calendar hoy = Calendar.getInstance();
       
        int dia=hoy.get(Calendar.DATE);
        int mes=hoy.get(Calendar.MONTH);
        int anio=hoy.get(Calendar.YEAR);
        if (Dia==null)
            Dia=String.valueOf(dia);
        if (Mes==null)
            Mes=String.valueOf(mes+1);
        if (Anio==null)
            Anio=String.valueOf(anio);
        if (Numero==null)
            Numero="";
         if (destino==null)
            destino="";
        
  
        %>

<form method="post" action="<%=CONTROLLER%>/Guias/Buscarmanifiesto"  
    name="DManifiesto" onSubmit="return validar(this)"  >
        
   
        
        <table>
   <tr>
   <td rowspan="2" colspan="10" >
    <table border="0" cellpadding="0" cellspacing="0"  >
        <td ><b>
        Fecha:
        </b></td>
        <td></font>
        


        <input name="Dia" value="<%=Dia%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" readonly>(dia)
        <input name="Mes" value="<%=Mes%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" readonly>(mes)

        <input name="Anio" value="<%=Anio%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" readonly>(a&ntilde;o)

    <td ><b>
        
<tr>
 <td align="left"> <b> Equipo:</b></td>
 <td><input name="Equipo" type ="text" size="10" maxlength="10" value="<%=equipo%>" readonly> </td>
 
  
  <td><b>  Origen</b>  <input name="Origen" value="<%=origen%>" type="text" size="10" maxlength="3" READONLY>   </td>
  <td><b>  Destino</b> <input name="Destino" value="<%=destino%>" type="text" size="10" maxlength="3" READONLY>  </td>
 
</tr>

        
<tr> 
    
    <td><b>Numero de Vuelo:
    </b></td>
    <td><input name="Vuelo" value="<%=vuelo%>" type="text" size="10" maxlength="3" readonly>
    </td>
    <input name="Secmanifiesto" type ="hidden" value="<%=secmanifiesto%>" > 
    
     <td><b>Numero de Manifiesto:
    </b></td>
    <td><input name="Manifiesto" value="<%=nummanifiesto%>" type="text" size="10" maxlength="3" readonly>
    </td>
</tr>

        
        
</table>
        
  
        
<table width="100%" align="center">
<tr>
<td>
<table id="t1" class="sortable">

<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<tr>
<th > Nª Guia</th>
<th > Piezas</th>
<th > Peso</th>
<th > Destino</th>
<th > Contiene</th>
<th > Cliente</th>
<th > Destinatario</th>
<th > Remitente</th>
<th > Ruta</th>

</tr>


<%
 List lista = model.getListaGuiasM();
 int secuencial=0;
 String filascolor="#CCCCCC";
 String Destino="";
 String Ruta1="";
 String Ruta2="";
 String Origen1="";
 int totalopz1=0;
 int totalopz2=0;
 float totalops1=0;
 float totalops2=0;
 
 
int totalpz=0;
float totalps=0;
if (lista != null){
     Iterator itr = lista.iterator();
      while (itr.hasNext()){
             secuencial++;
             Guias guia=(Guias) itr.next();              
             String seleccionUrl=CONTROLLER+"/Guias/Selecciona?codigo="+guia.getCodigo() ;
             if(guia.getEntregaen()==1 )
             Destino="Domicilio";
             else if(guia.getEntregaen()==2)
             Destino="Oficina";
             else if(guia.getEntregaen()==3)
             Destino="Aeropuerto";
             
             totalpz+=guia.getPiezas();
             totalps+=guia.getPeso();
             
             if (Origen1.equals("") || Origen1.equals(guia.getOrigen()))
             {
                 Ruta1=guia.getOrigen();
                 totalopz1+=guia.getPiezas();
                 totalops1+=guia.getPeso();
                 Origen1=guia.getOrigen();
             }
             else
             {
                 totalopz2+=guia.getPiezas();    
                 totalops2+=guia.getPeso();
                 Ruta2=guia.getOrigen();
             }
             
             
             
             
             %>
             <tr   bgcolor="<%=filascolor%>">
             <td><input type="checkbox" name="Guia<%=secuencial%>" value= "<%=guia.getCodigo()%>" onclick ="contar();" checked ><b> <%=guia.getNumero()%> </b></td>
             <td ><span id="Piezas<%=secuencial%>"><%=guia.getPiezas()%></span></td>             
             <td ><span id ="Peso<%=secuencial%>"><%=guia.getPeso()%></span></td>
             <td><%=Destino%></td>
             <td><%=guia.getContiene()%></td>
             <td><%=guia.getNombreCliente()%></td>
             <td><%=guia.getDestinatario()%></td>
             <td><%=guia.getRemitente()%></td>
             <td><%=guia.getOrigen() + " - " + guia.getDestino()  %></td>
            </tr>   
 
             <%}}%> 
 
<%

List listag=model.getGuiasLista();
if (listag != null){
     Iterator itr = listag.iterator();
      while (itr.hasNext()){
             secuencial++;
             Guias guiag=(Guias) itr.next();              

             if(guiag.getEntregaen()==1 )
             Destino="Domicilio";
             else if(guiag.getEntregaen()==2)
             Destino="Oficina";
             else if(guiag.getEntregaen()==3)
             Destino="Aeropuerto";
             
            // totalpz+=guiag.getPiezas();
             //totalps+=guiag.getPeso();
             
             
             %>
             <tr   bgcolor="<%=filascolor%>">
             <td><input type="checkbox" name="Guia<%=secuencial%>" value= "<%=guiag.getCodigo()%>" onclick ="contar();"  ><b> <%=guiag.getNumero()%> </b></td>
             <td ><span id="Piezas<%=secuencial%>"><%=guiag.getPiezas()%></span></td>             
             <td ><span id ="Peso<%=secuencial%>"><%=guiag.getPeso()%></span></td>
             <td><%=Destino%></td>
             <td><%=guiag.getContiene()%></td>
             <td><%=guiag.getNombreCliente()%></td>
             <td><%=guiag.getDestinatario()%></td>
             <td><%=guiag.getRemitente()%></td>
             <td><%=guiag.getOrigen() + " - " + guiag.getDestino()  %></td>
            </tr>   
 
             <%}}%> 
             
             
             
             
             
             
             
             
             
             
             
            
             <tr   bgcolor="<%=filascolor%>">
             <td><b> Totales </a></b></td>
             <td><input name="TotalPiezas" value="<%=totalpz%>" type="text" size="10" maxlength="20" readonly> </td>
             <td><input name="TotalPeso" value="<%=totalps%>" type="text" size="10" maxlength="20" readonly ></td>
             <input name="Secuencial" type ="hidden" value="<%=secuencial%>" > 
             
             <td> </td>
             
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
            </tr>   
          
            
 

</table>
</td>
</tr>


<tr>
<td align="left"> <b> Observaciones: <input name="Observaciones" value="<%=obs%>" type ="text" size="90" maxlength="90"> </b> </td>

</tr>


</table  >
<TABLE width="10%" align="center">
<tr>
    <td ><input name="Grabar" type="submit" id="Grabar" value="Grabar"  onclick="nosalir();"></td>
</tr>
</table>
</form>