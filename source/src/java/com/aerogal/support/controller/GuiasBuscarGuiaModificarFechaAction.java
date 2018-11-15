/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

/**
 *
 * @author nrubio
 */
public class GuiasBuscarGuiaModificarFechaAction extends Action {

	@Override
	public void run() throws ServletException, IOException {
		String pagina = "";

		String buscarGuia = request.getParameter("buscarGuia");
		String modFechaGuias = request.getParameter("modFechaGuias");

		model.Limpiarlistas();
		model.setError(null);

		if (buscarGuia != null) {
			// obteniendo los parametros del request
			String serie = request.getParameter("serie");
			String fechaInicio = request.getParameter("fechaInicio");
			String fechaFin = request.getParameter("fechaFin");
			String tipoDoc = request.getParameter("tipoDoc");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				model.BuscarGuiaxSerie(serie, format.parse(fechaInicio).getTime(), format.parse(fechaFin).getTime(), tipoDoc);
				//model.setAccion("1");
				pagina = "/Servlets/CambiarFechaGuiaFactura.jsp";

			} catch (SQLException e) {
				throw new ServletException("No es posible encontrar Guia: " + e.getMessage(), e);
			} catch (ParseException pe) {
				throw new ServletException("Error con parseo de fecha: " + pe.getMessage(), pe);
			}
			
		} else if (modFechaGuias != null) {
			String[] codGuias = request.getParameterValues("codModFecha");
//			
			try {
				model.BuscarGuiaxCodigo(codGuias);
				
				pagina = "/Servlets/ValidarCambioFecha.jsp";
			} catch (SQLException ex) {
				throw new ServletException("No es posible encontrar Guia: " + ex.getMessage(), ex);
			}

		}
		
		RequestDispatcher rd = application.getRequestDispatcher(pagina);
		if (rd == null) {
			throw new ServletException("No Existe Vuelos para esa Fecha " + pagina);
		} else {
			rd.forward(request, response);
		}



	}
}
