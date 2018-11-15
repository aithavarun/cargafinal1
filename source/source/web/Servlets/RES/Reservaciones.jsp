<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.*" %>





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
<form method="post" action="<%=CONTROLLER%>/Reservaciones/Buscar"  
    name="MantenimientoReservaciones" onSubmit="return validar(this)"  >
     <input name="baseurl" value="<%=BASEURL%>" 
type="hidden"  >
<tr>
<th colspan="25">RESERVACIONES Y VENTAS</th>
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
     
   <td colspan="3" >
    
    <input TYPE="submit"    NAME="<%=BASEURL%>/images/Forma/forma_r3_c18.x" value="Nueva">
   </td>
   
  </tr>
  
  <tr>
   
   <td colspan="1"><input TYPE="submit"    NAME="<%=BASEURL%>/images/Forma/forma_r5_c2.y" value="Reconfirmados"></td>
   <td colspan="1"><input TYPE="submit"    NAME="<%=BASEURL%>/images/Forma/forma_r5_c6.x" value="Duplicados"></td>
   <td colspan="1"><input TYPE="submit"    NAME="<%=BASEURL%>/images/Forma/forma_r5_c8.x" value="Time Limit"></td>
   <td colspan="1"><input TYPE="submit"    NAME="<%=BASEURL%>/images/Forma/forma_r5_c10.y" value="Waiting List"></td>
   <td colspan="1"><input TYPE="submit"    NAME="<%=BASEURL%>/images/Forma/forma_r5_c12.x" value="Cancelados"></td>
   <td colspan="1"><input TYPE="submit"    NAME="<%=BASEURL%>/images/Forma/forma_r5_c16.y" value="Disponibilidad"></td>
   
   <%-------------------
   <input type="image" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','<%=BASEURL%>/images/Forma/forma_r5_c2','<%=BASEURL%>/images/Forma/forma_r5_c2_f2.gif','<%=BASEURL%>/images/Forma/forma_r5_c2_f4.gif',1);" onClick="MM_nbGroup('down','navbar1','<%=BASEURL%>/images/Forma/forma_r5_c2','<%=BASEURL%>/images/Forma/forma_r5_c2_f3.gif',1);" name="<%=BASEURL%>/images/Forma/forma_r5_c2" src="<%=BASEURL%>/images/Forma/forma_r5_c2.gif" width="118" height="28" border="0" alt=""></td>
   <td><img name="<%=BASEURL%>/images/Forma/forma_r5_c5" src="<%=BASEURL%>/images/Forma/forma_r5_c5.gif" width="2" height="28" border="0" alt=""></td>
   <td><input type="image" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','<%=BASEURL%>/images/Forma/forma_r5_c6','<%=BASEURL%>/images/Forma/forma_r5_c6_f2.gif','<%=BASEURL%>/images/Forma/forma_r5_c6_f4.gif',1);" onClick="MM_nbGroup('down','navbar1','<%=BASEURL%>/images/Forma/forma_r5_c6','<%=BASEURL%>/images/Forma/forma_r5_c6_f3.gif',1);" name="<%=BASEURL%>/images/Forma/forma_r5_c6" src="<%=BASEURL%>/images/Forma/forma_r5_c6.gif" width="118" height="28" border="0" alt=""></td>
   <td><img name="<%=BASEURL%>/images/Forma/forma_r5_c7" src="<%=BASEURL%>/images/Forma/forma_r5_c7.gif" width="3" height="28" border="0" alt=""></td>
   <td><input type="image" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','<%=BASEURL%>/images/Forma/forma_r5_c8','<%=BASEURL%>/images/Forma/forma_r5_c8_f2.gif','<%=BASEURL%>/images/Forma/forma_r5_c8_f4.gif',1);" onClick="MM_nbGroup('down','navbar1','<%=BASEURL%>/images/Forma/forma_r5_c8','<%=BASEURL%>/images/Forma/forma_r5_c8_f3.gif',1);" name="<%=BASEURL%>/images/Forma/forma_r5_c8" src="<%=BASEURL%>/images/Forma/forma_r5_c8.gif" width="118" height="28" border="0" alt=""></td>
   <td><img name="<%=BASEURL%>/images/Forma/forma_r5_c9" src="<%=BASEURL%>/images/Forma/forma_r5_c9.gif" width="3" height="28" border="0" alt=""></td>
   <td><input type="image" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','<%=BASEURL%>/images/Forma/forma_r5_c10','<%=BASEURL%>/images/Forma/forma_r5_c10_f2.gif','<%=BASEURL%>/images/Forma/forma_r5_c10_f4.gif',1);" onClick="MM_nbGroup('down','navbar1','<%=BASEURL%>/images/Forma/forma_r5_c10','<%=BASEURL%>/images/Forma/forma_r5_c10_f3.gif',1);" name="<%=BASEURL%>/images/Forma/forma_r5_c10" src="<%=BASEURL%>/images/Forma/forma_r5_c10.gif" width="118" height="28" border="0" alt=""></td>
   <td><img name="<%=BASEURL%>/images/Forma/forma_r5_c11" src="<%=BASEURL%>/images/Forma/forma_r5_c11.gif" width="3" height="28" border="0" alt=""></td>
   <td colspan="3">
    <input type="image" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','<%=BASEURL%>/images/Forma/forma_r5_c12','<%=BASEURL%>/images/Forma/forma_r5_c12_f2.gif','<%=BASEURL%>/images/Forma/forma_r5_c12_f4.gif',1);" onClick="MM_nbGroup('down','navbar1','<%=BASEURL%>/images/Forma/forma_r5_c12','<%=BASEURL%>/images/Forma/forma_r5_c12_f3.gif',1);" name="<%=BASEURL%>/images/Forma/forma_r5_c12" src="<%=BASEURL%>/images/Forma/forma_r5_c12.gif" width="118" height="28" border="0" alt=""></td>
   <td><img name="<%=BASEURL%>/images/Forma/forma_r5_c15" src="<%=BASEURL%>/images/Forma/forma_r5_c15.gif" width="1" height="28" border="0" alt=""></td>
   <td colspan="5">
    <input type="image" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','<%=BASEURL%>/images/Forma/forma_r5_c16','<%=BASEURL%>/images/Forma/forma_r5_c16_f2.gif','<%=BASEURL%>/images/Forma/forma_r5_c16_f4.gif',1);" onClick="MM_nbGroup('down','navbar1','<%=BASEURL%>/images/Forma/forma_r5_c16','<%=BASEURL%>/images/Forma/forma_r5_c16_f3.gif',1);" name="<%=BASEURL%>/images/Forma/forma_r5_c16" src="<%=BASEURL%>/images/Forma/forma_r5_c16.gif" width="126" height="28" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Forma/spacer.gif" width="1" height="28" border="0" alt=""></td>
   -------------------------%>
  </tr>
  
  <tr>
  
   <td colspan="15">
   <%----Coloca la forma correcta--%>
   <% String accion=model.getAccion();
   if (accion==null)
   {
       
   }
   else if ((accion.equals("2") && (usuario.getAcceso()==0)))
   {%>
       <%@ include file="/Servlets/Resumen.jsp"%>
   <%}
    else if ((accion.equals("6")&& (usuario.getAcceso()==0)))
   {%>
       <%@ include file="/Servlets/Resumen.jsp"%>
   <%}%>
   </td>
  </tr>
  <tr>
   <%----Coloca la forma correcta--%>
   <% //String accion=model.getAccion();
   if (accion==null)
   {
       
   }
   else if (accion.equals("1"))
   {%>
       <%@ include file="/Servlets/RItinerarios.jsp"%>
   <%}
   else if (accion.equals("2"))
   {%>
       <%@ include file="/Servlets/Reservas.jsp"%>
   <%}
   else if (accion.equals("3"))
   {%>
       <%@ include file="/Servlets/Duplicados.jsp"%>
   <%}
    else if (accion.equals("4"))
   {%>
       <%@ include file="/Servlets/Timelimit.jsp"%>
   <%}
    else if (accion.equals("5"))
   {%>
       <%@ include file="/Servlets/ListadeEspera.jsp"%>
   <%}
   else if (accion.equals("6"))
   {%>
       <%@ include file="/Servlets/Reservas.jsp"%>
   <%}%>
   </td>
  </tr>
  
  </form>
</table>








<%-------------------
Nueva forma
------------------%>



<%-------------------
Fin forma
------------------%>



<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>


