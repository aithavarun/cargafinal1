// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:01:38
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesReporteGuiasAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesReporteGuiasAction extends Action
{

    public ReservacionesReporteGuiasAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        try
        {
            model.Limpiarlistas();
            model.Guiaslista(0, 0, 0);
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar Guias : " + e.getMessage());
        }
        String Idioma = "/Servlets/ReporteGuias.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en guias carga" + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
