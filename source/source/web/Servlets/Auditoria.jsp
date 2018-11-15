<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
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
String filascolor="#CCCCCC";
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
<form method="post" action="<%=CONTROLLER%>/Auditoria/Buscar"  name="ReporteManifiestos" onSubmit="return validar(this);" >
<tr>
    
    
    
<td valign="top">

<%--DecimalFormat f =new DecimalFormat("0.00");--%>
<tr>
<th colspan="16">AUDITORIA DE TABLAS</th>
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
<table  align="center">
<tr >
 <td>
 <input TYPE="submit"    NAME="Buscar" value="Buscar">
 </td>
 </tr>
    

</table>



<table  width="90%" align="CENTER" id="tcli1" class="sortable">
<tr>
<th width="100">Fecha </th>
<th>Transacciones </th>
<th>Usuario</th>
<th>Secuencial</th>
<th>Tabla</th>
</tr>
<%
 float total=0;
 int sw =0;
 Timestamp fechax;
  
 List list = model.getListaAuditoria();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Auditoria auditoria=(Auditoria) it.next();
          fechax=auditoria.getFecha();
          sw=1;
        
          %>
  <tr bgcolor="<%=filascolor%>">
      
       
  <td width="100" ><%=fechax%></td>
       
       <td><%=auditoria.getObservaciones()%></td>
       <td><%=auditoria.getUsuario()%></td>
       <td><%=auditoria.getSecuencial()%></td>
       <td><%=auditoria.getTabla()%></td>
  </tr>    
 <%}}%>

  <tr>
       
       
  </tr>    
 
 
 
 
 
</table>
</td>
</tr>
<tr>
<td align="center">

</td>
</tr>
</form>
</table>

<table align="center"  style="color:white" >
    
        <% if ((sw==0 ) && (buscar!=null))
        {   
        %>
           
        <tr  bgcolor="#FF0000"> 
            <td >
            NO EXISTEN DATOS PARA MOSTRAR EN ESTE RANGO DE FECHAS
            </td>
        </tr>
   
        <%}%>
    
</table>


<%@ include file="/WEB-INF/Banere.jsp"%>



</body>
</html>



