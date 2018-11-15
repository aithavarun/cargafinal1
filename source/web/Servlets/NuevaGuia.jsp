<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>


<%@ include file="/WEB-INF/Banner.jsp"%>  
<%DecimalFormat f =new DecimalFormat("00");%>

<%

String Origenr=request.getParameter("Origenr");
String Destinor=request.getParameter("Destinor");
String Numeror=request.getParameter("Numeror");
String Mesr=request.getParameter("Mesr");
String Anior=request.getParameter("Anior");
String Diar=request.getParameter("Diar");

String Mest=request.getParameter("Mest");
String Aniot=request.getParameter("Aniot");
String Diat=request.getParameter("Diat");

String Horat=request.getParameter("Horat"); 
String Minutost=request.getParameter("Minutost");


String Pax=request.getParameter("Pax");


String Nombre=request.getParameter("Nombre");
String Quiens=request.getParameter("Quiens");
String Telefono=request.getParameter("Telefono");
String Obs=request.getParameter("Obs");

String serie="";
String morigen=usuario.getSucursal().substring(0, 3);

model.BuscarSucursal(usuario.getSucursal());
List listsu = model.getSucursales();
 if (listsu != null) {
      Iterator itsu = listsu.iterator();
      while (itsu.hasNext()) {
          Sucursales sucursal=(Sucursales) itsu.next();
          serie=sucursal.getSerie();
          
      }
 }



long numguia=model.consultarGuiaFacturaPorSucursal(serie,"G");

int estado=0;
int k=0;

Calendar hoy = Calendar.getInstance();
int dia=hoy.get(Calendar.DATE);
int mes=hoy.get(Calendar.MONTH)+1;
int anio=hoy.get(Calendar.YEAR);
int hora=hoy.get(Calendar.HOUR_OF_DAY);
int minutos=hoy.get(Calendar.MINUTE);

long numero=0;

if (Diar==null)
    Diar=String.valueOf(dia);
if (Mesr==null)
    Mesr=String.valueOf(mes);
if (Anior==null)
    Anior=String.valueOf(anio);

if (Diat==null)
    Diat=String.valueOf(dia);
if (Mest==null)
    Mest=String.valueOf(mes);
if (Horat==null)
    Horat="12";
if (Minutost==null)
    Minutost="00";
if (Aniot==null)
    Aniot=String.valueOf(anio);


if (Numeror==null)
    Numeror="";
if (Origenr==null)
    Origenr="";
if (Destinor==null)
    Destinor="";

if (Pax==null)
    Pax="1";




if (Nombre==null)
    Nombre="";

if (Quiens==null)
    Quiens="";
if (Telefono==null)
    Telefono="";

if (Obs==null)
    Obs="";


%>
 
<script LANGUAGE="JavaScript"> 

ahora       = new Date();

ahoraDay    = ahora.getDate();

ahoraMonth  = ahora.getMonth()+1;

ahoraYear   = ahora.getYear();



