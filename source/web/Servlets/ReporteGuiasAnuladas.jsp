<%-- 
    Document   : ReporteGuiasAnuladas
    Created on : 13/12/2017, 09:18:36 AM
    Author     : capalacios
--%>
.<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%//@ page import="java.text.DecimalFormat,java.text.DecimalFormat,java.text.SimpleDateFormat" %>
<%@ page import="java.math.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import ="java.text.DecimalFormatSymbols" %>
<script type="text/javascript">
var tableToExcel = (function() {
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name, filename) {
    if (!table.nodeType) table = document.getElementById(table)
    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
    
        document.getElementById("dlink").href = uri + base64(format(template, ctx));
        document.getElementById("dlink").download = filename;
        document.getElementById("dlink").click();
  }
})();
</script>
<script>
function validar(){
    var diaini=form1.Dia.value;
    var mesini=form1.Mes.value;
    var anioini=form1.Anio.value;
    var diafin=form1.Dia2.value;
    var mesfin=form1.Mes2.value;
    var aniofin=form1.Anio2.value;
    var flagValidate= true;
    var medida=90;
    var fFecha1 = Date.UTC(anioini,mesini-1,diaini); 
    var fFecha2 = Date.UTC(aniofin,mesfin-1,diafin); 
    var dif = fFecha2 - fFecha1;
    var cdias = Math.floor(dif / (1000 * 60 * 60 * 24));
    //alert("cdias:"+cdias+"> medida: "+ medida );
    if( cdias > medida ){
        flagValidate = false;
        alert("Obligatorio Rango no debe ser mayor que " + medida + " dias." );
    }
    return  flagValidate;    
}
</script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@ include file="/WEB-INF/Banner.jsp"%>  
    <%DecimalFormat f =new DecimalFormat("0.00");%>
    <head>
        <title>::: Carga Aerogal :::</title>
        <link href="<%=BASEURL%>/images/Sistema/Level2_Verdana_Forms.css" rel="stylesheet" type="text/css">
        <script src="WEB-INF/jquery-3.2.0.min.js" type="text/javascript"></script>
    </head>
    <%

        java.util.Date mifecha;
        Calendar inicio = Calendar.getInstance();
        int mesini = 0;
        int diaini = 0;
        int anioini = 0;

        int mesfin = 0;
        int diafin = 0;
        int aniofin = 0;

        mifecha = inicio.getTime();
        inicio.setTime(mifecha);
        //int anio=inicio.get(Calendar.YEAR);
        String Dia = request.getParameter("Dia");
        String Mes = request.getParameter("Mes");
        String Anio = request.getParameter("Anio");
        String Diah = request.getParameter("Diah");
        String Mesh = request.getParameter("Mesh");
        String Anioh = request.getParameter("Anioh");
        String Misucursal = request.getParameter("Sucursal");

        mesini = inicio.get(Calendar.MONTH) + 1;
        anioini = inicio.get(Calendar.YEAR);
        diaini = inicio.get(Calendar.DATE);

        mesfin = inicio.get(Calendar.MONTH) + 1;
        aniofin = inicio.get(Calendar.YEAR);
        diafin = inicio.get(Calendar.DATE);

        if (Mes != null) {
            mesini = Integer.parseInt(Mes);
        }
        if (Anio != null) {
            anioini = Integer.parseInt(Anio);
        }
        if (Dia != null) {
            diaini = Integer.parseInt(Dia);
        }

        if (Mesh != null) {
            mesfin = Integer.parseInt(Mesh);
        }
        if (Anioh != null) {
            aniofin = Integer.parseInt(Anioh);
        }
        if (Diah != null) {
            diafin = Integer.parseInt(Diah);
        }
    %>    
    <body bgcolor="#CCCCCC">
        <form name="form1" method="post" action="<%=CONTROLLER%>/Reservaciones/ReporteGuiasAnuladas-" onSubmit="return validar(this)">
            <table border="0" cellpadding="0"  align="center" cellspacing="0" width="780" bgcolor="ffffff">
                <tr>
                    <td>
                        <table width="100%"  border="0">
                            <th colspan="7" bgcolor="#0099FF">
                                <span class="style3" >Guias Anuladas</span>
                            </th>
                            <tr> 
                                <td><b>Fecha Desde:</b></td>
                                <td>Dia</td>
                                <td><input name= "Dia" id="Dia" type="text"  value="<%=diaini%>" size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                            event.returnValue = false;" onKeyUp="validadia(this.form.Dia, this.form.Mes, this.form.Anio);" >
                                </td>
                                <td>Mes</td>
                                <td><input name= "Mes" id="Mes" type="text" value="<%=mesini%>" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                            event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
                                </td>
                                <td>Anio</td>
                                <td><input name= "Anio" id="Anio" type="text"  value="<%=anioini%>" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                            event.returnValue = false;">
                                </td>
                            </tr>
                            <tr> 
                                <td><b>Fecha Hasta:</b></td>
                                <td>Dia</td>
                                <td><input name= "Dia2" id="Dia2" type="text"  value="<%=diafin%>" size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                            event.returnValue = false;" onKeyUp="validadia(this.form.Dia, this.form.Mes, this.form.Anio);" >
                                </td>
                                <td>Mes</td>
                                <td><input name= "Mes2" id="Mes2" type="text" value="<%=mesfin%>" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                            event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
                                </td>
                                <td>Anio</td>
                                <td><input name= "Anio2" id="Anio2" type="text"  value="<%=aniofin%>" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                            event.returnValue = false;">
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td align="right"><input name="Buscar" type="submit" id="Buscar" value="Buscar" ></td>

                            <input name="salir" value="0" 
                                   type="hidden"  >
                            </tr>
                        </table>
                        <table width="100%" border="0" id="testTable">
                            <tr bordercolor="#FFFFFF">
                                <th colspan="17" bgcolor="#0099FF"><span class="style3">Resultados</span></th>
                            </tr>
                            <tr bgcolor="#FFFFCC">
                                <th>Numero</th>
                                <th>Fecha</th>
                                <th>Piezas</th>
                                <th>Peso</th>
                                <th>Contiene</th>
                                <th>Remitente</th>
                                <th>Destinatario</th>
                                <th>Credito</th>
                                <th>Sucursal</th>
                                <th>Usuario</th>
                                <th>Flete</th>
                                <th>Seguro</th>
                                <th>Otros</th>
                                <th>Iniva</th>
                                <th>Total</th>
                                <th>Origen</th>
                                <th>Destino</th>
                            </tr>
                            
