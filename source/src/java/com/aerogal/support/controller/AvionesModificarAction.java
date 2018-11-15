// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:51:20
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   AvionesModificarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class AvionesModificarAction extends Action
{

    public AvionesModificarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String descripcion = request.getParameter("Descripcion");
        String carpax = request.getParameter("CapPax");
        String capcarga = request.getParameter("CapCarga");
        String guardar = request.getParameter("Guardar");
        String codigo = request.getParameter("codigo");
        String parametros = "/Servlets/Aviones.jsp";
        try
        {
            if(guardar != null)
                model.ActualizaAviones(descripcion, Integer.parseInt(carpax), Float.parseFloat(capcarga), Integer.parseInt(codigo));
            model.BuscarAviones();
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
