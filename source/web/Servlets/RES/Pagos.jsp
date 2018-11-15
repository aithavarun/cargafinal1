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
int hlentero=0;
%>
<script LANGUAGE="JavaScript"> 


function validar(frm){

var salir = frm.salir.value;


 if (salir==1)
 {
        return true;
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
<form method="post" action="<%=CONTROLLER%>/Reservas/Tarifas"  
name="TarifasReservas"   onSubmit="return validar(this)" 
>
<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="8" >Modificar Reserva</th>
</tr>
<tr class="form1">
<th colspan="8" >Grupo y Contacto</th>
</tr>
<TR bgcolor="#CCCCCC">
<% Cabecera contacto=model.getCabecera();
Calendar fecha=contacto.getFechatc();
int infint=0;
        //fecha.setTime(contacto.getFechat());
        int aniot=fecha.get(Calendar.YEAR);
        int mest=fecha.get(Calendar.MONTH)+1;
        int diat=fecha.get(Calendar.DATE);

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
<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >
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
<%-----------------
----------------%>
</table>
<table width="100%" align="CENTER">


<tr class="form1">
<th colspan="8" >Tarifas</th>

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
<%------------
<input name="codigo<%=contador%>" value="<%=codigo1%>" 
type="hidden" >
<input name="cambia<%=contador%>" value="<%=vale%>" 
type="hidden"  >
--------------------%>
<td colspan="2"><b><%=FORMATOFECHA.format(vuelo.getFecha())%></b>
<td colspan="1"><%=vuelo.getOrigen()%></td>
<td colspan="1"><%=vuelo.getDestino()%></td>
<td><%=vuelo.getNumero()%></td>
<td colspan="1"><%=f1.format(vuelo.getHora())+":"+f1.format(vuelo.getMinuto())%></td>
<td><%=vuelo.getAvion()%></td>
</tr>
<tr bgcolor="#CCFFFF">
<td colspan="8">
<input name="viaje<%=contador%>" value="<%=vuelo.getOrigen()%><%=vuelo.getDestino()%>" 
type="hidden"  >

<select name='Tipo<%=codigo1%>'
 onchange="cambia(document.TarifasReservas.Tipo<%=codigo1%>.options[document.TarifasReservas.Tipo<%=codigo1%>.selectedIndex].value
,document.TarifasReservas.Tipo<%=codigo1%>.options[document.TarifasReservas.Tipo<%=codigo1%>.selectedIndex].text)">
<%

model.TraerTarifas(vuelo.getOrigen(),vuelo.getDestino(),contacto.getClase().trim()+"%");
List listas = model.getTarifas();
String Base="";
String Origen="";
String Destino="";

if  (listas != null)  {
    Iterator itvs = listas.iterator();
    while (itvs.hasNext()) { 
                       
       Tarifas tarifa=(Tarifas) itvs.next();
       
       
       if (!Base.equals(tarifa.getBase().trim()))
       {
           
            Base=tarifa.getBase().trim();
                   %>
                   
                   <option value='<%=vuelo.getOrigen().trim()+vuelo.getDestino().trim()+"."+tarifa.getBase()%>' >
                    <%=tarifa.getBase()%> - <%=tarifa.getRestriccionesN().trim()+ " Validez : " + String.valueOf(tarifa.getValidez()) + " dìas"%>
                   </option>
       <% 
       }%>
       
       
    <% }
}%>
</select>
</td>
</tr>

<%}}%>



<input name="CONTADOR" value="<%=contador%>" 
type="hidden" >

</table>

<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="10" >Pasajeros</th>
</tr>
<tr>

<th >Apellido</th>
<th >Nombre</th>
<th >Cedula</th>
 <th  >Boleto</th>
 <th  >Nac.</th>
 <th>No.</th>
</tr>

