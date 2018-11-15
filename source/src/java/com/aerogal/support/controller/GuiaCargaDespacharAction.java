// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:57:32
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   GuiaCargaDespacharAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class GuiaCargaDespacharAction extends Action
{

    public GuiaCargaDespacharAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        int Restricciones = 0;
        String Quien = request.getParameter("Quien");
        String Observacion = request.getParameter("Observacion");
        String Ci = request.getParameter("CI");
        String telefonor = request.getParameter("Telefonor");
        String Codigo = request.getParameter("Codigo");
        String guardar = request.getParameter("Guardar");
        String pagina = "/Servlets/BuscarGuia.jsp";
        if(guardar != null)
            try
            {
                model.GrabarDespacho(Quien, Ci, Observacion, Long.parseLong(Codigo), telefonor);
                pagina = "/Servlets/BuscarGuia.jsp";
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible encontrar vuelos: " + e.getMessage());
            }
        else
            try
            {
                model.Limpiarlistas();
                model.BuscarTarifasCarga();
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible encontrar guia: " + e.getMessage());
            }
        String next = pagina;
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
