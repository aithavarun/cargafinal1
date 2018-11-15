<%-- 
    Document   : CierreVentasPos
    Created on : 9/03/2018, 12:27:22 AM
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.text.DecimalFormatSymbols" %>
<%  
DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
simbolos.setDecimalSeparator('.');
DecimalFormat f =new DecimalFormat("0.00",simbolos);%>
<!DOCTYPE html>
<html>
    <%@ include file="/WEB-INF/Banner.jsp"%>  
    <head>
        <title>::: Carga Aerogal :::</title>
        <link href="<%=BASEURL%>/images/Sistema/Level2_Verdana_Forms.css" rel="stylesheet" type="text/css">
        <script src="WEB-INF/jquery-3.2.0.min.js" type="text/javascript"></script>
    </head>
    <script>
function validar(){
    var dia=form1.Dia.value;
    var mes=form1.Mes.value;
    var anio=form1.Anio.value;
    var vcierre=form1.numeroCierre.value;
    var fFecha1 = new Date(anio, mes - 1, dia);
    var fechaHoy = new Date();

        if(fFecha1>fechaHoy){
             alert( "Fecha ingresada no puede ser mayor que la fecha actual." );
            return false;
        }
        if (dia=="")
        {
            alert( "Debe ingresar el dia." );
            return false;
        } 
        if (mes=="")
        {
            alert( "Debe ingresar el mes." );
            return false;
        }
         if (anio=="")
        {
            alert( "Debe ingresar el Anio." );
            return false;
        } 
        if(vcierre==""){
            alert("Debe ingresar numero de cierre.");
            return false;
        }
}
    </script>  
    <%

        java.util.Date mifecha;
        Calendar inicio = Calendar.getInstance();
        int mes = 0;
        int dia = 0;
        int anio = 0;

        String Dia = request.getParameter("Dia");
        String Mes = request.getParameter("Mes");
        String Anio = request.getParameter("Anio");

        mes = inicio.get(Calendar.MONTH) + 1;
        anio = inicio.get(Calendar.YEAR);
        dia = inicio.get(Calendar.DATE);

        if (Mes != null) {
            mes = Integer.parseInt(Mes);
        }
        if (Anio != null) {
            anio = Integer.parseInt(Anio);
        }
        if (Dia != null) {
            dia = Integer.parseInt(Dia);
        }
        
         String user_estacion = usuario.getSucursal().substring(0, 3);
    %>
    <body bgcolor="#CCCCCC">
        <form name="form1" method="post" action="<%=CONTROLLER%>/Reservaciones/Cierre-" onSubmit="return validar(this)">
            <table border="0" cellpadding="0"  align="center" cellspacing="0" width="780" bgcolor="ffffff">
                <tr>
                    <td>
                        <table width="100%"  border="0">
                            <th colspan="7" bgcolor="#0099FF">
                                <span class="style3" >Cierre de Ventas Diario POS</span>
                            </th>
                            <% String error = model.getError();
                            String color = "FFFFCC";
                            if (error != null) {%>
                             <tr class="error">
                                <th colspan="6" ><%=error%></th>
                            </tr> 
                            <%}%>
                            <tr> 
                                <td><b>Fecha cierre de venta:</b></td>
                                <td>Dia</td>
                                <td><input name= "Dia" id="Dia" type="text"  value="<%=dia%>" size="2" maxlength="2"  onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                            event.returnValue = false;" onKeyUp="validadia(this.form.Dia, this.form.Mes, this.form.Anio);" >
                                </td>
                                <td>Mes</td>
                                <td><input name= "Mes" id="Mes" type="text" value="<%=mes%>" size="2" maxlength="2" onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                            event.returnValue = false;" onKeyUp="validames(this.form.Mes);"> 
                                </td>
                                <td>Anio</td>
                                <td><input name= "Anio" id="Anio" type="text"  value="<%=anio%>" size="4" maxlength="4" onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                            event.returnValue = false;">
                                </td>
                                <td>
                                    <input name=user_estacion value="<%=user_estacion%>" hidden="true" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td align="right"><input name="CalcularCierre" type="submit" id="CalcularCierre" value="Valor del Cierre" ></td>

                            <input name="salir" value="0" 
                                   type="hidden"  >
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <%
                float resultado = model.getResultadoCierre();
                String Observacion="";
                String numeroCierre="";

            %>
<SCRIPT>            
function parasalir()
  {
    
    MantenimientoGuias.salir.value=1;
    
  }
  
</SCRIPT>            
            <table width="100%"  border="0">
                <th colspan="7" bgcolor="#0099FF">
                    <span class="style3" >Resultado</span>
                </th>
                <tr>
                    <td>
                        <b>Resultado del cierre:</b>
                    </td>
                    <td>
                        <input name="resultado" value="<%=resultado%>" disable=true READONLY>
                    </td>
                </tr>
                <tr>
                    <td><b>Numero de Cierre</b></td>
                    <td><input name="numeroCierre" value="<%=numeroCierre%>" type="text" maxlength="6" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" ></td>
                </tr>
                <tr>
                    <td><b>Observaciones</b></td>
                    <td><textarea name="Observacion" type="text" maxlength="100" cols="51" rows="2"><%=Observacion.trim()%></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input  type="submit"  NAME="Salir" value="Salir" onclick="parasalir();"><input TYPE="submit"    NAME="Guardar" value="Guardar" ></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>

        </form>
    </body>
        <%@ include file="/WEB-INF/Banere.jsp"%> 
</html>