<%
  List lista2 = model.getReservaestado();
  String Cedula="";
  String Apellido="";
 
  String Tipo="";
  String Tipoa="";
  String Estado="";
  String selecciona="";
  String Estado1="";
  
  //contador=0;
  int i=0;
 color="#CCFFFF";
  String colore="#CCFFFF";
  int tipob=0;
    int aux=0;
    long vuelo=0;
    String tipoB="0";
  long reservacodigo=0;
  int t=0;
              if  (lista2 != null)  {
                    Iterator itr = lista2.iterator();
                   while (itr.hasNext()) {
                        Reservaestado reserva=(Reservaestado) itr.next();
                     
                   Cedula="";  
                 
                   //Apellido=reserva.getApellido()+" "+reserva.getNombre();
                  
                   
                   if (reserva.getCedula()!=null)
                                Cedula=reserva.getCedula();
                  
                  if (!Tipo.equals(reserva.getTipo().trim()))
                  {
                   if (t!=0)
                  {
                        tipoB=String.valueOf(t);
                        Tipoa=Tipo;
                   }
                    Tipo=reserva.getTipo().trim();   
                    t=0;
                    
                    
%>
<%if (!tipoB.equals("0")){%>
<input name="<%=Tipoa%>" value="<%=tipoB%>" 
type="hidden"  >
<%}%>
<tr  class="tipo">
<th colspan="10" ><input type="checkbox" name="Pax<%=Tipo%>" onclick="anulo('<%=Tipo%>','<%=t%>')">Pasajeros <%=Tipo%></th>
</tr>
<%}
long boleto=reserva.getBoletonumero();    

 if (reservacodigo!=reserva.getReservacodigo())
 {
     reservacodigo=reserva.getReservacodigo();  
     i++;
     t++;
     aux=0;
     tipoB=reserva.getBoletotipo();
     //boleto=
     if(boleto<0)
         boleto=0;
                    tipob=0;
                    if (tipoB==null)
                        tipoB="";
                    else
                        tipoB=tipoB.trim();
                  if (tipoB.equals("B"))
                      tipob=0;
                    else if (tipoB.equals("W"))
                      tipob=1;
                    else if (tipoB.equals("E"))
                      tipob=2;  
                    else if (tipoB.equals("A"))
                      tipob=3;
                    else if (tipoB.equals("R"))
                      tipob=4;
                    else if (tipoB.equals("H"))
                      tipob=5;  
                    else 
                      tipob=0;  
 
%>
<input name="Tipos<%=i%>" value="<%=Tipo%>"
type="hidden"  >
<tr bgcolor="#CCFFFF">
<td><input type="checkbox" name="Pax<%=Tipo%><%=t%>">
<%=reserva.getApellido().trim()%>
</td>
<td>
<%=reserva.getNombre().trim()%> 
</td>       
<td><%=Cedula%> 
</td>
<input name="Nacionalidad<%=i%>" value="<%=reserva.getNacionalidad()%>" 
type="hidden"  >
<td><%=boleto%> 
</td>
<td><%=reserva.getNacionalidad()%> 
</td>
<td rowspan="<%=contador+1%>" bgcolor="#CCCCCC"><%=i%>-<%=t%> </td>

</tr>
<%------------
<% 
if (reserva.getInfantes()==1)
{
    String Infa=reserva.getInfante();
                    if(Infa==null)
                        Infa="";
       infint=1;  
}    
%>
--------------%>

<%}
                   aux++;
if (reserva.getEstado().trim().equals("XX"))
    
{
  Estado1="HK";
   color="red";
   colore="#CCFFFF"; 
}
else if(reserva.getEstado().trim().equals("HK"))
{
  Estado1="XX";
 color="#CCFFFF";     
  colore="red"; 
}
else if(reserva.getEstado().trim().equals("HL"))
{
  Estado1="XX";
  color="#FFCC99";
  colore="red";
  hlentero=1;
}   
else if(reserva.getEstado().trim().equals("RR"))
{
  Estado1="XX";
  color="#00CCFF";
  colore="red"; 
}              
                  if (reserva.getBi()==0)
                  {
%>
<tr bgcolor="#CCFFFF">
<td bgcolor="<%=color%>"><b>
<%=reserva.getOrigen()+"-"+reserva.getDestino()+"-"+ reserva.getNumero() + "("+reserva.getEstado()+")"%> 
</b>
</td>


<td colspan="4">


<select name='<%=reserva.getOrigen()%><%=reserva.getDestino()%><%=i%>'  >
<%

model.TraerTarifasNacTipo(reserva.getOrigen(),reserva.getDestino(),reserva.getNacionalidad(),reserva.getTipo(),contacto.getClase().trim()+"%");
List listasx = model.getTarifas();
String Base="";
String Origen="";
String Destino="";
int m=0;
if  (listasx != null)  {
    Iterator itvsx = listasx.iterator();
    while (itvsx.hasNext()) { 
                       
       Tarifas tarifa=(Tarifas) itvsx.next();
       
       
       /*if (!Base.equals(tarifa.getBase().trim()))
       {*/
           
            Base=tarifa.getBase().trim();
            m++;
            if (tarifa.getBase().trim().equals(reserva.getTarifa().trim()))
                selecciona="SELECTED";
            else
                selecciona="";
                   %>
                   <option value='<%=tarifa.getBase().trim()+"."+tarifa.getTipo().trim()+"."+reserva.getNacionalidad().trim()%>'  <%=selecciona%>>
                    <%=tarifa.getBase().trim()%> - <%=f.format(tarifa.getValor())+" Q: " + f.format(tarifa.getCola()) +  " Iva: " + f.format(tarifa.getIva()) + " Seguro : " +f.format(tarifa.getSeguro())+" Tasa:"+f.format(tarifa.getTasa())%>
                   </option>
       <% 
       /*}*/%>
       
       
    <% }
}%>
</select>
<input name="T<%=reserva.getOrigen()%><%=reserva.getDestino()%><%=i%>" value="<%=m%>"
type="hidden"  >
</td>

<input name="vuelo<%=reserva.getOrigen()%><%=reserva.getDestino()%><%=i%>" value="<%=reserva.getVuelocodigo()%> " 
type="hidden"  >
<input name="estado<%=reserva.getOrigen()%><%=reserva.getDestino()%><%=i%>" value="<%=reserva.getEstado()%> " 
type="hidden"  >

<%------------

<input name="programacion<%=i%>_<%=aux%>" value="<%=reserva.getProgramacioncodigo()%> " 
type="hidden">
-------------%>
</tr>
                  
                   <%}}}%>
