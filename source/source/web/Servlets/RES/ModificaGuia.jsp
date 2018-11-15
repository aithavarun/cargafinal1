<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>





<%@ include file="/WEB-INF/Banner.jsp"%>  
<%DecimalFormat f =new DecimalFormat("0.00");%>
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
float pagocanje=0;
float mindescuento=0;
String ruc="";
String telefono="";
String obs="XXX";
String tipo=""; 
String direccion="";
int tipot=1;
int hora=0;
int minutos=0;
int entregaen=0;

java.util.Date mifecha;
java.util.Date mifechar;

//List listcx = model.getClientesCarga();

List listcx=model.getDescuentosc();
List list = model.getGuiasLista();
List list1=model.getVueloreserva();
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
          pesov=guia.getPesov();
          seguro=guia.getSeguro();
          ruc=guia.getRuc();
          telefono=guia.getTelefono();
          iva=guia.getIva();
          obs=guia.getObservacion();
          subtotal=flete+sadicional+seguro+edomicilio+tadicional;
          
          total=guia.getTotal();
          hora=guia.getHora();
          minutos=guia.getMinutos();
          cliente=guia.getCodcliente();
          tipot=guia.getTipo();
          direccion=guia.getDireccion();
          entregaen=guia.getEntregaen();
          
      }
 }



if (list1 != null) {
      Iterator itx = list1.iterator();
      while (itx.hasNext()) {
          Vuelosreserva vuelo=(Vuelosreserva) itx.next();
          Origen= vuelo.getOrigen();
          Destino=vuelo.getDestino();
          Nvuelo=vuelo.getNumero();
          mifecha=vuelo.getFecha();
          inicio.setTime(mifecha);
          mes =inicio.get(Calendar.MONTH)+1;
          anio=inicio.get(Calendar.YEAR);
          dia=inicio.get(Calendar.DATE);
          
          
          
          
      }
 }



if (listcx!=null)
    {
     Iterator itcx = listcx.iterator();
     while (itcx.hasNext())
         {
          Descuentosc descuentosc=(Descuentosc) itcx.next();
          //Clientesc clientescx=(Clientesc) itcx.next();
            if (descuentosc.getOrigen().equals(Origen) && descuentosc.getDestino().equals(Destino) && pesov > descuentosc.getMindescuento())
             {
              descuento=descuentosc.getDescuento();
              mindescuento=descuentosc.getMindescuento();
              vdescuento= (subtotal *(descuento/100)); 
              subtotal=subtotal-vdescuento;
              
             }
         }
    }





