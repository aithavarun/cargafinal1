// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:56:16
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   DescuentoCargaSeleccionaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class DescuentoCargaSeleccionaAction extends Action
{

    public DescuentoCargaSeleccionaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        String codigo = request.getParameter("codigo");
        String parametros = "/Servlets/ModificaDescuentoc.jsp";
        model.Limpiarlistas();
        try
        {
            model.BuscarDescuentoc(Integer.parseInt(codigo));
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar descuentos: " + e.getMessage());
        }
        String next = parametros;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe Vuelos para esa Fecha " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