<input name="i" value="<%=i %>" 
type="hidden"  >
<input name="aux" value="<%=aux%>" 
type="hidden"  >
<%if (!tipoB.equals("0")){%>
<input name="<%=Tipo%>" value="<%=t%>" 
type="hidden"  >
<%}%>


<script >
function cambia(codigo,valor)
{

var origen =codigo.substring(0,codigo.indexOf("."));


var clase=valor.substring(0,valor.indexOf("-")-1);
var s=0;
for (i=1;i<=<%=i%>;i++)
{
    combo= eval("document.TarifasReservas."+origen+i);
    var total="document.TarifasReservas.T"+origen+i;
    objeto=eval(total);
    x=objeto.value;
    var tipos="document.TarifasReservas.Tipos"+i;
    tipo=eval(tipos);
    nacs="document.TarifasReservas.Nacionalidad"+i;
    nac=eval(nacs);
    hasta=eval("document.TarifasReservas."+tipo.value);
    s++;
    if (s<=hasta.value)
    {
         Ys="document.TarifasReservas.Pax"+tipo.value+s;
        Y=eval(Ys);
       
        if (Y.checked)
        {
            conn=clase+"."+tipo.value+"."+nac.value;
            conx=clase+"."+tipo.value+".*";
            for (k=0;k<=x-1;k++)
            {
                

                if ((combo[k].value==conn) || (combo[k].value==conx))

                {
                    combo[k].selected=true;
                    
                }
            }
        }
    } 
   else
   {
    s=0;
   }
}

}


function anulo(tipo,numero)
{
   
    Estado=eval("document.TarifasReservas.Pax"+tipo);
    if (Estado.checked)
    {
        i=1;
     }
   else
   {
    i=0;
   }
   var documento="";
   var hasta=eval("document.TarifasReservas."+tipo);
   for (j=1;j<=hasta.value;j++)
   {
  
        
            documento="document.TarifasReservas.Pax"+tipo+j;
            
             if (documento!=null)
            {
                R = eval(documento);
                R.checked=i;
            }
        
        
    
    }
    
    
    
}
</script>
</table>
<%-------------Infantes--------------%>

<table width="100%" align="center">        
<tr  class="tipo">
<tH colspan="5">
Infante
</tH>


</tr>
<tr>

<th  colspan="3">Apellido/Nombre</th>

 
 
 <th  >Boleto</th>
 <th  >Nac.</th>

</tr>