<%List lista2 = model.getGuiasAnuladas();
 if  (lista2 != null)  {
      Iterator itr = lista2.iterator();
      while (itr.hasNext()) {
          GuiasAnuladas guiaAnulada=(GuiasAnuladas) itr.next();
%>
<tr bgcolor="#CCCCCC">
    <td><%=guiaAnulada.getNumero()%></td>
    <td><%=guiaAnulada.getFecha()%></td>
    <td><%=guiaAnulada.getPiezas()%></td>
    <td><%=guiaAnulada.getPeso()%></td>
    <td><%=guiaAnulada.getContiene()%></td>
    <td><%=guiaAnulada.getRemitente()%></td>
    <td><%=guiaAnulada.getDestinatario()%></td>
    <td><%=guiaAnulada.getCredito()%></td>
    <td><%=guiaAnulada.getSucursal()%></td>
    <td><%=guiaAnulada.getUsuario()%></td>
    <td><%=guiaAnulada.getFlete()%></td>
    <td><%=guiaAnulada.getSeguro()%></td>
    <td><%=guiaAnulada.getOtros()%></td>
    <td><%=guiaAnulada.getIva()%></td>
    <td><%=guiaAnulada.getTotal()%></td>
    <td><%=guiaAnulada.getOrigen()%></td>
    <td><%=guiaAnulada.getDestino()%></td>
</tr>
<%}  
 }        
%>                            
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a id="dlink"  style="display:none;"></a>
                        <input type="button" onclick="tableToExcel('testTable','ReporteGuiasAnuladas', 'ReporteGuiasAnuldas.xls')" value="Export to Excel">
                    </td>
                </tr>
            </table>                            
        </form>
    </body>  
    <%@ include file="/WEB-INF/Banere.jsp"%>      
</html>
<%model.Limpiarlistas();%>