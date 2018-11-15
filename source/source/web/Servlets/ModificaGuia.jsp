<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="/WEB-INF/Banner.jsp"%>  

<%@ page import ="java.text.DecimalFormatSymbols" %>
<%
DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
simbolos.setDecimalSeparator('.');
DecimalFormat f =new DecimalFormat("0.00",simbolos);%>


<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>


<%

java.util.Calendar inicio = java.util.Calendar.getInstance();
java.util.Calendar inicior = java.util.Calendar.getInstance();

long codigo=0;
long  numerog=0;
String Origen="";
String Destino="";
String Transito="";
String Nvuelo="";
int piezas=0;
float peso=0;
float pesov=0;
int dia=0;
int mes=0;
int anio=0;
int diar=0;
int mesr=0;
int anior=0;
int cliente=-1;
String contiene="";
String remitente="";
String destinatario="";
float flete=0;
float edomicilio=0;
float tadicional=0;
float sadicional=0;
float seguro=0;
float total=0;
float descuento =0;
float iva =0;
float subtotal=0;
float vdescuento=0;
float pagoe=0;
float pagoc=0;
float pagotc=0;
float pago=0;
float pagor=0;
float pagocheque=0;
float pagodeb=0;
float pagocredito=0;
boolean flagDeb = true;
float mindescuento=0;
float pesoaux=0;
float otros=0;
String ruc="";
String telefono="";
String obs="XXX";
String tipo=""; 
String direccion="";
String tipodoc="";
int tipotar=-1;
int hora=0;
int minutos=0;
int entregaen=0;
String sestado="";
java.util.Date mifecha;
java.util.Date mifechar;
float ImpUIO = 0;
float ImpGPS = 0;
float ImpSCY = 0;
String franquiciasDeb ="";
String bancosDeb = "";
String franquiciasDebC ="";
String bancosDebC = "";
String fourDigDeb = "";
String fourDigDebF ="";
String numberAuthDeb = "";
String numberAuthDebF = "";
String franquiciasCred ="";
String bancosCred = "";
String franquiciasCredC ="";
String bancosCredC = "";
String fourDigCred = "";
String numberAuthCred = "";
String fourDigCredF = "";
String numberAuthCredF = "";
String fechaVencimientoD = "0/0";
int mesdebC=0;
int aniodebC=0;
String fechaVencimientoC = "0/0";
int mescredC=0;
int aniocredC=0;

String serie="";

model.BuscarSucursal(usuario.getSucursal());
List listsu = model.getSucursales();
 if (listsu != null) {
      Iterator itsu = listsu.iterator();
      while (itsu.hasNext()) {
          Sucursales sucursal=(Sucursales) itsu.next();
          serie=sucursal.getSerie();
          
      }
 }

//List listcx = model.getClientesCarga();

//List listcx=model.getClientesCarga();
List list = model.getGuiasLista();
//List list1=model.getVueloreserva();
List list2=model.getPagosCarga();
List listaDetTarj=model.getDetPagosTarjetas();


if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Guias guia=(Guias) it.next();
          codigo=guia.getCodigo();
          numerog=guia.getNumero();
          mifechar=guia.getFecha();
          inicior.setTime(mifechar);
          mesr =inicior.get(Calendar.MONTH)+1;
          anior=inicior.get(Calendar.YEAR);
          diar=inicior.get(Calendar.DATE);
          piezas=guia.getPiezas();
          peso=guia.getPeso();
          contiene=guia.getContiene();
          remitente=guia.getRemitente();
          destinatario=guia.getDestinatario();
          flete =guia.getFlete();
          edomicilio=guia.getEdomicilio();
          tadicional=guia.getTransportea();
          sadicional=guia.getServicioa();
          otros=guia.getOtros();
          pesov=guia.getPesov();
          seguro=guia.getSeguro();
          ruc=guia.getRuc();
          telefono=guia.getTelefono();
          iva=guia.getIva();
          obs=guia.getObservacion();
          subtotal=flete+sadicional+seguro+edomicilio+tadicional+otros;
          tipodoc=guia.getTipo();
          total=guia.getTotal();
          hora=guia.getHora();
          minutos=guia.getMinutos();
          cliente=guia.getCodcliente();
          tipotar=guia.getTipotar();//out.println("-------------------------->"+tipotar);
          direccion=guia.getDireccion();
          entregaen=guia.getEntregaen();
          Origen= guia.getOrigen();
          Destino=guia.getDestino();
          Transito=guia.getTransito();
          vdescuento=guia.getDescuento();
          //descuento=guia.getDescuentop();
          ImpUIO=guia.getImpUIO();
          ImpGPS=guia.getImpGPS();
          ImpSCY=guia.getImpSCY();
          
          if (pesov==0) 
          pesoaux=peso;
          else
          pesoaux=pesov;
          if (guia.getEstado().equals("I"))       
              sestado="disabled='disabled'";
      }
 }

int midia=-1;
     // Calendar inicio=Calendar.getInstance();
      inicio.set(anior ,mesr -1 ,diar);
      midia=inicio.get(Calendar.DAY_OF_WEEK);
        if(midia==1)
            midia=7;
        else
           midia=midia-1;        


subtotal=subtotal-vdescuento;