function validar(){ 
    var miindice=eval("document.MantenimientoGuia.Cliente.options.value");
    var origen=eval("document.MantenimientoGuia.Origen.value");
    var destino=eval("document.MantenimientoGuia.Destino.value");
    
    var Contiene=MantenimientoGuia.Contiene.value;
    var Remitente=MantenimientoGuia.Remitente.value;
    var Destinatario=MantenimientoGuia.Destinatario.value;
    var Telefono=MantenimientoGuia.Telefono.value;
    var Salir=MantenimientoGuia.salir.value;
    var Numfacturaguia=MantenimientoGuia.Nguia.value;
    var Mipeso=MantenimientoGuia.peso.value;
    var Mdireccion=MantenimientoGuia.Direccion.value;
    
    
    if (Salir=="0")
    {
    if (miindice=="-1")
    
       {
            alert( "Seleccione un Cliente " );
            return false;
        }
    
   if (Numfacturaguia=="0" ||  Numfacturaguia=="")  
   
       {
            alert( "El Numero de Guia es Obligatorio, por favor solicite una nueva secuencia"  );
            return false;
        }
        
   
   if (Mipeso=="0" ||  Mipeso=="")  
   
       {
            alert( "El Peso es Obligatorio" );
            return false;
        }
        
 
   if (origen==destino)
       {
            alert( "El Destino no puede ser igual al Origen" );
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
    
    MantenimientoGuia.salir.value=1;
    
  }
  
</SCRIPT>


<table width="100%" align="left">

<tr class="form1">
<th colspan="6" >GUIA DE CARGA </th>
</tr>



<tr>
<td valign="top" width="50%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/GuiaCarga/Grabar"  
name="MantenimientoGuia" onSubmit="return validar(this)" 
>

<td>
                <b> Mes:</b></td><td><input name= "Mese" id="Mese" value="<%=mes%>"  type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
                
           
</td>
<td>
                <b> Dia:</b></td><td><input name= "Diae" id="Diae" value="<%=dia%>"  type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
              
</td>
<td>
                <b>Anio:</b></td><td><input name= "Anioe" id="Anioe" value="<%=anio%>"  type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
            
</td>

</tr>


<tr>
 <td>
     <b> Hora:</b></td><td><input name= "Hora" id="Minutos" value="<%=hora%>"  type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" > 
 </td>
 <td>
     <b> Minutos:</b></td><td><input name= "Minutos" id="Minutos" value="<%=minutos%>"  type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >   
 </td>
 
 <td><b>GUIA DE REMISION</b></td>
<td><input name="Tipo" value="G" type="text" size="1"  maxlength="1" READONLY ></td> 
</tr>

<tr>
<th colspan="6" >Nueva Guia de Carga</th>
</tr>
<tr>

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

if (color.equals("FFFFCC"))
   color="CCFFFF";
else
   color="FFFFCC"; 
%>
<tr>

</tr>
<tr bgcolor="<%=color%>">
<td>

<b>de: (Origen)</b></td>
<td><input name="Origen" value="<%=morigen%>" type="text" size="3"  maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();"></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);ponedestino();"></td> 
----------------%>
<td><b>a: (Destino)</b></td>
<%/*%>
<td><input name="Destino" value="" type="text" size="3"  maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();" ></td> 
<%*/%>

<td><select  name="Destino" type="text" class='txt-arialimput' onchange="igualat();">
<%
 model.BuscarCiudades();
 List list = model.getCiudades();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Ciudades ciudad=(Ciudades) it.next();
      
          %>
          
         <option value="<%=ciudad.getCodigo()%>" > <%=ciudad.getNombre().trim()%>  </option>
         
 
 <%}}%>
 
     </select>

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

<%}%>
</tr>


<%-----------------%>

<tr>
<th colspan="6" >Datos De Recepcion:</th>
</tr>


<tr>
<td><b> Cliente : </b></td>
<td><select  name="Cliente" type="text" class='txt-arialimput' onchange="iguala1();">  

<option value=-1      </option>
        
<%
 model.BuscarClientesCarga_sinEliminados("CR");
 List list = model.getClientesCarga();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Clientesc clientec=(Clientesc) it.next();
                
          %>
          
         <option value=<%=clientec.getCodigo()%> > <%=clientec.getNombre() %>  </option>
         
 
 <%}}%>
 
     </select>

<td>

<td><b> Ruc : </b></td>
<td>
<select  name="MRUC" type="text" class='txt-arialimput' onchange="iguala2();">  
 <option value=-1      </option>
<%
if (list !=null) {
     Iterator itx=list.iterator();
while (itx.hasNext()) {
          Clientesc clientecx=(Clientesc) itx.next();
         %>        
          <option value=<%=clientecx.getCodigo()%> > <%=clientecx.getRuc() %>  </option>
         
 
 <%}}%>
</select>

<DIV id="DivTag" style = "position:absolute; left:0cm; top:0cm; width:400; visibility:hidden; " >

<select  name="MTELEFONO" type="text" class='txt-arialimput'   >  
 <option value=-1      </option>
<%
if (list !=null) {
     Iterator itx=list.iterator();
while (itx.hasNext()) {
          Clientesc clientecx=(Clientesc) itx.next();
         %>        
          <option value=<%=clientecx.getCodigo()%> > <%=clientecx.getTelefono() %>  </option>
         
 
 <%}}%>
</select>

</DIV>

<td>
</tr>



<tr>
<td><b>Numero de Guia: </b></td><td><input name= "Serie" id="Serie" value="<%=serie%>" size="7" maxlength="7" readonly>  
    <input name= "Nguia" id="Nguia" value="<%=numguia%>"  type="text" readonly> 
</tr>



<tr>
<td><b>Piezas: </b>
</td><td>
<input name="piezas" value=1  type="text" size="2" maxlength="8" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>

<td><b>Peso: </b>
</td><td>
<input name="peso"  value=0  type="text" size="8" maxlength="8" onKeypress="if (event.keyCode < 46 || event.keyCode > 57) event.returnValue = false;">
<B>BALANZA<B> <input name="lee" type="checkbox"   onclick="balanzas();" ></TD>