if (list2 != null) {
      Iterator it2 = list2.iterator();
     
      while (it2.hasNext()) {
          Pagosc pagosc=(Pagosc) it2.next();
          tipo=pagosc.getTipo().trim();
          
          if (tipo.equals("EF"))
               pagoe=pagosc.getValor();
          else if(tipo.equals("CR"))
               pagoc=pagosc.getValor();
          else if (tipo.equals("CJ"))
               pagocanje=pagosc.getValor();
               
   
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



</SCRIPT>
<SCRIPT language="JavaScript 1.2" type="text/javascript">
  

      
</SCRIPT>
<table width="100%" align="left">
<tr>



<td valign="top" width="50%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/GuiaCarga/Modificar"  
name="MantenimientoGuias" onSubmit="return validar(this)" 
>
<tr>
<th colspan="6" >Modifica Guia de Carga</th> 
</tr>
<% String error=model.getError();
String color="FFFFCC";
if (error !=null)
{%>
<tr class="error">
<th colspan="6" ><%=error%></th>
</tr>
<%}%>
<tr class="form1">
<th colspan="6" >¿DATOS DEL VUELO?</th>
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
<td><input name="Destino" value="<%=Destino%>" type="text" size="3"  maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();"></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);poneorigen();"></td> 
----------------%>
<td><b>No. Vuelo </b></td>
<input name="codigo" type= "hidden"   value="<%=codigo%>"><td>
<td><input name="Numero"  type="text" value="<%=Nvuelo%>"  size="5"  maxlength="10">

</td> 
</tr>
<tr bgcolor="<%=color%>">
<td><b>Mes: </b></td>
<td><input name="Mes" value="<%=mes%>" type="text" size="2" maxlength="2" 
onChange="vermestexto(this.form.Mes.value, this.form.Anio.value);"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td><b>D&iacute;a: </b></td>
<td><input name="Dia" value="<%=dia%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<td><b>A&ntilde;o: </b></td>
<td><input name="Anio" value="<%=anio%>" type="text" size="4" maxlength="4" 
onChange="vermestexto(this.form.Mes.value, this.form.Anio.value);"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
<TD>
<A HREF="javascript:ventana1('Consulta',1);">Mostrar Vuelos</A>
</td>
</tr>
<%}%>

<%---------------
--%>
<tr class="form1">
<th colspan="6" >GUIA DE CARGA </th>
</tr>

<tr>
<th colspan="6" >Datos De Recepcion:</th>
</tr>


<tr>
<td><b> Cliente : </b></td>
<td><select  name="Cliente" type="text" class='txt-arialimput'>
<option value="-1">->Seleccione un Cliente<-</option>
<%
 model.BuscarClientesCarga_sinEliminados();
 List listc = model.getClientesCarga();
 
 if (listc != null) {
      Iterator itc = listc.iterator();
      while (itc.hasNext()) {
          Clientesc clientec=(Clientesc) itc.next();
          //Sucursales sucursal=(Sucursales) it.next();
      
          %>
          
         <option value=<%=clientec.getCodigo()%> > <%=clientec.getNombre()%>   </option>
         
 
 <%}}%>
 
     </select>

<td>

</tr>


<tr>

<td><b> Numero de Guia:</b></td><td><input name= "Nguia" id="Nguia" value="<%=numerog%>" type="text"  size="10" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY> 
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
</tr>



<tr>
<td><b>Piezas: </b>
</td><td>
<input name="piezas" value="<%=piezas%>"  type="text" size="2" maxlength="8" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td><b>Peso: </b>
</td><td>
<input name="peso"  value="<%=f.format(peso)%>"  type="text" size="2" maxlength="8" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td><b>Peso Por Volumen: </b>
</td><td>
<input name="pesovolumen"  value="<%=f.format(pesov)%>"  type="text" size="2" maxlength="8" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td ><input  type="submit"  name="Calcula" value="Calcular Desc. Tarif." onclick="salirsi();"></td>

</tr>



<tr>
<td><b>Contiene: </b></td>
<td >
<input name="Contiene" value="<%=contiene%>" type="text" size="30" maxlength="30" >
</td>
</tr>
<tr>
<td><b>Remitente: </b></td>
<td >
<input name="Remitente" value="<%=remitente%>" type="text" size="30" maxlength="30" >
</td>


<td><b>Destinatario: </b></td>
<td colspan="2">
<input name="Destinatario" value="<%=destinatario%>" type="text" size="30" maxlength="30" >
</td>
</tr>


<tr>
<td><b>Ruc: </b></td>
<td >
<input name="Ruc" value="<%=ruc%>" type="text" size="30" maxlength="30" >
</td>


<td><b>Telefono: </b></td>
<td colspan="2">
<input name="Telefono" value="<%=telefono%>" type="text" size="30" maxlength="30" >
</td>
</tr>



<TR>
<td ><b>Direccion: </b></td>
<td colspan="2"> <input name="Direccion" value="<%=direccion%>" type="text" size=50" maxleng="100" >
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
<td><b> Tipo : </b></td>
<td><select  name="Tipo" type="text" class='txt-arialimput'   >


          
         <option value=1 > Tarifa Normal  </option>
         
         <option value=2 > Tarifa Perecible  </option>
 
 
     </select>

<td>

</tr>


<tr>
<td><b>Porcentaje De Decuento: </b></td>
<td colspan="2"><input name="Pdescuento"  value="<%=f.format(descuento)%>"  type="text" size="20"  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
%
</td> 
</tr>


<tr class="form1">
<th colspan="6" >Pagos </th>
</tr>

<tr>
<td><b>Flete: </b></td>
<td colspan="2"  ><input name="Flete" value="<%=f.format(flete)%>" align="right" type="text" size="20"  READONLY></td> 
</tr>

<tr>
<td><b>Entrega Domicilio: </b></td>
<td colspan="2"><input name="Edomicilio" value="<%=f.format(edomicilio)%>" type="text" size="20"  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
*</td> 
</tr>
<tr>
<td><b>Transp Adicional: </b></td>
<td colspan="2"><input name="Tadicional" value="<%=f.format(tadicional)%>"
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
type="text" size="20"  maxlength="30">*</td> 
</tr>

<tr>
<td><b>Servicio Adicional: </b></td>
<td colspan="2"  ><input name="Sadicional"  value="<%=f.format(sadicional)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>


<tr>
<td><b>Seguros: </b></td>
<td colspan="2"  ><input name="Seguros"  value="<%=f.format(seguro)%>"    type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>

<tr>
<td><b>Descuentos: </b></td>
<td colspan="2"  ><input name="Descuentos"  value="<%=f.format(vdescuento)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
<td><b>Efectivo:</b></td>
<td colspan="2"  ><input name="Efectivo"  value="<%=f.format(pagoe)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
</tr>



<tr>
<td><b>Subtotales: </b></td>
<td colspan="2"  ><input name="Subtotales"  value="<%=f.format(subtotal)%>"   type="text" size="20" align="right"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
<td><b>Credito:</b></td>
<td colspan="2"  ><input name="Credito"  value="<%=f.format(pagoc)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
<td ><input  type="submit"  name="Pagos" value="Hacer Pago" onclick="salirsi();"></td>
</tr>




<tr>
<td><b>Iva: </b></td>
<td colspan="2"  ><input name="Iva"  value="<%=f.format(iva)%>"  type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
<td><b>Canje:</b></td>
<td colspan="2"  ><input name="Canje"  value="<%=f.format(pagocanje)%>"   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td> 
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
 <input TYPE="submit"    NAME="Grabar" value="Imprimir" onclick="nosalir();">
 </td>
 
 <td align="center">
 <input name="salir" value="0" 
type="hidden"  >
 <input  type="submit"  NAME="Salir" value="Salir" onclick="salirsi();">
 </td>
 </tr>
 </form>
 
</table>
</td>

<td valign="top" align="left" width="70%">
<table width="50%"  >
<%@ include file="/WEB-INF/Calendario.jsp"%>

</table>
<%------------
<table width="100%"  >
<%@ include file="/Servlets/VistaItinerario.jsp"%>

</table>
<%-----------------------------%>
</td>
</tr>
</table>

<SCRIPT language="JavaScript 1.2" type="text/javascript">
  
    function ventana1(nombre,k){
    
        function Is() {
    var agent = navigator.userAgent.toLowerCase();
    this.ns = (navigator.appName == "Netscape");
    this.ie = (navigator.appName == "Microsoft Internet Explorer");
        }

var is = new Is();
var mes=eval("document.MantenimientoGuias.Mes");
var dia=eval("document.MantenimientoGuias.Dia");
var anio=eval("document.MantenimientoGuias.Anio");
var origen=eval("document.MantenimientoGuias.Origen");
var destino=eval("document.MantenimientoGuias.Destino");
var abrir="<%=CONTROLLER%>/Reservaciones/"+nombre+"?Mes="+mes.value+"&Dia="+dia.value+"&Anio="+anio.value+"&Origen="+origen.value+"&Destino="+destino.value;
    if(is.ie) {
        
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )

        } 
    else if(is.ns) {
	var obj = window.open( abrir, "","SCROLLBARS=yes,WIDTH=400,HEIGHT=300,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )

    }
   
}


      
</SCRIPT>

<script language="JavaScript" type="text/javascript">
   MantenimientoGuias.Cliente.options.value="<%=cliente%>"
   MantenimientoGuias.Tipo.options.value="<%=tipot%>"
   MantenimientoGuias.Entregaen.options.value="<%=entregaen%>"
</script>

<script LANGUAGE="JavaScript"> 
 var mmes=eval("document.MantenimientoGuias.Mes");
  var manio=eval("document.MantenimientoGuias.Anio");
  var mmess=mmes.value;
 
 var manios=manio.value;
vermestexto(mmess,manios);
 mmes=eval("document.MantenimientoGuias.Origen");
  manio=eval("document.MantenimientoGuias.Destino");
 mmess=mmes.value;
 
 manios=manio.value;

//veritinerariotexto(mmess,manios);

</SCRIPT>  

<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