//out.println("++++====>");
          

if (list2 != null) {
      Iterator it2 = list2.iterator();
     
      while (it2.hasNext()) {
          Pagosc pagosc=(Pagosc) it2.next();
          //out.println("+++++++++++++++++++++++++======>"+pagosc.getValor());
          tipo=pagosc.getTipo().trim();
          
          if (tipo.equals("EF"))
               pagoe=pagosc.getValor();
          else if(tipo.equals("CR"))
               pagoc=pagosc.getValor();
          else if(tipo.equals("RT"))     
               pagor=pagosc.getValor();
          else if(tipo.equals("CH"))
               pagocheque=pagosc.getValor();
      }
 }

if(listaDetTarj!=null){
    Iterator itDet = listaDetTarj.iterator();
    
    while(itDet.hasNext()){
        DetalleCobroTarjeta detPagoT =(DetalleCobroTarjeta) itDet.next();
        if(detPagoT.getPagstipo().equals("CC")){
            pagocredito = detPagoT.getPagnvalor();
            franquiciasCredC =detPagoT.getDetfranquicia();
            bancosCredC = detPagoT.getDetbanco();
            fourDigCredF = detPagoT.getUltimosdigitos();
            numberAuthCredF= detPagoT.getNumero_autorizacion();
            if(detPagoT.getFecha_vencimiento()!=null){
                fechaVencimientoC=detPagoT.getFecha_vencimiento();
            }
        }
        if(detPagoT.getPagstipo().equals("DC")){
            pagodeb=detPagoT.getPagnvalor();
            franquiciasDebC=detPagoT.getDetfranquicia();
            bancosDebC= detPagoT.getDetbanco();
            fourDigDebF = detPagoT.getUltimosdigitos();
            numberAuthDebF= detPagoT.getNumero_autorizacion();
            if(detPagoT.getFecha_vencimiento()!=null){
                fechaVencimientoD=detPagoT.getFecha_vencimiento();
            }
        }
    }
    String[] partsDeb = fechaVencimientoD.split("/");
    String[] partsCred = fechaVencimientoC.split("/");
    mesdebC=Integer.parseInt(partsDeb[0].trim());
    aniodebC=Integer.parseInt(partsDeb[1].trim());
    mescredC=Integer.parseInt(partsCred[0].trim());
    aniocredC=Integer.parseInt(partsCred[1].trim());
}


String Numero=request.getParameter("Numeror");
String Mes=request.getParameter("Mesr");
String Anio=request.getParameter("Anior");
String Dia=request.getParameter("Diar");


int estado=0;
int k=0;


Calendar hoy = Calendar.getInstance();


%>

    
<script LANGUAGE="JavaScript"> 
/*
function validar(){
    alert("Validando");
    var origen=eval("document.MantenimientoGuias.Origen.value");
    var destino=eval("document.MantenimientoGuias.Destino.value"); 
    var miindice=eval("document.MantenimientoGuia.Cliente.options.value");
    var Contiene=MantenimientoGuias.Contiene.value;
    var Remitente=MantenimientoGuias.Remitente.value;
    var Destinatario=MantenimientoGuias.Destinatario.value;
    var Telefono=MantenimientoGuias.Telefono.value;
    var Salir=MantenimientoGuias.salir.value;
    var Numfacturaguia=MantenimientoGuias.Nguia.value;
    var Mipeso=MantenimientoGuias.peso.value;
    var Mdireccion=MantenimientoGuias.Direccion.value;
    
    if (Salir=="0")
    {
        if (miindice=="-1")
    
       {
            alert( "Seleccione un Cliente " );
            return false;
        }
        if (origen==destino)
           {
                alert("Destino no Puede ser igual al Origen" );
                return false;
            }

       if (Mipeso=="0" ||  Mipeso=="")  
   
       {
            alert( "El Peso es Obligatorio" );
            return false;
        }         


       if (Contiene=="")
            {
                alert("Contiene es obligatorio" );
                return false;
            }

         if (Remitente=="")
            {
                alert("Remitente es obligatorio" );
                return false;
            }
        if (Destinatario=="")
            {
                alert("Destinatario es obligatorio" );
                return false;
            }
            
        if (Telefono=="")
            {
                alert("Telefono es obligatorio" );
                return false;
            }
        
        if (Mdireccion=="")
           {
            
            alert("Direccion es obligatorio" );
            return false;
            
            }  
             
      
      }

      return true;
        }
*/
</SCRIPT>

<SCRIPT>

function parasalir()
  {
    
    MantenimientoGuias.salir.value=1;
    
  }
  
</SCRIPT>
<script>
    $(document).ready(function(){
        $('.dateVen').mask("00/0000", {placeholder: "mm/YYYY"});
    });
</script>
<table width="100%" align="left">
<tr>



<td valign="top" width="50%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/GuiaCarga/Modificar"
name="MantenimientoGuias" onSubmit="return validatePayment(this);"  >
<tr>
<% if (tipodoc.equals("F"))  
{%> 
<th colspan="6" >Modifica Factura Directa</th> 
<%}
else
{   
%>
<th colspan="6" >Modifica Guia de Carga</th> 
<%}%>

</tr>

