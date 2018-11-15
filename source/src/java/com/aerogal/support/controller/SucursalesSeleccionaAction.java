// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:02:38
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   SucursalesSeleccionaAction.java

package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class SucursalesSeleccionaAction extends Action
{

    public SucursalesSeleccionaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String codigo = request.getParameter("codigo");
        try
        {
            model.BuscarSucursal(codigo);
        }
        catch(SQLException e)
        {
            throw new ServletException("es Aqui " + e.getMessage());
        }
        String Idioma = "/Servlets/ModificaSucursal.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe Sucursal " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
