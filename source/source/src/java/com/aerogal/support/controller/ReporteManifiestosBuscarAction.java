// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:59:27
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReporteManifiestosBuscarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReporteManifiestosBuscarAction extends Action
{

    public ReporteManifiestosBuscarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Origen = request.getParameter("Origen");
        String Destino = request.getParameter("Destino");
        String baseurl = request.getParameter("baseurl");
        String Buscar = request.getParameter("Buscar");
        String Manifiesto = request.getParameter("Manifiesto");
        String Diad = request.getParameter("Diad");
        String Mesd = request.getParameter("Mesd");
        String Aniod = request.getParameter("Aniod");
        String Diah = request.getParameter("Diah");
        String Mesh = request.getParameter("Mesh");
        String Anioh = request.getParameter("Anioh");
        String Vuelo = request.getParameter("Vuelo");
        String Equipo = request.getParameter("Equipo");
        String Peso = request.getParameter("TotalPeso");
        String Piezas = request.getParameter("TotalPiezas");
        String Observaciones = request.getParameter("Observaciones");
        String Secuencial = request.getParameter("Secmanifiesto");
        String Reimprimir = request.getParameter("Reimprimir");
        String cadena = "";
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
        if(Origen == null)
            Origen = "*";
        if(Destino == null)
            Destino = "*";
        model.setAccion("");
        model.setError("");
        try
        {
            model.setError(null);
            if(Buscar != null)
            {
                model.BuscarManifiestos(diad, mesd, aniod, diah, mesh, anioh, Origen, Destino);
                pagina = "/Servlets/ReporteManifiestos.jsp";
            } else
            if(Reimprimir != null)
            {
                model.BuscarManifiesto(Long.parseLong(Secuencial));
                model.ListaGuiasManifiesto(Long.parseLong(Secuencial));
                pagina = "/Servlets/ReimprimeManifiesto.jsp";
            }
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar Manifiestos: " + e.getMessage());
        }
        String next = pagina;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existen manifiestos para ese rango de fechas" + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