<tr>
<td>
                <b> Mes:</b></td><td><input name= "Mese" id="Mese" value="<%=mesr%>"  type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
                
           
</td>
<td>
                <b> Dia:</b></td><td><input name= "Diae" id="Diae" value="<%=diar%>" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
              
</td>
<td>
                <b>Anio:</b></td><td><input name= "Anioe" id="Anioe" value="<%=anior%>"  type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
            
</td>

</tr>

<tr>
 <td>
     <b> Hora:</b></td><td><input name= "Hora" id="Minutos" value="<%=hora%>"  type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" > 
 </td>
 <td>
     <b> Minutos:</b></td><td><input name= "Minutos" id="Minutos" value="<%=minutos%>"  type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >   
 </td>
 
<% if (tipodoc.equals("F"))  
{%> 
 <td><b>FACTURA DIRECTA</b></td>

<%}
else
{   
%>
 <td><b>GUIA DE REMISION</b></td>

<%}%>
<td><input name="Tipo" value="<%=tipodoc%>" type="text" size="1"  maxlength="1" READONLY ></td> 
 
</tr>

<input name="codigo" value="<%=codigo%>" type="HIDDEN">


<% String error=model.getError();
String color="FFFFCC";
if (error !=null)
{%>
<tr class="error">
<th colspan="6" ><%=error%></th>
</tr>
<%}%>
<tr class="form1">
<th colspan="6" >R U T A</th>
</tr>
<%
{

    
    
%>
<tr>

</tr>
<tr bgcolor="">
<td>

<b>de: (Origen)</b></td>
<td><input name="Origen" value="<%=Origen%>" type="text" size="3"  maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();"></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);ponedestino();"></td> 
----------------%>
<td><b>a: (Destino)</b></td>
<%/*%>
<td><input name="Destino" value="<%=Destino%>" type="text" size="3"  maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();"></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);poneorigen();"></td> 
----------------%>
<%*/%>


<td><select  name="Destino" type="text" class='txt-arialimput'>
<%
String DestinoCBX = model.getDestinoCbx();
if(DestinoCBX==null){
    DestinoCBX=Destino;
}
 model.BuscarCiudades();
 List listc = model.getCiudades();
 if (list != null) {
      Iterator itc = listc.iterator();
      while (itc.hasNext()) {
          Ciudades ciudad=(Ciudades) itc.next();
          if(ciudad.getCodigo().equals(DestinoCBX))
          {
          %>
          <option value="<%=ciudad.getCodigo()%>" selected="selected"> <%=ciudad.getNombre().trim()%>  </option>
          <%
          }else{
          %>
          
         <option value="<%=ciudad.getCodigo()%>" > <%=ciudad.getNombre().trim()%>  </option>
         
 
 <%}}}%>
 
     </select>
    

</td>


<td><b> (Transito)</b></td>   
   <td><select  name="Transito" type="text" class='txt-arialimput'>
<%
 model.BuscarCiudades();
 List listx = model.getCiudades();
 if (listx != null) {
      Iterator it = listx.iterator();
      while (it.hasNext()) {
          Ciudades ciudad=(Ciudades) it.next();
      
          %>
          
         <option value="<%=ciudad.getCodigo()%>" > <%=ciudad.getNombre().trim()%>  </option>
         
 
 <%}}%>
 
     </select>

</td> 


</tr>
<%}%>

<%---------------
--%>
<tr class="form1">
<% if (tipodoc.equals("F"))  
{%> 
<th colspan="6" >FACTURA DIRECTA </th>
<%}
else
{  
%>
<th colspan="6" >GUIA DE CARGA </th>
<%}%>
</tr>

<tr>
<th colspan="6" >Datos De Recepcion:</th>
</tr>



<tr>
<td><b> Cliente : </b></td>
<td><select  name="Cliente" type="text" class='txt-arialimput' >
<option value="-1">->Seleccione un Cliente<-</option>
<%
  if  (tipodoc.equals("F")) 
    model.BuscarClientesCarga_sinEliminados("CO");
  else
    model.BuscarClientesCarga_sinEliminados("CR");  
  
 List listc = model.getClientesCarga();
 String ClienteCBX = model.getClienteCbx();
 if(ClienteCBX==null){
     ClienteCBX=Integer.toString(cliente);
 }
 if (listc != null) {
      Iterator itc = listc.iterator();
      while (itc.hasNext()) {
          Clientesc clientec=(Clientesc) itc.next();
          if(clientec.getCodigo()==Integer.parseInt(ClienteCBX)){
              %>
              <option value=<%=clientec.getCodigo()%> selected="selected" > <%=clientec.getNombre()%>   </option>
              <%
          }else{
          %>
          
         <option value=<%=clientec.getCodigo()%> > <%=clientec.getNombre()%>   </option>
         
 
 <%}}}%>
 
     </select>

<td>

</tr>


<tr>
<% if (tipodoc.equals("F"))  
{%> 
 <td><b> Numero de Factura:</b></td><td>
     <input name= "Serie" id="Serie" value="<%=serie%>" size="7" maxlength="7" readonly>
     <input name= "Nguia" id="Nguia" value="<%=numerog%>" type="text"  size="10" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY> 
<%}
else
{  
%>
 <td><b> Numero de Guia:</b></td><td>
     <input name= "Serie" id="Serie" value="<%=serie%>" size="7" maxlength="7" readonly>
     <input name= "Nguia" id="Nguia" value="<%=numerog%>" type="text"  size="10" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY> 
<%}%>
</tr>




