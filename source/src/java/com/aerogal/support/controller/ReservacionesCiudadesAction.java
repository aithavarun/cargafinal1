// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:00:21
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesCiudadesAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesCiudadesAction extends Action
{

    public ReservacionesCiudadesAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        try
        {
            model.Limpiarlistas();
            model.BuscarCiudades();
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar Ciudades: " + e.getMessage());
        }
        String Idioma = "/Servlets/Ciudades.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en ciudades " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
