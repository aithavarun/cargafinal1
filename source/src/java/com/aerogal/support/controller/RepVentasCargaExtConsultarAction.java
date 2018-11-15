// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:59:39
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   RepVentasCargaConsultarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class RepVentasCargaExtConsultarAction extends Action
{

    public RepVentasCargaExtConsultarAction()
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
            model.BuscarRepventasC(psucursal, usuario, dia, mes, anio, documento);
        }
        catch(SQLException e)
        {
            throw new ServletException("es Aqui " + e.getMessage());
        }
        String Idioma = "/Servlets/RepVentasCargaExt.jsp";
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