<tr>
<td><b>Piezas: </b>
</td><td>
<input name="piezas" value="<%=piezas%>"  type="text" size="8" maxlength="8" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td><b>Peso: </b>
</td><td>
<input name="peso"  value="<%=f.format(peso)%>"  type="text" size="8" maxlength="8" onKeypress="if (event.keyCode < 46 || event.keyCode > 57) event.returnValue = false;">
<B>BALANZA<B> <input name="lee" type="checkbox"   onclick="balanzas();" >
</td>

<td><b>Peso Por Volumen: </b>
</td><td>
<input name="pesovolumen"  value="<%=f.format(pesov)%>"  type="text" size="8" maxlength="8" onKeypress="if (event.keyCode < 46 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>

<tr>
<td><b>Contiene: </b></td>
<td >
<input name="Contiene" value="<%=contiene%>" type="text" size="30" maxlength="30" onChange="javascript:this.value=this.value.toUpperCase();" >
</td>
</tr>
<tr>
<td><b>Remitente: </b></td>
<td>
<input name="Remitente" value="<%=remitente%>" type="text" size="30" maxlength="30" onChange="javascript:this.value=this.value.toUpperCase();">
</td>


<td><b>Ruc/CI Rem.: </b></td>
<td >
<input name="Ruc" value="<%=ruc%>" type="text" size="30" maxlength="30" >
</td>

<td><b>Telefono(Direccion)Rem: </b></td>
<td >
<input name="Telefono" value="<%=telefono%>" type="text" size="30" maxlength="60" >
</td>
</tr>


<tr>

<td><b>Destinatario: </b></td>
<td >
<input name="Destinatario" value="<%=destinatario%>" type="text" size="30" maxlength="30" onChange="javascript:this.value=this.value.toUpperCase();">
</td>


<td ><b>Direccion Dest.: </b></td>
<td colspan="2"> <input name="Direccion" value="<%=direccion%>" type="text" size=50" maxleng="100" onChange="javascript:this.value=this.value.toUpperCase();">
</TD>
</TR>


<tr>
<td><b> Para Entrega En : </b></td>
<td><select  name="Entregaen" type="text" class='txt-arialimput'   >

       <option value=3 > Aeropuerto  </option>
       
       <option value=1 > Domicilio  </option>
         
       <option value=2 > Oficina  </option>

        
 
     </select>

<td>

</tr>


<tr>
<td><b>Tipo Tarifa :</b></td>
<%
Usuarios usuariox=model.getUsuarios();
if (usuariox.getTipo()<0)
{  
%>
<td><select  name="Tipot" type="text" class='txt-arialimput' >
<%}
else
{
%>
<td><select  name="Tipot" type="text" class='txt-arialimput' disabled="disabled">
<%
}
model.BuscarTipostarifas();
 List listt = model.getTiposTarifas();
 if (listt != null) {
      Iterator it = listt.iterator();
      while (it.hasNext()) {
          Tipot tipox=(Tipot) it.next();
      
          %>
          
         
         <option value="<%=tipox.getSecuencial()%>" >  <%=tipox.getNombre().trim()%>  </option>
         
         
 
 <%}}%>
 
     </select>

<td>
<%if (usuariox.getTipo()<0)
{  
%>
 <td ><input  type="submit"  name="Aplica" value="Aplica otra Tarifa" onclick="validar();" <%=sestado%> ></td>
<%}%>
</tr>


<tr>
<!--<td><b>Porcentaje De Descuento: </b></td>
<td colspan="2"><input name="Pdescuento"  value="<%=f.format(descuento)%>"  type="text" size="20"  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
%
</td> -->
<td></td><td></td>
<td ><input  type="submit"  name="Calcula" value="Calcular Desc. Tarif."  <%=sestado%> ></td>
</tr>


<tr class="form1">
<th colspan="6" >Pagos </th>
</tr>
<%
int flag = model.getIsNewGF();
if(flag==1){
 if (tipodoc.equals("F") &&  (pagoe+pagoc)==0)
  pagoe=total;
 else if (tipodoc.equals("G") && (pagoc+pagoe)==0)
  pagoc=total;
}
%>
<tr>
<td><b>Flete: </b></td>
<td><input name="Flete" value="<%=f.format(flete)%>" align="right" type="text"  READONLY></td> 
<% if (tipodoc.equals("F"))  
{%> 
<td><b>Retencion:</b></td>
<td><input name="Retencion"  value="<%=f.format(pagor)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
<%}%>
<td><b>Tarifa por Kilo:</b></td>
<td colspan="2"  ><input name="Tarifaxk" value="<%=f.format(total/pesoaux)%>" align="right" type="text"  READONLY><b>Tarifa Neta(<%=f.format(model.tarifa_usable)%>)</b></td> 
</tr>

