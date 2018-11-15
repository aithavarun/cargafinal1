// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:58:43
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   GuiasBuscarCargaAction.java

package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class GuiasBuscarCargaAction extends Action
{

    public GuiasBuscarCargaAction()
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
        String Guardar = request.getParameter("Guardar");
        String Grabar = request.getParameter("Grabar");
        String Manifiesto = request.getParameter("Manifiesto");
        String Dia = request.getParameter("Dia");
        String Mes = request.getParameter("Mes");
        String Anio = request.getParameter("Anio");
        String Vuelo = request.getParameter("Vuelo");
        String Equipo = request.getParameter("Equipo");
        String Peso = request.getParameter("TotalPeso");
        String Piezas = request.getParameter("TotalPiezas");
        String Observaciones = request.getParameter("Observaciones");
        String Secuencial = request.getParameter("Secuencial");
        String Secmanifiesto = request.getParameter("Secmanifiesto");
        String Nummanifiesto = request.getParameter("Manifiesto");
        String Reimprimir = request.getParameter("Reimprimir");
        String cadena = "";
        int secuencial = 0;
        int i = 0;
        String Nuevo = request.getParameter("Nuevo");
        String pagina = "/Echo.jsp";
        int dia = 0;
        int mes = 0;
        int anio = 0;
        model.setAccion("");
        model.setError("");
        try
        {
            model.setError(null);
            if(Buscar != null)
            {
                model.Guiaslista(Origen, Destino);
                pagina = "/Servlets/Carga.jsp";
            }
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible Manifiestos: " + e.getMessage());
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
