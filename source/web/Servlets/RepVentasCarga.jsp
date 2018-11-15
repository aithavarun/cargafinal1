<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat,java.text.DecimalFormat,java.text.SimpleDateFormat" %>
<%@ page import="java.math.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="/WEB-INF/Banner.jsp"%> 
<%@ page import ="java.text.DecimalFormatSymbols" %>
<%
DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
simbolos.setDecimalSeparator('.');
DecimalFormat f =new DecimalFormat("0.00",simbolos);
DecimalFormat fx =new DecimalFormat("0000000");
%>


<SCRIPT language="JavaScript" >
    ahora       = new Date();
    ahoraDay    = ahora.getDate();
    ahoraMonth  = ahora.getMonth()+1;
    ahoraYear   = ahora.getYear();
   

 
 function envia(form ){
   if (form.Dia.value>31) 
  {
   alert("dia incorrecto");
   return false;

  } 

 else
   return true;

   }
   
   
function cuantosDias(mes, anyo)
    {
        var cuantosDias = 31;
        if (mes == 4 || mes == 6 || mes == 9 || mes == 11)
      cuantosDias = 30;
        if (mes == 2 && (anyo/4) != Math.floor(anyo/4))
      cuantosDias = 28;
        if (mes == 2 && (anyo/4) == Math.floor(anyo/4))
      cuantosDias = 29;
        return cuantosDias;
    }

function validames(campo) {
if (campo.value > 12) campo.value = 12;
}

function validadia(campo,mes, anyo) {
var dias;
dias=cuantosDias(mes,anyo);
if (campo.value > dias)  campo.value = cuantosDias(mes,anyo);
}
    
</SCRIPT>




 
<%
//Usuarios usuario=model.getUsuarios();
String musuario=usuario.getNombre();
String selecciona="";
if (usuario.getTipo()>=1)
    selecciona="READONLY";
java.util.Date mifecha;
Calendar inicio = Calendar.getInstance();
int mes=0;
int dia=0;
int anio=0;
mifecha=inicio.getTime();


String sucursalX=request.getParameter("Sucursal");
        String Dia=request.getParameter("Dia");
        String Mes=request.getParameter("Mes");
        String Anio=request.getParameter("Anio");
        String usuarioX=request.getParameter("Usuario");
        String documento=request.getParameter("Documento");
        String psucursal=request.getParameter("Sucursal");
        
       if (usuarioX==null)
        usuarioX=musuario;
        
       if (psucursal==null)
           psucursal="-1";
           
        
%>





<table width="578" align="center" border="1">
<form method="post" action="<%=CONTROLLER%>/RepVentasCarga/Consultar"  name="ReportedeVentas">
<tr>
<th colspan="14" >  REPORTE       DE       VENTAS       CARGA  </th>
</tr>
<tr>
<td>Fecha Actual :</td>
<td>
Dia</td>
<td><input name= "Diaa" id="Diaa" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" READONLY >
</TD>
<td>Mes</td>
<td><input name= "Mesa" id="Mesa" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);" READONLY> 
</TD>
<td>Anio</td>
<td><input name= "Anioa" id="Anioa" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" READONLY>
</td>
</tr>
<tr>
<td>Fecha :</td>
<td>
Dia</td>
<td><input name= "Dia" id="Dia" type="text"  value="<%=Dia%>" size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
</td>
<td>Mes</td>
<td><input name= "Mes" id="Mes" type="text" value="<%=Mes%>" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
</td>
<td>Anio</td>
<td><input name= "Anio" id="Anio" type="text"  value="<%=Anio%>" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>


<tr>
<td>
 Usuario:
 </td>
 <td >
 <input type="text"    NAME="Usuario" value="<%=usuarioX%>" <%=selecciona%>>
  </td>
  <td colspan="4">
 <input TYPE="submit"    NAME="Buscar" value="Buscar">
 </td>
 </tr>
 <tr>
 <td>Sucursal :</td>
<td><select  name="Sucursal" type="text" class='txt-arialimput'>

<option value=-1 > POR-USUARIO  </option>

