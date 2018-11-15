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

//List listcx = model.getClientesCarga();

//List listcx=model.getClientesCarga();
List list = model.getGuiasLista();
//List list1=model.getVueloreserva();
List list2=model.getPagosCarga();


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
          tipotar=guia.getTipotar();
          direccion=guia.getDireccion();
          entregaen=guia.getEntregaen();
          Origen= guia.getOrigen();
          Destino=guia.getDestino();
          Transito=guia.getTransito();
          vdescuento=guia.getDescuento();
          descuento=guia.getDescuentop();
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

/*
    if (listcx!=null)
    {
     Iterator itcx = listcx.iterator();
     while (itcx.hasNext())
         {
          
          Clientesc clientec=(Clientesc) itcx.next();
          
                            
          
          
         if (String.valueOf(clientec.getDiagratis()).contains(String.valueOf(midia)) &&  pesov< clientec.getGratisHasta())
          {
              descuento=100;
              vdescuento= (subtotal *(descuento/100)); 
              subtotal=subtotal-vdescuento;
              
          }
          
          
              
              
         }
  
  
}

*/


if (list2 != null) {
      Iterator it2 = list2.iterator();
     
      while (it2.hasNext()) {
          Pagosc pagosc=(Pagosc) it2.next();
          tipo=pagosc.getTipo().trim();
          
          if (tipo.equals("EF"))
               pagoe=pagosc.getValor();
          else if(tipo.equals("CR"))
               pagoc=pagosc.getValor();
          else if(tipo.equals("RT"))     
               pagor=pagosc.getValor();
      }
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

function validar(){ 
    var origen=eval("document.MantenimientoGuias.Origen.value");
    var destino=eval("document.MantenimientoGuias.Destino.value"); 
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

</SCRIPT>

<SCRIPT>

function parasalir()
  {
    
    MantenimientoGuias.salir.value=1;
    
  }
  
</SCRIPT>

<table width="100%" align="left">
<tr>



<td valign="top" width="50%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/GuiaCarga/Modificar"  

name="MantenimientoGuias" onSubmit="return validar(this)"  >
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
 model.BuscarCiudades();
 List listc = model.getCiudades();
 if (list != null) {
      Iterator itc = listc.iterator();
      while (itc.hasNext()) {
          Ciudades ciudad=(Ciudades) itc.next();
      
          %>
          
         <option value="<%=ciudad.getCodigo()%>" > <%=ciudad.getNombre().trim()%>  </option>
         
 
 <%}}%>
 
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
 
 if (listc != null) {
      Iterator itc = listc.iterator();
      while (itc.hasNext()) {
          Clientesc clientec=(Clientesc) itc.next();
                
          %>
          
         <option value=<%=clientec.getCodigo()%> > <%=clientec.getNombre()%>   </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>


<tr>
<% if (tipodoc.equals("F"))  
{%> 
 <td><b> Numero de Factura:</b></td><td><input name= "Nguia" id="Nguia" value="<%=numerog%>" type="text"  size="10" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY> 
<%}
else
{  
%>
 <td><b> Numero de Guia:</b></td><td><input name= "Nguia" id="Nguia" value="<%=numerog%>" type="text"  size="10" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY> 
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

<td><b>Telefono Rem.: </b></td>
<td >
<input name="Telefono" value="<%=telefono%>" type="text" size="15" maxlength="20" >
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
<td><b>Porcentaje De Descuento: </b></td>
<td colspan="2"><input name="Pdescuento"  value="<%=f.format(descuento)%>"  type="text" size="20"  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
%
</td> 
<td ><input  type="submit"  name="Calcula" value="Calcular Desc. Tarif."  <%=sestado%> ></td>
</tr>


<tr class="form1">
<th colspan="6" >Pagos </th>
</tr>

<tr>
<td><b>Flete: </b></td>
<td colspan="2"  ><input name="Flete" value="<%=f.format(flete)%>" align="right" type="text" size="20"  READONLY></td> 
<td><b>Tarifa por Kilo:</b></td>
<td colspan="2"  ><input name="Tarifaxk" value="<%=f.format(total/pesoaux)%>" align="right" type="text" size="20"  READONLY><b>Tarifa Neta(<%=f.format(model.tarifa_usable)%>)</b></td> 
</tr>

<tr>
<td><b>Entrega Domicilio: </b></td>
<td colspan="2"><input name="Edomicilio" value="<%=f.format(edomicilio)%>" type="text" size="20"  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
</td> 
</tr>
<tr>
<td><b>Transp Adicional: </b></td>
<td colspan="2"><input name="Tadicional" value="<%=f.format(tadicional)%>"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
type="text" size="20"  maxlength="30" READONLY></td> 
</tr>

<tr>
<td><b>Servicio Adicional: </b></td>
<td colspan="2"  ><input name="Sadicional"  value="<%=f.format(sadicional)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>

<tr>
<td><b>Otros: </b></td>
<td colspan="2"  ><input name="Otros"  value="<%=f.format(otros)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>


<tr>
<td><b>Seguros: </b></td>
<td colspan="2"  ><input name="Seguros"  value="<%=f.format(seguro)%>"    type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>

<%
 if (tipodoc.equals("F"))
  pagoe=total;
 else if (tipodoc.equals("G"))
  pagoc=total;
 
%>


<tr>
<td><b>Descuentos: </b></td>
<td colspan="2"  ><input name="Descuentos"  value="<%=f.format(vdescuento)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 


<% if (tipodoc.equals("F"))  
{%> 
<td><b>Efectivo:</b></td>
<td colspan="2"  ><input name="Efectivo"  value="<%=f.format(pagoe)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
<%}%>
</tr>



<tr>
<td><b>Subtotales: </b></td>
<td colspan="2"  ><input name="Subtotales"  value="<%=f.format(subtotal)%>"   type="text" size="20" align="right"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
<td><b>Credito:</b></td>
<td colspan="2"  ><input name="Credito"  value="<%=f.format(pagoc)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
<%/*%><td ><input  type="submit"  name="Pagos" value="Hacer Pago" onclick="salirsi();"></td><%*/%>
</tr>




<tr>
<td><b>Iva: </b></td>
<td colspan="2"  ><input name="Iva"  value="<%=f.format(iva)%>"  type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
<% if (tipodoc.equals("F"))  
{%> 
<td><b>Retencion:</b></td>
<td colspan="2"  ><input name="Retencion"  value="<%=f.format(pagor)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
<%}%>
</tr>


<tr>
<td><b>totales: </b></td>
<td colspan="2"  ><input name="totales"  value="<%=f.format(total)%>"   type="text" size="20" align="right"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>

<tr>
<td><b>Obs: </b></td>
<td colspan="5"><textarea name="Observacion" type="text"  cols="80" rows="2"><%=obs.trim()%></textarea></td>
</tr>
<tr>

</td>



<tr align="center">
<td align="center">
 <input TYPE="submit"    NAME="Grabar" value="Imprimir" <%=sestado%> >
 </td>
 
 <td align="center">
 <input name="salir" value="0" 
type="hidden"  >
 <input  type="submit"  NAME="Salir" value="Salir" onclick="parasalir();">
 </td>
 
 <td align="center">
 <input TYPE="submit"    NAME="ImprimirMec" value="ImprimirMec" <%=sestado%> >
 </td>
 
 
 </tr>
 </form>
 
</table>
</td>

<td valign="top" align="left" width="70%">

</td>
</tr>
</table>



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


