
<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.*" %>





<%@ include file="/WEB-INF/Banner.jsp"%>  




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
var diad=document.MantenimientoGuias.Dia.value;
location="<%=CONTROLLER%>/Guias/asdasr?Dia=diad";
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
        %>
        
        
<table border="0" cellpadding="0" cellspacing="0" width="780">
<!-- fwtable fwsrc="forma.png" fwbase="forma.gif" fwstyle="Dreamweaver" fwdocid = "363923732" fwnested="0" -->
<form method="post" action="<%=CONTROLLER%>/Guias/Buscarg"  
    name="MantenimientoGuias" onSubmit="return validar(this)"  >
     <input name="baseurl" value="<%=BASEURL%>" 
type="hidden"  >
<tr>
<th colspan="25">CARGA AEROGAL </th>

</tr>
<tr>
   <td rowspan="8" colspan="10" >
    <table border="0" cellpadding="0" cellspacing="0"  >
    <td ><b>
    Fecha:
    </b></td>
    <td>(mes)</font>
    <input name="Mes" value="<%=Mes%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
    </td>
    <td>(dia)
    <input name="Dia" value="<%=Dia%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
    </td>
    <td>(a&ntilde;o)
    <input name="Anio" value="<%=Anio%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
    </td>
    
  
   <td  colspan="5">
   <b>
     <input TYPE="submit"  NAME="<%=BASEURL%>/images/Forma/forma_r3_c14.y" value="BUSCAR">
   </b>
   </td>
     
   <td  colspan="5">
    <b>
    <input TYPE="submit"   NAME="<%=BASEURL%>/images/Forma/forma_r3_c18.x" style="font-size: 18pt; font-weight: bold; font-family:Courier New; letter-spacing:1pt" value="NUEVA GUIA">
    </b>
   </td>
   
   <td  colspan="5">
    <b>
    <input TYPE="submit"   NAME="<%=BASEURL%>/images/Forma/forma_r3_c12.x" style="font-size: 18pt; font-weight: bold; font-family:Courier New; letter-spacing:1pt"  value="NUEVA FACTURA">
    </b>
   </td>
   
   
  </tr>
 
  <tr>
  
   <td colspan="15">
   
        
   
    
       <%@ include file="/Servlets/Guias.jsp"%>
       
   
    
  
  
   </td>
  </tr>
  
  
  </form>
</table>




<%-------------------
Fin forma
------------------%>



<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>



