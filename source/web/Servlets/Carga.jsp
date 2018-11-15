
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
function validare(frm){

    
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

function validar(frm){
if (frm.Origen.value=="")
     {
        alert("Seleccione un origen");
        return false;
     }
    

 if (frm.Destino.value=="")
     {
        alert("Seleccione un destino");
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
        String destino=request.getParameter("Destino"); 
        String origen=request.getParameter("Origen"); 
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
         if (destino==null)
            destino="";
        
     //    Usuarios usuario=model.getUsuarios();
        %>
        
<table align="center"  width="80%"  border="0">
 
    <form method="post" action="<%=CONTROLLER%>/Guias/BuscarCarga"  
    name="Manifiesto" onSubmit="return validar(this)"  >
        
      <th colspan="6" bgcolor="#0099FF">
    <span class="style3" >    Criterios de B&uacute;squeda
    </span>
    </th>
    
    <tr >
    
      <td  width="50">Origen :</td>
      <td  width="50"><select  name="Origen" type="text" class='txt-arialimput'>
            <%
             model.BuscarCiudades();
             List listo = model.getCiudades();
             if (listo != null) {
                  Iterator it = listo.iterator();
                  while (it.hasNext()) {
                      Ciudades ciudad=(Ciudades) it.next();
                     
                      %>
                     <option value="<%=ciudad.getCodigo()%>" > <%=ciudad.getNombre().trim()%>  </option>
             <%}}%>
                 </select>
      <td>
          
      <td></td>
      <td></td>
      <td  width="50">Destino :</td>
      <td  width="50"><select  name="Destino" type="text" class='txt-arialimput'>
            <%
             model.BuscarCiudades();
             List list = model.getCiudades();
             if (list != null) {
                  Iterator it = list.iterator();
                  while (it.hasNext()) {
                      Ciudades ciudad=(Ciudades) it.next();
                      
                      %>
                     <option value="<%=ciudad.getCodigo()%>" > <%=ciudad.getNombre().trim()%>  </option>
             <%}}%>
                 </select>
      <td>
    </tr>
    
    <tr>
    <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right"><input name="Buscar" type="submit" id="Buscar" value="Buscar"  onclick="nosalir();"></td>
     
      
      
      
        
      <input name="salir" value="0" 
        type="hidden"  >
    </tr>
    <tr></tr>
    <tr></tr>
    <tr></tr>
    <tr></tr>
  </table>
        
        
  
       
        

<table width="100%" border="0">
    <tr bordercolor="#FFFFFF">
      <th colspan="8" bgcolor="#0099FF"><span class="style3">CARGA SIN MANIFIESTO</span></th>
    </tr>



   </table>
   
   
  
  <tr>



<script language="JavaScript" type="text/javascript">
   Manifiesto.Destino.options.value="<%=destino%>"
   Manifiesto.Origen.options.value="<%=origen%>"
</script>
   
     
   
   
  </tr>
 
  <tr>
  
   <td colspan="15">
   
        
   
    
       <%@ include file="/Servlets/GuiasCarga.jsp"%>
       
   
    
  
  
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