<%
reservacodigo=0;
int infauno=0;
List  listainf = model.getReservasi();
              if  (listainf != null)  {
                    Iterator itinf = listainf.iterator();
                   while (itinf.hasNext()) {
                        Reservaestado reserva=(Reservaestado) itinf.next();
                      String Infa=reserva.getInfante();
                      long Boletoi=reserva.getBoletonumero();
                      infauno++;
                      if (Boletoi<0)
                          Boletoi=0;
                    if(Infa==null)
                        Infa="";   
                      
%>


<%
 if (reservacodigo!=reserva.getReservacodigo())
 {
     reservacodigo=reserva.getReservacodigo();  
     i++;
     t++;
     aux=0;
     tipoB=reserva.getBoletotipo();
                    tipob=0;
                    if (tipoB==null)
                        tipoB="";
                    else
                        tipoB=tipoB.trim();
                  if (tipoB.equals("B"))
                      tipob=0;
                    else if (tipoB.equals("W"))
                      tipob=1;
                    else if (tipoB.equals("E"))
                      tipob=2;  
                    else if (tipoB.equals("A"))
                      tipob=3;
                    else if (tipoB.equals("R"))
                      tipob=4;
                    else if (tipoB.equals("H"))
                      tipob=5;  
                    else 
                      tipob=0;  
     
%>
<tr bgcolor="#99FFFF">
<td colspan="3"><%=Infa%></td>
<td><%=Boletoi%></td>
<td><%=reserva.getNacionalidad()%></td>
</tr>

<%}

if (reserva.getEstado().trim().equals("XX"))
    
{
  Estado1="HK";
   color="red";
   colore="#CCFFFF"; 
}
else if(reserva.getEstado().trim().equals("HK"))
{
  Estado1="XX";
 color="#CCFFFF";     
  colore="red"; 
}
else if(reserva.getEstado().trim().equals("HL"))
{
  Estado1="XX";
  color="#FFCC99";
  colore="red"; 
}   
else if(reserva.getEstado().trim().equals("RR"))
{
  Estado1="XX";
  color="#00CCFF";
  colore="red"; 
}              
       if (infauno>=1)
                  {           %>
<tr bgcolor="#CCFFFF">
<td bgcolor="<%=color%>"><b>
<%=reserva.getOrigen()+"-"+reserva.getDestino()+"-"+ reserva.getNumero() + "("+reserva.getEstado()+")"%> 
</b>
</td>


<td colspan="4">


<select name='i<%=reserva.getOrigen().trim()+reserva.getDestino().trim()%>'>
<%

model.TraerTarifasNacTipo(reserva.getOrigen(),reserva.getDestino(),reserva.getNacionalidad(),"INF",contacto.getClase().trim()+"%");
List listasx = model.getTarifas();
String Base="";
String Basei="";
String Base1="";
String Origen="";
String Destino="";
int m=0;
if  (listasx != null)  {
    Iterator itvsx = listasx.iterator();
    while (itvsx.hasNext()) { 
                       
       Tarifas tarifa=(Tarifas) itvsx.next();
       
       
       /*if (!Base.equals(tarifa.getBase().trim()))
       {*/
           
            Base=tarifa.getBase().trim();
            m++;
            Base1="";
            if (tarifa.getBase()!=null)
                Base1=tarifa.getBase().trim();
           Basei="";
            if (reserva.getTarifai()!=null)
                Basei=reserva.getTarifai().trim(); 
            if (Base1.equals(Basei))
                selecciona="SELECTED";
            else
                selecciona="";
                   %>
                   <option value='<%=Base1+"."+tarifa.getTipo().trim()+"."+reserva.getNacionalidad().trim()%>' <%=selecciona%> >
                    <%=Base1%> - <%=f.format(tarifa.getValor())+ " Iva: " + f.format(tarifa.getIva()) + " Seguro : " +f.format(tarifa.getSeguro())+" Tasa:"+f.format(tarifa.getTasa())%>
                   </option>
       <% 
       /*}*/%>
       
       
    <% }
}%>
</select>
</td>

<input name="vueloi<%=reserva.getOrigen().trim()+reserva.getDestino().trim()%>" value="<%=reserva.getVuelocodigo()%> " 
type="hidden"  >
<input name="estadoi<%=reserva.getOrigen().trim()+reserva.getDestino().trim()%>" value="<%=reserva.getEstado()%> " 
type="hidden"  >
</tr>
<%}}}%>




</table>


<%------------Prueba-------------%>
<table width="100%" align="center">        
<tr class="form1">
<tH colspan="3">
Observaciones
</tH>
</tr>
<tr>
<td colspan="3" align="center"><textarea name="Obs" cols="100" rows="3"></textarea></td>

</TR>
<%
 lista = model.getReservas();
              if  (lista != null)  {
                    Iterator ito = lista.iterator();
                   while (ito.hasNext()) {
                        Observaciones obs=(Observaciones) ito.next();
                        
%>
<tr bgcolor="#99FFFF">
<td><%=obs.getUsuario()%></td>
<td><%=obs.getFecha()%></td>
<td><%=obs.getHora()%></td>
</tr>
<tr bgcolor="#CCFFCC">
<td colspan="3"><%=obs.getObservacion()%></td>
</tr>

<%}}%>
</table>


<table width="100%" align="center">           
<%------Fin Prueba-----------------%>
<tr align="center">
<%if ((hlentero==0) && (usuario.getAcceso()<3))
{%>
<td align="center">
 <input TYPE="submit"    NAME="Grabar" value="Grabar" onclick="nosalir();">
 </td>
 <td align="center">
 <input TYPE="submit"    NAME="Pagos" value="Pagos" onclick="nosalir();">
 </td>
  
 <td align="center">
 <input TYPE="submit"    NAME="PTA" value="PTA" onclick="nosalir();">
 </td>
 <input name="salir" value="0" 
type="hidden"  >
<%}%>
 <td align="center">
 <input  type="submit"  NAME="Salir" value="Salir" onclick="salirsi();">
 </td>
 </tr>
 </form>
 
</table>
</td>
</tr>
</table>


<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


