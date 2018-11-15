<%-- 
    Document   : ValidarAnulacion
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
		<form method="post" action="<%=CONTROLLER%>/Guias/AnularGuiaSeleccionada"  name="AnularGuiaSeleccionada">
			
			<table align="center" bgcolor="#ffffff">
				<tr align="center">
					<td colspan="17"><span style="color:red;font-weight: bold;">¿Est&aacute; seguro que desea anular las siguientes gu&iacute;as?</span></td>
				</tr>
				<tr>
					<th>Num. Guia</th>
					<th>Fecha</th>
					<th>Estado</th>
					<th>Cliente</th>
					<th>Origen</th>
					<th>Destino</th>
					<th>Peso</th>
					<th>Flete</th>
					<th>Domicilio</th>
					<th>Servicio Adicional</th>
					<th>Seguro</th>
					<th>I.V.A.</th>
					<th>Otros</th>
					<th>Total</th>
					<th>Efectivo</th>
					<th>Credito</th>
					<th>Observaciones</th>
					<th>Usuario</th>
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
					<Td><%=guiaAnular.getEstado()%></Td>
					<Td><%=guiaAnular.getCliente()%></Td>
					<Td><%=guiaAnular.getOrigen()%></Td>
					<Td><%=guiaAnular.getDestino()%></Td>
					<Td><%=f.format(guiaAnular.getPeso())%></Td>
					<Td><%=f.format(guiaAnular.getFlete())%></Td>
					<Td><%=f.format(guiaAnular.getEdomicilio())%></Td>
					<Td><%=f.format(guiaAnular.getServicioa())%></Td>
					<Td><%=f.format(guiaAnular.getSeguro())%></Td>
					<Td><%=f.format(guiaAnular.getIva())%></Td>
					<Td><%=f.format(guiaAnular.getOtros())%></Td>
					<Td><%=f.format(guiaAnular.getTotal())%></Td>
					<Td><%=f.format(guiaAnular.getEfectivo())%></Td>
					<Td><%=f.format(guiaAnular.getCredito())%></Td>
					<Td><%=guiaAnular.getObservacion()%></Td>
					<Td><%=guiaAnular.getUsuario()%></Td>
				</TR>
				<input type="hidden" value="<%=guiaAnular.getCodigo()%>" name="codAnular"/>
				<%
					}
				}
			%>
				<tr>
					<td align="center" colspan="17">
						<input type="submit" value="Anular Guia / Factura" name="anularGuia" />&nbsp;
						<input type="button" value="Cancelar" name="cancelar" onclick="window.history.back()" />
					</td>
				</tr>
			</table>
			
		</form>

    </body>
	<%@ include file="/WEB-INF/Banere.jsp"%>
</html>
