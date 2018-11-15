<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>





<%@ include file="/WEB-INF/Banner.jsp"%> 
<% 
Calendar hoy = Calendar.getInstance();
int dia=hoy.get(Calendar.DATE);
int mes=hoy.get(Calendar.MONTH)+1;
int anio=hoy.get(Calendar.YEAR);
int salir=0;

%>
<script LANGUAGE="JavaScript"> 


function validar(frm){

var salir = frm.salir.value;


 if (salir==1)
 {
        return true;
 }
   
 quien = eval("document.TarifasReservas.quien");
 if (quien.value=="")
 {
    alert("Es obligatorio quien aprueba el descuento");
    return false;
 }
 numero = eval("document.TarifasReservas.numero");
 if (numero.value=="")
 {
    alert("Es obligatorio numero del documento de aprobacion");
    return false;
 }
    return true;
}

function salirsi()
   {
   
   
   salir = eval("document.TarifasReservas.salir");
   salir.value=1;
   
   
   }
function nosalir()
{
    
    salir = eval("document.TarifasReservas.salir");
    salir.value=0;
}

</SCRIPT>


<%DecimalFormat f =new DecimalFormat("0.00");
DecimalFormat f1 =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<table width="100%" align="left">
                     <tr>
                     <td>
<table width="100%" align="left">

<% String error=model.getError();
String color="FFFFCC";
if (error !=null)
{%>
<tr class="error">
<th colspan="6" ><%=error%></th>
</tr>
<%}%>


<tr>



<td valign="top" width="100%" >

<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/Descuentos/Modificar"  
name="TarifasReservas"   onSubmit="return validar(this)" >
<tr>
<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="8" >Modificar Descuentos</th>
</tr>
<tr class="form1">
<th colspan="8" >Grupo y Contacto</th>
</tr>
<TR bgcolor="#CCCCCC">
<% Cabecera contacto=model.getCabecera();
Calendar fecha=contacto.getFechatc();
long codigo=contacto.getCodigo();
int infint=0;
        //fecha.setTime(contacto.getFechat());
        int aniot=fecha.get(Calendar.YEAR);
        int mest=fecha.get(Calendar.MONTH)+1;
        int diat=fecha.get(Calendar.DATE);
List listad = model.getBase();
long codigod=0;
String numero="";
String Obs="";
String quien="";
if  (listad != null)  {
    Iterator itd = listad.iterator();
    while (itd.hasNext()) {
        Descuentos descuentos=(Descuentos) itd.next();
        codigod=descuentos.getCodigodescuento();
        numero=descuentos.getDocumento();
        quien=descuentos.getQuien();
        Obs=descuentos.getObservaciones();
    }
}
%>

<%

String aux="";
int conttc=0;
%>
<td colspan="1"><b>Booking Reference:</b></td>
<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >


<td ><b><%=contacto.getBooking()%></b></td> 
<td>Quien Solicita:</td>
<td><%=contacto.getQuiens()%></td> 
<td>Telefono:</td>
<td colspan="3"><%=contacto.getTelefono()%>
</td>
</tr>
<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Sucursal:</b></td>

<td ><b><%=contacto.getSucursal()%></b></td> 
<td>Quien Reserva:</td>
<td><%=contacto.getQuienr()%></td> 
<td>Fecha:</td>
<td colspan="3"><%=FORMATOFECHA.format(contacto.getFecha())%>
</td>
</tr>
<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Grupo:</b></td>
<td colspan="7">
<%=contacto.getGrupo().trim()%>
</td>

</tr>

<tr>
<th colspan="8" >Time Limit <%=FORMATOFECHA.format(contacto.getFechat())%>   <%=f1.format(contacto.getHorat())%>:<%=f1.format(contacto.getMinutot())%></th>
</tr>

</table>
<%-----------------%>
<table width="100%" align="CENTER">


<tr class="form1">
<th colspan="8" >Viaje</th>
</tr>

