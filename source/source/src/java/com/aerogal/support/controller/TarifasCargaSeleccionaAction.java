// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:03:11
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   TarifasCargaSeleccionaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class TarifasCargaSeleccionaAction extends Action
{

    public TarifasCargaSeleccionaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        String codigo = request.getParameter("codigo");
        model.Limpiarlistas();
        if(codigo == null)
            codigo = "0";
        try
        {
            model.BuscarTarifaCarga(Long.parseLong(codigo));
        }
        catch(SQLException e)
        {
            throw new ServletException("es Aqui " + e.getMessage() + "?" + codigo);
        }
        String Idioma = "/Servlets/ModificaTarifaCarga.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe Tarifas " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
