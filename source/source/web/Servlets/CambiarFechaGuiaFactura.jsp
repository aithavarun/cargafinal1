<%-- 
    Document   : CambiarFechaGuiaFactura
    Created on : Nov 12, 2014, 3:26:52 PM
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


	<script type="text/javascript" >
		ahora       = new Date();
		ahoraDay    = ahora.getDate();
		ahoraMonth  = ahora.getMonth()+1;
		ahoraYear   = ahora.getYear();
			
		function envia(form ){
			if (form.Dia.value>31) 
			{
				alert("dia incorrecto");
				return false;
			} else
				return true;
		}

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

		function validames(campo) {
			if (campo.value > 12) campo.value = 12;
		}

		function validadia(campo,mes, anyo) {
			var dias;
			dias=cuantosDias(mes,anyo);
			if (campo.value > dias)  campo.value = cuantosDias(mes,anyo);
		}
	</script>

    <%@ include file="/WEB-INF/Banner.jsp"%>
    <body><!-- name="MantenimientoUsuarios" -->
		<form method="post" action="<%=CONTROLLER%>/Guias/BuscarGuiaModificarFecha"  name="BuscarGuiaAnular">
			<table width="100%" align="center">
				<tr>
					<td valign="top">
						<table align="CENTER">
							<th>Cambiar fecha de Gu&iacute;a o Factura</th>
						</table>
						<table width="50%" align="CENTER">
							<tr>
								<td>Num. Serie :</td>
								<td><input name="serie" type="text" size="10" maxlength="30"></td>
							</tr>

							<tr>
								<td>Fecha Inicio</td>
								<td><input type="text" maxlength="10" size="15"  id="fechaInicio" name="fechaInicio"></td>
							</tr>
							<tr>
								<td>Fecha Fin</td>
								<td><input type="text" maxlength="10" size="15"  id="fechaFin" name="fechaFin"></td>
							</tr>
							<tr>
								<td>Tipo documento</td>
								<td><input type="radio" name="tipoDoc" value="G">Guia&Tab;
									<input type="radio" name="tipoDoc" value="F">Factura</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center"><input type="submit" value="Buscar Guia / Factura" name="buscarGuia"></td>
				</tr>
			</table>
		</form>

		<form method="post" action="<%=CONTROLLER%>/Guias/BuscarGuiaModificarFecha"  name="MantenimientoUsuarios">
			<table>
				<tr>
					<th>Modificar?</th>
					<th>Num. Guia</th>
					<th>Fecha</th>
					<th width="20%">Nombre del Cliente</th>
					<th>Origen</th>
					<th>Destino</th>
					<th>Peso</th>
					<th>Flete</th>
					<th>Domicilio</th>
					<th>Valorizacion</th>
					<th>Seguro</th>
					<th>I.V.A.</th>
					<th>Otros</th>
					<th>Total</th>
					<th>Efectivo</th>
					<th>Credito</th>
					<th>Cuenta Credito Observaciones</th>
					<th>Usuario</th>
				</tr>

				<%
				// Si vengo de anular una guia, verifico que traiga el mensaje de exito.
				// si no lo trae, es primera vez q entro
					if (request.getAttribute("resultado") != null) {
						out.println(request.getAttribute("resultado"));
					} else {

						List guias = model.getGuiasLista();

						if (guias != null) {


							if (guias.size() == 0) {
				%>
				No hay guias que cumplan con los criterios de busqueda
				<%			} else {
					DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
					simbolos.setDecimalSeparator('.');
					DecimalFormat f = new DecimalFormat("0.00", simbolos);

					Iterator it = guias.iterator();

					Repventasc guia = null;

					while (it.hasNext()) {
						guia = (Repventasc) it.next();
				%>
				<tr align="right">
					<!--<td><input type="radio" name="codAnular" value="<%=guia.getCodigo()%>"</td>-->
					<td><input type="checkbox" name="codModFecha" value="<%=guia.getCodigo()%>"</td>
					<td><%=guia.getNumero()%></td>
					<td><%=guia.getFecha()%></td>
					<td WIDTH="20%" align="left"><%=guia.getCliente()%></td>
					<td><%=guia.getOrigen()%></td>
					<td><%=guia.getDestino()%></td>
					<td><%=f.format(guia.getPeso())%></td>
					<td><%=f.format(guia.getFlete())%></td>
					<td><%=f.format(guia.getEdomicilio())%></td>
					<td><%=f.format(guia.getServicioa())%></td>
					<td><%=f.format(guia.getSeguro())%></td>
					<td><%=f.format(guia.getIva())%></td>
					<td><%=f.format(guia.getOtros())%></td>
					<td><%=f.format(guia.getTotal())%></td>
					<td><%=f.format(guia.getEfectivo())%></td>
					<td><%=f.format(guia.getCredito())%></td>
					<td><%=guia.getObservacion()%></td>
					<td><%=guia.getUsuario()%></td>
				</tr> 
				<%
					}
				%>
				<tr align="center">
					<td colspan="18"><input type="submit" value="Modificar Fechas" name="modFechaGuias"/></td>
				</tr>
				<%
							}

						}
					}%>

			</table>
		</form>
	</body>
	<%@ include file="/WEB-INF/Banere.jsp"%>
</html>