<%
    model.BuscarSucursales();
         List lists = model.getSucursales();
         if (lists != null) {
              Iterator its = lists.iterator();

              while (its.hasNext()) {
                  Sucursales sucursal=(Sucursales) its.next();

%>
          
         <option value=<%=sucursal.getCodigo()%> > <%=sucursal.getDescripcion()%>  </option>
         
  <%}}%>
 
</select>

</td>
</tr>

<TR>
    <td>Documento :</td>
<td><select  name="Documento" type="text" class='txt-arialimput'>

<option value="G" > GUIAS DE REMISION  </option>
<option value="F" > FACTURAS  </option>
 
</select>
</td>
</TR>
 
    
    
 
 
 </tr>
</form >
</table>
<%-----------------
<div class="page"> 
-----------------------------%>
<table width="578" align="center" border="1">
<%

float flete=0;
String origen="";
String destino="";
float  domicilio=0;
float valorizacion=0;
float seguro=0;
float impuesto=0;
float total=0;
float efectivo=0;
float credito=0;
String observacion="";
float tdomicilio=0;
float tvalorizacion=0;
float tdescuento=0;

int sec=0;
float iva=0;
float tasa=0;
float sc=0;
float penalidad=0;
float tarifa1=0;
float iva1=0;
float q1=0;
float tasa1=0;
float seguro1=0;
float sc1=0;
float penalidad1=0;
float total1=0;
float descuento=0;
float comision=0;
float contado=0;
float tcredito=0;
float pta=0;
float ptatotal=0;
float ptapinta=0;
float comisionpinta=0;
float mpd=0;
//float otros=0;
float canje=0;
// Para pintar
float comisionp=0;
float contadop=0;
float chequesp=0;
float tcreditop=0;
float creditop=0;
float ptap=0;

float ptatotalp=0;
float ptapintap=0;
float mpdp=0;
float otros=0;
float canjep=0;

double unoporciento=0;
float pagos=0;
float ventas=0;
float ventas1=0;
float diferecniacuadre=0;
String diferencia="";

String color="#CCCCCC";
%>
<tr>
<th>Orden</th>
<th>Num. Guia</th>
<th>Estado</th>
<th WIDTH="20%">Nombre del Cliente</th>
<th>Origen </th>
<th>Destino </th>
<th>Peso </th>
<th>Flete </th>
<th>Domicilio </th>
<th>Valorizacion </th>
<th>Seguro </th>
<th>I.V.A. </th>
<!-- Nueva separacion de impuestos -->
<th>Imp. UIO</th>
<th>Imp. GPS</th>
<th>Imp. SCY</th>
<!-- -->
<th>Total Impuestos</th>
<!--<th>Otros***</th>-->
<th>Total </th>
<th>Credito Cliente</th>
<th>Retencion</th>
<th>Valor a Pagar</th>
<th>Efectivo</th>
<th>Cheque</th>
<th>Debito</th>
<th>Tarjeta de Credito</th>
<th>Banco emisor TD</th>
<th>Franquicia TD</th>    
<th>4 ultimos Digitos TD</th>
<th>Fecha Vencimiento TD</th>
<th>Numeros Autorizacion Transaccion TD</th>
<th>Banco Emisor TC</th>
<th>Franquicia TC</th>
<th>4 Ultimos digitos TC</th>
<th>Fecha Vencimiento TC</th>
<th>Numero Autorizacion Transaccion TC</th>
<th>Cierre POS</th>
<!--<th>Credito**</th>-->
<!--<th>Descuento**</th>-->
<!--<th>Cuenta Credito Observaciones**</th>-->
<th>Observaciones</th>
<th>Usuario</th>
</tr>

<%
 List list = model.getRepventasCarga();
 
String estado="";    

float porcentaje=0;
long anterior=0;
float tflete=0;
float tseguro=0;
float tiva=0;
float ttotal=0;
float tcontado=0;
float totros=0;
float tcanje=0;
float peso=0;
float tpeso=0;
// ----------
float timpUIO=0;
float timpGPS=0;
float timpSCY=0;
float valorTD =0;
float valorTC =0;
float cheque = 0;
String detbancoTD;
String detfranquiciaTD;
String fecha_vencimientoTD;
String ultimosdigitosTD;
String numero_autorizacionTD; 
String detbancoTC;
String detfranquiciaTC;
String fecha_vencimientoTC;
String ultimosdigitosTC;
String numero_autorizacionTC; 
String numero_cierre;
float apagar = 0;
float tapagar = 0;
float totalCheque = 0;
float totalDebito =0;
float totalCredito = 0;
// ----------
String cliente="Sin";
String colorcuadre="#FFFFFF";



