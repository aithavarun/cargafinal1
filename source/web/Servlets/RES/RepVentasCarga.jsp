<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat,java.text.DecimalFormat,java.text.SimpleDateFormat" %>
<%@ page import="java.math.*"%>
<%@ include file="/WEB-INF/Banner.jsp"%> 
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
%>





<table width="578" align="center">
<form method="post" action="<%=CONTROLLER%>/RepVentasCarga/Consultar"  name="ReportedeVentas">
<tr>
<th colspan="7" >  REPORTE       DE       VENTAS       CARGA  </th>
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
<td><input name= "Dia" id="Dia" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
</td>
<td>Mes</td>
<td><input name= "Mes" id="Mes" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
</td>
<td>Anio</td>
<td><input name= "Anio" id="Anio" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>


<tr>
<td>
 Usuario:
 </td>
 <td >
 <input type="text"    NAME="Usuario" value="<%=musuario%>" <%=selecciona%>>
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

<td>
 
 
 </tr>
</form >
</table>
<%-----------------
<div class="page"> 
-----------------------------%>
<table width="578" align="center">
<%DecimalFormat f =new DecimalFormat("0.00");

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
float cheques=0;
float pta=0;
float ptatotal=0;
float ptapinta=0;
float comisionpinta=0;
float mpd=0;
float otros=0;
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
float otrosp=0;
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
<th>Origen </th>
<th>Destino </th>
<th>Flete </th>
<th>Domicilio </th>
<th>Valorizacion </th>
<th>Seguro </th>
<th>Impuesto </th>
<th>Total </th>
<th>Efectivo</th>
<th>Canje</th>
<th>Credito</th>
<th>Descuento</th>
<th>Cuenta Credito Observaciones</th>
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
float tcredito=0;
float tcanje=0;

String colorcuadre="#FFFFFF";
       
long numero=0;      
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          
          anterior=0;
          Repventasc repventac=(Repventasc) it.next();
          
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
          descuento=repventac.getDescuento();
          tdescuento+=descuento;
          tseguro+=seguro;
         
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
          descuento=repventac.getDescuento();
          observacion=repventac.getObservacion();
          diferecniacuadre=total-efectivo-canje-credito;
          
          
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
         
          %>
          
  <tr align="right" BGCOLOR=<%=color%>>
        <td bgcolor="<%=colorcuadre%>"><%=sec%> <%=diferencia%> </td>
        <td><A HREF="<%=seleccionUrl%>"> <%=repventac.getNumero()%></td>
        <td><%=origen%></td>
        <td><%=destino%></td>
        <td><%=f.format(flete)%> </td>
        <td><%=f.format(domicilio)%></td>
        <td><%=f.format(valorizacion)%></td>
        <td><%=f.format(seguro)%></td>
        <td><%=f.format(impuesto)%></td>
        <td><%=f.format(total)%></td>
        <td><%=f.format(efectivo)%></td>
        <td><%=f.format(canje)%></td>
        <td><%=f.format(credito)%></td>
        <td><%=f.format(descuento)%></td>
        <td><%=observacion%></td>          
        <td><%=repventac.getUsuario()%></td>        
        
  </tr>    
 <%}}%>


 

<tr align="right" BGCOLOR="#CCFF00">

<th colspan="2">Total</th>
<th></th>
<th></th>
<th><%=f.format(tflete)%></th>
<th><%=f.format(tdomicilio)%></th>
<th><%=f.format(tvalorizacion)%></th>
<th><%=f.format(tseguro)%></th>
<th><%=f.format(tiva)%></th>
<th><%=f.format(ttotal)%></th>
<th><%=f.format(tcontado)%></th>
<th><%=f.format(tcanje)%></th>
<th><%=f.format(tcredito)%></th>
<th><%=f.format(cheques)%></th>
<th><%=f.format(cheques)%></th>
 
 </tr>   
  

</table>
<%------------------%>
<%
if (mifecha!=null)
    inicio.setTime(mifecha);
mes =inicio.get(Calendar.MONTH)+1;
anio=inicio.get(Calendar.YEAR);
dia=inicio.get(Calendar.DATE);
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
<table width="578" align="center" bgcolor="#ffffff">
<tr>
<th colspan="6">RESUMEN</th>
</tr>
<TR>
<Td>FLETE</Td>
<Td><%=f.format(tflete)%></Td>
<Td>CONTADO</Td>
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
<Td>CANJE</Td>
<td><%=f.format(tcanje)%></td>
</TR>
<TR>
<Td>SEGURO</Td>
<td><%=f.format(tseguro)%></td>
<Td>DESCUENTOS</Td>
<td><%=f.format(tdescuento)%></td>
</TR>

<TR>
<Td>IMPUESTO</Td>
<td><%=f.format(tiva)%></td>
<Td></Td>
<td></td>
</TR>

<tr>
<TH>TOTAL</TH>
<th><%=f.format(tflete+tdomicilio+tvalorizacion+tseguro+tiva)%></th>
<TH>TOTAL</TH>
<th><%=f.format(tcontado+tcredito+tcanje+tdescuento)%></th>
</TR>
</table>

</td>
</table>

<%@ include file="/WEB-INF/Banere.jsp"%>
<%--------------------------------------
</div>
--------------------%>

</body>
</html>