<tr>
<td><b>In & Out Airport UIO: </b></td>
<td><input name="ImpUIO" value="<%=f.format(ImpUIO)%>" type="text" maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
</td>
<% if (tipodoc.equals("G"))  
{%>
<td><b>Credito:</b></td>
<td><input name="Credito"  value="<%=f.format(pagoc)%>"   type="text" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
<%}%>
</tr>
<tr>
<td><b>In & Out Impuesto GPS: </b></td>
<td><input name="ImpGPS" value="<%=f.format(ImpGPS)%>"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
type="text" maxlength="30" READONLY></td> 
<% if (tipodoc.equals("F"))  
{%>
<td colspan="2"><b>FORMAS DE PAGO</b></td>
<%}%>
</tr>

<!--<tr>
<td><b>Servicio Adicional: </b></td>
<td colspan="2"  ><input name="Sadicional"  value="<%=f.format(sadicional)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>-->

<tr>
<td><b>In & Out Impuesto SCY: </b></td>
<td><input name="ImpSCY"  value="<%=f.format(ImpSCY)%>"   type="text" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
<%--<%= model.detalleOtros %>--%>
</td> 
<% if (tipodoc.equals("F"))  
{%>
<td><b>Efectivo:</b></td>
<td><input name="Efectivo"  value="<%=f.format(pagoe)%>"   type="text" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
<%}%>
</tr>
<tr>
<td><b>Seguro: </b></td>
<td><input name="Seguros"  value="<%=f.format(seguro)%>"    type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td>

<% if (tipodoc.equals("F"))  
{%>
<td><b>Cheque:</b></td>
<td><input name="cheque" id="cheque"  value="<%=f.format(pagocheque)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
<%}%>
<!--<script type="text/javascript">
$('input[type=radio]').change( function() {
    if(this.value=="tcredito"){
//        alert("Tarjeta Credito");  
        $('.tc_fields').show();
    }else{
//        alert("No Tarjeta Credito");
        $('.tc_fields').hide();
    }
});
</script>-->
<%
if(flag==1){
 if (tipodoc.equals("F") &&  (pagoe+pagoc)==0)
  pagoe=total;
 else if (tipodoc.equals("G") && (pagoc+pagoe)==0)
  pagoc=total;
} 
%>


<!--<td><b>Descuentos: </b></td>
<td colspan="2"  ><input name="Descuentos"  value="<%=f.format(vdescuento)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> -->
</tr>