long numero=0;      
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          
          anterior=0;
          RepventascWC repventac=(RepventascWC) it.next();
          
          //if (numero==repventac.getNumero())
          //     it.next();
          
          sec++;
          //String seleccionUrl=CONTROLLER+"/Repventascarga/Selecciona?i=12&Boleto="+repventac.getNumero(); 
          
          String seleccionUrl=CONTROLLER+"/Guias/Selecciona?codigo="+repventac.getCodigo() ;
          penalidad1=0;
         // comision=0;
          if (numero+1 != repventac.getNumero())
          {
              numero=repventac.getNumero();
              if (color.equals("#CCCCCC"))
                  color="#ffffff";
              else
                  color="#CCCCCC";
          }
          else
          {
              numero++;
              if ((color.equals("#CCCCCC")) ||(color.equals("#ffffff")))
                  color=color;
              else
                  color="#CCCCCC";
          }
           
          
          flete=repventac.getFlete();
          tflete+=flete;
          origen=repventac.getOrigen();
          destino=repventac.getDestino();
          domicilio=repventac.getEdomicilio();
          tdomicilio+=domicilio;
          valorizacion=repventac.getServicioa();
          tvalorizacion+=valorizacion;
          seguro=repventac.getSeguro();
         // descuento=repventac.getDescuento();
         // tdescuento+=descuento;
          tseguro+=seguro;
          cliente=repventac.getCliente();
          total=repventac.getTotal();
          ttotal+=Float.parseFloat(f.format(total));
          
          efectivo=repventac.getEfectivo();
          tcontado+=efectivo;
          
          impuesto=repventac.getIva();
          
          tiva+=Float.parseFloat(f.format(impuesto));
          
          credito=repventac.getCredito();
          
          tcredito+=credito;
          canje=repventac.getCanje();
          tcanje+=canje;
          /*OTROS*/
          otros=repventac.getOtros();
          totros+=otros;
          descuento=repventac.getDescuento();
          tdescuento+=descuento;
          observacion=repventac.getObservacion();
          valorTD = repventac.getTdebito();
          valorTC = repventac.getTcredito();
          cheque = repventac.getCheque();
          diferecniacuadre=total-efectivo-canje-credito-cheque-valorTC-valorTD;
          if (repventac.getPeso()>repventac.getPesov())
          peso=repventac.getPeso();
          else
          peso=repventac.getPesov();    
          
          tpeso+=peso;
          
          if (repventac.getEstado().equals("X"))
              estado="X";
          else
              estado="";
          
          if (Math.round(diferecniacuadre) !=0)        
          {
              
              colorcuadre="#0000ff";
              diferencia="("+f.format(diferecniacuadre)+")";
          }
          else
          {
              colorcuadre="#FFFFFF";
              diferencia="";
          }
            
          diferecniacuadre=0;
         
          timpUIO += repventac.getImpUIO();
          timpGPS += repventac.getImpGPS();
          timpSCY += repventac.getImpSCY();
          detbancoTD = repventac.getDetbancoTD();
          detfranquiciaTD = repventac.getDetfranquiciaTD();
          fecha_vencimientoTD= repventac.getFecha_vencimientoTD();
          ultimosdigitosTD = repventac.getUltimosdigitosTD();
          numero_autorizacionTD =repventac.getNumero_autorizacionTD();
          detbancoTC = repventac.getDetbancoTC();
          detfranquiciaTC = repventac.getDetfranquiciaTC();
          fecha_vencimientoTC=repventac.getFecha_vencimientoTC();
          ultimosdigitosTC=repventac.getUltimosdigitosTC();
          numero_autorizacionTC=repventac.getNumero_autorizacionTC();
          numero_cierre=repventac.getNumero_cierre();
          
          apagar = total-canje;
          tapagar=tapagar+apagar;
          totalCheque = totalCheque+cheque;
          totalDebito=totalDebito+valorTD;
          totalCredito=totalCredito+valorTC;
          %>
          
  <tr align="right" BGCOLOR=<%=color%>>
        <td bgcolor="<%=colorcuadre%>"><%=sec%> <%=diferencia%> </td> <!-- 1 Orden -->
        
        <%if(estado.equals("X")) 
        {%>
         <td> <%=fx.format(repventac.getNumero())%></td> <!-- 2 Número de guía -->
        <%}else
        {
         %>
        <td><A HREF="<%=seleccionUrl%>"> <%=fx.format(repventac.getNumero())%></td> <!-- 2 Número de guía -->
         <%}%>
        <td><%=estado%></td> <!-- 3 Estado -->
        <td WIDTH="20%" align="left"><%=cliente%></td> <!-- 4 Nombre del cliente -->
        <td><%=origen%></td> <!-- 5 Origen -->
        <td><%=destino%></td> <!-- 6 Destino -->
        <td><%=f.format(peso)%></td> <!-- 7 Peso -->
        <td><%=f.format(flete)%> </td> <!-- 8 Flete -->
        <td><%=f.format(domicilio)%></td> <!-- 9 Domicilio -->
        <td><%=f.format(valorizacion)%></td> <!-- 10  Valorización-->
        <td><%=f.format(seguro)%></td> <!-- 11  Seguro-->
        <td><%=f.format(impuesto)%></td> <!-- 12 I.V.A   -->
	<!-- -->
	<td><%=f.format(repventac.getImpUIO())%></td> <!-- 13 Imp UIO -->
	<td><%=f.format(repventac.getImpGPS())%></td> <!-- 14 Imp GPS -->
	<td><%=f.format(repventac.getImpSCY())%></td> <!-- 15 Imp SCY -->
        <!-- -->
        <td><%=f.format(otros)%></td> <!-- 16 Total impuestos  -->
	<td><%=f.format(total)%></td> <!-- 17 Total -->
        <td><%=f.format(credito)%></td><!--18 Credito cliente -->
        <td><%=f.format(canje)%></td> <!-- 19 Retención  -->
        <td><%=f.format(apagar)%></td> <!-- 20  Valor a pagar-->
        <td><%=f.format(efectivo)%></td> <!-- 21 Efectivo -->
        <td><%=f.format(cheque)%></td> <!-- 22 Cheque -->
        <!--<td><%=f.format(descuento)%></td>-->
        <td><%=valorTD%></td>  <!-- 23 Débito -->         
        <td><%=valorTC%></td>   <!-- 24 Tarjeta de Crédito  -->     
        <td><%=detbancoTD%></td> <!-- 25 Banco emisor TD -->
        <td><%=detfranquiciaTD%></td> <!-- 26 Franquicia TD -->
        <td><%=ultimosdigitosTD%></td> <!-- 27 4 últimos dígitos TD -->
        <td><%=fecha_vencimientoTD%></td> <!-- 28 Fecha vencimiento TD -->
        <td><%=numero_autorizacionTD%></td> <!-- 29 Número de autorización de transacción TD -->
        <td><%=detbancoTC%></td> <!-- 30 Banco emisor TC -->
        <td><%=detfranquiciaTC%></td> <!-- 31 Franquicia TC -->
        <td><%=ultimosdigitosTC%></td> <!-- 32 4 últimos dígitos TC -->
        <td><%=fecha_vencimientoTC%></td> <!-- 33 Fecha vencimiento TC -->
        <td><%=numero_autorizacionTC%></td> <!-- 34 Número de autorización de transacción TC -->
        <% if(numero_cierre==null){%>
        <td></td>
        <%}else{%>
        <td><%=numero_cierre%></td> <!-- 35 Cierre POS  -->
        <%}%>
        <td><%=observacion%></td> <!-- 36 Observaciones -->
        <td><%=repventac.getUsuario()%></td> <!-- 37 Usuario -->
  </tr>    
 <%}}%>


 

