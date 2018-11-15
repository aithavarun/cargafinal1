<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.*" %>

<html>
<head>
<title>::: Reservaciones Aerogal :::</title>
<link href="<%=BASEURL%>/images/Sistema/Level2_Verdana_Forms.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
.style1 {
	color: #000066;
	font-weight: bold;
	font-size: 18px;
}
.style3 {color: #FFFFFF}
-->
</style>

<script LANGUAGE="JavaScript"> 

/**
 * funcion para saber cuantos dias tiene cada mes
 */
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

 function validarfecha(dia,mes,anio)
   {
    
    if (mes=="")
        {
            alert("Mes es obligatorio" );
            return true;
        }
    
    if (anio=="")
        {
            alert("Año es obligatorio" );
            return true;
        }    
    if (mes >12)
     {
            alert("Mes no puede ser mayor de 12" );
            return true;
      
     }
     if (mes <=0)
     {
            alert("Mes no puede ser menor o igual a 0" );
            return true;
      
     }
     
    
     if (dia=="")
        {
            alert("Dia es obligatorio" );
            return true;
        }
        var cuantos=cuantosDias(mes,anio);
    
    if (dia >cuantos)
     {
            alert("Dia no puede ser mayor de " + cuantos );
            return true;
      
     }
     
      var fecha = new Date();
      var miFecha = new Date(anio,mes,dia); 
      if (fecha > miFecha)
      {
            alert("Fecha debe ser mayor que hoy");
            return true;
        }
      
        return false;
   }

function validar(frm){

var salir = frm.salir.value;

 if (salir==1)
 {
        return true;
 }


var dia=frm.dia.value;
var mes=frm.mes.value;
var anio=frm.anio.value;

var miFecha =new Date(anio,mes-1,dia); 
if ( validarfecha(dia,mes,anio))
    {

        return false;
    }
              

var diah=frm.diah.value;
var mesh=frm.mesh.value;
var anioh=frm.anioh.value;

var miFechah =new Date(anioh,mesh-1,diah); 
if ( validarfecha(diah,mesh,anioh))
    {

        return false;
    }
     
     
    return true;
}
function salirsi()
   {
   
   
   salir = eval("document.form1.salir");
   salir.value=1;
   
   
   }
function nosalir()
{
    
    salir = eval("document.form1.salir");
    salir.value=0;
}

</SCRIPT>
</head>
<%

java.util.Calendar inicio = java.util.Calendar.getInstance();

int anio=inicio.get(Calendar.YEAR);

%>
<body bgcolor="#CCCCCC"  >
<form name="form1" method="post" action=""  >
<table border="0" cellpadding="0"  align="center" cellspacing="0" width="780" bgcolor="ffffff">
<tr>
<td>
  <table width="100%"  border="0">
  <td><img src="<%=BASEURL%>//images/logo.gif" > </td>
  <td><span class="style1">B&ugrave;squedas Avanzadas
</span></td>
</table>
</td>
</tr>
<tr>
<td>
  <table width="100%"  border="0">
      <th colspan="4" bgcolor="#0099FF">
    <span class="style3" >    Criterios de B&uacute;squeda
    </span>
    </th>
    <tr>
      <td width="144">Apellido</td>
      <td width="160"><input name="Apellido" type="text" id="Apellido" onChange="javascript:this.value=this.value.toUpperCase();"></td>
      <td width="192">Nombre</td>
      <td width="246"><input name="Nombre" type="text" id="Nombre" onChange="javascript:this.value=this.value.toUpperCase();"></td>
    </tr>
    <tr>
      <td>Boleto</td>
      <td><input name="Boleto" type="text" id="Boleto"   value="0" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Prepagado</td>
      <td><input name="PTA" type="text" id="PTA"  value="0" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Sucursal qui&eacute;n Genera</td>
      <td><input name="Sucursalo" type="text" id="Sucursalo" onChange="javascript:this.value=this.value.toUpperCase();"></td>
      <td>Sucursal qui&eacute;n Recibe </td>
      <td><input name="Sucursald" type="text" id="Sucursald" onChange="javascript:this.value=this.value.toUpperCase();"></td>
    </tr>
    <tr>
      <td>Desde (dd/mm/aaaa) </td>
      <td><input name="dia" type="text" id="dia" value="01" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
      <input name="mes" type="text" id="mes" value="01" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
      <input name="anio" type="text" id="anio" value="<%=anio%>" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
      <td>Hasta (dd/mm/aaaa)</td>
      <td><input name="diah" type="text" id="diah" size="2" maxlength="2" value="31" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
        <input name="mesh" type="text" id="mesh" size="2" maxlength="2" value="12" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
        <input name="anioh" type="text" id="anioh" size="4" maxlength="4" value="<%=anio%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right"><input name="Buscar" type="submit" id="Buscar" value="Buscar"  onclick="nosalir();"></td>
      <td><input name="Salir" type="submit" id="Salir" value="Salir" onclick="salirsi();"></td>
      <input name="salir" value="0" 
        type="hidden"  >
    </tr>
  </table>
  <td>
  </tr>
  <tr>
  <td>
  <table width="100%" border="0">
    <tr bordercolor="#FFFFFF">
      <th colspan="6" bgcolor="#0099FF"><span class="style3">Resultados</span></th>
    </tr>
    <tr bgcolor="#FFFFCC">
      <th>Sec/Booking</th>
      <th>Apellido/Nombre</th>
      <th>Fecha/Fono</th>
      <th>Tipo/Sucursal</th>
      <th>Sucursal Pta/Recibe</th>
      <th>Boleto/Pta</th>
    </tr>
<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>    
<%List lista2 = model.getReservaestado();

//int total=(lista2.size())+1;

int j=0;
long codigo=0;
String suc1="";
String suc2="";
String fecha="";
  if  (lista2 != null)  {
      Iterator itr = lista2.iterator();
      while (itr.hasNext()) {
            Casitotal reservas=(Casitotal) itr.next();
            j++;
            
            String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?codigo="+String.valueOf(reservas.getCodigo()) ;
            
            String seleccionUrlpta=CONTROLLER+"/Reservas/Seleccionapta?codigo="+String.valueOf(reservas.getCodigo()) ;
            
            //if (reservas!=reserva.getReservacodigo())
              if (codigo!=reservas.getCodigor())
              {
                codigo=reservas.getCodigor();
                if (reservas.getSucursalptaenvia()==null)
                    suc1="";
                if (reservas.getSucursalpta()==null)
                    suc2="";
                fecha="";
                if (reservas.getFechav()!=null)
                    fecha=FORMATOFECHA.format(reservas.getFechav());
                long boleto=reservas.getBoleto();
                if (boleto <0)
                    boleto=0;
                //String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?codigo="+String.valueOf(reservas.getCodigo()) ;
            %>     
    
    
    <tr bgcolor="#CCCCCC">
      <td><%=j%></td>
      <td><%=reservas.getApellido()%></td>
      <td><%=FORMATOFECHA.format(reservas.getFecha())%></td>
      <td><%=reservas.getTipo()%></td>
      <td><%=suc2%></td>
      <td><%=boleto%></td>
    </tr>
    <tr bgcolor="#CCCCCC">
      <td><b><A HREF="<%=seleccionUrl%>"> <%=reservas.getBooking()%></a></b></td>
      <td><%=reservas.getNombre()%></td>
      <td><%=reservas.getTelefono()%></td>
      <td><%=reservas.getSucursal()%></td>
      <td><%=suc1%></td>
      <td><b><A HREF="<%=seleccionUrlpta%>">  <%=reservas.getPta()%></a></b></td>
    </tr>
    <%}%>
    <tr bgcolor="#66FFFF">
      <td><%=reservas.getOrigen()%></td>
      <td><%=reservas.getDestino()%></td>
      
      <td><%=fecha%></td>
      <td><%=reservas.getNumero()%></td>
      <td><%=f.format(reservas.getHora())%>:<%=f.format(reservas.getMinuto())%></td>
      <td><%=reservas.getEstado()%></td>
    </tr>
    
<%}
  }
%>    
  </table>
  </td>
</tr>
</table>

</form>
</body>
</html>
<%model.Limpiarlistas();%>
