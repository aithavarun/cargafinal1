// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:00:15
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesAvionesAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesAvionesAction extends Action
{

    public ReservacionesAvionesAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        try
        {
            model.BuscarAviones();
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar Aviones: " + e.getMessage());
        }
        String Idioma = "/Servlets/Aviones.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en aviones " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