<tr align="right" BGCOLOR="#CCFF00">

<th colspan="2">Total</th>
<th></th>
<th></th>
<th></th>
<th></th>
<th><%=f.format(tpeso)%></th>
<th><%=f.format(tflete)%></th>
<th><%=f.format(tdomicilio)%></th>
<th><%=f.format(tvalorizacion)%></th>
<th><%=f.format(tseguro)%></th>
<th><%=f.format(tiva)%></th>
<!-- Nueva separacion de impuestos -->
<th><%=f.format(timpUIO)%></th>
<th><%=f.format(timpGPS)%></th>
<th><%=f.format(timpSCY)%></th>
<!-- -->
<th><%=f.format(totros)%></th>
<th><%=f.format(ttotal)%></th>
<th><%=f.format(tcredito)%></th>
<th><%=f.format(tcanje)%></th>
<th><%=f.format(tapagar)%></th>
<th><%=f.format(tcontado)%></th>
<th><%=f.format(totalCheque)%></th>
<th><%=f.format(totalDebito)%></th>
<th><%=f.format(totalCredito)%></th>

<!--<th><%=f.format(tdescuento)%></th>-->
 </tr>   
  
</table>
<%------------------%>
<%
if (mifecha!=null)
    inicio.setTime(mifecha);
mes =inicio.get(Calendar.MONTH)+1;
anio=inicio.get(Calendar.YEAR);
dia=inicio.get(Calendar.DATE);
if (Mes!=null)
    mes=Integer.parseInt(Mes) ;