<tr>
<td ><b>Subtotales: </b></td>
<td><input name="Subtotales"  value="<%=f.format(subtotal)%>"   type="text" align="right"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
<%/*%><td ><input  type="submit"  name="Pagos" value="Hacer Pago" onclick="salirsi();"></td><%*/%>
<% if (tipodoc.equals("F"))  
{%>
<td><b>Tarjeta Debito:</b></td>
<td><input name="tDebito" id="tDebito"  value="<%=f.format(pagodeb)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td>
 <td>
     <b>Franquicias:</b>
        <select  name="franquiciasDeb" id="franquiciasDeb" type="text" class='txt-arialimput' disabled="true" >
          <option value="0">-Seleccione-</option>
          <% 
          model.BuscarFranquicias();
          List listf1 = model.getlista();
          if (listf1 != null) {
            Iterator it = listf1.iterator();
            while (it.hasNext()) {
                Franquicias franquicia=(Franquicias) it.next();
                if(franquicia.getIniciales().trim().equals(franquiciasDebC)){
                    %>
                    <option value="<%=franquicia.getIniciales()%>" selected="selected" > <%=franquicia.getNombre_franquicia().trim()%>  </option>
                    <%
                }else{
          %>
            <option value="<%=franquicia.getIniciales()%>" > <%=franquicia.getNombre_franquicia().trim()%>  </option>
          <%}}}%>
        </select>       
        </div>
    </td>
    <td><b>Banco:</b>
        <select  name="bancosDeb" id="bancosDeb" type="text" class='txt-arialimput' disabled="true" >
          <option value="0">-Seleccione-</option>  
          <% 
          model.BuscarBancos();
          List listb1 = model.getlista();
          if (listb1 != null) {
            Iterator it = listb1.iterator();
            while (it.hasNext()) {
                Bancos banco=(Bancos) it.next();
                if(banco.getInciales().trim().equals(bancosDebC)){%>
                <option value="<%=banco.getInciales()%>" selected="selected" > <%=banco.getNombre_banco().trim()%>  </option>
                <%                    
                }else{
          %>
           <option value="<%=banco.getInciales()%>" > <%=banco.getNombre_banco().trim()%>  </option>
          <%}}}%>
        </select>       
        </div>
    </td>
<%}%>
<script type="text/javascript">
$( "#tDebito" ).focusout(function() {
    if(this.value>0.0){
        $("#franquiciasDeb").prop('disabled', false);
        $("#bancosDeb").prop('disabled', false);
        $("#mesDeb").prop('disabled', false);
        $("#anioDeb").prop('disabled', false);
        $("#fourDigDeb").prop('disabled', false);
        $("#numberAuthDeb").prop('disabled', false);
    }
    if(this.value==0){
        $("#franquiciasDeb").prop('disabled', true);
        $("#franquiciasDeb").val( "0" );
        $("#bancosDeb").prop('disabled', true);
        $("#bancosDeb").val( "0" );
        $("#mesDeb").prop('disabled', true);
        $("#mesDeb").val( "0" );
        $("#anioDeb").prop('disabled', true);
        $("#anioDeb").val( "0" );
        $("#fourDigDeb").prop('disabled', true);
        $("#fourDigDeb").val( "" );
        $("#numberAuthDeb").prop('disabled', true);
        $("#numberAuthDeb").val( "" );
    }
});
</script>
</tr>
<tr>
<td><b>Iva: </b></td>
<td colspan="2"><input name="Iva"  value="<%=f.format(iva)%>"  type="text" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td>
<% if (tipodoc.equals("F"))  
{%>
    <td>
        <b>Fecha vencimiento:</b> <br>
        <select  name="mesDeb" id="mesDeb" type="text" class='txt-arialimput' disabled="true" >
          <option value="0">-Seleccione-</option>  
          <%
          for(int i=1;i<13;i++){
              if(i==mesdebC){
                  %>
                  <option value="<%=i%>" selected="selected" > <%=i%>  </option>
                  <%
              }else{  
          %>
          <option value="<%=i%>" > <%=i%>  </option>
          <%           
          }}
          %>
        </select>    
        <select  name="anioDeb" id="anioDeb" type="text" class='txt-arialimput' disabled="true" >
            <option value="0">-Seleccione-</option> 
            <%
            Calendar cal= Calendar.getInstance();
            int year= cal.get(Calendar.YEAR);
            for(int j=year;j<year+10;j++){
                if(j==aniodebC){
                    %>
                    <option value="<%=j%> "selected="selected" > <%=j%>  </option>
                    <%
                }else{ 
            %>
             <option value="<%=j%>" > <%=j%>  </option>
          <%}}%>
        </select>
        <!--<input type="text" name="dateVenDeb" id="dateVenDeb" class='dateVen' type="text" disabled="true"></input>-->
    </td>
    <td><b>Ultimos 4 digitos:</b><input name="fourDigDeb" id="fourDigDeb" value="<%=fourDigDebF%>" type="text" maxlength="4" disabled="true" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></input></td>
    <td><b>Numero Autorizacion:</b><input name="numberAuthDeb" id="numberAuthDeb" value="<%=numberAuthDebF%>" type="text" disabled="true" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></input></td>
<%}%>
</tr>
<tr>
<td><b>totales: </b></td>
<td><input name="totales"  value="<%=f.format(total)%>"   type="text"  align="right"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
<% if (tipodoc.equals("F"))  
{%>
<td><b>Tarjeta Credito:</b></td>
<td><input name="tCredito" id="tCredito"  value="<%=f.format(pagocredito)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td>
    <td>
        <b>Franquicias:</b>    
        <select  name="franquiciasCred" id="franquiciasCred" type="text" class='txt-arialimput' disabled="true" >
          <option value="0">-Seleccione-</option>
          <% 
          model.BuscarFranquicias();
          List listf2 = model.getlista();
          if (listf2 != null) {
            Iterator it = listf2.iterator();
            while (it.hasNext()) {
                Franquicias franquicia=(Franquicias) it.next();   
                if(franquicia.getIniciales().trim().equals(franquiciasCredC)){%>
                    <option value="<%=franquicia.getIniciales()%>" selected="selected" > <%=franquicia.getNombre_franquicia().trim()%>  </option>
          <%  
                }else{    
          %>
            <option value="<%=franquicia.getIniciales()%>" > <%=franquicia.getNombre_franquicia().trim()%>  </option>
          <%}}}%>
        </select>
    </td>
    <td><b>Banco:</b>
        <select  name="bancosCred" id="bancosCred" type="text" class='txt-arialimput'  disabled="true" >
          <option value="0">-Seleccione-</option>
          <% 
          model.BuscarBancos();
          List listb2 = model.getlista();
          if (listb2 != null) {
            Iterator it = listb2.iterator();
            while (it.hasNext()) {
                Bancos banco=(Bancos) it.next();
                if(banco.getInciales().trim().equals(bancosCredC)){
                    %>
                    <option value="<%=banco.getInciales()%>" selected="selected"> <%=banco.getNombre_banco().trim()%>  </option>
                    <%
                }else{   
          %>
           <option value="<%=banco.getInciales()%>" > <%=banco.getNombre_banco().trim()%>  </option>
          <%}}}%>
        </select>
    </td>
<%}%>
<script type="text/javascript">
$( "#tCredito" ).focusout(function() {
    if(this.value>0.0){
        $("#franquiciasCred").prop('disabled', false);
        $("#bancosCred").prop('disabled', false);
        $("#mesCred").prop('disabled', false);
        $("#anioCred").prop('disabled', false);
        $("#fourDigCred").prop('disabled', false);
        $("#numberAuthCred").prop('disabled', false);
    }
    if(this.value==0){
        $("#franquiciasCred").prop('disabled', true);
        $("#franquiciasCred").val( "0" );
        $("#bancosCred").prop('disabled', true);
        $("#bancosCred").val( "0" );
        $("#mesCred").prop('disabled', true);
        $("#mesCred").val( "0" );
        $("#anioCred").prop('disabled', true);
        $("#anioCred").val( "0" );
        $("#fourDigCred").prop('disabled', true);
        $("#fourDigCred").val( "" );
        $("#numberAuthCred").prop('disabled', true);
        $("#numberAuthCred").val( "" );
    }
});
</script>
</tr>

