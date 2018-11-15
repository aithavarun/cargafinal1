// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:55:14
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   CiudadesGuardarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class CiudadesGuardarAction extends Action
{

    public CiudadesGuardarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String codigo = request.getParameter("Codigo");
        String descripcion = request.getParameter("Descripcion");
        String impuesto = request.getParameter("impuesto");
        String tasa = request.getParameter("tasa");
        String seguro = request.getParameter("seguro");
        String web = request.getParameter("web");
        String guardar = request.getParameter("Guardar");
        String parametros = "/Servlets/Ciudades.jsp";
        if(web == null)
            web = "0";
        if(guardar != null)
            try
            {
                model.GrabarCiudades(codigo, descripcion, Float.parseFloat(impuesto), Float.parseFloat(tasa), Float.parseFloat(seguro), Integer.parseInt(web));
                model.BuscarCiudades();
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible encontrar ciudades: " + e.getMessage());
            }
        String next = parametros;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe  para esa Fecha " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
