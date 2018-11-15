<%-- 
    Document   : ValidarCambioFecha
    Created on : Nov 17, 2014, 9:20:34 AM
    Author     : nrubio
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@ page session="true" %>
<%@ page errorPage= "/WEB-INF/ErrorPage.jsp" %>
<%@ page import="com.aerogal.support.model.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<html>
    <%@ include file="/WEB-INF/Banner.jsp"%>
    <body>
		<form method="post" action="<%=CONTROLLER%>/Guias/CambiarFechaGuiaSeleccionada"  name="AnularGuiaSeleccionada">
			
			<table align="center" bgcolor="#ffffff">
				<tr align="center">
					<td colspan="17">
						<span style="color:red;font-weight: bold;">
							Coloque la nueva fecha en el campo "Nueva Fecha"<br />
							Formato de fecha: YYYY-MM-DD
						</span>
					</td>
				</tr>
				<tr>
					<th>Num. Guia</th>
					<th>Fecha</th>
					<th>Cliente</th>
					<th>Origen</th>
					<th>Destino</th>
					<th>Peso</th>
					<th>Total</th>
					<th>Efectivo</th>
					<th>Credito</th>
					<th>Observaciones</th>
					<th>Usuario</th>
					<th>Nueva Fecha<br />(YYYY-MM-DD)</th>
				</tr>
				
				<%
				List guia = model.getGuiasLista();

				if (guia != null) {
					
					Iterator it = guia.iterator();
					DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
					simbolos.setDecimalSeparator('.');
					DecimalFormat f = new DecimalFormat("0.00", simbolos);

					Repventasc guiaAnular = null;

					while(it.hasNext()) {
						guiaAnular = (Repventasc) it.next();

			%>
				<TR>
					<Td><%=guiaAnular.getNumero()%></Td>
					<Td><%=guiaAnular.getFecha()%></Td>
					<Td><%=guiaAnular.getCliente()%></Td>
					<Td><%=guiaAnular.getOrigen()%></Td>
					<Td><%=guiaAnular.getDestino()%></Td>
					<Td><%=f.format(guiaAnular.getPeso())%></Td>
					<Td><%=f.format(guiaAnular.getTotal())%></Td>
					<Td><%=f.format(guiaAnular.getEfectivo())%></Td>
					<Td><%=f.format(guiaAnular.getCredito())%></Td>
					<Td><%=guiaAnular.getObservacion()%></Td>
					<Td><%=guiaAnular.getUsuario()%></Td>
					<Td><input type="text" name="<%= guiaAnular.getCodigo() %>_nuevaFecha" maxlength="10"/></Td>
				</TR>
				<input type="hidden" value="<%=guiaAnular.getCodigo()%>" name="codModFecha"/>
				<%
					}
				}
			%>
				<tr>
					<td align="center" colspan="17">
						<input type="submit" value="Cambiar Fechas" name="modFechaGuia" />&nbsp;
						<input type="button" value="Cancelar" name="cancelar" onclick="window.history.back()" />
					</td>
				</tr>
			</table>
			
		</form>

    </body>
	<%@ include file="/WEB-INF/Banere.jsp"%>
</html>