<tr>
<td><b>Obs: </b></td>
<td colspan="2"><textarea name="Observacion" type="text"  cols="50" rows="4"><%=obs.trim()%></textarea></td>
<% if (tipodoc.equals("F"))  
{%>
    <td>
        <b>Fecha vencimiento:</b><br> 
        <!--<input name="dateVenCred" id="dateVenCred" class='dateVen' type="text" data-mask="000 000 000" disabled="true"></input>-->
        <select  name="mesCred" id="mesCred" type="text" class='txt-arialimput' disabled="true" >
          <option value="0">-Seleccione-</option>  
          <%
          for(int i=1;i<13;i++){
               if(i==mescredC){
                   %>
                   <option value="<%=i%>" selected="selected" > <%=i%>  </option>
                   <%
               }else{     
          %><option value="<%=i%>" > <%=i%>  </option>
          <%           
          }}
          %>
        </select>    
        <select  name="anioCred" id="anioCred" type="text" class='txt-arialimput' disabled="true"  >
            <option value="0">-Seleccione-</option> 
            <%
            Calendar cal= Calendar.getInstance();
            int year= cal.get(Calendar.YEAR);
            for(int j=year;j<year+10;j++){
                if(j==aniocredC){
                    %>
                    <option value="<%=j%>" selected="selected" > <%=j%>  </option>
                    <%
                }else{
            %>
             <option value="<%=j%>" > <%=j%>  </option>
          <%}}%>
        </select>
    </td>
    <td><b>Ultimos 4 digitos:</b> <input name="fourDigCred" id="fourDigCred" value="<%=fourDigCredF%>" type="text" maxlength="4" disabled="true" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></input></td>
    <td><b>Numero Autorizacion:</b><input name="numberAuthCred" id="numberAuthCred" value="<%=numberAuthCredF%>" type="text" disabled="true" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></input></td>
<%}%>
</tr>
<tr>

</td>



<tr align="center">
<!--<td align="center">
 <input TYPE="submit"    NAME="Grabar" value="Imprimir" <%=sestado%> >
 </td>-->
  <td align="center">
 <input TYPE="submit"    NAME="ImprimirNuevoFormato" value="ImprimirNuevoFormato"  <%=sestado%> >
 </td>
 <td align="center">
        <input TYPE="submit"    NAME="ImprimirFormato2017" value="ImprimirFormato2017" <%=sestado%> >
 </td>
 <td align="center">
        <input TYPE="submit"    NAME="ImprimirFormatoGYE" value="ImprimirFormatoGYE"  <%=sestado%> >
 </td> 
 <td align="center">
 <input name="salir" value="0" 
type="hidden"  >
 <input  type="submit"  NAME="Salir" value="Salir" onclick="parasalir();">
 </td>
 
<!-- <td align="center">
 <input TYPE="submit"    NAME="ImprimirMec" value="ImprimirMec" <%=sestado%> >
 </td>-->
<script>
function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}
</script>
<script>
function validatePayment() {
    var franquiciasDeb=MantenimientoGuias.franquiciasDeb.value;
    var franquiciasCred=MantenimientoGuias.franquiciasCred.value;
    var tDebito=MantenimientoGuias.tDebito.value;
    var tCredito=MantenimientoGuias.tCredito.value;
    var bancosDeb=MantenimientoGuias.bancosDeb.value;
    var mesDeb=MantenimientoGuias.mesDeb.value;
    var anioDeb=MantenimientoGuias.anioDeb.value;
    var fourDigDeb=MantenimientoGuias.fourDigDeb.value;
    var numberAuthDeb=MantenimientoGuias.numberAuthDeb.value;
    var bancosCred=MantenimientoGuias.bancosCred.value;
    var mesCred=MantenimientoGuias.mesCred.value;
    var anioCred=MantenimientoGuias.anioCred.value;
    var fourDigCred=MantenimientoGuias.fourDigCred.value;
    var numberAuthCred=MantenimientoGuias.numberAuthCred.value;
    var Cheque=MantenimientoGuias.cheque.value;
    var Efectivo=MantenimientoGuias.Efectivo.value;
    var Retencion=MantenimientoGuias.Retencion.value;
    var totales= MantenimientoGuias.totales.value;
    
    if(tDebito>0){
        if (franquiciasDeb=="0")
        {
            alert( "Seleccione una Franquicia para la tarjeta de Debito " );
            return false;
        }
        if(bancosDeb=="0"){
            alert("Seleccione un banco para el cobro de tarjeta de Debito");
            return false;
        }
        if(mesDeb=="0" || anioDeb=="0"){
            alert("Ingrese una fecha de vencimiento para la tarjeta de Debito");
            return false;
        }
        if(fourDigDeb==null||fourDigDeb==""){
            alert("Ingrese los ultimos 4 numeros de la tarjeta de Debito");
            return false;
        }
        if(fourDigDeb.length<4){
            alert("Ingrese los ultimos 4 numeros de la tarjeta de Debito");
            return false
        }
        if(numberAuthDeb=null||numberAuthDeb==""){
            alert("Ingrese el numero de autorizacion de Debito generado por el POS");
            return false;
        }
    }
    if(tCredito>0){
        if (franquiciasCred=="0")
        {
            alert( "Seleccione una Franquicia para la tarjeta de Credito " );
            return false;
        }
        if(bancosCred=="0"){
            alert("Seleccione un banco para el cobro de tarjeta de Credito");
            return false;
        }
        if(mesCred=="0" || anioCred=="0"){
            alert("Ingrese una fecha de vencimiento para la tarjeta de Credito");
            return false;
        }
        if(fourDigCred==null||fourDigCred==""){
            alert("Ingrese los ultimos 4 numeros de la tarjeta de Credito");
            return false;
        }
        if(fourDigCred.length<4){
            alert("Ingrese los ultimos 4 numeros de la tarjeta de Credito");
            return false
        }
        if(numberAuthCred=null||numberAuthCred==""){
            alert("Ingrese el numero de autorizacion de Credito generado por el POS");
            return false;
        }
    }
    
    var montoTemp = 0.00;
        if(Efectivo>0){
            montoTemp=montoTemp+parseFloat(Efectivo);}
        if(Retencion>0){
            montoTemp=montoTemp+parseFloat(Retencion);}
        if(Cheque>0){
            montoTemp=montoTemp+parseFloat(Cheque);}
        if(tCredito>0){
            montoTemp=montoTemp+parseFloat(tCredito);}
        if(tDebito>0){
            montoTemp=montoTemp+parseFloat(tDebito);}
        //alert("cheque: "+Cheque+ " Efectivo: "+Efectivo+" Retencion:"+Retencion+" tCredito: " +tCredito+" tDebito: "+tDebito+" TOTAL: "+totales+" suma: "+montoTemp);
        //alert("monto tempo: " + montoTemp);
        //alert("TOTAL: " + roundToTwo(totales));
        if(roundToTwo(montoTemp)<roundToTwo(totales)){
            alert("Debe asignar todo el monto en las diferentes formas de pago");
            return false;
        }
        if(roundToTwo(montoTemp)>roundToTwo(totales)){
            alert("El monto a pagar no debe exceder el total calculado");
            return false;
        }
        
    return true;
}
</script>

 
 
 </tr>
 </form>