<tr >
<th colspan="2" >Fecha</th>
<th >Origen<%=codigod%></th>
 <th >Destino</th>
 <th >Numero</th>
 <th >Hora</th>
 <th >Avion</th>
</tr>


<%

int contador=0;

long codigo1=0;
String vale="";
 List lista = model.getVueloreserva();
              if  (lista != null)  {
                    Iterator itv = lista.iterator();
                   while (itv.hasNext()) {
                        Vuelosreserva vuelo=(Vuelosreserva) itv.next();
                        
                                               
                         contador++;
                        codigo1=vuelo.getCodigo();
                    
%>
<tr class="vuelo">
<td colspan="2"><b><%=FORMATOFECHA.format(vuelo.getFecha())%></b></td>
<td colspan="1"><%=vuelo.getOrigen()%></td>
<td colspan="1"><%=vuelo.getDestino()%></td>
<td><%=vuelo.getNumero()%></td>
<td colspan="1"><%=f1.format(vuelo.getHora())+":"+f1.format(vuelo.getMinuto())%></td>
<td><%=vuelo.getAvion()%></td>
</tr>
<%}}%>
</table>
<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="8" >Tarifas</th>
</tr>
<tr >
<th >Origen</th>
<th>Destino</th>
<th>Boleto</th>
 <th >Sc</th>
 <th >% Descuento</th>
 </tr>
<%

long reservas=0;
  List lista2 = model.getReservaestado();
  int i=0;
  int j=1;
  float tiva=0;
  float tvalor=0;
  float tseguro=0;
  float ttasa=0;
  float descuento=1;
  float rtiva=0;
  float rtvalor=0;
  float rtseguro=0;
  float rttasa=0;
  String Sc="0";
  String Sdescuento="";
  if  (lista2 != null)  {
      Iterator itr = lista2.iterator();
      while (itr.hasNext()) {
            Tarifasreservas reserva=(Tarifasreservas) itr.next();
            tiva+=reserva.getIva();
            tseguro+=reserva.getSeguro();
            ttasa+=reserva.getTasa();
            tvalor+=reserva.getValor();
            Sc="0";
            if (reservas!=reserva.getReservacodigo())
            {%> 
<% 
if (reservas>0)
{
    Sc=request.getParameter("sc"+String.valueOf(i));
    Sdescuento=request.getParameter("descuento"+String.valueOf(i));
%>


<%}%>


            <%    reservas=reserva.getReservacodigo();
            long boleto=reserva.getBoleto();
            
            if (boleto<0)
                boleto=0;
                 descuento=1-reserva.getDescuento()/100;
                /*if (descuento==0)
                    descuento=1;*/
                i++;
                j=1;
                rtiva=0;
                rtseguro=0;
                rttasa=0;
                rtvalor=0;
                rtiva+=reserva.getIva();
                rtseguro+=reserva.getSeguro();
                rttasa+=reserva.getTasa();
                rtvalor+=reserva.getValor();
                if ((Sc==null) || (Sc.equals("")))
                    Sc=String.valueOf(reserva.getSc());
                
            %>
            
<%-------------------------%>
            
<tr bgcolor="#CCFFFF">            
<td colspan="2"><b><%=i%>-
<%=reserva.getApellido().trim()%>
/
<%=reserva.getNombre().trim()%>
(<%=reserva.getTipo()%>
 :<%=reserva.getClase()%>
)
<input name="reserva<%=i%>" value="<%=reserva.getReservacodigo()%>" 
type="hidden"  >
<input name="boleto<%=i%>" value="<%=reserva.getBoletocodigo()%>" 
type="hidden"  >
<input name="nboleto<%=i%>" value="<%=reserva.getBoleto()%>" 
type="hidden"  >
</b>
</td>       
<td>
<%=boleto%> 
</td>  

<td>
<input name="sc<%=i%>" value="<%=Sc%>" align="right"  
type="text" size="6" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>

<td>
<input name="descuento<%=i%>" value="<%=reserva.getDescuento()%>"  
type="text" size="6" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>

</tr>
<%}
            else
            {%>

            
               <% j++;
                rtiva+=reserva.getIva();
                rtseguro+=reserva.getSeguro();
                rttasa+=reserva.getTasa();
                rtvalor+=reserva.getValor();
                
            }%>


 
<%}}%>


