<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Timestamp"%>





<%@ include file="/WEB-INF/Banner.jsp"%>  
<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<script language="javascript">
	function llenar()
	{
        var todo=eval("document.NombresReservas.Rapido");
        var nombres=todo.value;
        var i; 
        var ja = new Array(); 
        
        ja = nombres.split("/"); 
        
        for(i=0;i<ja.length;i++) 
        {
            var aux=ja[i].indexOf(" ");
            //alert (aux);
            var Apellido=ja[i].substring(0,aux);
            alert (Apellido);
            var Nombre=ja[i].substring(aux +1,ja[i].length);
            var campo=eval("document.NombresReservas.Nombre"+(i+1));
	    var campo1=eval("document.NombresReservas.Apellido"+(i+1));
	    campo.value=Nombre;
	    campo1.value=Apellido;
        }
        }
function aplicar()
	{
        //var todo=eval("document.NombresReservas.Rapido");
        
        //alert("aca");
        var desde=eval("document.NombresReservas.desdeRapido");
        var hasta=eval("document.NombresReservas.hastaRapido");
        //var nombres=todo.value;
        var i=parseInt(desde.value); 
        var j=parseInt(hasta.value); 
        var ja = new Array(); 
        var rapido=eval("document.NombresReservas.nombresRapido");
        var nombres=rapido.value;
        ja = nombres.split("/"); 
        //alert("aqui");
        var f=0;
        for(k=i;k<=j;k++) 
        {
            //var aux=ja[k].indexOf(" ");
            //alert (aux);
            var Apellido=eval("document.NombresReservas.apellidoRapido");
            //alert (Apellido);
            var Nombre=ja[f];
            var campo=eval("document.NombresReservas.Nombre"+(k));
	    var campo1=eval("document.NombresReservas.Apellido"+(k));
	    campo.value=Nombre;
	    campo1.value=Apellido.value;
	    f++;
	    //alert(Nombre);
        }
	}		
	function seleccionar(contador)
	{
        var desde=eval("document.NombresReservas.desdeRapido");
        var hasta=eval("document.NombresReservas.hastaRapido");
        var i=parseInt(desde.value); 
        var j=parseInt(hasta.value); 

        comboEstado= eval("document.NombresReservas.Estadorapido");
        
        
        for(k=i;k<=j;k++) 
        {
         for (w=1 ;w<=contador;w++)
         {
            comboEstado1= eval("document.NombresReservas.Estado"+k+"_"+w);
            comboEstado2= eval("document.NombresReservas.Estado"+k+"_"+w);
            comboEstado1[comboEstado.selectedIndex].selected = true;
            comboEstado2[comboEstado.selectedIndex].selected = true;
         }
	
        }
	}		
function cambiaboletotipo()
{
    
}
</script>
<table width="100%" align="left">
<tr>



<td valign="top" width="100%" >
<table width="100%" align="CENTER">
<form method="post" action="<%=CONTROLLER%>/Reservas/Modificarn"  
name="NombresReservas"  
>
<tr class="form1">
<th colspan="6" >Modificar Nombres - Estados</th>
</tr>
<tr class="form1">
<th colspan="6" >Grupo y Contacto</th>
</tr>
<TR bgcolor="#CCCCCC">
<% Cabecera contacto=model.getCabecera();%>
<td><b>Booking Reference:</b></td>
<td ><b><%=contacto.getBooking()%></b></td> 
<td>Quien Solicita:</td>
<td><%=contacto.getQuiens()%></td> 
<td>Telefono:</td>
<td><%=contacto.getTelefono()%></td>
</tr>
<input name="codigo" value="<%=contacto.getCodigo()%>" 
type="hidden"  >
<TR bgcolor="#CCCCCC">
<td colspan="1"><b>Grupo:</b></td>
<td colspan="7">
<%=contacto.getGrupo().trim()%>
</td>

</tr>


<tr>
<th colspan="6" >Time Limit</th>
</tr>
<td><b>Fecha:</b></td>
<td colspan="2" ><b><%=FORMATOFECHA.format(contacto.getFechat())%></b></td> 
<td><b><%=f.format(contacto.getHorat())+":"+f.format(contacto.getMinutot())%></b></td> 

<tr>
</TR>


<tr class="form1">
<th colspan="6" >Datos del Viaje</th>

</tr>
<tr >
<th >Fecha</th>
<th >Origen</th>
 <th >Destino</th>
 <th >Numero</th>
 <th >Hora</th>
 <th >Avion</th>
</tr>

