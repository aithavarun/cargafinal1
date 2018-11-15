
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
<form method="post" action="<%=CONTROLLER%>/Guias/Buscarmanifiesto"  
    name="MantenimientoGuias" onSubmit="return validar(this)"  >
     <input name="baseurl" value="<%=BASEURL%>" 
type="hidden"  >
<tr>
<td align="center"> <b> MANIFIESTO DE EMBARQUE DE CARGA </b> </td>
</tr>

<tr>
<td align="left"> <b> Elaborado por: <input name="Elaborado" type ="text" size="80" maxlength="60"> </td>
</tr>

<tr>
<td align="left"> <b> Matricula: <input name="Matricula" type ="text" size="20" maxlength="20"> </td>
</b>
</tr>

<tr>
   <td rowspan="2" colspan="10" >
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
    <td ><b>
    
    Numero de Vuelo:
     </b></td><td>
    <input name="Numero" value="<%=Numero%>" type="text" size="10" maxlength="20">
    </td>
    
   </table>
   
   
   </td>
   
  </tr>
  <tr>




   <td colspan="3" >
     <input TYPE="submit"    NAME="<%=BASEURL%>/images/Forma/forma_r3_c14.y" value="Buscar">
   </td>
     
   
   
  </tr>
 
  <tr>
  
   <td colspan="15">
   
        
   
    
       <%@ include file="/Servlets/GuiasManif.jsp"%>
       
   
    
  
  
   </td>
  </tr>
  
  
  </form>
</table>


<tr>
<td align="left"> <b> Observaciones: <input name="Observaciones" type ="text" size="90" maxlength="90"> </b> </td>
</tr>

<%-------------------
Fin forma
------------------%>



<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>




