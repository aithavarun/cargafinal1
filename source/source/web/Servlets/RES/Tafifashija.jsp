<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>

<html>
<head>
<title>::: Reservaciones Aerogal ::: </title>
<link href="<%=BASEURL%>/images/Sistema/Level2_Verdana_Forms.css" rel="stylesheet" type="text/css">
</head>
<%Usuarios usuario=model.getUsuarios();%>
<body>


<table width="100%" align="center">
<form method="post" action="<%=CONTROLLER%>/Tarifas/Nuevo"  name="MantenimientoTarifas">.
 
<tr>
<td valign="top">
<table width="90%" align="CENTER">
<%DecimalFormat f =new DecimalFormat("###,##0.00");%>
<tr>
<th>Base</th>
<th>Origen</th>
<th>Destino</th>
<th>Tipo</th>
<th>Clase</th>
<th>Restricciones</th>
<th>Validez</th>
<th>Tarifa</th>
<th>Iva</th>
<th>Seguro</th>
<th>Tasa</th>

</tr>
<%
 List list = model.getTarifas();
 int i=0;
 int j=1;
 String color="#efefef";
 float iva=0;
 float valor=0;
 float seguro=0;
 float tasa=0;
 float qi=0;
 float ivai=0;
 float valori=0;
 float seguroi=0;
 float tasai=0;
 float q=0;
 
 float porcentajeiva=12;
 String Origen="";
 String Destino="";
 String Rnb=request.getParameter("Cierra");
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          Tarifas tarifa=(Tarifas) it.next();
          
          
          if (tarifa.getTipo().trim().equals("INF"))
          {
              ivai+=tarifa.getIva();
              valori+=tarifa.getValor();
              qi+=tarifa.getCola();
              tasai+=tarifa.getTasa();
              seguroi+=tarifa.getSeguro();
              j++;
              if (j>1)
                  {
                        if (tarifa.getSegurovias()==1)
                            tarifa.setSeguro(0);
                        if (tarifa.getTasavias()==1)
                            tarifa.setTasa(0);
                  }
                  else if (i==1)
                      Origen=tarifa.getOrigen();

                  Destino=tarifa.getDestino();
          }
          else
          {
              i++;
              iva+=tarifa.getIva();
              valor+=tarifa.getValor();
              q+=tarifa.getCola();
              tasa+=tarifa.getTasa();
              seguro+=tarifa.getSeguro();
              if (i>1)
                  {
                        if (tarifa.getSegurovias()==1)
                            tarifa.setSeguro(0);
                        if (tarifa.getTasavias()==1)
                            tarifa.setTasa(0);
                  }
                  else if (i==1)
                      Origen=tarifa.getOrigen();

                  Destino=tarifa.getDestino();
          }
          %>
          
  <tr bgcolor="<%=color%>" >
 <TD>
        <%=tarifa.getBase()%>
       </td>
        
       <td>
       
             <%=tarifa.getOrigen()%>
       
       </td>
       <td>
       <%=tarifa.getDestino()%>
       </td>
       <td>
       <%=tarifa.getTipo()%>
       </td>
       <td>
       <%=tarifa.getClase()%>
       </td>
       <td>
       <%=tarifa.getRestriccionesN()%>
       </td>
       
       <tD>
       <%=tarifa.getValidez()%>
       </td>
   <td>
       <%=f.format(tarifa.getValor())%>
       
   </td>
       <td>
        <%=f.format(tarifa.getIva())%>
       </td>
       <td>
       <%=f.format(tarifa.getSeguro())%>
       </td>
       <td>
       <%=f.format(tarifa.getTasa())%>
       </td>
  </tr>    
 <%}}%>

</table>
</td>
</tr>
</form>
</table>
<%
int oneway=1;
porcentajeiva=12;        
if (Origen.equals(Destino))
    oneway=2;
 if (usuario.getAcceso()==1)
 {
     if (oneway==2)
         porcentajeiva=8;
     else
         porcentajeiva=16;
 }

porcentajeiva=porcentajeiva/100;
iva=(valor+q)*porcentajeiva;
ivai=(valori+qi)*porcentajeiva;
if (Rnb==null)
{
%>

<SCRIPT language="JavaScript 1.2" type="text/javascript">
var iva=eval("window.opener.MantenimientoReservas.iva");
var valor=eval("window.opener.MantenimientoReservas.valor");
var q=eval("window.opener.MantenimientoReservas.q");
var seguro=eval("window.opener.MantenimientoReservas.seguro");
var tasa=eval("window.opener.MantenimientoReservas.tasa");
var INF=eval("window.opener.MantenimientoReservas.INF");
iva.value=<%=f.format(iva)%>;
valor.value=<%=f.format(valor)%>;
q.value=<%=f.format(q)%>;
seguro.value=<%=f.format(seguro)%>;
tasa.value=<%=f.format(tasa)%>;
var que=INF.value;
var ivai=eval("window.opener.MantenimientoReservas.ivai");
var valori=eval("window.opener.MantenimientoReservas.valori");
var qi=eval("window.opener.MantenimientoReservas.qi");
var seguroi=eval("window.opener.MantenimientoReservas.seguroi");
var tasai=eval("window.opener.MantenimientoReservas.tasai");
if (que !="")
 {
   
    
    ivai.value=<%=f.format(ivai)%>;
    valori.value=<%=f.format(valori)%>;
    qi.value=<%=f.format(qi)%>;
    seguroi.value=<%=f.format(seguroi)%>;
    tasai.value=<%=f.format(tasai)%>;
    window.opener.document.getElementById("apagar").innerHTML=<%=f.format(iva+valor+q+seguro+tasa+ivai+valori+qi+seguroi+tasai)%>;
 }
else
{ 
    ivai.value=0;
    valori.value=0;
    qi.value=0;
    seguroi.value=0;
    tasai.value=0;

    window.opener.document.getElementById("apagar").innerHTML=<%=f.format(iva+valor+q+seguro+tasa)%>;
}    

    window.opener.document.getElementById("saldo").innerHTML=parseFloat(window.opener.document.getElementById("apagar").innerHTML)-parseFloat(window.opener.document.getElementById("pagado").innerHTML);
    window.opener.document.getElementById("saldo").innerHTML=Math.round(parseFloat(window.opener.document.getElementById("saldo").innerHTML) * 100) / 100 ;
    
this.close();
</script>
<%}%>


</body>
</html>


