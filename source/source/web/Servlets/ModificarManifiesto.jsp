<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>



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

<% String error=model.getError();
String color="FFFFCC";
if (error !=null)
{%>
<table>
<tr class="error">
<th colspan="12" ><%=error%></th>
</tr>
</table>
<%}%>

<% String Numero=request.getParameter("Numero");
        String Diad=request.getParameter("Diad");
        String Mesd=request.getParameter("Mesd");
        String Aniod=request.getParameter("Aniod");
        String Diah=request.getParameter("Diah");
        String Mesh=request.getParameter("Mesh");
        String Anioh=request.getParameter("Anioh");
        
        String Micliente=request.getParameter("Cliente");
        Calendar hoy = Calendar.getInstance();
        
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
<form method="post" action="<%=CONTROLLER%>/ModificarManifiestos/Buscar"  name="ModificarManifiestos">
<tr>
    

    
<td valign="top">

<%DecimalFormat f =new DecimalFormat("0.00");%>
<tr>
<th colspan="8">MODIFICAR MANIFIESTOS</th>
</tr>
</table>
<table  >
<tr>
<td><b>FECHA :</b></td>
<td>
Dia</td>
<td><input name= "Diad" id="Diad" type="text"  value="<%=Diad%>" size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);"  readonly>
</TD>
<td>Mes</td>
<td><input name= "Mesd" id="Mesd" type="text" value="<%=Mesd%>"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"  readonly> 
</TD>
<td>Anio</td>
<td><input name= "Aniod" id="Aniod" type="text" value="<%=Aniod%>"  size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"  readonly>
</td>

<TD></TD>
<TD></TD>

<%--td ><b>Hasta :</b> </td>
<td>
Dia</td>
<td><input name= "Diah" id="Diah" type="text" value="<%=Diah%>"  size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);"  readonly >
</td>
<td>Mes</td>
<td><input name= "Mesh" id="Mesh" type="text" value="<%=Mesh%>"  size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);" readonly> 
</td>
<td>Anio</td>
<td><input name= "Anioh" id="Anioh" type="text"   value="<%=Anioh%>" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" readonly>
</td--%>
</tr>

</table>



<table  width="90%" align="CENTER" id="tcli1" class="sortable">
<tr>
<th>Fecha </th>
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
 
 List list = model.getListaManifiestos();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Manifiesto manifiesto=(Manifiesto) it.next();
          String seleccionUrl=CONTROLLER+"/ModificarManifiestos/Selecciona?codigo="+ manifiesto.getCodigo() +"&Usuario=" + manifiesto.getUsuario()+"&Origen="+manifiesto.getOrigen()+"&Destino="+manifiesto.getDestino();
          %>
  <tr>
      
       
       <td><%=manifiesto.getFecha()%></td>
       <td><A HREF="<%=seleccionUrl%>"> <%=manifiesto.getNumero()%></td>
       <td><%=manifiesto.getOrigen()%></td>
       <td><%=manifiesto.getDestino()%></td>
       <td><%=manifiesto.getVuelo()%></td>
       <td><%=manifiesto.getEquipo()%></td>
       <td><%=manifiesto.getPeso()%></td>
       <td><%=manifiesto.getPiezas()%></td>
       <td><%=manifiesto.getObservacion()%></td>
       
  </tr>    
 <%}}%>

</table>
</td>
</tr>
<tr>
<td align="center">

</td>
</tr>
</form>
</table>


<%@ include file="/WEB-INF/Banere.jsp"%>



</body>
</html>



