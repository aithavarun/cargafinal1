// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:00:29
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesClientesCargaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesClientesCargaAction extends Action
{

    public ReservacionesClientesCargaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        try
        {
            model.Limpiarlistas();
            model.BuscarClientesCarga("*");
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar Clientes: " + e.getMessage());
        }
        String Idioma = "/Servlets/ClientesCarga.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en clientes carga" + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
