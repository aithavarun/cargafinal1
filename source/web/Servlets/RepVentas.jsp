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
<form method="post" action="<%=CONTROLLER%>/RepVentas/Consultar"  name="ReportedeVentas">
<tr>
<th colspan="7">REPORTE DE  VENTAS</th>
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
int sec=0;
float tarifa=0;
float iva=0;
float q=0;
float tasa=0;
float seguro=0;
float sc=0;
float penalidad=0;
float total=0;
float tarifa1=0;
float iva1=0;
float q1=0;
float tasa1=0;
float seguro1=0;
float sc1=0;
float penalidad1=0;
float total1=0;

float comision=0;
float contado=0;
float cheques=0;
float tcredito=0;
float credito=0;
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
<th>Sec</th>
<th>Serie</th>
<th>Cliente</th>
<th>Tarifa </th>
<th>Q</th>
<th>I.V.A.</th>
<th>Seguro</th>
<th>Tasa</th>
<th>S.C.</th>
<th>Penalidad</th>
<th>Total V.</th>
<th>Comision</th>
<th>Contado</th>
<th>Cheques</th>
<th>T.Credito</th>
<th>Credito</th>
<th>MPD</th>
<th>PTA</th>
<th>CANJES</th>
<th>OTROS</th>
<th>ESTADO</th>
<th>Usuario</th>
<th>OBSERVACION</th>

</tr>

<%
 List list = model.getRepventas();
 
String estado="";    
float descuento=0;
float porcentaje=0;
String colorcuadre="#FFFFFF";
       //String lfecha = new SimpleDateFormat("yyyy-MM-dd 00:00:00.0").format(new java.util.Date());