<td><b>Peso Por Volumen: </b>
</td><td>
<input name="pesovolumen"  value=0  type="text" size="8" maxlength="8" onKeypress="if (event.keyCode < 46 || event.keyCode > 57) event.returnValue = false;">
</td>



</tr>

<tr>
<td><b>Contiene: </b></td>
<td >
<input name="Contiene" value="" type="text" size="30" maxlength="30" onChange="javascript:this.value=this.value.toUpperCase();">
</td>
</tr>

<tr>
<td><b>Remitente: </b></td>
<td >
<input name="Remitente" value="" type="text" size="30" maxlength="30" onChange="javascript:this.value=this.value.toUpperCase();">
</td>


<td><b>RUC/CI Rem.: </b></td>
<td >
<input name="Ruc" value="" type="text" size="30" maxlength="30" >
</td>

<td><b>Telefono(Direccion)Rem: </b></td>
<td >
<input name="Telefono" value="" type="text" size="30" maxlength="60" >
</td>

</tr>

<tr>
<td><b>Destinatario: </b></td>
<td >
<input name="Destinatario" value="" type="text" size="30" maxlength="30" onChange="javascript:this.value=this.value.toUpperCase();">
</td>
<td ><b>Direccion Dest.: </b></td>
<td colspan="2"> <input name="Direccion" value="" type="text" size=50" maxleng="100" onChange="javascript:this.value=this.value.toUpperCase();" >
</td>
</tr>

<tr>
<td><b> Para Entrega En : </b></td>
<td><select  name="Entregaen" type="text" class='txt-arialimput' onchange="entregaen();"  >

        <option value=3 > Aeropuerto  </option> 
       
        <option value=1 > Domicilio  </option>
         
        <option value=2 > Oficina  </option>
     
 
     </select>

<td>
</tr>



<tr>
<!--<td><b>Porcentaje De Descuento: </b></td>
<td colspan="2"><input name="Pdescuento" value=0 type="text" size="20"  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
</td> -->
<td></td><td></td>
<TD><B>ENTREGA DOMICILIO<B>
<input type="checkbox" name="Tranporte" value="0"  onclick="adicional();" />
</TD>

<td ><input  type="submit"  name="Calcula" value="Calcular Desc. Tarif." onclick="salirsi();" ></td>
</tr>

<tr class="form1">
<th colspan="6" >Pagos </th>
</tr>

<tr>
<td><b>Flete: </b></td>
<td colspan="2"  ><input name="Flete" value=0 align="right" type="text" size="20" READONLY ></td> 
</tr>

<tr>
<td><b>In & Out Airport UIO: </b></td>
<td colspan="2"><input name="Edomicilio" value=0 type="text" size="20"  maxlength="30" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
</td> 
</tr>


<tr>
<td><b>In & Out Impuesto GPS: </b></td>
<td colspan="2"><input name="Tadicional" value=0
onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
type="text" size="20"  maxlength="30" READONLY> </td> 
</tr>

<!--<tr>
<td><b>Servicio Adicional: </b></td>
<td colspan="2"  ><input name="Sadicional"  value=0   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>-->

<tr>
<td><b>In & Out Impuesto SCY: </b></td>
<td colspan="2"  ><input name="Otros"  value=0  type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
</td> 
</tr>

<tr>
<td><b>Seguro: </b></td>
<td colspan="2"  ><input name="Seguros"  value=0   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>


<tr>
<td><b>Descuentos: </b></td>
<td colspan="2"  ><input name="Pdescuentos"  value=0   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>



<tr>
<td><b>Subtotales: </b></td>
<td colspan="2"  ><input name="Subtotales"  value=0   type="text" size="20" align="right"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>


<tr>
<td><b>Iva: </b></td>
<td colspan="2"  ><input name="Iva"  value=0   type="text" size="20" align="right" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>




<tr>
<td><b>Totales: </b></td>
<td colspan="2"  ><input name="totales"  value=0   type="text" size="20" align="right"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY></td> 
</tr>

<tr>
<td><b>Obs: </b></td>
<td colspan="5"><textarea name="Observacion" type="text"  cols="80" rows="2"></textarea></td>
</tr>
<tr>


</td>



<tr align="center">
<td align="center">
 
 </td>
 
 <td align="center">
 <input name="salir" value="0" 
type="hidden">
 <input  type="submit"  NAME="Salir" value="Salir" onclick="parasalir();" >
 </td>
 </tr>
 </form>
 
