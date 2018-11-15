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
String  selecciona="READONLY";
java.util.Date mifecha;
Calendar inicio = Calendar.getInstance();
int mes=0;
int dia=0;
int anio=0;
mifecha=inicio.getTime();
%>





<table width="578" align="center">
<form method="post" action="<%=CONTROLLER%>/RepVentasxSuc/Consultar"  name="ReportedeVentas">
<tr>
<th colspan="7">REPORTE DE  VENTAS POR SUC</th>
</tr>
<tr>
<td>Fecha Desde :</td>
<td>
Dia</td>
<td><input name= "Diaa" id="Diaa" type="text"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);"  >
</TD>
<td>Mes</td>
<td><input name= "Mesa" id="Mesa" type="text"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);" > 
</TD>
<td>Anio</td>
<td><input name= "Anioa" id="Anioa" type="text"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>
</tr>
<tr>
<td>Fecha Hasta:</td>
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
 </tr>
</form >
</table>
<%-----------------
<div class="page"> 
-----------------------------%>
<table width="578" align="center">
<%DecimalFormat f =new DecimalFormat("0.00");
String Sucursal="";
String aux="";
String str="";
float tarifa=0;
float descuento=0;
float tarifatsuc=0;
float descuentotsuc=0;
float tarifatotal=0;
float descuentototal=0;
int nl=0;
String color="#CCCCCC";
%>

<tr>
<th>Sucursal</th>
<th>Fecha</th>
<th>Tarifa</th>
<th>Descuento </th>
</tr>

<%
 List list = model.getRepventasxSuc();


String colorcuadre="#FFFFFF";
       //String lfecha = new SimpleDateFormat("yyyy-MM-dd 00:00:00.0").format(new java.util.Date());
long numero=0;      
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Repventasxsuc repventa=(Repventasxsuc) it.next();
          
          if (aux.equals(repventa.getSucursal()))
          {
          Sucursal="";
          nl=0;
          }
          else
          {
           nl=1;
           Sucursal=repventa.getSucursal();
           
          }
          
          aux=repventa.getSucursal();
          tarifa=repventa.getTarifa();
          tarifatotal+=tarifa;
          descuento=repventa.getDescuento();
          descuentototal+=descuento;
                
          if (nl==1 && tarifatsuc>0)
          {
          str="<tr ><td align='left' > Total Por Suc:</td> <td align='right'> </td> <td align='right'>"+ f.format(tarifatsuc) + " </td> <td align='right' > "+ f.format(descuentotsuc) + "</td> </tr>";
          tarifatsuc=0;
          descuentotsuc=0;
          }
          else
          str="";    
          %>
   
<%=str%>
       
  <tr  BGCOLOR=<%=color%>>
        <td align="left" bgcolor="<%=colorcuadre%>"><%=Sucursal%> </td>
        <td align="center" >  <%=repventa.getFecha()%> </td>
        <td align="right">  <%=f.format(tarifa)%> </td>
        <td align="right">  <%=f.format(descuento)%> </td>
       
  </tr>    

 
 <%   tarifatsuc+=tarifa;
      descuentotsuc+=descuento;
      
      }}%>           
            
<tr >
        <td align="left" >  TOTAL Por Suc:  </td>
        <td align="center" >   </td>
        <td align="right">   <%=f.format(tarifatsuc)%>  </td>
        <td align="right" >   <%=f.format(descuentotsuc)%>  </td>
       
  </tr>    

 
<tr  BGCOLOR=<%=color%>>
        <td align="left" bgcolor="<%=colorcuadre%>"> <h3> TOTAL : </h3> </td>
        <td align="center" >   </td>
        <td align="right"> <h3>  <%=f.format(tarifatotal)%> </h3> </td>
        <td align="right" > <h3>  <%=f.format(descuentototal)%> </h3> </td>
       
  </tr>    

  
<SCRIPT language="JavaScript">
ReportedeVentas.Diaa.value=ahoraDay;
ReportedeVentas.Mesa.value=ahoraMonth;
ReportedeVentas.Anioa.value=ahoraYear;
ReportedeVentas.Dia.value=ahoraDay;
ReportedeVentas.Mes.value=ahoraMonth;
ReportedeVentas.Anio.value=ahoraYear;

</SCRIPT >



<%@ include file="/WEB-INF/Banere.jsp"%>
<%--------------------------------------
</div>
--------------------%>

</body>
</html>





