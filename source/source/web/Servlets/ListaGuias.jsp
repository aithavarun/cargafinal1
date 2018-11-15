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



<form method="post" action="<%=CONTROLLER%>/Guias/Buscarmanifiesto"  
    name="DManifiesto" onSubmit="return validar(this)"  >
        
        
        
<table width="100%" align="center">
<tr>
<td>
<table id="t1" class="sortable">

<%DecimalFormat f =new DecimalFormat("00");
SimpleDateFormat FORMATOFECHA= 
                        new SimpleDateFormat("E , d MMM - yyyy");
String nbusca=request.getParameter("Buscar"); 
                        %>
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
             <td><input type="checkbox" name="Guia<%=secuencial%>" value= "<%=guia.getCodigo()%>" onclick ="contar();" checked ><b> <%=guia.getNumero()%> </b></td>
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
             <input name="Secuencial" type ="hidden" value="<%=secuencial%>" > 
             
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




</table>

<%// if (secuencial>0 )
//{
%>
<TABLE width="10%" align="center">
<tr>
    <td ><input name="Manifiesto" type="submit" id="Manifiesto" value="Manifiesto"  onclick="nosalir();"></td>
</tr>
</table>
<%
//}
//else 
 if(nbusca!=null && secuencial==0)
{
%>

   <table align="center"  style="color:white" >
    
           
        <tr  bgcolor="#FF0000"> 
            <td >
            NO EXISTEN DATOS PARA MOSTRAR 
            </td>
        </tr>
   
        
    
</table>
<%
}
%>
</form>