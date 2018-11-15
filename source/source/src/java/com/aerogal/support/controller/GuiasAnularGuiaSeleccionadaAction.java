/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

/**
 *
 * @author nrubio
 */
public class GuiasAnularGuiaSeleccionadaAction extends Action {

	@Override
	public void run() throws ServletException, IOException {
            //System.out.println("oihoihoih/**/");
		String[] codAnular = request.getParameterValues("codAnular");
		
//		long codGuia = Long.parseLong(request.getParameter("codAnular"));
		String pagina = null;

		try {
			model.AnularGuias(codAnular);
			request.setAttribute("resultado", "Facturas anuladas con exito");
			
			pagina = "/Servlets/AnularGuiaFactura.jsp";

		} catch (SQLException e) {
			throw new ServletException("Hubo un problema al anular la guía: " + e.getMessage(), e);
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
