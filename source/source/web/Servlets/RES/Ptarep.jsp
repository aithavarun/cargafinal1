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
   
   var saldo=parseFloat(document.getElementById("saldo").innerHTML);
   
     if (saldo!=0)
     {
        alert("Es necesrio cancelar todo para grabar");
        return false;
     }
      var numero=frm.ptanombre.value;
      if (numero=="")
      {
          alert("Es necesrio el nombre de quien paga el pta");
            return false;
      }
      var sucursal=frm.sucursale.value;
      if (sucursal=="")
      {
          alert("Es necesrio la sucursal don se retira el boleto");
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
<form method="post" action="<%=CONTROLLER%>/Ptas/Modificar"  
name="TarifasReservas"   onSubmit="return validar(this)" 
>
<%Cabecera contacto=model.getCabecera();%>
<table width="100%" align="CENTER">
<tr class="form1">
<input name="nptaa" value="<%=contacto.getNumeropta()%>" 
type="hidden"  >

<th colspan="8" >Modificar PTA  <input name="npta" value="<%=contacto.getNumeropta()%>"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></th>
</tr>
<tr class="form1">
<th colspan="8" >Grupo y Contacto</th>
</tr>
<TR bgcolor="#CCCCCC">
<% 
Calendar fecha=contacto.getFechatc();
long codigo=contacto.getCodigo();
int infint=0;
        //fecha.setTime(contacto.getFechat());
        int aniot=fecha.get(Calendar.YEAR);
        int mest=fecha.get(Calendar.MONTH)+1;
        int diat=fecha.get(Calendar.DATE);

%>
<%
String tc[]=new String[4];
String Tc[]=new String[4];
String tcn[]=new String[4];
String obstc[]=new String[4];
String aux="";
// aumentar en el jsp
float ocho=12;
float cambio=1;
if (usuario.getAcceso()==1)
    cambio=cotiz;
// fin aumentar
int conttc=0;
String Ruc=request.getParameter("Ruc");
String Razon=request.getParameter("Razonsocial");
String Tour=request.getParameter("Tourcode");

if (Ruc==null)
{
    Ruc=contacto.getRuc();
    if (Ruc==null)
        Ruc="";
        
}
if (Razon==null)
{
    Razon=contacto.getRazon();
    if (Razon==null)
        Razon="";
        
}
if (Tour==null)
{
    Tour=contacto.getTour();
    if (Tour==null)
        Tour="";    
}

%>
<td colspan="1"><b>Booking Reference:</b></td>
<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >
<input name="codigopta" value="<%=contacto.getCodigopta()%>" 
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
<%-------------------
<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >
--------------%>
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


</table>
<%-----------------%>
<table width="100%" align="CENTER">


<tr class="form1">
<th colspan="8" >Viaje</th>

</tr>
</tr>
<tr >
<th colspan="2" >Fecha</th>
<th >Origen</th>
 <th >Destino</th>
 <th >Numero</th>
 <th >Hora</th>
 <th >Avion</th>
</tr>


<%

int contador=0;
String Origen="";
String Destino="";
int oneway=1;
long codigo1=0;
float porcentajeiva=12;
String vale="";
 List lista = model.getVueloreserva();
              if  (lista != null)  {
                    Iterator itv = lista.iterator();
                   while (itv.hasNext()) {
                        Vuelosreserva vuelo=(Vuelosreserva) itv.next();
                        
                            if (contador==0)
                                Origen=vuelo.getOrigen().trim();
                        Destino=vuelo.getDestino().trim();
                         contador++;
                        codigo1=vuelo.getCodigo();
                    
%>
<tr class="vuelo">

<input name="codigo<%=contador%>" value="<%=codigo1%>" 
type="hidden" >
<input name="cambia<%=contador%>" value="<%=vale%>" 
type="hidden"  >

<td colspan="2"><b><%=FORMATOFECHA.format(vuelo.getFecha())%></b>
<td colspan="1"><%=vuelo.getOrigen()%></td>
<td colspan="1"><%=vuelo.getDestino()%></td>
<td><%=vuelo.getNumero()%></td>
<td colspan="1"><%=f1.format(vuelo.getHora())+":"+f1.format(vuelo.getMinuto())%></td>
<td><%=vuelo.getAvion()%></td>
</tr>


<%}}%>
<%
// aumentado por q
int acceso=model.AccesoCiudad(Origen.trim().toUpperCase());
porcentajeiva=12;
if (Origen.equals(Destino))
    oneway=2;
 if (acceso==1)
 {
     if (oneway==2)
         porcentajeiva=8;
     else
         porcentajeiva=16;
 }

porcentajeiva=porcentajeiva/100;

%>
</table>

<input name="viaje" value="<%=contador%>" 
type="hidden"  >
<table width="100%" align="CENTER">


<tr class="form1">
<th colspan="9" >Tarifas</th>

</tr>
</tr>
<tr >
<th >Origen</th>
<th>Destino</th>
<th>Base</th>
 <th >Valor</th>
 <th >Q</th>
 <th >Iva</th>
 <th >Seguro</th>
 <th >Tasa</th>
 <th >Total</th>
</tr>

<%

long reservas=0;
  List lista2 = model.getReservaestado();
  int i=0;
  int j=1;
  float tiva=0;
  float tq=0;
  float tvalor=0;
  float tseguro=0;
  float ttasa=0;
  float descuento=1;
  float rtiva=0;
  float rtvalor=0;
  float rtq=0;
  float rtseguro=0;
  float rttasa=0;
  String Sc="0";
  float msc=0;
  String Sdescuento="";
  if  (lista2 != null)  {
      Iterator itr = lista2.iterator();
      while (itr.hasNext()) {
            Tarifasreservas reserva=(Tarifasreservas) itr.next();
            tiva+=(reserva.getValor()+reserva.getCola())*porcentajeiva;
             //porcentajeiva=ocho/100;
             reserva.setIva((reserva.getValor()+reserva.getCola())*porcentajeiva);
             if (reservas==reserva.getReservacodigo())
             {
                 if (reserva.getSegurovias()==1)
                    reserva.setSeguro(0);
                if (reserva.getTasavias()==1)
                    reserva.setTasa(0);
             }
            //tiva+=reserva.getIva();
            tseguro+=reserva.getSeguro();
            ttasa+=reserva.getTasa();
            tvalor+=reserva.getValor();
            tq+=reserva.getCola();
            Sc="0";
            if (reservas!=reserva.getReservacodigo())
            {%> 
<% 
if (reservas>0)
{
    //Sc=request.getParameter("sc"+String.valueOf(i));
    //Sdescuento=request.getParameter("descuento"+String.valueOf(i));
%>
<tr bgcolor="#5599FF">
<td colspan="3"><b>Totales Pax</b>
</td>
<td align="right">
<span id="rrValor<%=i%>"  style="position:relative;">
<%=f.format(rtvalor*descuento)%>
</span>
<input name="rtvalor<%=i%>" value="<%=rtvalor%>" 
type="hidden"  >

</td>
<td align="right">
<span id="rrQ<%=i%>"  style="position:relative;">
<%=f.format(rtq)%>
</span>

</td>
<td align="right">
<span id="rrIva<%=i%>"  style="position:relative;">
<%=f.format(rtiva*descuento) %>
</span>
<input name="rtiva<%=i%>" value="<%=rtiva%>" 
type="hidden"  >

</td>
<td align="right">

<%=f.format(rtseguro)%>
</td>
<input name="rtseguro<%=i%>" value="<%=rtseguro%>" 
type="hidden"  >

<td align="right">

<%=f.format(rttasa)%>
</td>
<input name="rttasa<%=i%>" value="<%=rttasa%>" 
type="hidden"  >

<td align="right">
<span id="rrTtotal<%=i%>"  style="position:relative;">
<%=f.format(rtvalor*descuento+rtq+rtiva*descuento+rttasa+rtseguro )%>
</span>
<input name="rttotal<%=i%>" value="<%=rtq+rtvalor+rtiva+rttasa+rtseguro+msc%>" 
type="hidden"  >
</td>
<%------------------------------
<script language="JavaScript"> 
 cambiasc(document.TarifasReservas,<%=i%>,2);
</script> 

------------------%>
<%}%>

 </tr>
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
                rtq=0;
                 
               rtiva+=(reserva.getValor()+reserva.getCola())*porcentajeiva;
                //rtiva+=reserva.getIva();
                //porcentajeiva=ocho/100;
                rtseguro+=reserva.getSeguro();
                rttasa+=reserva.getTasa();
                rtvalor+=reserva.getValor();
                rtq+=reserva.getCola();
                //if ((Sc==null) || (Sc.equals("")))
                    Sc=String.valueOf(reserva.getSc());
                    msc=reserva.getSc();
                
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
</b>
</td>       

<td><input name="nboleto<%=i%>" value="<%=boleto%>"    
type="text" size="20" maxlength="50" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td> 

<input name="boleto<%=i%>" value="<%=reserva.getBoletocodigo()%>" 
type="hidden"  >
<%------------------

<input name="nboleto<%=i%>" value="<%=reserva.getBoleto()%>" 
type="hidden"  >

<td>
<%=boleto%> 
</td> 
 -----------------%>
<td><b>SC:</b></td>
<td><%=Sc%>
<%------------
<input name="sc<%=i%>" value="<%=Sc%>" align="right"  onchange="cambiasc(this.form,'<%=i%>','<%=j%>')"
type="text" size="6" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
----------%>
<input name="sc<%=i%>" value="<%=Float.parseFloat(Sc)%>" 
type="hidden"  >
</td>
<td colspan="2" align="right"><b>% Descuento :</b></td>
<td><%=reserva.getDescuento()%>
<input name="descuento<%=i%>" value="<%=reserva.getDescuento()%>"  
type="hidden"  >
<%------------
----------%>
</td>

</tr>
<%}
            else
            {%>

            
               <% j++;
              
                rtiva+=(reserva.getValor()+reserva.getCola())*porcentajeiva;
               
                if (reserva.getSegurovias()==1)
                    reserva.setSeguro(0);
                if (reserva.getTasavias()==1)
                    reserva.setTasa(0);
 
               // rtiva+=reserva.getIva();
               //porcentajeiva=ocho/100;
                rtseguro+=reserva.getSeguro();
                rttasa+=reserva.getTasa();
                rtvalor+=reserva.getValor();
                rtq+=reserva.getCola();
                
                
            }%>

<tr bgcolor="#00CCFF">

<td><%=j%>
<%=reserva.getOrigen()%>
</td>
<td>
<%=reserva.getDestino()%>
</td>
<td>
<%=reserva.getBase()%>   
</td>
</td>
<td align="right">
<span id="Valor<%=i%><%=j%>"  style="position:relative;">
<%=f.format(reserva.getValor()*descuento)%>
<input name="rvalor<%=i%><%=j%>" value="<%=reserva.getValor()%>" 
type="hidden"  >
</span>
</td>
<td align="right">
<span id="q<%=i%><%=j%>"  style="position:relative;">
<%=f.format(reserva.getCola())%>
<input name="rq<%=i%><%=j%>" value="<%=reserva.getCola()%>" 
type="hidden"  >
</span>
</td>

<td align="right">
<span id="Iva<%=i%><%=j%>"  style="position:relative;">
<%
reserva.setIva((reserva.getValor()*descuento+reserva.getCola())*porcentajeiva);
%>
<%=f.format(reserva.getIva()) %> 
</span>
</td>
<td align="right">

<%=f.format(reserva.getSeguro())%>
</td>
<td align="right">

<%=f.format(reserva.getTasa())%>
</td>
<td align="right">
<span id="Total<%=i%><%=j%>"  style="position:relative;">

<%=f.format(reserva.getValor()*descuento+reserva.getIva()+reserva.getSeguro()+reserva.getTasa()+reserva.getCola())%>
<input name="total<%=i%><%=j%>" value="<%=reserva.getValor()+reserva.getIva()+reserva.getSeguro()+reserva.getTasa()+reserva.getCola()%>" 
type="hidden"  >
</span>
</td>


 </tr>
 
<%}}%>

<tr bgcolor="#5599FF">
<td colspan="3"><b>Totales Pax: </b>
</td>
<td align="right">
<span id="rrValor<%=i%>"  style="position:relative;">
<%=f.format(rtvalor*descuento)%>
</span>
<input name="rtvalor<%=i%>" value="<%=rtvalor%>" 
type="hidden"  >

</td>
<td align="right">
<span id="rrQ<%=i%>"  style="position:relative;">
<%=f.format(rtq)%>
</span>
<input name="rtq<%=i%>" value="<%=rtq%>" 
type="hidden"  >

</td>

<td align="right">
<span id="rrIva<%=i%>"  style="position:relative;">
<%=f.format(rtiva*descuento) %>
</span>
<input name="rtiva<%=i%>" value="<%=rtiva%>" 
type="hidden"  >

</td>
<td align="right">

<%=f.format(rtseguro)%>
<input name="rtseguro<%=i%>" value="<%=rtseguro%>" 
type="hidden"  >

</td>
<td align="right">

<%=f.format(rttasa)%>
</td>
<input name="rttasa<%=i%>" value="<%=rttasa%>" 
type="hidden"  >

<td align="right">
<span id="rrTtotal<%=i%>"  style="position:relative;">


<%=f.format(msc*1.0+rtq+rtvalor*descuento+rtiva*descuento+rttasa+rtseguro)%>

</span>
<input name="rttotal<%=i%>" value="<%=rtq+rtvalor+rtiva+rttasa+rtseguro+msc%>" 
type="hidden"  >
</td>


 </tr>
<%
 List lista2i=model.getTarifainante();
reservas=0;
rtiva=0;
rtseguro=0;
rttasa=0;
rtvalor=0;
rtq=0;
//String xx="";
int infanteuno=0;
if  (lista2i != null)  {
      Iterator itri = lista2i.iterator();
      while (itri.hasNext()) {
            Tarifasreservas reserva=(Tarifasreservas) itri.next();
            descuento=1;
            tiva+=(reserva.getValor()*descuento+reserva.getCola())*porcentajeiva;
            
             reserva.setIva((reserva.getValor()*descuento+reserva.getCola())*porcentajeiva);
            tseguro+=reserva.getSeguro();
            ttasa+=reserva.getTasa();
            tvalor+=reserva.getValor();
            tq+=reserva.getCola();
            infanteuno++;
            if (reservas!=reserva.getReservacodigo())
            {%> 
<% 
if (reservas>0)
{
    
%>
<tr bgcolor="#5599FF">
<td colspan="3"><b>Totales Pax</b>
</td>
<td align="right">
<span id="rValori"  style="position:relative;">
<%=f.format(rtvalor*descuento)%>
</span>
<input name="rtvalori" value="<%=rtvalor%>" 
type="hidden"  >

</td>
<td align="right">
<span id="rQi"  style="position:relative;">
<%=f.format(rtq)%>
</span>
<input name="rtqi" value="<%=rtq%>" 
type="hidden"  >

</td>

<td align="right">
<span id="rIvai"  style="position:relative;">
<%=f.format(rtiva*descuento) %>
</span>
<input name="rtivai" value="<%=rtiva%>" 
type="hidden"  >

</td>
<td align="right">

<%=f.format(rtseguro)%>
</td>
<input name="rtseguroi" value="<%=rtseguro%>" 
type="hidden"  >

<td align="right">

<%=f.format(rttasa)%>
</td>
<input name="rttasai" value="<%=rttasa%>" 
type="hidden"  >
<td align="right">
<span id="rTtotali"  style="position:relative;">
<%=f.format(rtvalor*descuento+rtiva*descuento+rttasa+rtseguro )%>
</span>
<input name="rttotali" value="<%=rtvalor+rtiva+rttasa+rtseguro%>" 
type="hidden"  >
</td>

<%}%>

 </tr>
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
                rtiva+=(reserva.getValor()*descuento+reserva.getCola())*porcentajeiva;
                //rtiva+=reserva.getIva();
                rtseguro+=reserva.getSeguro();
                rttasa+=reserva.getTasa();
                rtvalor+=reserva.getValor();
                rtq+=reserva.getCola();
                
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
<%----------------------------
<input name="nboletoi" value="<%=reserva.getBoleto()%>" 
type="hidden"  >
-----------------------%>
</b>

</td>  

<td><input name="nboletoi" value="<%=boleto%>"    
type="text" size="20" maxlength="50" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td> 
<%---------     
<td>
<%=boleto%> 
</td>
------%>  
<td><b>sa</b></td>
<td>
</td>
<td colspan="2" align="right"><b></b></td>
<td>
</td>

</tr>
<%}
            else
            {%>

            
               <% j++;
                
                rtiva+=(reserva.getValor()*descuento+reserva.getCola())*porcentajeiva;
                //rtiva+=reserva.getIva();
                rtseguro+=reserva.getSeguro();
                rttasa+=reserva.getTasa();
                rtvalor+=reserva.getValor();
                rtq+=reserva.getCola();
                
            }%>

<tr bgcolor="#00CCFF">

<td><%=j%>
<%=reserva.getOrigen()%>
</td>
<td>
<%=reserva.getDestino()%>
</td>
<td>
<%=reserva.getBase()%>   
</td>
</td>
<td align="right">
<span id="Valori<%=j%>"  style="position:relative;">
<%=f.format(reserva.getValor()*descuento)%>
<input name="rvalori<%=j%>" value="<%=reserva.getValor()%>" 
type="hidden"  >
</span>
</td>
<td align="right">
<span id="Qi<%=j%>"  style="position:relative;">
<%=f.format(reserva.getCola())%>
<input name="rcolai<%=j%>" value="<%=reserva.getCola()%>" 
type="hidden"  >
</span>
</td>

<td align="right">
<span id="Ivai<%=j%>"  style="position:relative;">
<%=f.format(reserva.getIva()*descuento) %> 
</span>
</td>
<td align="right">

<%=f.format(reserva.getSeguro())%>
</td>
<td align="right">

<%=f.format(reserva.getTasa())%>
</td>
<td align="right">
<span id="Totali<%=j%>"  style="position:relative;">
<%=f.format(reserva.getCola()+reserva.getValor()*descuento+reserva.getIva()*descuento+reserva.getSeguro()+reserva.getTasa()+msc)%>
<input name="totali<%=j%>" value="<%=reserva.getValor()+reserva.getIva()+reserva.getSeguro()+reserva.getTasa()+msc%>" 
type="hidden"  >
</span>
</td>

 </tr>
 
<%}}%>
<% if  (infanteuno>0)  {%>
<tr bgcolor="#5599FF">
<td colspan="3"><b>Totales Pax Infantes</b>
</td>
<td align="right">
<span id="rValori"  style="position:relative;">
<%=f.format(rtvalor*descuento)%>
</span>
<input name="rtvalori" value="<%=rtvalor%>" 
type="hidden"  >

</td>
<td align="right">
<span id="rQi"  style="position:relative;">
<%=f.format(rtq)%>
</span>
<input name="rtqi" value="<%=rtq%>" 
type="hidden"  >

</td>

<td align="right">
<span id="rIvai"  style="position:relative;">
<%=f.format(rtiva*descuento) %>
</span>
<input name="rtivai" value="<%=rtiva%>" 
type="hidden"  >

</td>
<td align="right">

<%=f.format(rtseguro)%>
<input name="rtseguroi" value="<%=rtseguro%>" 
type="hidden"  >

</td>
<td align="right">

<%=f.format(rttasa)%>
</td>
<input name="rttasai" value="<%=rttasa%>" 
type="hidden"  >

<td align="right">
<span id="rTtotali"  style="position:relative;">
<%=f.format(rtvalor*descuento+rtiva*descuento+rttasa+rtseguro+msc+rtq)%>
</span>
<input name="rttotali" value="<%=rtvalor+rtiva+rttasa+rtseguro+msc+rtq%>" 
type="hidden"  >
</td>


 </tr>
<%}%>
<%-------------Totales---------------%>

<tr bgcolor="#FFCC00">
<td colspan="3"><b>Totales</b>
</td>
<td align="right">
<span id="TValor"  style="position:relative;">
<%=f.format(tvalor)%>
<input name="tvalor" value="<%=tvalor%>" 
type="hidden"  >
</span>
</td>
<td align="right">
<span id="TQ"  style="position:relative;">
<%=f.format(tq)%>
<input name="tq" value="<%=tq%>" 
type="hidden"  >
</span>
</td>

<td align="right">
<span id="TIva"  style="position:relative;">
<%=f.format(tiva) %>
</span>
</td>
<td align="right">

<%=f.format(tseguro)%>
</td>
<td align="right">

<%=f.format(ttasa)%>
</td>
<td align="right">
<span id="TTotal"  style="position:relative;">
<%=f.format(tq+tvalor+tiva+ttasa+tseguro)%>
<input name="ttotal" value="<%=tvalor+tiva+ttasa+tseguro+tq%>" 
type="hidden"  >
</span>
</td>
<input name="i" value="<%=i%>" 
type="hidden"  >


 </tr>
<tr class="form1">
<th colspan="9" >Comision</th>
</tr>
<tr >
<th >Agencia</th>
<th colspan="2">Nombre</th>
<th>Base</th>
<th colspan="1">Valor</th>

<th>Comision</th>
<th colspan="1">A pagar</th>
</tr>

<%
List listbase  = model.getBase();
int x=0;
int contadorbase=1;
 if (listbase!=null)
    contadorbase= listbase.size();
//
%>
<tr>
<td rowspan="<%=contadorbase+1%>" colspan="2">
<select name="agencias" >
<option value="-1">->Seleccione un Cliente<-</option>
<%List listacli = model.getClientes();
//list.size()+1;
//int clientesl[]=new int[x];
String agencia=request.getParameter("agencias");
int age=0;
if (agencia!=null)
    age=Integer.parseInt(agencia);
int y=0;
String selecciona="";

 if (listacli != null) {
      Iterator itcli = listacli.iterator();
      while (itcli.hasNext())
      {
          Clientes cliente=(Clientes) itcli.next();
          y++;
          //x=cliente.getContribuyente();
          //clientesl[y]=cliente.getCodigo();        
          if (age==cliente.getCodigo() || (cliente.getCodigo()==contacto.getCliente()))
          {
              selecciona="selected";
               x=cliente.getContribuyente();
          }
          else
              selecciona="";
              

          %>
  
      <option value='<%=cliente.getCodigo()%>'<%=selecciona%>><%=cliente.getNombre()%></option>
          <%
          
      }
 }%>
 
</select></td>
<td rowspan="<%=contadorbase+1%>"><input  type="submit"  NAME="Clientes" value="Calcular Comisiones" onclick="salirsi();"></td>



 
 <%
 float valor=0;
 float iva=0;
 float comis=0;
 float uno=0;
 float setenta=0;
 float tcomis=0;
 if (listbase != null) {
      Iterator itbase1 = listbase.iterator();
      while (itbase1.hasNext()) {
          Descuentobase  base=(Descuentobase) itbase1.next();
          valor=base.getValor();
          iva+=(base.getValor()+base.getCola())*porcentajeiva;
          //iva=base.getIva();
          comis=base.getComision();
          valor=valor*comis/100;
          iva=iva*comis/100;
          uno=valor*1/100;
          setenta=0;
          if (x==0)
            setenta=iva*70/100;
          tcomis+=(valor+iva)-(uno+setenta);
          
          //String seleccionUrl=CONTROLLER+"/Clientes/Selecciona?codigo="+cliente.getCodigo() ;
           %>
           <tr bgcolor="#CCFFFF">
          <td><%=base.getBase()%></td>
          <td><%=f.format(base.getTotal())%></td>
          <td><%=f.format((valor+iva)-(uno+setenta))%></td>
          <td><%=f.format(base.getTotal()-(valor+iva)+uno+setenta)%></td>
           </tr>
          <%
      }}%>
     
<input name="x" value="<%=x%>" 
type="hidden"  >
</tr>
<tr class="form1">
<th colspan="9" >Formas de Pago</th>
</tr>
</table>
<%//String ya=request.getParameter("i");
//Efectivo
String ya=request.getParameter("i");
      String efectivo=request.getParameter("efectivo");
      String obsefectivo=request.getParameter("obsefectivo");
      //Canjes
      String proveedores=request.getParameter("proveedores");
      String canje=request.getParameter("canje");
      //String documentoch=request.getParameter("documentoch");
      //Cheques
      String obsch=request.getParameter("obsch");
      String cheque=request.getParameter("cheque");
      String documentoch=request.getParameter("documentoch");
      // mpd
      String obsmpd=request.getParameter("obsmpd");
      String mpd=request.getParameter("mpd");
      String documentompd=request.getParameter("documentompd");
      // Credito
      String obscr=request.getParameter("obscredito");
      String cr=request.getParameter("credito");
      String documentocr=request.getParameter("documentocredito");
      /*// pta
      String obspta=request.getParameter("obspta");
      String pta=request.getParameter("pta");
      String documentopta=request.getParameter("documentopta");*/
      // Otros
      String obsotros=request.getParameter("obsotros");
      String otros=request.getParameter("otros");
      String documentootros=request.getParameter("documentootros");
      
%>
<%----------------%>
<%
if (ya!=null)
{
    List listfp= model.getFormasp();

if (listfp != null) {
      Iterator itlistfp= listfp.iterator();
      while (itlistfp.hasNext()) {
          Foramapagos forma=(Foramapagos) itlistfp.next();
          String formatipo=forma.getTipo().trim();
          if (formatipo.equals("EF"))
          {
              efectivo=String.valueOf(forma.getValor());
              obsefectivo=forma.getObservaciones();
          }
          else if (formatipo.equals("CJ"))
          {
              canje=String.valueOf(forma.getValor());
              proveedores=forma.getObservaciones();
          }
          else if (formatipo.equals("CH"))
          {
              cheque=String.valueOf(forma.getValor());
              obsch=forma.getObservaciones();
              documentoch=forma.getDocumento();
          }
          else if (formatipo.equals("MP"))
          {
              mpd=String.valueOf(forma.getValor());
              obsmpd=forma.getObservaciones();
              documentompd=forma.getDocumento();
          }
          else if (formatipo.equals("CR"))
          {
              cr=String.valueOf(forma.getValor());
              obscr=forma.getObservaciones();
              documentocr=forma.getDocumento();
          }
          /*else if (formatipo.equals("PT"))
          {
              pta=String.valueOf(forma.getValor());
              obspta=forma.getObservaciones();
              documentopta=forma.getDocumento();
          }*/
          else if (formatipo.equals("OT"))
          {
              otros=String.valueOf(forma.getValor());
              obsotros=forma.getObservaciones();
              documentootros=forma.getDocumento();
          }
          %>
          <%
          
      }
 }
}
           
    
  
          if (efectivo==null)
          {
              efectivo="0";
              obsefectivo="";
          }
          if (canje==null)
          {
              canje="0";
             proveedores=null;
          }
          if (cheque==null)
          {
              cheque="0";
              obsch="";
              documentoch="";
          }
          if (mpd==null)
          {
              mpd="0";
              obsmpd="";
              documentompd="";
          }
          if (cr==null)
          {
              cr="0";
              obscr="";
              documentocr="";
          }
         /* if (pta==null)
          {
              pta="0";
              obspta="";
              documentopta="";
          }*/
          if (otros==null)
          {
              otros="0";
              obsotros="";
              documentootros="";
          }

%>

<%----------------- fromas de pago----------------------%>
<table width="100%" align="center">           
<td width="40%" valign="top">
<table width="100%" align="center">           
<tr  valign="top">
<th >Valor</th>
<th>Documento</th>
<th>Observaciones</th>
</tr>
<tr class="form1">
<th colspan="3" >Efectivo</th>
</tr>
<tr>
<td>
<input name="efectivo" value="<%=efectivo%>" onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="2">
<input name="obsefectivo" value="<%=obsefectivo%>"  
type="text" size="30">
</td>
</tr>
<tr class="form1">
<th colspan="3" >Cheque</th>
</tr>
<tr>
<td>
<input name="cheque" value="<%=cheque%>"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="1">
<input name="documentoch" value="<%=documentoch%>"  
type="text" size="10">

<td colspan="1">
<input name="obsch" value="<%=obsch%>"  
type="text" size="20">
</td>
</tr>
<tr class="form1">
<th colspan="3" >MPD</th>
</tr>
<tr>
<td>
<input name="mpd" value="<%=mpd%>"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="1">
<input name="documentompd" value="<%=documentompd%>"  
type="text" size="10">

<td colspan="1">
<input name="obsmpd" value="<%=obsmpd%>"  
type="text" size="20">
</td>
</tr>

<tr class="form1">
<th colspan="3" >Credito</th>
</tr>
<tr>
<td>
<input name="credito" value="<%=cr%>"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="1">
<input name="documentocredito" value="<%=documentocr%>"  
type="text" size="10">

<td colspan="1">
<input name="obscredito" value=<%=obscr%>""  
type="text" size="20">
</td>
</tr>

<tr class="form1">
<th colspan="3" >Canje</th>
</tr>
<tr>
<td>
<input name="canje" value="<%=canje%>"   onchange="pagados(this.form)"
type="text" size="8" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="2">
<select name="proveedores" >
<option value="-1">->Seleccione un Proveedor<-</option>
<%List listproveedores = model.getProveedores();
//list.size()+1;
//int clientesl[]=new int[x];

if (listproveedores  != null) {
      Iterator itlistproveedores  = listproveedores.iterator();
      while (itlistproveedores.hasNext()) {
          Proveedores Proveedor=(Proveedores) itlistproveedores.next();
          y++;
          //x=cliente.getContribuyente();
          //clientesl[y]=cliente.getCodigo(); 
          selecciona="";
          int p=0;
          if (proveedores!=null)
              p=Integer.parseInt(proveedores.trim());
          if (p==Proveedor.getCodigo())
                selecciona="selected";
              
          //String seleccionUrl=CONTROLLER+"/Clientes/Selecciona?codigo="+cliente.getCodigo() ;
          %>
          
      <option <%=selecciona%> value='<%=Proveedor.getCodigo()%>'<%=selecciona%>><%=Proveedor.getRSocial()%>-<%=Proveedor.getSaldo()%></option>
          <%
          
      }
 }%>
 
</select></td>

</tr>


<tr class="form1">
<th colspan="3" >Otros</th>
</tr>
<tr>
<td>
<input name="otros" value="<%=otros%>"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="1">
<input name="documentootros" value="<%=documentootros%>"  
type="text" size="10">

<td colspan="1">
<input name="obsotros" value="<%=obsotros%>"  
type="text" size="20">
</td>
</tr>


</table>
</td>
<td width="60%" valign="top">
<%
if (ya!=null)
{
    List listtc= model.getTarjetas();

if (listtc != null) {
      Iterator itlisttc= listtc.iterator();
      while (itlisttc.hasNext()) {
          Tarjetas tarjetas=(Tarjetas) itlisttc.next();
          
          selecciona="";
          tc[conttc]=String.valueOf(tarjetas.getValor());
          Tc[conttc]=tarjetas.getTipo();
          tcn[conttc]=String.valueOf(tarjetas.getNumero());
          obstc[conttc]=tarjetas.getBaucher();
          conttc++;

          %>
          <%
          
      }
 }
}
    for(int g=0;g<=3;g++)
    {
        aux=request.getParameter("tc"+String.valueOf(g+1));
        
        if (aux!=null)
            tc[g]=aux;
        else if(tc[g]==null)
            tc[g]="0";
        aux=request.getParameter("tcn"+String.valueOf(g+1));
         
        if (aux!=null)
            tcn[g]=aux;
        else if(tcn[g]==null)
            tcn[g]="0";
        
        aux=request.getParameter("Tc"+String.valueOf(g+1));
        
        if (aux!=null)
            Tc[g]=aux.trim();
        else if(Tc[g]==null)
            Tc[g]="X";
        
        aux=request.getParameter("obstc"+String.valueOf(g+1));
        if (aux!=null)
            obstc[g]=aux;
        else if(obstc[g]==null)
            obstc[g]="";
        
    }  
//}
%>

<%-------------Tarjetas de cCredito-------------%>

<table width="100%" align="center">           
</tr>
<tr class="form1">
<th colspan="4" >Tarjeta de Credito</th>
</tr>
<tr >
<th >Valor</th>
<th>Numero</th>
<th colspan="1">Banco</th>
<th>Boucher</th>
</tr>

<tr>
<td>
<input name="tc1" value="<%=tc[0]%>"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<input name="tcn1" value="<%=tcn[0]%>"  
type="text" size="8" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<select name='Tc1'>
<%
selecciona="";

aux=Tc[0].trim();
//if (aux==null)
//    aux="";
if (aux.equals("D"))
    selecciona="selected";
%>
<option value='d' <%=selecciona%>>Dinners Club</option>
<% 
selecciona="";
if (aux.equals("V"))
    selecciona="selected";
%>

<option value='v' <%=selecciona%>>Visa</option>
<% 
selecciona="";
if (aux.equals("M"))
    selecciona="selected";
%>

<option value='m' <%=selecciona%>>Master Card</option>
<% 
selecciona="";
if (aux.equals("A"))
    selecciona="selected";
%>

<option value='a' <%=selecciona%>>American Express</option>

</select>
</td>
<td colspan="1">        
<input name="obstc1" value="<%=obstc[0]%>"  
type="text" size="15">
</td>
</tr>

<tr>
<td>
<input name="tc2" value="<%=tc[1]%>"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<input name="tcn2" value="<%=tcn[1]%>"  
type="text" size="8" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<select name='Tc2'>
<%
aux=Tc[1].trim();
//if (aux==null)
//    aux="";
if (aux.equals("D"))
    selecciona="selected";
%>
<option value='d' <%=selecciona%>>Dinners Club</option>
<% 
selecciona="";
if (aux.equals("V"))
    selecciona="selected";
%>

<option value='v' <%=selecciona%>>Visa</option>
<% 
selecciona="";
if (aux.equals("M"))
    selecciona="selected";
%>

<option value='m' <%=selecciona%>>Master Card</option>
<% 
selecciona="";
if (aux.equals("A"))
    selecciona="selected";
%>

<option value='a' <%=selecciona%>>American Express</option>
</select>
</td>
<td colspan="1">
<input name="obstc2" value="<%=obstc[1]%>"  
type="text" size="15">
</td>
</tr>

<tr>
<td>
<input name="tc3" value="<%=tc[2]%>"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<input name="tcn3" value="<%=tcn[2]%>"  
type="text" size="8" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<select name='Tc3'>
<%
aux=Tc[2].trim();
//if (aux==null)
//    aux="";
if (aux.equals("D"))
    selecciona="selected";
%>
<option value='d' <%=selecciona%>>Dinners Club</option>
<% 
selecciona="";
if (aux.equals("V"))
    selecciona="selected";
%>

<option value='v' <%=selecciona%>>Visa</option>
<% 
selecciona="";
if (aux.equals("M"))
    selecciona="selected";
%>

<option value='m' <%=selecciona%>>Master Card</option>
<% 
selecciona="";
if (aux.equals("A"))
    selecciona="selected";
%>

<option value='a' <%=selecciona%>>American Express</option>
</select>
</td>
<td colspan="1">
<input name="obstc3" value="<%=obstc[2]%>"  
type="text" size="15">
</td>
</tr>

<tr>
<td>
<input name="tc4" value="<%=tc[3]%>"  onchange="pagados(this.form)" 
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<input name="tcn4" value="<%=tcn[3]%>"  
type="text" size="8" maxlength="10" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<select name='Tc4'>
<%
aux=Tc[3].trim();
//if (aux==null)
//    aux="";
if (aux.equals("D"))
    selecciona="selected";
%>
<option value='d' <%=selecciona%>>Dinners Club </option>
<% 
selecciona="";
if (aux.equals("V"))
    selecciona="selected";
%>

<option value='v' <%=selecciona%>>Visa</option>
<% 
selecciona="";
if (aux.equals("M"))
    selecciona="selected";
%>

<option value='m' <%=selecciona%>>Master Card</option>
<% 
selecciona="";
if (aux.equals("A"))
    selecciona="selected";
%>

<option value='a' <%=selecciona%>>American Express</option>
</select>
</td>
<td colspan="1">
<input name="obstc4" value="<%=obstc[3]%>"  
type="text" size="15">
</td>
</tr>

<tr class="form1">
<th colspan="4" >Resumen</th>
</tr>
<tr >
<th colspan="2">Descripcion</th>
<th colspan="2">Valor</th>
</tr>
<tr bgcolor="#FFCC00">
<td colspan="2">
    valor a pagar:
</td>
<td colspan="2">
<span id="apagar"  style="position:relative;">
</span>
</td>
</tr>
<tr bgcolor="#FFCC00">
<td colspan="2">
    (-) menos comisiones:
</td>
<td colspan="2">
<span id="comisioness"  style="position:relative;">
<%=f.format(tcomis)%>
</span>
</td>
<input name="comision" value="<%=tcomis%>" 
type="hidden"  >

</tr>
<tr bgcolor="#FFCC00">
<td colspan="2">
    (-) valor pagado:
</td>
<td colspan="2">
<span id="pagado"  style="position:relative;">
0
</span>
</td>

<tr bgcolor="#FFCC00">
<td colspan="2">
    Saldo:
</td>
<td colspan="2">
<span id="saldo"  style="position:relative;">
0
</span>
</td>

</tr>

</tr>
<tr class="form1">
<th colspan="4" >Adicionales</th>
</tr>
<tr>
<th colspan="2">
RUC
</th>
<th colspan="2">
Razon Social
</th>

</tr>
<tr>
<td colspan="2">
<input name="Ruc" value="<%=Ruc%>"  
type="text" size="15" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="2">
<input name="Razonsocial" value="<%=Razon%>"  
type="text" size="30">
</tr>
<tr>
<th colspan="4">
Tour Code
</th>
</tr>
<tr>
<td colspan="4">
<input name="Tourcode" value="<%=Tour%>"  
type="text" size="30">
</td>
</tr>
<tr>
<th colspan="4">
Sucursal donde se retira el Boleto
</th>
</tr>
<tr>
<%String  sucursale=contacto.getSucursalenvia();
 if (sucursale==null)
    sucursale="";
 else
   sucursale=sucursale.trim();
%>
<td colspan="4">
<select name='sucursale' onchange="cambiasucursal();">    
<%
 List listsucursal = model.getSucursales();
 if (listsucursal!= null) {
      Iterator itsucursal = listsucursal.iterator();
      while (itsucursal.hasNext()) {
          Sucursales sucursal=(Sucursales) itsucursal.next();
          selecciona="";
          
          if(sucursale.equals(sucursal.getCodigo().trim()))
            selecciona="selected";  
          %>
   <option value='<%=sucursal.getCodigo()%>' <%=selecciona%>><%=sucursal.getDescripcion()%></option>       
      
 <%}}%>    
    
</select>    
<%---------------------------
<td colspan="4">
<input name="sucursale" value="<%=sucursale%>"  
type="text" size="20" onChange="javascript:this.value=this.value.toUpperCase();">
----------------------%>
</td>
</tr>
<tr>
<th colspan="4">
Nombre de quien paga el PTA 
</th>
</tr>
<tr>
<%String  npta=contacto.getNombrepta();
 if (npta==null)
    npta="";%>
<td colspan="4">
<input name="ptanombre" value="<%=npta%>"  
type="text" size="30" onChange="javascript:this.value=this.value.toUpperCase();">
</td>
</tr>

</table>


</td>
</table>

<table width="100%" align="center">           
<script language="JavaScript"> 
totales();
pagados(document.TarifasReservas);
/*
for (z=1;z<=<%=i%>;z++)
{
    //cambiasc(document.TarifasReservas,z,1);
    cambiadescuento(document.TarifasReservas,z,1);
}
*/
<%---------------------------  

-----------------%>
function cambiasucursal()
{
for (z=1;z<=<%=i%>;z++)
{
    //cambiasc(document.TarifasReservas,z,1);
    cambiadescuento(document.TarifasReservas,z,1);
}

}
function cambiasc(formulario,i,j){

 texto=eval("formulario.sc"+i);
 var texto1=texto.value;
 todo=eval("formulario.rttotal"+i);
 var tot=todo.value;
 document.getElementById("rTtotal"+i ).innerHTML=parseFloat(tot)+parseFloat(texto1); 
 
 <%-------------
 
 ---------------%>
 totales();

 
}
 
 function cambiadescuento(formulario,i,j)
{

 texto=eval("formulario.descuento"+i);
 texto1=100-parseFloat(texto.value);
 texto1=texto1/100;
 var tttvalor=0;
 var tttiva=0;
 var ttttotal=0;
 for (k=1;k<=<%=j%>;k++)
 {
    // 'Total<%=i%><%=j%>',
    capa="Total"+i+k;
    Valor="Valor"+i+k;
    Iva="Iva"+i+k;
    total=eval("formulario.total"+i+k);
    
    var que="document.TarifasReservas.rvalor"+i;
        que=que+k;
    
    valork=eval(que);
    
   //alert(valork.value);     
    var valordesc1=valork.value;
    var valordesc=texto1*parseFloat(valordesc1);
    var iva=parseFloat(valordesc)*<%=porcentajeiva%>;
    tttvalor+=valordesc;
    tttiva+=iva;
    //alert(capa);
    Total=parseFloat(total.value)-(parseFloat(valordesc1)+parseFloat(valordesc1)*.12);
    Total=Total+valordesc+iva;
    //total=document.getElementById(capa).innerHTML;
    document.getElementById(Valor).innerHTML=Math.round(valordesc * 100) / 100 ; 
    document.getElementById(Iva).innerHTML=Math.round(iva * 100) / 100 ;
    
    document.getElementById(capa).innerHTML=Math.round(Total * 100) / 100 ;
    ttttotal+=Total;
    delete valork;
 }
 
 document.getElementById("rValor"+i).innerHTML=Math.round(tttvalor* 100) / 100 ;
 document.getElementById("rIva"+i).innerHTML=Math.round(tttiva* 100) / 100 ;
 document.getElementById("rTtotal"+i ).innerHTML=Math.round(ttttotal* 100) / 100 ;
 totales();
} 
function totales()
{
var total=0;
var iva=0;
var valor=0;
    for (i=1;i<=<%=i%>;i++)
    {
     capa="rrTtotal"+i;
     Valor="rrValor"+i;
     Iva="rrIva"+i; 
     total+=parseFloat(document.getElementById(capa).innerHTML);
     valor+=parseFloat(document.getElementById(Valor).innerHTML);
     iva+=parseFloat(document.getElementById(Iva).innerHTML);
    <%----------------
     -------------------%>    
    }
    <%-------------------Infantes-------------------%> 
     if (<%=infanteuno%>>0)
     {
        capa="rTtotali";
        Valor="rValori";
        Iva="rIvai"; 
        total+=parseFloat(document.getElementById(capa).innerHTML);
        valor+=parseFloat(document.getElementById(Valor).innerHTML);
        iva+=parseFloat(document.getElementById(Iva).innerHTML);
        }
    <%-------------------------------------------%>  
    document.getElementById("TValor").innerHTML=Math.round(valor* 100) / 100 ;
    document.getElementById("TIva").innerHTML=Math.round(iva * 100) / 100 ;
    document.getElementById("TTotal").innerHTML=Math.round(total * 100) / 100 ;
    document.getElementById("apagar").innerHTML=Math.round(total * 100) / 100 ;
    pag=parseFloat(document.getElementById("pagado").innerHTML)
    document.getElementById("saldo").innerHTML=Math.round((total-pag-<%=tcomis%>) * 100) / 100 ;
}
function pagados(formulario)
{
     efe=eval("formulario.efectivo");
     cheque=eval("formulario.cheque");
     mpd=eval("formulario.mpd");
     otros=eval("formulario.otros");
     credito=eval("formulario.credito");
     canje=eval("formulario.canje");
     pta=0;//eval("formulario.pta");
     tc=0;
     for(i=1;i<=4;i++)
     {
        tcx=eval("formulario.tc"+i);
        tc+=parseFloat(tcx.value);
     }
     <%----------------
     total=parseFloat(tc)+parseFloat(efe.value)+parseFloat(cheque.value)+parseFloat(pta.value)+
           parseFloat(mpd.value)+parseFloat(otros.value)+parseFloat(credito.value)+parseFloat(canje.value);
     ------------------%>      
     total=parseFloat(tc)+parseFloat(efe.value)+parseFloat(cheque.value)+
           parseFloat(mpd.value)+parseFloat(otros.value)+parseFloat(credito.value)+parseFloat(canje.value);
     
     document.getElementById("pagado").innerHTML=Math.round(total * 100) / 100 ;
     totales();
     
}
<%---------------------

<%
-------------------%>
</script> 
<script language="Javascript">
function imprSelec(nombre)
{
  var ficha = document.getElementById(nombre);
  var ventimp = window.open(' ', 'popimpr');
  ventimp.document.write( ficha.innerHTML );
  ventimp.document.close();
  ventimp.print( );
  ventimp.close();
}
</script> 



<%------Fin Prueba-----------------%>
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
 <%----------->
<tr>
 <td>
 <a href="javascript:imprSelec('seleccion')" >Imprime la ficha</a>
 </td
 </tr>
 <%--------------%>
 </form>
 
</table>
</td>
</tr>
</table>


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


