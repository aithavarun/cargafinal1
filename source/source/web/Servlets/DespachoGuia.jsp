
<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>





<%@ include file="/WEB-INF/Banner.jsp"%>  

<script LANGUAGE="JavaScript"> 
function validar(frm){
var quien=frm.Quien.value;

if (frm.salir.value=="0")
    {
    
         if (quien=="")
          {
             alert("Ingrese el nombre de la persona que retira" );
             return false;
          }

         if (frm.CI.value=="")
          {
             alert("Ingrese la cedula de identidad de la persona que retira" );
             return false;
          }
          
    }
  return true;
}
</SCRIPT>  

<SCRIPT>

function parasalir()
  {
    
    DespachoGuias.salir.value=1;
    
  }
  
</SCRIPT>

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
String origen="";
String destino="";

int piezas=0;
float peso=0;
float pesov=0;

int cliente=-1;
String contiene="";
String remitente="";
String destinatario="";
String nombrecliente="";
String telefonor="";
String ruc="";
String telefono="";
String obs="XXX";
String tipo=""; 
String direccion="";
String quienr="";
String cedula="";
int entregado=0;
java.util.Date mifecha;
java.util.Date mifechar;
String sestado="";


List list = model.getGuiadespacho();

if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Despachos guia=(Despachos) it.next();
          //Hola
          codigo=guia.getCodigo();
          numerog=guia.getNumero();
          origen=guia.getOrigen();
          destino=guia.getDestino();
          piezas=guia.getPiezas();
          peso=guia.getPeso();
          contiene=guia.getContiene();
          remitente=guia.getRemitente();
          destinatario=guia.getDestinatario();        
          ruc=guia.getRuc();
          telefono=guia.getTelefono();
          obs=guia.getObservacion(); 
          nombrecliente=guia.getNombrecliente();
          cliente=guia.getCodcliente();
          direccion=guia.getDireccion();
          quienr=guia.getQuienr();
          telefonor=guia.getTelefonor();
          if (quienr==null)
              quienr="";
          cedula=guia.getCedulaqr();
          if (cedula==null)
              cedula="";
           if (obs==null)
              obs="";
 
          if (telefonor==null)
              telefonor="";
 
          entregado=guia.getEntregado();
          
          if (entregado==1)
              sestado="disabled='disabled'";
          else
              sestado="";
          
      }
 }


String Numero=request.getParameter("Numeror");


int estado=0;
int k=0;


%>

    

<table width="90%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/GuiaCarga/Despachar"  
name="DespachoGuias" onSubmit="return validar(this);" 
>

<tr>
<th colspan="6" >DESPACHO DE GUIA</th> 
</tr>

<% String error=model.getError();
    String color="FFFFCC";
    if (error !=null)
    {%>

<tr class="error">
<th colspan="6" ><%=error%></th>
</tr>

<tr  bgcolor="">
<td><b>de: (Origen)</b></td>
<td><input name="Origen" value="<%=origen%>" type="text" size="3"  maxlength="3"  readonly></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);ponedestino();"></td> 
----------------%>
<td><b>a: (Destino)</b></td>
<td><input name="Destino" value="<%=destino%>" type="text" size="3"  maxlength="3" readonly></td> 
<%----------------------
onChange="veritinerariotexto(this.form.Origen<%=k%>.value, this.form.Destino<%=k%>.value);poneorigen();"></td> 
----------------%>
</tr>
<%}%>

<%---------------
--%>

<tr>
<td><b> Cliente : </b></td>
<td ><input name= "Nguia" id="Nguia" value="<%=nombrecliente%>" type="text"  size="30" maxlength="10"  READONLY> 

<td>

</tr>


<tr>

<td><b> Numero de Guia:</b></td><td><input name= "Nguia" id="Nguia" value="<%=numerog%>" type="text"  size="10" maxlength="10"  READONLY> 
</tr>
<tr>
<td><b>Piezas: </b>
</td><td>
<input name="piezas" value="<%=piezas%>"  type="text" size="10" maxlength="8" readonly >
</td>

<td><b>Peso: </b>
</td><td>
<input name="peso"  value="<%=f.format(peso)%>"  type="text" size="10" maxlength="8" readonly>
</td>

<td><b>Peso Por Volumen: </b>
</td><td>
<input name="pesovolumen"  value="<%=f.format(pesov)%>"  type="text" size="10" maxlength="8" readonly >
</td>



</tr>


<tr>
<td><b>Contiene: </b></td>
<td >
<input name="Contiene" value="<%=contiene%>" type="text" size="30" maxlength="30" readonly >
</td>
</tr>
<tr>
<td><b>Remitente: </b></td>
<td >
<input name="Remitente" value="<%=remitente%>" type="text" size="30" maxlength="30"  readonly>
</td>


<td><b>Destinatario: </b></td>
<td colspan="2">
<input name="Destinatario" value="<%=destinatario%>" type="text" size="30" maxlength="30" readonly >
</td>
</tr>


<tr>
<td><b>Ruc: </b></td>
<td >
<input name="Ruc" value="<%=ruc%>" type="text" size="30" maxlength="30"  readonly>
</td>


<td><b>Telefono: </b></td>
<td colspan="2">
<input name="Telefono" value="<%=telefono%>" type="text" size="30" maxlength="30" readonly >
</td>
</tr>



<TR>
<td ><b>Direccion: </b></td>
<td colspan="2"> <input name="Direccion" value="<%=direccion%>" type="text" size="30" maxleng="100" readonly >
</TD>

</TR>




<tr>
<td><b>Quien Retira: </b></td>
<td  ><input name="Quien" type="text" size="30" value="<%=quienr%>" <%=sestado%> ></td>
<input name="Codigo" type="HIDDEN" size="30" value="<%=codigo%>" >
<td><b>C.I.: </b></td>
<td   colspan="2"><input name="CI" type="text"  size="30" value="<%=cedula%>" <%=sestado%> ></td>
</tr>

<tr>
    <TD><b>Telefono Retira: </b></TD>
<td colspan="2"> <input name="Telefonor" value="<%=telefonor%>" type="text" size="30" maxleng="30"  <%=sestado%> ></TD>

</tr>    
<tr>
<td><b>Observaciones: </b></td>
<td   colspan="5"><textarea name="Observacion" type="text"  cols="80" rows="2" <%=sestado%> ><%=obs.trim()%></textarea></td>

</tr>
<tr>


</td>


</TABLE>

<table width="10%" align="center">
<tr>
<td>
 <input TYPE="submit"    NAME="Guardar" value="Guardar">
 </td>
 <td>
  <input name="salir" value="0" 
type="hidden">
 <input  type="submit"  NAME="Salir" value="Salir"  onclick="parasalir();">
 </td>
 </tr>


</td>
</tr>
</form>

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