<%
String titulo="";
String titulo1="";
int contador=0;
 List lista = model.getVueloreserva();
              if  (lista != null)  {
                    Iterator itv = lista.iterator();
                   while (itv.hasNext()) {
                        Vuelosreserva vuelo=(Vuelosreserva) itv.next();
                    titulo=vuelo.getAvion().trim();
                    String seleccionUrl=CONTROLLER+"/Avion/Selecciona?codigo="+vuelo.getCodigoavion()+"&programacion=" +vuelo.getCodigo();
                     if (!titulo.equals("OPEN"))  
                        contador++;
                    
                       
                      
                    
%>

<tr class="vuelo">
                     <%if (!titulo.equals("OPEN"))
                     {%>
<td  ><input type="checkbox" name="stado<%=contador%>" value= "stado<%=contador%>" onclick=" anulo(<%=contador%>)"><%=FORMATOFECHA.format(vuelo.getFecha())%></td>       
<%}else
{%>             
<td>Tramo Abierto </td>
<%}%>
<td><%=vuelo.getOrigen()%></td>
<td><%=vuelo.getDestino()%></td>
<td><%=vuelo.getNumero()%></td>
<td><%=f.format(vuelo.getHora())+":"+f.format(vuelo.getMinuto())%></td>
<td>
<A HREF="<%=seleccionUrl%>">
<%=vuelo.getAvion()%> </a>

</td>
</tr>

<tr>
<td   colspan="6">
<%
model.BuscarAsientos(vuelo.getCodigoavion());
model.BuscarAsientosocupados(vuelo.getCodigo());
model.MaximoAsiento(vuelo.getCodigoavion());
%>
<%-------------------------------------
<%@ include file="/WEB-INF/Asientos.jsp"%>
-----------------------------%>
</td>
</tr>
<%}}%>


<table width="100%" align="CENTER">
<tr class="form1">
<th colspan="10" >Pasajeros</th>
</tr>
<%-------------------Rapido-------------------%>
<tr>
<%-----------------------------------------------
<td colspan="1"><input name="Rapido" value="" 
type="text" size="20" maxlength="100"  onChange="javascript:this.value=this.value.toUpperCase();llenar();"> </td>
------------------%>
<td colspan="1">Desde:<input name="desdeRapido" value="1" 
type="text" size="3" maxlength="3"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"> </td>
<td colspan="1">Hasta:<input name="hastaRapido" value="1" 
type="text" size="3" maxlength="3"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"> </td>
<td>
<select name="Estadorapido">
<option value='HK' >HK</option>
<option value='HL' >HL</option>
<option value='RR' >RR</option>
<option value='XX' >XX</option>
</select>
</td>
<TD>

<A HREF="javascript:seleccionar(<%=contador%>)">Seleccionar</A>
</td>
</tr>
<tr>
<td colspan="1">Apellido:<input name="apellidoRapido" value="" 
type="text" size="20" maxlength="100"  onChange="javascript:this.value=this.value.toUpperCase();llenar();"> </td>
<td colspan="1">Nombres:<input name="nombresRapido" value="" 
type="text" size="20"  onChange="javascript:this.value=this.value.toUpperCase();llenar();"> </td>
<TD>
<A HREF="javascript:aplicar()">Aplicar</A>
</td>


</tr>
<tr>
<Td>
<select name='Tboletog' onchange="javascript:cambiaboletotipo();">
<option value='A'>Aerogal</option>
<option value='B' >BSP</option>
<option value='W'>web</option>
<option value='E'>Eticket</option>
<option value='R'>Revisi&oacute;n</option>
<option value='H'>Ch.Coorp.</option>
</select>
</td>
</tr>
<%-------------------Fin Rapido-------------------%>
<tr>

<th >Apellido</th>
<th >Nombre</th>
<th >Cedula</th>
 
 <%-------<th >Estado <%=titulo%></th>-----------%>
 <%----------------- valido
<th colspan="2"><input type="checkbox" name="Titulo1" onclick="anulo(2)">Estado <%=titulo1%></th>

<%------- <th >Estado <%=titulo1%></th>-
<%----------------- valido----------%>
 <th  >Boleto</th>
 <th  >Tipo</th>
 <th>No.</th>
</tr>