long numero=0;      
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Repventas repventa=(Repventas) it.next();
          
          sec++;
          
          /***PABLO CORDOVA***/
          String  seleccionUrl="";
          if (repventa.getAdc()>0) 
           seleccionUrl=CONTROLLER+"/Repventas/Seleccionabolm?i=12&Boleto="+repventa.getSecuencial(); 
          else
           seleccionUrl=CONTROLLER+"/Repventas/Selecciona?i=12&Boleto="+repventa.getNumero(); 
          /********************/
          
          
          
          descuento=1;
          penalidad1=0;
         // comision=0;
          if (numero+1 != repventa.getNumero())
          {
              numero=repventa.getNumero();
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
          
          
          //descuento=1-(repventa.getPenalidad()/100);
          tarifa1=repventa.getTarifa()*descuento;
          iva1=repventa.getIva();
          tasa1=repventa.getTasa();
          seguro1=repventa.getSeguro();
          sc1=repventa.getSc();
          q1=repventa.getQ();
          penalidad1=repventa.getAdc();
          total1=repventa.getTarifa()*descuento+repventa.getIva()+repventa.getTasa()+repventa.getSeguro()+repventa.getSc()+repventa.getAdc()+repventa.getQ();
          
          if (repventa.getEstado().equals("X"))
          {
              color="FF3333";
              estado="VOID";
              //comision=0;
              comisionpinta=0;
          }
          else if (repventa.getEstado().equals("PTA"))
          {
              color="33FF99";
              estado="PTA";
              seleccionUrl=CONTROLLER+"/Repventas/Selecciona?Ptanumero="+repventa.getNumero(); 
              tarifa1=0;
              iva1=0;
              tasa1=0;
              seguro1=0;
              sc1=0;
              penalidad1=0;
              q1=0;
              ptatotal+=repventa.getTarifa()+repventa.getIva()+repventa.getTasa()+repventa.getSeguro()+repventa.getSc()+repventa.getAdc()+repventa.getQ();
              comision=comision+repventa.getComision();
              pta=pta+repventa.getPta();
              ptapinta=repventa.getPta();
              comisionpinta=repventa.getComision();
               if (comision>0)
              {
                  unoporciento+=(repventa.getTarifa()+repventa.getTasa()+repventa.getSeguro()+repventa.getSc()+repventa.getAdc())*0.01;
              }
          }
          else
          {
              estado="";
              if (repventa.getPta()>0)
              {
                  pta=pta+repventa.getPta();
                  ptapinta=repventa.getPta();
                  comisionpinta=0;
              }
              else
              {
                  comision=comision+repventa.getComision();
                  ptapinta=repventa.getPta();
                  comisionpinta=repventa.getComision();
              }
              if (comision>0)
              {
                  unoporciento+=(repventa.getTarifa()*descuento+repventa.getTasa()+repventa.getSeguro()+repventa.getSc()+repventa.getAdc())*0.1;
              }
              
          }
           diferencia=""; 
          tarifa+=tarifa1;
          iva+=iva1;
          tasa+=tasa1;
          seguro+=seguro1;
          q+=q1;
          sc+=sc1;
          penalidad+=penalidad1;
          total=total+repventa.getTarifa()*descuento+repventa.getIva()+repventa.getTasa()+repventa.getSeguro()+repventa.getSc()+repventa.getAdc()+repventa.getQ();
          
          ventas=repventa.getTarifa()*descuento+repventa.getIva()+repventa.getTasa()+repventa.getSeguro()+repventa.getSc()+repventa.getAdc()+repventa.getQ();
          ventas1=ventas;
          if (repventa.getEstado().equals("PTA"))
                pagos=comisionpinta+(repventa.getEfectivo()+repventa.getCheque()+repventa.getTarjeta()+repventa.getCredito()+repventa.getMpd()+ptapinta+repventa.getCanje()+repventa.getOtros());
          else
              pagos=comisionpinta+(repventa.getEfectivo()+repventa.getCheque()+repventa.getTarjeta()+repventa.getCredito()+repventa.getMpd()+ptapinta+repventa.getCanje()+repventa.getOtros())*(1-(comisionpinta/ventas));
          diferencia=""; 
          //if (Math.round(pagos-ventas) !=0)
          diferecniacuadre+=pagos-ventas;
          //if ((pagos-ventas) !=0)
          if (Math.round(pagos-ventas) !=0)        
          {
              
              colorcuadre="#0000ff";
              diferencia="("+f.format(pagos-ventas)+")";
          }
          else
              colorcuadre="#FFFFFF";
          if (ventas==0)
              ventas=1;
          if (repventa.getEstado().equals("PTA"))
          {
              contado=contado+(repventa.getEfectivo());
              cheques=cheques+(repventa.getCheque());
              tcredito=tcredito+(repventa.getTarjeta());
              credito=credito+(repventa.getCredito());
              mpd=mpd+(repventa.getMpd());

              otros=otros+(repventa.getOtros());
              canje+=(repventa.getCanje());
              
              contadop=(repventa.getEfectivo());
              chequesp=(repventa.getCheque());
              tcreditop=(repventa.getTarjeta());
              creditop=(repventa.getCredito());
              mpdp=(repventa.getMpd());

              otrosp=(repventa.getOtros());
              canjep=(repventa.getCanje());
          }
          else
          {
              contado=contado+(repventa.getEfectivo()*(1-(comisionpinta/ventas)));
              cheques=cheques+(repventa.getCheque()*(1-(comisionpinta/ventas)));
              tcredito=tcredito+(repventa.getTarjeta()*(1-(comisionpinta/ventas)));
              credito=credito+(repventa.getCredito()*(1-(comisionpinta/ventas)));
              mpd=mpd+(repventa.getMpd()*(1-(comisionpinta/ventas)));

              otros=otros+(repventa.getOtros()*(1-(comisionpinta/ventas)));
              canje+=(repventa.getCanje()*(1-(comisionpinta/ventas)));
              
              contadop=(repventa.getEfectivo()*(1-(comisionpinta/ventas)));
              chequesp=(repventa.getCheque()*(1-(comisionpinta/ventas)));
              tcreditop=(repventa.getTarjeta()*(1-(comisionpinta/ventas)));
              creditop=(repventa.getCredito()*(1-(comisionpinta/ventas)));
              mpdp=(repventa.getMpd()*(1-(comisionpinta/ventas)));

              otrosp=(repventa.getOtros()*(1-(comisionpinta/ventas)));
              canjep=(repventa.getCanje()*(1-(comisionpinta/ventas)));
          }
              mifecha=repventa.getFecha();
          //porcentaje=ventas*comision
         
          
          %>
  <tr align="right" BGCOLOR=<%=color%>>
        <td bgcolor="<%=colorcuadre%>"><%=sec%> <%=diferencia%> </td>
        <td><A HREF="<%=seleccionUrl%>"> <%=repventa.getNumero()%> Pablo </td>
        <td><%=f.format(tarifa1)%></td>
        <td><%=f.format(q1)%></td>
        <td><%=f.format(iva1)%> p</td>
        <td><%=f.format(tasa1)%></td>
        <td><%=f.format(seguro1)%></td>
        <td><%=f.format(sc1)%></td>
        <td><%=f.format(penalidad1)%></td>
        <%-------------------
        <td><%=f.format(repventa.getTarifa()*descuento+repventa.getIva()*descuento+repventa.getTasa()+repventa.getSeguro()+repventa.getSc()+repventa.getAdc())%></td>
        ------------------%>
        <td><%=f.format(ventas1)%></td>
        <td><%=f.format(comisionpinta)%></td>
        <td><%=f.format(contadop)%></td>
        <td><%=f.format(chequesp)%></td>
        <td><%=f.format(tcreditop)%></td>
        <td><%=f.format(creditop)%></td>
        <td><%=f.format(mpdp)%></td>
        <td><%=f.format(ptapinta*(1-(comisionpinta/ventas)))%></td>
        <td><%=f.format(canjep)%></td>
        <td><%=f.format(otrosp)%></td>
        <td><%=estado%></td>
        <td><%=repventa.getUsuario()%></td>        
        <td><%=repventa.getObservacion()%></td>  
  </tr>    
 <%}}%>

