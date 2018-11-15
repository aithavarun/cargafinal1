<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.*" %>

<script language="JavaScript">
function validar(frm){ 
    
    //alert (frm.Guia.value);
  
    
    
    
    if (frm.Guia.value=="")
       {
       frm.Guia.value=0;
        
        
      }
   
    

      return true;

        } 

</script>  


<html>
    
    <%@ include file="/WEB-INF/Banner.jsp"%>  
<%DecimalFormat f =new DecimalFormat("0.00");%>
<head>
<title>::: Carga Aerogal :::</title>
<link href="<%=BASEURL%>/images/Sistema/Level2_Verdana_Forms.css" rel="stylesheet" type="text/css">

<style type="text/css">

</style>


</head>
<%

java.util.Calendar inicio = java.util.Calendar.getInstance();

int anio=inicio.get(Calendar.YEAR);

%>
<body bgcolor="#CCCCCC"  >
<form name="form1" method="post" action="<%=CONTROLLER%>/Reservaciones/DespachoGuia-" onSubmit="return validar(this);" >
<table border="0" cellpadding="0"  align="center" cellspacing="0" width="780" bgcolor="ffffff">
<tr>
<td>
  <table width="100%"  border="0">
  <td><img src="<%=BASEURL%>//images/logo.gif" > </td>
  <td><span class="style1">B&ugrave;squeda de Guia
</span></td>
</table>
</td>
</tr>
<tr>
<td>
  <table width="100%"  border="0">
      <th colspan="4" bgcolor="#0099FF">
    <span class="style3" >    Criterios de B&uacute;squeda
    </span>
    </th>
    
    <tr>
      <td>Guia Nº</td>
      <td><input name="Guia" type="text" id="Boleto"   value="0" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
 <tr>
<td> Cliente: </td>
<td><select  name="Cliente" type="text" class='txt-arialimput' onchange="selecliente();">  


<option value="-1">->Ninguno<-</option>

        
<%
 model.BuscarClientesCarga("*");

 List list = model.getClientesCarga();
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Clientesc clientec=(Clientesc) it.next();     
          %>
          
         <option value=<%=clientec.getCodigo()%> >  <%=clientec.getCodigos()%> <%=clientec.getNombre() %>  </option>
         
 
 <%}}%>
 
     </select>

<td>
</tr>
    
    
    
    <tr>
      <td width="144">Remitente</td>
      <td width="160"><input name="Remitente" type="text" id="Apellido" onChange="javascript:this.value=this.value.toUpperCase();"></td>
      </tr>
      <tr>
      <td width="192">Destinatario</td>
      <td width="246"><input name="Destinatario" type="text" id="Nombre" onChange="javascript:this.value=this.value.toUpperCase();"></td>
    </tr>
    <tr>
     <td width="192">Despachado</td>
     <td><select  name="Despachado" type="text" class='txt-arialimput' onchange="selecliente();">  
     <option value="0"> NO </option>
     <option value="1"> SI </option>
         </select>
     <td>
     </tr>
     
    <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right"><input name="Buscar" type="submit" id="Buscar" value="Buscar"  ></td>
      
      <input name="salir" value="0" 
        type="hidden"  >
    </tr>
  </table>
  
  <td>
  </tr>
  <tr>
  <td>
  <table width="100%" border="0">
    <tr bordercolor="#FFFFFF">
      <th colspan="7" bgcolor="#0099FF"><span class="style3">Resultados</span></th>
    </tr>
    <tr bgcolor="#FFFFCC">
      <th>Guia</th>
      <th>Fecha Guia</th>
      <th>Cliente</th>
      <th>Remitente</th>
      <th>Destinatario</th>
      <th>Contenido</th>
      <th>Despachado</th>
      <th>Quien entrega</th>
      <th>Fecha Entregado<th>
    </tr>
  
<%List lista2 = model.getGuiadespacho();

//int total=(lista2.size())+1;

int j=0;
long codigo=0;
String sino="";
String quiene="";
String fecha="";

  if  (lista2 != null)  {
      Iterator itr = lista2.iterator();
      while (itr.hasNext()) {
            Guias guiadespacho=(Guias) itr.next();
            j++;
            
            String seleccionUrl=CONTROLLER+"/Reservas/Selecciona?codigo="+String.valueOf(guiadespacho.getCodigo()) ;
            
           // String seleccionUrlpta=CONTROLLER+"/Reservas/Seleccionapta?codigo="+String.valueOf(reservas.getCodigo()) ;
          
         sino="NO";
        
             if (guiadespacho.getEntregadosino()==1 )
                sino="SI";
                quiene=guiadespacho.getQuienentrega();
                if (quiene==null)
                    quiene="";    

%>    
    
    <tr bgcolor="#CCCCCC">
      <td><A HREF="<%=seleccionUrl%>"> <%=guiadespacho.getNumero()%></td>
      <td><%=guiadespacho.getFecha()%></td>
      <td><%=guiadespacho.getNombreCliente()%></td>
      <td><%=guiadespacho.getRemitente()%></td>
      <td><%=guiadespacho.getDestinatario()%></td>
      <td><%=guiadespacho.getContiene()%></td>
       <td><%=sino%></td>
       <td><%=quiene%></td>
       <% if (guiadespacho.getEntregadosino()==0  )
        {   %>
       <td></td>   
       <%}
        else        
            {%>
        <td><%=guiadespacho.getFechae()%></td>   
        <%}%>
    </tr>
    
    
<%}
  }
%>    
  </table>
  </td>
</tr>
</table>

</form>
</body>
<%@ include file="/WEB-INF/Banere.jsp"%>  

</html>
<%model.Limpiarlistas();%>
