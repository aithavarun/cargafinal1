// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:59:44
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   RepVentasCargafConsultarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class RepVentasCargafConsultarAction extends Action
{

    public RepVentasCargafConsultarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String usuario = request.getParameter("Usuario");
        String pdia = request.getParameter("Dia");
        String pmes = request.getParameter("Mes");
        String panio = request.getParameter("Anio");
        String psucursal = request.getParameter("Sucursal");
        String documento = request.getParameter("Documento");
        String pdiah = request.getParameter("Diah");
        String pmesh = request.getParameter("Mesh");
        String panioh = request.getParameter("Anioh");
        int diah = 0;
        int mesh = 0;
        int anioh = 0;
        if(pdiah == null)
            diah = 0;
        else
            diah = Integer.parseInt(pdiah);
        if(pmesh == null)
            mesh = 0;
        else
            mesh = Integer.parseInt(pmesh);
        if(panioh == null)
            anioh = 0;
        else
            anioh = Integer.parseInt(panioh);
        int dia = 0;
        if(pdia == null)
            dia = 0;
        else
            dia = Integer.parseInt(pdia);
        int mes = 0;
        if(pmes == null)
            mes = 0;
        else
            mes = Integer.parseInt(pmes);
        int anio = 0;
        if(panio == null)
            anio = 0;
        else
            anio = Integer.parseInt(panio);
        if(usuario == null)
            usuario = "0";
        try
        {
            model.BuscarRepventasF(psucursal, usuario, dia, mes, anio, documento, diah, mesh, anioh);
        }
        catch(SQLException e)
        {
            throw new ServletException("es Aqui " + e.getMessage());
        }
        String Idioma = "/Servlets/RepVentasCargafe.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe GUIAS para esa Fecha " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
