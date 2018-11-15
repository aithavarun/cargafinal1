<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import ="java.text.DecimalFormatSymbols" %>
<%
DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
simbolos.setDecimalSeparator('.');
DecimalFormat f =new DecimalFormat("0.00",simbolos);%>

<html>



<%@ include file="/WEB-INF/Banner.jsp"%>  


<SCRIPT language="JavaScript" >
    ahora       = new Date();
    ahoraDay    = ahora.getDate();
    ahoraMonth  = ahora.getMonth()+1;
    ahoraYear   = ahora.getYear();
   

 
function validar(frm){

   
 var Mesd=frm.Mesd.value
 if (Mesd=="")
    {
       alert("Mes es obligatorio" );
       return false;
    }
  
 var Aniod=frm.Aniod.value;   
 if (Aniod=="")
     {
        alert("Anio es obligatorio" );
        return false;
     }    
     
if (Mesd >12)
   {
           alert("Mes no puede ser mayor de 12" );
           return false;      
    }
    if (Mesd <=0)
     {
          alert("Mes no puede ser menor o igual a 0" );
          return false;
     
     }
    
     
      var diad=frm.Diad.value;
     if (diad=="")
       {
           alert("Dia es obligatorio" );
           return false;
        }
   var cuantos=cuantosDias(Mesd,Aniod);
    
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
 
//55555555     
     var Mesh=frm.Mesh.value
 if (Mesh=="")
    {
       alert("Mes es obligatorio" );
       return false;
    }
  
 var Anioh=frm.Anioh.value;   
 if (Anioh=="")
     {
        alert("Anio es obligatorio" );
        return false;
     }    
     
if (Mesh >12)
   {
           alert("Mes no puede ser mayor de 12" );
           return false;      
    }
    if (Mesh <=0)
     {
          alert("Mes no puede ser menor o igual a 0" );
          return false;
     
     }
    
     
      var diah=frm.Diah.value;
     if (diah=="")
       {
           alert("Dia es obligatorio" );
           return false;
        }
   var cuantos=cuantosDias(Mesh,Anioh);
    
    if (diah >cuantos)
    {
           alert("Dia no puede ser mayor de " + cuantos );
           return false;
      
     }
    if (diah <=0)
    {
           alert("Dia no puede ser menor o igual a 0" );
            return false;
      
     }
 
    
    
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
</SCRIPT>

<% String Numero=request.getParameter("Numero");
        String Diad=request.getParameter("Diad");
        String Mesd=request.getParameter("Mesd");
        String Aniod=request.getParameter("Aniod");
        String Diah=request.getParameter("Diah");
        String Mesh=request.getParameter("Mesh");
        String Anioh=request.getParameter("Anioh");
        String Origen=request.getParameter("Origen");
        String Destino=request.getParameter("Destino");
        String Micliente=request.getParameter("Cliente");
        String buscar=request.getParameter("Buscar");
        Calendar hoy = Calendar.getInstance();
        if (Origen==null)
            Origen="*";
        
        if (Destino==null)
            Destino="*";
        
        int dia=hoy.get(Calendar.DATE);
        int mes=hoy.get(Calendar.MONTH);
        int anio=hoy.get(Calendar.YEAR);
       
        if (Diad==null)
            Diad=String.valueOf(dia);
        if (Mesd==null)
            Mesd=String.valueOf(mes+1);
        if (Aniod==null)
            Aniod=String.valueOf(anio);
 
        if (Diah==null)
            Diah=String.valueOf(dia);
        if (Mesh==null)
            Mesh=String.valueOf(mes+1);
        if (Anioh==null)
            Anioh=String.valueOf(anio);
        
        if (Numero==null)
            Numero="";
        
    
        %>



<%-------------------
Aqui va todo el trabajo
&nbsp;
------------------%>
<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/ReporteManifiestos/Buscar"  name="ReporteManifiestos" onSubmit="return validar(this);" >
<tr>
    
    
    
<td valign="top">

<%--DecimalFormat f =new DecimalFormat("0.00");--%>
<tr>
<th colspan="16">REPORTE DE MANIFIESTOS</th>
</tr>

<td><b>Desde :</b></td>
<td>
Dia</td>
<td><input name= "Diad" id="Diad" type="text"  value="<%=Diad%>" size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
</TD>
<td>Mes</td>
<td><input name= "Mesd" id="Mesd" type="text" value="<%=Mesd%>"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);" > 
</TD>
<td>Anio</td>
<td><input name= "Aniod" id="Aniod" type="text" value="<%=Aniod%>"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >
</td>