</table>
</td>

<td valign="top" align="left" width="70%">

</td>
</tr>
</table>

<SCRIPT language="JavaScript 1.2" type="text/javascript">

function trim(cadena) 
{ 
    for(i=0; i<cadena.length; ) 
    { 
        if(cadena.charAt(i)==" ") 
            cadena=cadena.substring(i+1, cadena.length); 
        else 
            break; 
    } 

    for(i=cadena.length-1; i>=0; i=cadena.length-1) 
    { 
        if(cadena.charAt(i)==" ") 
            cadena=cadena.substring(0,i); 
        else 
            break; 
    } 
     alert(cadena);
    document.MantenimientoGuia.peso.value=cadena; 
} 


var ajaxBalanza;




function balanzas()

    {
      var xz;
     xz=eval("document.MantenimientoGuias.lee.checked");
       
  if (xz==1 )
  {          
        
    
    // Creamos el control XMLHttpRequest segun el navegador en el que estemos
    if( window.XMLHttpRequest )
        ajaxBalanza = new XMLHttpRequest(); // No Internet Explorer
    else
        ajaxBalanza = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer

    // Almacenamos en el control al funcion que se invocara cuando la peticion
    
    
   
   
    ajaxBalanza.onreadystatechange = function()
                           {
    // Comprobamos si la peticion se ha completado (estado 4)
       
                           if( ajaxBalanza.readyState == 4 )
                            {
                             
                             
     // Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
                           
                           if( ajaxBalanza.status == 200 )
                            {
                                
                              //  x=ajaxBalanza.responseText
                          
                                document.MantenimientoGuias.peso.value=ajaxBalanza.responseText;
                              // trim(x);
                               
                                
                                }
                             else
                                {
                                 
                                document.MantenimientoGuias.peso.value=ajaxBalanza.responseText;
                    
                                }
                            }
                                else
                             {
                                    document.MantenimientoGuias.peso.value="....";
                
               
                                  }
                           }
    
    
    
    var tiempo=new Date().getTime();    
    // Enviamos la peticion
        


    
    ajaxBalanza.open( "GET",'<%=CONTROLLER%>/Consulta/Peso?ms='+tiempo,true );

    ajaxBalanza.send( "" );
        
    
   }  
    }

</SCRIPT>  


<script language="JavaScript" type="text/javascript">
   
  MantenimientoGuias.Cliente.options.value="<%=cliente%>"
  MantenimientoGuias.Destino.options.value="<%=Destino%>"
  MantenimientoGuias.Transito.options.value="<%=Transito%>"  
  MantenimientoGuias.Tipot.options.value="<%=tipotar%>"
  MantenimientoGuias.Entregaen.options.value="<%=entregaen%>"
   
   var n= MantenimientoGuias.Transito.options.length;
  
  var options= MantenimientoGuias.Transito.options;
    for (var i= 0;  i<n; i++) {
        if (options[i].value==="<%=Transito%>") {
            MantenimientoGuias.Transito.selectedIndex = options[i].index;
            break;
        }
    }

</script>


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


