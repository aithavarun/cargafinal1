<%-- 
    Document   : DetFactdtc
    Created on : Mar 16, 2018, 12:30:18 AM
    Author     : Cesar
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
<!DOCTYPE html>
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
                            var diaini = form1.Dia.value;
                            var mesini = form1.Mes.value;
                            var anioini = form1.Anio.value;
                            var diafin = form1.Dia2.value;
                            var mesfin = form1.Mes2.value;
                            var aniofin = form1.Anio2.value;
                            var flagValidate = true;
                            var medida = 7;
                            var fFecha1 = Date.UTC(anioini, mesini - 1, diaini);
                            var fFecha2 = Date.UTC(aniofin, mesfin - 1, diafin);
                            var dif = fFecha2 - fFecha1;
                            var cdias = Math.floor(dif / (1000 * 60 * 60 * 24));
                            //alert("cdias:"+cdias+"> medida: "+ medida );
                            if (cdias > medida){
                            flagValidate = false;
                            alert("Obligatorio Rango no debe ser mayor que " + medida + " dias.");
                            }
                            return  flagValidate;
                            }
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@ include file="/WEB-INF/Banner.jsp"%>  
    <%DecimalFormat f = new DecimalFormat("0.00");%>
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
        String Diah = request.getParameter("Dia2");
        String Mesh = request.getParameter("Mes2");
        String Anioh = request.getParameter("Anio2");
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
        
        String user_estacion = usuario.getSucursal().substring(0, 3);
    %>
    <body bgcolor="#CCCCCC">
        <form name="form1" method="post" action="<%=CONTROLLER%>/Reservaciones/ReporteDetFacTdTc-" onSubmit="return validar(this)">
            <table border="0" cellpadding="0"  align="center" cellspacing="0" width="780" bgcolor="ffffff">
                <tr>
                    <td>
                        <table width="100%"  border="0">
                            <th colspan="7" bgcolor="#0099FF">
                                <span class="style3" >Detalle Facturación TD y TC</span>
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
                                <td>
                                    <input name=user_estacion value="<%=user_estacion%>" hidden="true"/>
                                </td>

                            </tr>
                            <tr>
                                <td><input type="checkbox" name="sinvalprev" value="1">Sin validacion descargas previas<br></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <%
                                    String desde = Anio + Mes + Dia;
                                    String hasta = Anioh + Mesh + Diah;

                                %>
                                <td align="right"><input name="Buscar" type="submit" id="Buscar" value="Descargar" ></td>
                                <!--<td align="right"> <input type="button" onclick="tableToExcel('testTable', 'DETALLE FACTURACION TD Y TC', 'DETALLE FACTURACION TD Y TC.xls')" value="Descargar" ></td>-->

                            <input name="salir" value="0" 
                                   type="hidden"  >
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" id="testTable" style="display: none;">
<!--                <tr bordercolor="#FFFFFF">
                    <th colspan="29" bgcolor="#0099FF"><span class="style3">Resultados</span></th>
                </tr>-->
                <tr bgcolor="#FFFFCC">
                    <th>Line_Type</th>
                    <th>Bath_Source</th>
                    <th>Conversion_Date</th>
                    <th>Conversion_Rate</th>
                    <th>Creation_Date</th>
                    <th>Currency_Code</th>
                    <th>TRX_Type</th>
                    <th>Gl_Date</th>
                    <th>Org_Id</th>
                    <th>Orig_System_Address_Ref</th>
                    <th>Salesrep_num</th>
                    <th>Printing_Option</th>
                    <th>Quantity</th>
                    <th>Set_Of_Books</th>
                    <th>Tax_Code</th>
                    <th>TRX_Date</th>
                    <th>TRX_Number</th>
                    <th>Unit_Selling_Price</th>
                    <th>UOM_Name</th>
                    <th>Description</th>
                    <th>Amount</th>
                    <th>Term_Name</th>
                    <th>Orig_System_Ref</th>
                    <th>Interface_Line_Attrib11</th>
                    <th>Link_To_Line_Attribute1</th>
                    <th>Tax_Rate</th>
                    <th>Conversion_Type</th>
                    <th>Memo_line</th>
                    <th>ENVIA A CLIENTE</th>
                    <th>FACT DIGITALIZADA</th>
                    <th>LLEVA SOPORTE</th>
                    <th>ZERO OCTA</th>
                    <th>TIPO_FACTURACION</th>
                    <th>Tc</th>
                </tr>
                <%List lista2 = model.getlista();
                    if (lista2 != null) {
                        Iterator itr = lista2.iterator();
                        while (itr.hasNext()) {
                            DetFacturacion detFacturacion = (DetFacturacion) itr.next();
                %>                
                <tr bgcolor="#CCCCCC">
                    <td><%=detFacturacion.getLine_Type()%></td>  
                    <td><%=detFacturacion.getBath_Source()%></td> 
                    <td><%=detFacturacion.getConversion_Date()%></td> 
                    <td><%=detFacturacion.getConversion_Rate()%></td> 
                    <td><%=detFacturacion.getCreation_Date()%></td> 
                    <td><%=detFacturacion.getCurrency_Code()%></td> 
                    <td><%=detFacturacion.getTRX_Type()%></td> 
                    <td><%=detFacturacion.getGl_Date()%></td> 
                    <td><%=detFacturacion.getOrg_Id()%></td> 
                    <td><%=detFacturacion.getOrig_System_Address_Ref()%></td> 
                    <td><%=detFacturacion.getSalesrep_num()%></td> 
                    <td><%=detFacturacion.getPrinting_Option()%></td> 
                    <td><%=detFacturacion.getQuantity()%></td> 
                    <td><%=detFacturacion.getSet_Of_Books()%></td> 
                    <td><%=detFacturacion.getTax_Code()%></td> 
                    <td><%=detFacturacion.getTRX_Date()%></td>
                    <td><%=detFacturacion.getTRX_Number()%></td> 
                    <td><%=detFacturacion.getUnit_Selling_Price()%></td> 
                    <td><%=detFacturacion.getUOM_Name()%></td> 
                    <td><%=detFacturacion.getDescription()%></td> 
                    <td><%=detFacturacion.getAmount()%></td> 
                    <td><%=detFacturacion.getTerm_Name()%></td> 
                    <td><%=detFacturacion.getOrig_System_Ref()%></td> 
                    <td><%=detFacturacion.getInterface_Line_Attrib11()%></td> 
                    <td><%=detFacturacion.getLink_To_Line_Attribute1()%></td> 
                    <td><%=detFacturacion.getTax_Rate()%></td> 
                    <td><%=detFacturacion.getConversion_Type()%></td> 
                    <td><%=detFacturacion.getMemo_line()%></td> 
                    <td><%=detFacturacion.getENVIAACIENTE()%></td>
                    <td><%=detFacturacion.getFACTDIGITALIZADA()%></td>
                    <td><%=detFacturacion.getLLEVASOPORTE()%></td>
                    <td><%=detFacturacion.getZEROOCTA()%></td>
                    <td><%=detFacturacion.getTIPO_FACTURACION()%></td>
                    <td><%=detFacturacion.getTc()%></td> 
                </tr>
                <%}
                    }
                %>    
                <a id="dlink"  style="display:none;"></a>            
                <!--<input type="button" onclick="tableToExcel('testTable', 'DETALLE FACTURACION TD Y TC', 'DETALLE FACTURACION TD Y TC ' +<%=Anio%><%=Mes%><%=Dia%> + '-' +<%=Anioh%><%=Mesh%><%=Diah%> + '.xls')" value="Export to Excel">-->
            </table>
            <% if (model.getIsLoadedTabledT() == 1) { %>
            <script>
                tableToExcel('testTable', 'DETALLE FACTURACION TD Y TC', 'DETALLE FACTURACION TD Y TC ' +<%=Anio%><%=Mes%><%=Dia%> + '-' +<%=Anioh%><%=Mesh%><%=Diah%> + '.xls');
            </script>
            <% }%>


        </form>                                          
    </body>
    <%@ include file="/WEB-INF/Banere.jsp"%> 
</html>
