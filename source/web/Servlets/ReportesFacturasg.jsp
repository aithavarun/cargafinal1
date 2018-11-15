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
        String Dia2=request.getParameter("Dia2");
        String Mes2=request.getParameter("Mes2");
        String Anio2=request.getParameter("Anio2");
        
        String Micliente=request.getParameter("Cliente");
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

        if (Dia2==null)
            Dia2=String.valueOf(dia);
        if (Mes2==null)
            Mes2=String.valueOf(mes+1);
        if (Anio2==null)
            Anio2=String.valueOf(anio);
        
        if (Numero==null)
            Numero="";
        
       // int micliente=0;
        %>
        
        
<table border="0" cellpadding="0" cellspacing="0" width="780">
<!-- fwtable fwsrc="forma.png" fwbase="forma.gif" fwstyle="Dreamweaver" fwdocid = "363923732" fwnested="0" -->
<form method="post" action="<%=CONTROLLER%>/Guias/Buscarfacturasg"  
    name="MantenimientoGuias" onSubmit="return validar(this)"  >
     <input name="baseurl" value="<%=BASEURL%>" 
type="hidden"  >
<tr>
<th colspan="25">CARGA AEROGAL - REPORTE GUIAS FACTURAS</th>
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
    
    Fecha:
    </b></td>
    <td>(mes)</font>
    <input name="Mes2" value="<%=Mes2%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
    </td>
    <td>(dia)
    <input name="Dia2" value="<%=Dia2%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
    </td>
    <td>(a&ntilde;o)
    <input name="Anio2" value="<%=Anio2%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
    </td>
    <td ><b>
    
   </table> 
   
 <table border="0" cellpadding="0" cellspacing="0" width="780">
   
  <tr><td> <b>CLIENTE: </b> </td>
  <td><select  name="Cliente" type="text" class='txt-arialimput' onchange="selecliente();">  

        
<%
 model.BuscarClientesCarga("CO");
 List list = model.getClientesCarga();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Clientesc clientec=(Clientesc) it.next();
          
      
          %>
          
         <option value=<%=clientec.getCodigo()%> > <%=clientec.getNombre() %>  </option>
         
 
 <%}}%>
 
     </select>


  
  </tr> 
 
  
  
  <TR><td><b>SUCURSAL: </b></td>
      <TD><select name="Sucursal" type="text" class='txt-arialimput'>
      <option value=-1 >   </option>
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
          
      </TD>
  </TR>
 
   </table>
   
   
   </td>
   
  </tr>
  <tr>
   <td colspan="3" >
     <input TYPE="submit"  NAME="<%=BASEURL%>/images/Forma/forma_r3_c14.y" value="Buscar">
   </td>
     
   
   
     
   
  </tr>
 
  <tr>
  
   <td colspan="15">
   
        
   
    
       <%@ include file="/Servlets/Guiasxfacs.jsp"%>
       
   
    
  
  
   </td>
  </tr>
  
  
  </form>
</table>


<script language="JavaScript" type="text/javascript">
   MantenimientoGuias.Cliente.options.value="<%=Micliente%>"
</script>

<%-------------------
Fin forma
------------------%>



<%@ include file="/WEB-INF/Banere.jsp"%>

</body>
</html>