</table>
</td>

<td valign="top" align="left" width="70%">

</td>
</tr>
</table>


<SCRIPT language="JavaScript 1.2" type="text/javascript">
  
    function iguala1(){
    var miindice=eval("document.MantenimientoGuia.Cliente.options.value");
    MantenimientoGuia.MRUC.options.value=miindice;     
    
    MantenimientoGuia.MTELEFONO.options.value=miindice;
    var indice = document.MantenimientoGuia.Cliente.selectedIndex 
    MantenimientoGuia.Remitente.value=eval("document.MantenimientoGuia.Cliente.options[indice].text");
    MantenimientoGuia.Ruc.value=eval("document.MantenimientoGuia.MRUC.options[indice].text");
    
    MantenimientoGuia.Telefono.value=eval("document.MantenimientoGuia.MTELEFONO.options[indice].text");
    
    }
 
    function iguala2(){
    var miindice=eval("document.MantenimientoGuia.MRUC.options.value");
    MantenimientoGuia.Cliente.options.value=miindice;  
    
    MantenimientoGuia.MTELEFONO.options.value=miindice;
    var indice = document.MantenimientoGuia.Cliente.selectedIndex 
    MantenimientoGuia.Remitente.value=eval("document.MantenimientoGuia.Cliente.options[indice].text");
    MantenimientoGuia.Ruc.value=eval("document.MantenimientoGuia.MRUC.options[indice].text");
    
    MantenimientoGuia.Telefono.value=eval("document.MantenimientoGuia.MTELEFONO.options[indice].text");
    
    }

    function igualat(){
    var miindice=eval("document.MantenimientoGuia.Destino.options.value");
    MantenimientoGuia.Transito.options.value=miindice;  
    }
    
    function adicional(){
    var  x=eval("document.MantenimientoGuia.Tranporte.checked");
    var vpeso=MantenimientoGuia.peso.value;
    var destino=document.MantenimientoGuia.Destino.value;
    var aux=0;
    
    if (destino=="UIO")
        aux=1;
    if (destino=="CUE")
        aux=1;
    if (destino=="MEC")
        aux=1;
    if (destino=="GYE")
        aux=1;
    
    if (x && vpeso<=3 && aux==1 ) 
    {
    MantenimientoGuia.Edomicilio.value=1.5;
    document.MantenimientoGuia.Entregaen.options.value=1;
    }else
    {
    MantenimientoGuia.Edomicilio.value=0;    
    document.MantenimientoGuia.Entregaen.options.value=3;
    }
    //MantenimientoGuia.Tranporte.checked
    }
    
    function entregaen (){
    var dato;
        dato=eval("document.MantenimientoGuia.Entregaen.value");
       
        if (dato==1 )
        {
        document.MantenimientoGuia.Tranporte.checked=1;
        adicional();
        }
        else
         {
        document.MantenimientoGuia.Tranporte.checked=0;
        adicional();
        }
       
    }
</SCRIPT>

<script LANGUAGE="JavaScript"> 
 
 
javascript:window.history.forward(1);


</SCRIPT>  


<script LANGUAGE="JavaScript"> 
  var mmes=eval("document.MantenimientoGuia.Mes");
  var manio=eval("document.MantenimientoGuia.Anio");
  var mmess=mmes.value;
 
 var manios=manio.value;
 vermestexto(mmess,manios);
 mmes=eval("document.MantenimientoGuia.Origen");
 manio=eval("document.MantenimientoGuia.Destino");
 mmess=mmes.value;
 
 manios=manio.value;

</SCRIPT>  

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
     xz=eval("document.MantenimientoGuia.lee.checked");
       
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
                                //alert((x));
                                document.MantenimientoGuia.peso.value=ajaxBalanza.responseText;
                              // trim(x);
                                //document.MantenimientoGuia.peso.value="2.00";
                                
                                }
                             else
                                {
                                 
                                document.MantenimientoGuia.peso.value=ajaxBalanza.responseText;
                    
                                }
                            }
                                else
                             {
                                    document.MantenimientoGuia.peso.value="....";
                
               
                                  }
                           }
    
    
    
    var tiempo=new Date().getTime();    
    // Enviamos la peticion
        
//    ajaxCiudades.open( "GET", url+'?ms='+tiempo, true );

    
    ajaxBalanza.open( "GET",'<%=CONTROLLER%>/Consulta/Peso?ms='+tiempo,true );

    ajaxBalanza.send( "" );
        
    
   }  
    }

</SCRIPT>  


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


