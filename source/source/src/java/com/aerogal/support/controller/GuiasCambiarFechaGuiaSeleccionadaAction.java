/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

/**
 *
 * @author nrubio
 */
public class GuiasCambiarFechaGuiaSeleccionadaAction extends Action {

	@Override
	public void run() throws ServletException, IOException {
		String[] codModificar = request.getParameterValues("codModFecha");
		long[] nuevasFechas = new long[codModificar.length];
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String pagina = null;
		
		try {
			// formando el array de nuevas fechas acorde al orden en el que vienen los codigos de guia
			for (int i = 0; i < codModificar.length; i++) {
				nuevasFechas[i] = format.parse(request.getParameter(codModificar[i] + "_nuevaFecha")).getTime();
			}
		
			model.modificarFechasGuias(codModificar, nuevasFechas);
			request.setAttribute("resultado", "Facturas modificadas con exito");
			
			pagina = "/Servlets/CambiarFechaGuiaFactura.jsp";

		} catch (SQLException e) {
			throw new ServletException("Hubo un problema al anular la guía: " + e.getMessage(), e);
		} catch (ParseException pe) {
			throw new ServletException("Hubo un problema de parseo: " + pe.getMessage(), pe);
		}
		
		model.Limpiarlistas();
		
		RequestDispatcher rd = application.getRequestDispatcher(pagina);
		if (rd == null) {
			throw new ServletException("Problemas para redirigir al sitio: " + pagina);
		} else {
			rd.forward(request, response);
		}

	}
}