<%
  List lista2 = model.getReservaestado();
  String Cedula="";
  String Apellido="";
  String Infante="";
  String Tipo="";
  String Estado="";
  String Asiento="";
  String Estado1="";
  String cambia="";
  //contador=0;
  int i=0;
  String color="#CCFFFF";
  String colore="#CCFFFF";
  int tipob=0;
    int aux=0;
    long vuelo=0;
    String tipoB="";
  long reservacodigo=0;
  long Frecuente=0;           
              if  (lista2 != null)  {
                    Iterator itr = lista2.iterator();
                   while (itr.hasNext()) {
                        Reservaestado reserva=(Reservaestado) itr.next();
                     
                   Cedula="";  
                   Infante="";
                   //Apellido=reserva.getApellido()+" "+reserva.getNombre();
                  
                   
                   if (reserva.getCedula()!=null)
                                Cedula=reserva.getCedula();
                   if (reserva.getInfante()!=null)
                                Infante=reserva.getInfante(); 
                  if (!Tipo.equals(reserva.getTipo().trim()))
                  {
                    Tipo=reserva.getTipo().trim();   
                    
%>


<tr  class="tipo">
<th colspan="10" >Pasajeros <%=Tipo%></th>
</tr>
<%}
 if (reservacodigo!=reserva.getReservacodigo())
 {
     reservacodigo=reserva.getReservacodigo();  
     i++;
     aux=0;
     Frecuente=reserva.getFrecuente();
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

<tr bgcolor="#CCFFFF">
<input name="Rcodigo<%=i%>" value="<%=reserva.getReservacodigo() %>" 
type="hidden"  >
<% if (reserva.getBoletocodigo()>0)
    cambia="true";
else
cambia="true";
%>

<td colspan="1" ><input name="Apellido<%=i%>" value="<%=reserva.getApellido().trim()%>" 
type="text" size="15" maxlength="50"  onKeypress="if (event.keyCode > 0 ) event.returnValue =<%=cambia%>;"> 
</td>
<td>
<input name="Nombre<%=i%>" value="<%=reserva.getNombre().trim()%>" 
type="text" size="15" maxlength="50" onKeypress="if (event.keyCode > 0 ) event.returnValue =<%=cambia%>;">
</td>       
<td><input name="Cedula<%=i%>" value="<%=Cedula%>" 
type="text" size="11" maxlength="15" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td>
<input name="Boletocodigo<%=i%>" value="<%=reserva.getBoletocodigo()%>" 
type="hidden"  >
<td><input name="Boleto<%=i%>" value="<%=reserva.getBoletonumero()%>" 
type="text" size="20" maxlength="50"   onchange="boleto(<%=i%>);" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td>
<select name='Tipoboleto<%=i%>'>
<option value='A'>Aerogal</option>
<option value='B' >BSP</option>
<option value='W'>web</option>
<option value='E'>Eticket</option>
<option value='R'>Revisi&oacute;n</option>
<option value='H'>Ch.Coorp.</option>
</select>
<script LANGUAGE="JavaScript"> 
comboEstado= eval("document.NombresReservas.Tipoboleto<%=i%>");
comboEstado[<%=tipob%>].selected = true;
</SCRIPT>
</td>
<td rowspan="<%=contador+2+reserva.getInfantes()%>" bgcolor="#CCCCCC"><%=i%> </td>
</tr>
<tr>
<td colspan="1"><b>Frecuente:</b></td>
<td>
<input name="Frecuente<%=i%>" value="<%=Frecuente%>" 
type="text" size="20" maxlength="20" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
<td colspan="1"><b>Tipo:</b></td>
<td>
<input name="Tipo<%=i%>" value="<%=Tipo%>" 
type="text" size="3" maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();">
</td>
<td>Nac. 
<%
String nacnac="";
%>

<select name='Clase<%=i%>'>
<% if(reserva.getNacionalidad().trim().equals("*"))
    nacnac="selected";
else
    nacnac="";
%>
 <option value='*' <%=nacnac%>>Todos</option>
 <% if(reserva.getNacionalidad().trim().equals("NAC"))
    nacnac="selected";
else
    nacnac="";
%>

 <option value='NAC'<%=nacnac%> >Nacional</option>
 <% if(reserva.getNacionalidad().trim().equals("EXT"))
    nacnac="selected";
else
    nacnac="";
%>

 <option value='EXT' <%=nacnac%> >Extranjero</option>
 </select>
</td>
</tr>
<% if (reserva.getInfantes()==1)
{
    String Infa=reserva.getInfante();
                    if(Infa==null)
                        Infa="";
%>
<tr bgcolor="#66FFFF">
<td><b>Infante:</b></td>
<td>
<input name="Infante<%=i%>" value="<%=Infa%>" 
type="text" size="20" maxlength="50" >
</td>
<td><b>Boleto Infante:</b></td>
<td colspan="1">
<input name="Boletoinf<%=i%>" value="<%=reserva.getBoletonumero()%>" 
type="text" size="20" maxlength="50"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
<input name="Boletocodigoi<%=i%>" value="<%=reserva.getBoletocodigo()%>" 
type="hidden"  >
</td>

                        </tr>
<%}%>
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
                
if (reserva.getAsiento()==null)
    Asiento="";
else
  Asiento=reserva.getAsiento();
                   if (reserva.getBi()==0)
                   {
                       aux++;
%>
<tr bgcolor="#CCFFFF">
<td bgcolor="<%=color%>"><b>
<%=reserva.getOrigen()+"-"+reserva.getDestino()+"-"+ reserva.getNumero() + "("+reserva.getEstado()+")"%>
</b>
<%String loquesea="";%>
</td>
<td>
<select name="Estado<%=i%>_<%=aux%>">
<%if(reserva.getEstado().trim().equals("HK"))
    loquesea="SELECTED";
else
    loquesea="";
%>
<%if((reserva.getEstado().trim().equals("HL")) && (usuario.getTipo()<2))
{%>
<option value='HK' <%=loquesea%>>HK</option>
<%
} 
else if(!(reserva.getEstado().trim().equals("HL")) )
{%>
<option value='HK' <%=loquesea%>>HK</option>
<%}%>

<%if(reserva.getEstado().trim().equals("HL"))
    loquesea="SELECTED";
else
    loquesea="";
%>

<option value='HL' <%=loquesea%>>HL</option>
<%if(reserva.getEstado().trim().equals("RR"))
    loquesea="SELECTED";
else
    loquesea="";
%>
<%if((reserva.getEstado().trim().equals("HL")) && (usuario.getTipo()<2))
{%>
<option value='RR' <%=loquesea%>>RR</option>
<%
} 
else if(!(reserva.getEstado().trim().equals("HL"))) 
{%>
<option value='RR' <%=loquesea%>>RR</option>
<%}%>

<%if(reserva.getEstado().trim().equals("XX"))
    loquesea="SELECTED";
else
    loquesea="";
%>

<option value='XX' <%=loquesea%>>XX</option>
</select>
</td>
<%----------------------------
<td bgcolor="<%=colore%>"><input type="checkbox" name="Estado<%=i%>_<%=aux%>" value= "<%=reserva.getEstado()%>"><%=Estado1%>
</td>
-----------------------%>
<td colspan="1"><b>Asiento:</b></td>
<td colspan="2"><input name="Asiento<%=i%>_<%=aux%>" value="<%=Asiento%>" 
type="text" size="3" maxlength="3" onChange="javascript:this.value=this.value.toUpperCase();" >
</td>


<input name="vueloi<%=i%>_<%=aux%>" value="<%=reserva.getVuelocodigo()%>" 
type="hidden"  >
<input name="estado<%=i%>_<%=aux%>" value="<%=reserva.getEstado()%>" 
type="hidden"  >
<input name="programacion<%=i%>_<%=aux%>" value="<%=reserva.getProgramacioncodigo()%>" 
type="hidden"  >
</tr>
<%-----------

-------------%>
<%}
                   else
                   {%>
                   <script >
                   boleto=eval("document.NombresReservas.Boletoinf<%=i%>");
                   boleto.value="<%=reserva.getBoletonumero()%>";
                   codigo=eval("document.NombresReservas.Boletocodigoi<%=i%>");
                   codigo.value="<%=reserva.getBoletocodigo()%>";
</script>
                   <%}}}%>
<input name="i" value="<%=i %>" 
type="hidden"  >
<input name="aux" value="<%=aux%>" 
type="hidden"  >
<script >

function boleto(desde)
{
   indice=eval("document.NombresReservas.i");
   var hasta=parseInt(indice.value);
   
   boletoinicial=eval("document.NombresReservas.Boleto"+desde);
   var j=1;
   var k=0;
   k=parseInt(boletoinicial.value);
   
    for(i=desde+1;i<=hasta;i++)
    {
        
        boleto=eval("document.NombresReservas.Boleto"+i);
        
        
        boleto.value=k+j;
        j++;
    }
}

function anulo(numero)
{
   
    Estado=eval("document.NombresReservas.stado"+numero);
    if (Estado.checked)
    {
        i=1;
     }
   else
   {
    i=0;
   }
   var documento="";
    <% for (int j=1;j<=i;j++){%>
        documento="document.NombresReservas.Estado"+"<%=j%>"+"_"+numero;
        R<%=j%> = eval(documento);
        R<%=j%>.checked=i;
    <%}%>
    
    
    
}
</script>
</table>
<%------------Prueba-------------%>
<table width="100%" align="center">        
<tr class="form1">
<tH colspan="3">
Observaciones
</tH>
<tr>
<td colspan="3"><textarea name="Obs" cols="80" rows="4"></textarea></td>
</TR>
</tr>

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
<table width="80%" align="center">         
   
<%------Fin Prueba-----------------%>
<tr align="center">
<td align="center">
 <input TYPE="submit"    NAME="Pagos" value="Fijar Tarifas">
 </td>
 <td align="center" colspan="2">
 <input  type="submit"  NAME="Grabar" value="Grabar Reserva">
 </td>
 <td align="center">
 <input  type="submit"  NAME="Salir" value="Salir">
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


