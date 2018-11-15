// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:01:50
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesReporteVentasFAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import java.util.GregorianCalendar;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesReporteVentasFAction extends Action
{

    public ReservacionesReporteVentasFAction()
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
        String Idioma = "/Servlets/RepVentasCargafe.jsp";
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
