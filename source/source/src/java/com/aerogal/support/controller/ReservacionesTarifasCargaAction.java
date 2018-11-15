// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:02:00
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesTarifasCargaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesTarifasCargaAction extends Action
{

    public ReservacionesTarifasCargaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        try
        {
            model.Limpiarlistas();
            model.BuscarTarifasCarga();
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar Tarifas de Carga: " + e.getMessage());
        }
        String Idioma = "/Servlets/TarifasCarga.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en tarifas " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
