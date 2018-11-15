// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:59:17
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   GuiasSeleccionaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class GuiasSeleccionaAction extends Action
{

    public GuiasSeleccionaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        String codigo = request.getParameter("codigo");
        String Idioma = "/Echo.jsp";
        model.Limpiarlistas();
        if(codigo == null)
            codigo = "0";
        try
        {
            model.setError(null);
            model.BuscarGuia(Long.parseLong(codigo));
            model.BuscarPagoCarga(Long.parseLong(codigo));
            model.BuscarDescuentoscarga(Long.parseLong(codigo));
            model.BuscarDetallePagosTarjeta(Long.parseLong(codigo));
            //System.out.println("=1aasse>");
            model.setIsNewGF(0);
            Idioma = "/Servlets/ModificaGuia.jsp";
        }
        catch(SQLException e)
        {
            throw new ServletException("es Aqui " + e.getMessage());
        }
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe Guias para esa Fecha " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
