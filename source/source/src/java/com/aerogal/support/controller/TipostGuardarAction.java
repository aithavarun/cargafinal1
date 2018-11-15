// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:03:17
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   TipostGuardarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class TipostGuardarAction extends Action
{

    public TipostGuardarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String nombre = request.getParameter("Nombre");
        String observacion = request.getParameter("Observacion");
        String guardar = request.getParameter("Guardar");
        String parametros = "/Servlets/Tipostarifas.jsp";
        try
        {
            if(guardar != null)
                model.GrabarTipost(nombre, observacion);
            model.BuscarTipostarifas();
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar usuarios: " + e.getMessage());
        }
        String next = parametros;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe Tipos tarifas para esa Fecha " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
