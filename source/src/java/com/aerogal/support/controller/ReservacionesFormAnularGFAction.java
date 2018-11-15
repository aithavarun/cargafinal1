/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

/**
 *
 * @author nrubio
 */
public class ReservacionesFormAnularGFAction extends Action {

    @Override
    public void run() throws ServletException, IOException {
        model.Limpiarlistas();
        String Pagina = "/Servlets/AnularGuiaFactura.jsp";
        model.setError(null);

        RequestDispatcher rd = application.getRequestDispatcher(Pagina);
        if (rd == null) {
            throw new ServletException("Existe un error en Anular Guias " + Pagina);
        } else {
            rd.forward(request, response);
        }
    }
}
