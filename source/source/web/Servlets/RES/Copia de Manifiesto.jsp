<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.*" %>

<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  
<%-------------------
Aqui va todo el trabajo
&nbsp;
<%=BASEURL%>/images/Forma/
------------------%>
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

  <%--------------------------  
        
----------------------------------%>
function Buscar(){
alert("buscar");
var diad=document.MantenimientoReservaciones.Dia.value;
location="<%=CONTROLLER%>/Reservaciones/asdasr?Dia=diad";
alert("pasa");
}
function validar(frm){

    
    var Mes=frm.Mes.value;
    if (Mes=="")
        {
            alert("Mes es obligatorio" );
            return false;
        }
    var Anio=frm.Anio.value;
    if (Anio=="")
        {
            alert("Anio es obligatorio" );
            return false;
        }    
    if (Mes >12)
     {
            alert("Mes no puede ser mayor de 12" );
            return false;
      
     }
     if (Mes <=0)
     {
            alert("Mes no puede ser menor o igual a 0" );
            return false;
      
     }
    
     
      var diad=frm.Dia.value;
     if (diad=="")
        {
            alert("Dia es obligatorio" );
            return false;
        }
    var cuantos=cuantosDias(Mes,Anio);
    
    if (diad >cuantos)
     {
            alert("Dia no puede ser mayor de " + cuantos );
            return false;
      
     }
     if (diad <=0)
     {
            alert("Dia no puede ser menor o igual a 0" );
            return false;
      
     }
    
    
    
    return true;
}

 <%------------------
       alert(<%=Dia%>);
        comboDias = eval("document.MantenimientoAviones.Dia");
        comboDias[<%=Dia%>].selected = true;
       alert(<%=Dia%>);
 --------------%>

 
</SCRIPT>

<%-------------------
Re Nueva forma
------------------%>
<% String Numero=request.getParameter("Numero");
        String Dia=request.getParameter("Dia");
        String Mes=request.getParameter("Mes");
        String Anio=request.getParameter("Anio");
        String Origen=request.getParameter("Origen");
        Calendar hoy = Calendar.getInstance();
        
        int dia=hoy.get(Calendar.DATE);
        int mes=hoy.get(Calendar.MONTH);
        int anio=hoy.get(Calendar.YEAR);
        if (Dia==null)
            Dia=String.valueOf(dia);
        if (Mes==null)
            Mes=String.valueOf(mes+1);
        if (Anio==null)
            Anio=String.valueOf(anio);
        if (Numero==null)
            Numero="";
        if (Origen==null)
            Origen="";
        %>
        
        
<table border="0" cellpadding="0" cellspacing="0" width="729">
<tr>
<!-- fwtable fwsrc="forma.png" fwbase="forma.gif" fwstyle="Dreamweaver" fwdocid = "363923732" fwnested="0" -->
<form method="post" action="<%=CONTROLLER%>/Manifiesto/Pax"  
    name="MantenimientoReservaciones" onSubmit="return validar(this)"  >
    
    <table border="0" cellpadding="0" cellspacing="0" >
  
    <td ><b>
    
    Fecha:
    
    </b></td>
    <td>(mes)
    <input name="Mes" value="<%=Mes%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
    </td>
    <td>(dia)
    <input name="Dia" value="<%=Dia%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
    </td>
    <td>(a&ntilde;o)
    <input name="Anio" value="<%=Anio%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
    </td>
    <td ><b>
    
    Numero de Vuelo:
    
    </b></td><td>
    <input name="Numero" value="<%=Numero%>" type="text" size="5" maxlength="20" >
    </td>
    <td ><b>
    Origen:
     </b></td><td>
    <input name="Origen" value="<%=Origen%>" type="text" size="5" maxlength="20" >
    </td>
    <td>
 <input TYPE="submit"    NAME="Buscar" value="Buscar">
 </td>
   </table>
   
  <table  align="center" border="0" cellpadding="1" cellspacing="0" >

<th colspan="1">Sec.</th>
<th>Apellido/Nombre</th>
<th>Tipo</th>
<th>Destino</th>
<th>Clase</th>
<th>Grupo</th>
<th>Asiento</th>
<th>Bording</th>
<th>Maletas</th>
<th>Estado</th>
  <%
  List lista3 = model.getProveedores();
  int ci=0;
  String asiento="";
  String estado="";
%>

  <%;
  if  (lista3 != null)  {
       Iterator itpnl = lista3.iterator();
       while (itpnl.hasNext()) {
            PNL pnl=(PNL) itpnl.next();
            ci++;
            asiento=pnl.getAsiento();
            if (asiento==null)
                asiento="";
            estado=pnl.getEstado();
            if (estado.equals("EM"))
                estado="B-OK";
            else
                estado="B-GS";
        %>
        <tr>
       <td><%=ci%></td> 
       <td><%=pnl.getNombre()%>/<%=pnl.getApellido()%></td>
       <td><%=pnl.getTipo()%></td>
       <td><%=pnl.getDestino()%></td>
       <td>Y</td>
       <td><%=pnl.getGrupo()%></td>
       <td><%=asiento%></td>
       <td><%=pnl.getBording()%></td>
       <td><%=pnl.getMaletas()%>/<%=pnl.getPeso()%></td>
       <td><%=estado%></td>
       
           
        </tr>
 <%
       }
  }
  %>
  </table>
  </form>
</tr>  
<%@ include file="/WEB-INF/Banere.jsp"%>
</table>






</body>
</html>


