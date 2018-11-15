/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.GregorianCalendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

/**
 *
 * @author wcadena
 */
public class ReservacionesManifiestoExtAction extends Action {
    public ReservacionesManifiestoExtAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        try
        {
            String nusuario = "admin";
            GregorianCalendar miCal = new GregorianCalendar();
            int dia = miCal.get(5);
            int mes = miCal.get(2);
            int anio = miCal.get(1);
            model.BuscarRepventasC("", nusuario, dia, mes, anio, "");
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar Reporte: " + e.getMessage());
        }
        String Idioma = "/Servlets/RepVentasCargaExt.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en proveedores " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
