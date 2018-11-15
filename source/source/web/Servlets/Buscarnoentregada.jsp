<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%//@ page import="java.text.DecimalFormat,java.text.DecimalFormat,java.text.SimpleDateFormat" %>
<%@ page import="java.math.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import ="java.text.DecimalFormatSymbols" %>



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

java.util.Date mifecha;
Calendar inicio = Calendar.getInstance();
int mes1=0;
int dia1=0;
int anio1=0;

int mesh=0;
int diah=0;
int anioh=0;

        mifecha=inicio.getTime();
        inicio.setTime(mifecha);
        //int anio=inicio.get(Calendar.YEAR);
        String Dia=request.getParameter("Dia");
        String Mes=request.getParameter("Mes");
        String Anio=request.getParameter("Anio");
        String Diah=request.getParameter("Diah");
        String Mesh=request.getParameter("Mesh");
        String Anioh=request.getParameter("Anioh");
        String Misucursal=request.getParameter("Sucursal");


mes1 =inicio.get(Calendar.MONTH)+1;
anio1=inicio.get(Calendar.YEAR);
dia1=inicio.get(Calendar.DATE);

mesh =inicio.get(Calendar.MONTH)+1;
anioh=inicio.get(Calendar.YEAR);
diah=inicio.get(Calendar.DATE);


if (Mes!=null)
    mes1=Integer.parseInt(Mes) ;
if (Anio!=null)
    anio1=Integer.parseInt(Anio);
if (Dia!=null)
    dia1=Integer.parseInt(Dia);

if (Mesh!=null)
    mesh=Integer.parseInt(Mesh) ;
if (Anioh!=null)
    anioh=Integer.parseInt(Anioh);
if (Diah!=null)
    diah=Integer.parseInt(Diah);

%>

<body bgcolor="#CCCCCC"  >
<form name="form1" method="post" action="<%=CONTROLLER%>/Reservaciones/Despachadono-" onSubmit="return validar(this);" >
<table border="0" cellpadding="0"  align="center" cellspacing="0" width="780" bgcolor="ffffff">
<tr>
<td>
  <table width="100%"  border="0">
  <td><img src="<%=BASEURL%>//images/logo.gif" > </td>
  <td><span class="style1">
</span></td>
</table>
</td>
</tr>
<tr>
<td>
  <table width="100%"  border="0">
      <th colspan="4" bgcolor="#0099FF">
    <span class="style3" >    CARGA NO ENTREGADA
    </span>
    </th>
    <tr> 
    <td><b>Fecha Desde:</b></td>
   <td>Dia</td>
   <td><input name= "Dia" id="Dia" type="text"  value="<%=dia1%>" size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
   </td>
   <td>Mes</td>
  <td><input name= "Mes" id="Mes" type="text" value="<%=mes1%>" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
   </td>
   <td>Anio</td>
   <td><input name= "Anio" id="Anio" type="text"  value="<%=anio1%>" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
   </td>
   </tr>
    <tr> 
    <td><b>Fecha Hasta:</b></td>
   <td>Dia</td>
   <td><input name= "Diah" id="Diah" type="text"  value="<%=diah%>" size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validadia(this.form.Dia,this.form.Mes,this.form.Anio);" >
   </td>
   <td>Mes</td>
  <td><input name= "Mesh" id="Mesh" type="text" value="<%=mesh%>" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
   </td>
   <td>Anio</td>
   <td><input name= "Anioh" id="Anioh" type="text"  value="<%=anioh%>" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;">
   </td>
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


   <tr>
    <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right"><input name="Buscar" type="submit" id="Buscar" value="Buscar"  ></td>
      
      <input name="salir" value="0" 
        type="hidden"  >
    </tr>
   </table>  
   
  
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
      <td><%=guiadespacho.getNumero()%></td>
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


</form>
</body>
<script language="JavaScript" type="text/javascript">


  form1.Sucursal.options.value="<%=Misucursal%>"
  
  
</script>

<%@ include file="/WEB-INF/Banere.jsp"%>  

</html>
<%model.Limpiarlistas();%>