if (Anio!=null)
    anio=Integer.parseInt(Anio);
if (Dia!=null)
    dia=Integer.parseInt(Dia);
%>
<%------------------%>


<SCRIPT language="JavaScript">
    
ReportedeVentas.Diaa.value=ahoraDay;
ReportedeVentas.Mesa.value=ahoraMonth;
ReportedeVentas.Anioa.value=ahoraYear;

ReportedeVentas.Dia.value=<%=dia%>;
ReportedeVentas.Mes.value=<%=mes%>;
ReportedeVentas.Anio.value=<%=anio%>;
</SCRIPT >
<table width="578" align="center" bgcolor="#ffffff" border="1">
<tr>
<th colspan="6">RESUMEN</th>
</tr>
<TR>
<Td>FLETE</Td>
<Td><%=f.format(tflete)%></Td>
<Td>EFECTIVO</Td>
<Td><%=f.format(tcontado)%></Td>
</TR>
<TR>


<Td>DOMICILIO</Td>
<td><%=f.format(tdomicilio)%></td>
<Td>CREDITO</Td>
<td><%=f.format(tcredito)%></td>
</TR>
<TR>
<Td>VALORIZACION</Td>
<td><%=f.format(tvalorizacion)%></th>
<Td>RETENCION</Td>
<td><%=f.format(tcanje)%></td>
</TR>
<TR>
<Td>SEGURO</Td>
<td><%=f.format(tseguro)%></td>
<Td>CHEQUE</Td>
<td><%=f.format(totalCheque)%></td>
</TR>

<TR>
<Td>I.V.A.</Td>
<td><%=f.format(tiva)%></td>
<Td>TARJETA DEBITO</Td>
<td><%=f.format(totalDebito)%></td>
</TR><TR>
<Td>OTROS</Td>
<td><%=f.format(totros)%></td>
<Td>TARJETA CREDITO</Td>
<td><%=f.format(totalCredito)%></td>
</TR>

<tr>
<TH>TOTAL</TH>
<th><%=f.format(tflete+tdomicilio+tvalorizacion+tseguro+tiva+totros)%></th>
<TH>TOTAL</TH>
<th><%=f.format(tcontado+tcredito+tcanje+totalCheque+totalDebito+totalCredito)%></th>
</TR>
</table>

</td>
</table>

<script language="JavaScript" type="text/javascript">
   ReportedeVentas.Documento.options.value="<%=documento%>"
   ReportedeVentas.Sucursal.options.value="<%=psucursal%>"
</script>

<%@ include file="/WEB-INF/Banere.jsp"%>
<%--------------------------------------
</div>
--------------------%>

</body>
</html>