<TD></TD>
<TD></TD>

<td ><b>Hasta :</b> </td>
<td>
Dia</td>
<td><input name= "Diah" id="Diah" type="text" value="<%=Diah%>"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
</td>
<td>Mes</td>
<td><input name= "Mesh" id="Mesh" type="text" value="<%=Mesh%>"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
</td>
<td>Anio</td>
<td><input name= "Anioh" id="Anioh" type="text"   value="<%=Anioh%>" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
</td>
</tr>

</table>
<table>
<tr >
<td   width="50"> <b>Origen : </b></td>
      <td  width="50"><select  name="Origen" type="text" class='txt-arialimput' onchange="selecliente();">  
          <option value="*">->Todas<-</option>
            <%
             model.BuscarCiudades();
             List listd = model.getCiudades();
             if (listd != null) {
                  Iterator it = listd.iterator();
                  while (it.hasNext()) {
                      Ciudades ciudad=(Ciudades) it.next();
                      
                      %>
                     <option value="<%=ciudad.getCodigo()%>" > <%=ciudad.getNombre().trim()%>  </option>
             <%}}%>
                 </select>
      </td>
      <td></td>
      <td></td>
      <td  width="50"> <b>Destino : </b></td>
      <td  width="50"><select  name="Destino" type="text" class='txt-arialimput'>
          <option value="*">->Todas<-</option>
            <%
             model.BuscarCiudades();
             List listh = model.getCiudades();
             if (listh != null) {
                  Iterator it = listh.iterator();
                  while (it.hasNext()) {
                      Ciudades ciudad=(Ciudades) it.next();
                      
                      %>
                     <option value="<%=ciudad.getCodigo()%>" > <%=ciudad.getNombre().trim()%>  </option>
             <%}}%>
                 </select>
      </td>
 <td></td>     
 <td></td>     
 <td>
 <input TYPE="submit"    NAME="Buscar" value="Buscar">
 </td>
 </tr>
    

</table>



<table  width="90%" align="CENTER" id="tcli1" class="sortable">
<tr>
<th width="100">Fecha </th>
<th>Manifiesto Nº </th>
<th>Origen</th>
<th>Destino</th>
<th>Vuelo </th>
<th>Equipo </th>
<th>T. Peso </th>
<th>T. Piezas </th>
<th>Observaciones </th>



</tr>
<%
 float total=0;
 List list = model.getListaManifiestos();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Manifiesto manifiesto=(Manifiesto) it.next();
          String seleccionUrl=CONTROLLER+"/ReporteManifiestos/Selecciona?codigo="+manifiesto.getCodigo() ;
          total+=manifiesto.getPeso();
          %>
  <tr>
      
       
  <td width="100" ><%=manifiesto.getFecha()%></td>
       <td><A HREF="<%=seleccionUrl%>"><%=manifiesto.getNumero()%></td>
       
       <td><%=manifiesto.getOrigen()%></td>
       <td><%=manifiesto.getDestino()%></td>
       <td><%=manifiesto.getVuelo()%></td>
       <td><%=manifiesto.getEquipo()%></td>
       <td align="right" ><%=f.format(manifiesto.getPeso())%></td>
       <td align="right"><%=manifiesto.getPiezas()%></td>
       <td><%=manifiesto.getObservacion()%></td>
       
  </tr>    
 <%}}%>

  <tr>
      
       
       <td></td>
       <td></td>
       
       <td></td>
       <td></td>
       <td></td>
       <td> <b>TOTAL </B> </td>
       <td align="right"> <b><%=f.format(total)%></b></td>
       <td></td>
       <td></td>
       
  </tr>    
 
 
 
 
 
</table>
</td>
</tr>
<tr>
<td align="center">

</td>
</tr>


<%if ((total<=0) && buscar!=null)
{%>
    <table align="center"  style="color:white" >
        <tr  bgcolor="#FF0000"> 
            <td >
            NO EXISTEN DATOS PARA MOSTRAR 
            </td>
        </tr>
    </table>
<%}%>

</form>


<script language="JavaScript" type="text/javascript">
   ReporteManifiestos.Origen.options.value="<%=Origen%>"
   ReporteManifiestos.Destino.options.value="<%=Destino%>"
</script>

<%@ include file="/WEB-INF/Banere.jsp"%>




</body>
</html>



