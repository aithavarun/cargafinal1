// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:03:34
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   TipostSeleccionaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class TipostSeleccionaAction extends Action
{

    public TipostSeleccionaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String codigo = request.getParameter("codigo");
        if(codigo == null)
            codigo = "0";
        try
        {
            model.BuscarTipoTarifa(Integer.parseInt(codigo));
        }
        catch(SQLException e)
        {
            throw new ServletException("es Aqui " + e.getMessage());
        }
        String Idioma = "/Servlets/ModificaTipot.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe Cliente" + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
