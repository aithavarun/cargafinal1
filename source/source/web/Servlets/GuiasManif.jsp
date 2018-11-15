<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.*" %> 

<%@ include file="/WEB-INF/Banner.jsp"%>  


<script language="JavaScript">

function contar() {

/**/
var totalpiezas=0;
var totalpeso=0;
var i=0;

var manifiesto=eval("document.all.Secuencial");


/**/
for (i=1;i<=parseInt(manifiesto.value);i++)
{
    var guia=eval('document.all.Guia'+i);
    var TotalPiezasObjeto=document.getElementById("Piezas"+i).innerHTML;
    var TotalPesoObjeto=document.getElementById("Peso"+i).innerHTML;
    if (guia.checked)
    {
        totalpeso=totalpeso+parseFloat(TotalPesoObjeto);
        totalpiezas=totalpiezas+parseInt(TotalPiezasObjeto);
    }
}

var total=eval("document.all.TotalPiezas");
var totalp=eval("document.all.TotalPeso");

total.value=totalpiezas;
totalp.value=totalpeso;

}
</script>


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

    if(frm.Vuelo.value=="")
        {
        alert ("Ingrese el Vuelo");
        return false;
        }
    if(frm.Manifiesto.value=="")
        {
        alert ("Ingrese el numero de manifiesto");
        return false;
        }
        
        if(frm.Manifiesto.value=="0")
        {
        alert ("Ingrese el numero de manifiesto");
        return false;
        }
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
 // return false;
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
        String origen=request.getParameter("Origen");
        String destino=request.getParameter("Destino");        
        long manifiesto=model.TraerNManifiesto(model.getUsuarios().getSucursal(),"M");
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
        
  
        %>
        




<form method="post" action="<%=CONTROLLER%>/Guias/Buscarmanifiesto"  
    name="DManifiesto" onSubmit="return validar(this);"  >
   
        
  <table>
   <tr>
   <td rowspan="2" colspan="10" >
    <table border="0" cellpadding="0" cellspacing="0"  >
        <td ><b>
        Fecha:
        </b></td>
        <td></font>
        


        <input name="Dia" value="<%=Dia%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">(dia)

        <input name="Mes" value="<%=Mes%>" type="text" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" >(mes)
        
        <input name="Anio" value="<%=Anio%>" type="text" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">(a&ntilde;o)

    <td ><b>
        
<tr>
 <td align="left"> <b> Equipo:</b></td>
 <!--td><input name="Equipo" type ="text" size="20" maxlength="20"> </td-->
 <td  width="250"><select  name="Equipo" type="text" class='txt-arialimput'>
            <%
                model.BuscarAviones();
                 List list1 = model.getAviones();
                 if (list1 != null) {
                      Iterator it = list1.iterator();
                      while (it.hasNext()) {
                          Aviones avion=(Aviones) it.next();
            %>
                     <option value="<%=avion.getDescripcion().trim()%>" > <%=avion.getDescripcion().trim()%>  </option>
                     
             <%}}%>
 </select>
  </td>
  
  <td><b>  Origen</b>  <input name="Origen" value="<%=origen%>" type="text" size="10" maxlength="3" READONLY>   </td>
  <td><b>  Destino</b> <input name="Destino" value="<%=destino%>" type="text" size="10" maxlength="3" READONLY>  </td>
 
</tr>

        
<tr> 
    
    <td><b>Numero de Vuelo:
    </b></td>
    <td><input name="Vuelo" value="<%=Numero%>" type="text" size="10" maxlength="4">
    </td>
    <td><b>Numero de Manifiesto:
    </b></td>
    <td><input name="Manifiesto" value="<%=manifiesto%>" type="text" size="10" maxlength="10">
    </td>
</tr>

        
        
</table>
        
        
<table width="100%" align="center">
<tr>
<td>
<table id="t1" class="sortable">

<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");%>
<tr>
<th > Nª Guia</th>
<th > Piezas</th>
<th > Peso</th>
<th > Destino</th>
<th > Contiene</th>
<th > Cliente</th>
<th > Destinatario</th>
<th > Remitente</th>
<th > Ruta</th>

</tr>


<%
 List lista = model.getGuiasLista();
 int secuencial=0;
 String filascolor="#CCCCCC";
 String Destino="";
 String Ruta1="";
 String Ruta2="";
 String Origen1="";
 int totalopz1=0;
 int totalopz2=0;
 float totalops1=0;
 float totalops2=0;
 
 
int totalpz=0;
float totalps=0;
if (lista != null){
     Iterator itr = lista.iterator();
      while (itr.hasNext()){
             secuencial++;
             Guias guia=(Guias) itr.next();              
             String seleccionUrl=CONTROLLER+"/Guias/Selecciona?codigo="+guia.getCodigo() ;
             if(guia.getEntregaen()==1 )
             Destino="Domicilio";
             else if(guia.getEntregaen()==2)
             Destino="Oficina";
             else if(guia.getEntregaen()==3)
             Destino="Aeropuerto";
             
             totalpz+=guia.getPiezas();
             totalps+=guia.getPeso();
             
             if (Origen1.equals("") || Origen1.equals(guia.getOrigen()))
             {
                 Ruta1=guia.getOrigen();
                 totalopz1+=guia.getPiezas();
                 totalops1+=guia.getPeso();
                 Origen1=guia.getOrigen();
             }
             else
             {
                 totalopz2+=guia.getPiezas();    
                 totalops2+=guia.getPeso();
                 Ruta2=guia.getOrigen();
             }
             
             
             
             
             %>
             <tr   bgcolor="<%=filascolor%>">
             <!--td><input type="checkbox" name="Guia<%=secuencial%>" value= "<%=guia.getCodigo()%>" checked   ><b> <%=guia.getNumero()%> </b></td-->
             <td><b> <%=guia.getNumero()%> </b></td>
             <input name="Guia<%=secuencial%>" type ="hidden" value="<%=guia.getCodigo()%>" > 
             <td ><span id="Piezas<%=secuencial%>"><%=guia.getPiezas()%></span></td>             
             <td ><span id ="Peso<%=secuencial%>"><%=guia.getPeso()%></span></td>
             <td><%=Destino%></td>
             <td><%=guia.getContiene()%></td>
             <td><%=guia.getNombreCliente()%></td>
             <td><%=guia.getDestinatario()%></td>
             <td><%=guia.getRemitente()%></td>
             <td><%=guia.getOrigen() + " - " + guia.getDestino()  %></td>
            </tr>   
 
             <%}}%> 
 
            
            
             <tr   bgcolor="<%=filascolor%>">
             <td><b> Totales </a></b></td>
             <td><input name="TotalPiezas" value="<%=totalpz%>" type="text" size="10" maxlength="20" readonly> </td>
             <td><input name="TotalPeso" value="<%=totalps%>" type="text" size="10" maxlength="20" readonly ></td>
            
             
             <td> </td>
             
             <td></td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
            </tr>   
          
            
 

</table>
</td>
</tr>

<tr>
<td align="left"> <b> Observaciones: <input name="Observaciones" type ="text" size="90" maxlength="90"> </b> </td>
<input name="Secuencial" type ="hidden" value="<%=secuencial%>" > 
</tr>

<tr>
<td align="center"><input name="Guardar" type="submit" id="Guardar" value="Guardar"  ></td>
</tr>

</table>

</form>
<%@ include file="/WEB-INF/Banere.jsp"%>