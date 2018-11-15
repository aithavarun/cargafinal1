// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:02:51
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   TarifaCargaBuscarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class TarifaCargaBuscarAction extends Action
{

    public TarifaCargaBuscarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String origen = request.getParameter("Origen");
        String destino = request.getParameter("Destino");
        String parametros = "/Servlets/TarifasCarga.jsp";
        try
        {
            if(origen.length() > 0)
                model.BuscarTarifasCargaVuelo(origen, destino);
            else
                model.BuscarTarifasCarga();
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar vuelos: " + e.getMessage());
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
