// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:51:10
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   AuditoriaBuscarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class AuditoriaBuscarAction extends Action
{

    public AuditoriaBuscarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Buscar = request.getParameter("Buscar");
        String Diad = request.getParameter("Diad");
        String Mesd = request.getParameter("Mesd");
        String Aniod = request.getParameter("Aniod");
        String Diah = request.getParameter("Diah");
        String Mesh = request.getParameter("Mesh");
        String Anioh = request.getParameter("Anioh");
        int secuencial = 0;
        int i = 0;
        String pagina = "/Echo.jsp";
        int diad = 0;
        int mesd = 0;
        int aniod = 0;
        if(Diad != null)
            diad = Integer.parseInt(Diad);
        if(Mesd != null)
            mesd = Integer.parseInt(Mesd);
        if(Aniod != null)
            aniod = Integer.parseInt(Aniod);
        int diah = 0;
        int mesh = 0;
        int anioh = 0;
        if(Diah != null)
            diah = Integer.parseInt(Diah);
        if(Mesh != null)
            mesh = Integer.parseInt(Mesh);
        if(Anioh != null)
            anioh = Integer.parseInt(Anioh);
        model.setAccion("");
        model.setError("");
        try
        {
            model.setError(null);
            if(Buscar != null)
            {
                model.BuscarAuditoria(diad, mesd, aniod, diah, mesh, anioh);
                pagina = "/Servlets/Auditoria.jsp";
            }
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar Datos: " + e.getMessage());
        }
        String next = pagina;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Datos para ese rango de fechas" + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