<%-------------Infantes---------------%>
<%
 List lista2i=model.getTarifainante();
 reservas=0;
if  (lista2i != null)  {
      Iterator itri = lista2i.iterator();
      while (itri.hasNext()) {
            Tarifasreservas reserva=(Tarifasreservas) itri.next();
            tiva+=reserva.getIva();
            tseguro+=reserva.getSeguro();
            ttasa+=reserva.getTasa();
            tvalor+=reserva.getValor();
            
            if (reservas!=reserva.getReservacodigo())
            {%> 
<% 
if (reservas>0)
{
    
%>

<%}%>

 
            <%    reservas=reserva.getReservacodigo();
            long boleto=reserva.getBoleto();
            
            if (boleto<0)
                boleto=0;
                 descuento=1;
                /*if (descuento==0)
                    descuento=1;*/
               
                j=1;
                rtiva=0;
                rtseguro=0;
                rttasa=0;
                rtvalor=0;
                rtiva+=reserva.getIva();
                rtseguro+=reserva.getSeguro();
                rttasa+=reserva.getTasa();
                rtvalor+=reserva.getValor();
                
                
            %>
            

            
<tr bgcolor="#CCFFFF">            
<td colspan="2"><b><%=i+1%>-
<%=reserva.getApellido()%>

<%=reserva.getNombre()%>
(<%="INF"%>
 :<%=reserva.getClase()%>
)
<input name="reservai" value="<%=reserva.getReservacodigo()%>" 
type="hidden"  >
<input name="boletoi" value="<%=reserva.getBoletocodigo()%>" 
type="hidden"  >
<input name="nboletoi" value="<%=reserva.getBoleto()%>" 
type="hidden"  >
</b>
</td>       
<td>
<%=boleto%> 
</td>  
<td><b></b></td>
<td>
</td>



</tr>
<%}
            else
            {%>

            
               <% j++;
                rtiva+=reserva.getIva();
                rtseguro+=reserva.getSeguro();
                rttasa+=reserva.getTasa();
                rtvalor+=reserva.getValor();
                
            }%>


<%}}%>
<input name="i" value="<%=i%>" 
type="hidden"  >
 
<tr class="form1">
<th colspan="5" >Adicionales</th>
</tr>
<tr>
<th colspan="2">
Numero de Aprobacion
</th>
<th colspan="3">
Quien Aprueba
</th>

<input name="codigod" value="<%=codigod%>" 
type="hidden"  >
 
</tr>
<tr>
<td colspan="2">
<input name="numero" value="<%=numero%>"  
type="text" size="15" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="3">
<input name="quien" value="<%=quien%>"  
type="text" size="30">
</td>
</tr>
<tr>
<th colspan="5">
Observaciones
</th>
</tr>
<tr>
<td colspan="5">
<input name="Observaciones" value="<%=Obs%>"  
type="text" size="50">
</td>
</tr>


</table>
<%-------------Totales---------------%>

 
<table width="100%" align="center">           

<tr align="center">
<td align="center">
 <input TYPE="submit"    NAME="Grabar" value="Grabar" onclick="nosalir();">
 </td>
 <input name="salir" value="0" 
type="hidden"  >
 <td align="center">
 <input  type="submit"  NAME="Salir" value="Salir" onclick="salirsi();">
 </td>
 </tr>
 
 </table>
 </tr>
 </form>
 


</table>

</td>
</tr>
</table>


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