<%---------------------------%>

<tr align="right" BGCOLOR="#CCFF00">

<th colspan="2">Total</th>
<th><%=f.format(tarifa)%></th>
<th><%=f.format(q)%></th>
<th><%=f.format(iva)%></th>
<th><%=f.format(tasa)%></th>
<th><%=f.format(seguro)%></th>
<th><%=f.format(sc)%></th>
<th><%=f.format(penalidad)%></th>
<th><%=f.format(total)%></th>
<th><%=f.format(comision)%></th>
<th><%=f.format(contado)%></th>
<th><%=f.format(cheques)%></th>
<th><%=f.format(tcredito)%></th>
<th><%=f.format(credito)%></th>
<th><%=f.format(mpd)%></th>
<th><%=f.format(pta)%></th>
<th><%=f.format(canje)%></th>
<th><%=f.format(otros)%></th>
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
<Td>TARIFA</Td>
<Td><%=f.format(tarifa)%></Td>
<Td>COMISION</Td>
<Td><%=f.format(comision/1.12)%></Td>
<Td>EFECTIVO</Td>
<Td><%=f.format(contado)%></Td>
</TR>
<TR>


<Td>IVA</Td>
<td><%=f.format(iva)%></td>
<Td>COMISION IVA</Td>
<Td><%=f.format(comision/1.12*0.12)%></Td>
<Td>CHEQUE</Td>
<td><%=f.format(cheques)%></td>
</TR>
<TR>
<Td>TASA</Td>
<td><%=f.format(tasa)%></th>
<Td>COMISION </Td>
<Td>0.00</Td>
<Td>TARJETA</Td>
<td><%=f.format(tcredito)%></td>
</TR>
<TR>
<Td>SEGURO</Td>
<td><%=f.format(seguro)%></td>
<Td>COMISION</Td>
<Td>0.00</Td>
<Td>CANJE</Td>
<td><%=f.format(canje)%></td>
</TR>

<TR>
<Td>PTA</Td>
<td><%=f.format(ptatotal)%></td>
<Td>COMISION</Td>
<Td>0.00</Td>
<Td>OTROS</Td>
<td><%=f.format(otros)%></td>
</TR>

<TR>
<Td>PNTLY</Td>
<td><%=f.format(penalidad)%></td>
<Td>COMISION</Td>
<Td>0.00</Td>
<Td>MPD</Td>
<td><%=f.format(mpd)%></td>
</TR>
<TR>
<Td>RET 1%</Td>
<%
unoporciento=(comision/1.12) * 0.01;
%>
<td><%=f.format(unoporciento)%></td>

<Td>COMISION</Td>
<Td>0.00</Td>
<Td>PTA</Td>
<td><%=f.format(pta)%></td>
</TR>
<TR>
<Td>CXPAGAR</TH>
<td><%=f.format(credito)%></td>
<Td>COMISION </Td>
<Td>0.00</Td>
<Td><%=diferecniacuadre%></Td>
<td></td>
</TR>
<TR>
<Td>Q</Td>
<Td><%=f.format(q)%></Td>
<Td>COMISION</Td>
<Td>0</Td>
<Td></Td>
<Td></Td>
</TR>

<tr>
<TH>TOTAL</TH>
<th><%=f.format(-credito+ptatotal+seguro+tasa+iva+tarifa+penalidad+unoporciento+q)%></th>
<TH>COMISION</TH>
<TH><%=f.format(comision)%></TH>
<TH>TOTAL</TH>
<th><%=f.format(mpd+cheques+contado+tcredito+canje+otros+pta)%></th>
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





