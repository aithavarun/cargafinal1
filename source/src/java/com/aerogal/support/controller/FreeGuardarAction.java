// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:56:44
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   FreeGuardarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class FreeGuardarAction extends Action
{

    public FreeGuardarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        String codigo = request.getParameter("Codigocli");
        String dia = request.getParameter("Dia");
        String kilos = request.getParameter("Kilos");
        String guardar = request.getParameter("Guardar");
        String parametros = "/Servlets/ModificaClienteCarga.jsp";
        model.Limpiarlistas();
        if(guardar != null)
            try
            {
                model.GrabarFree(Integer.parseInt(dia), Float.parseFloat(kilos), Long.parseLong(codigo));
                model.BuscarClienteCarga(Integer.parseInt(codigo));
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible encontrar descuentos: " + e.getMessage());
            }
        else
            try
            {
                model.Limpiarlistas();
                model.BuscarClienteCarga(Integer.parseInt(codigo));
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
