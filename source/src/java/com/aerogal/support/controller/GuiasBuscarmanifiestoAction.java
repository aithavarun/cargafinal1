// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:59:12
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   GuiasBuscarmanifiestoAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class GuiasBuscarmanifiestoAction extends Action
{

    public GuiasBuscarmanifiestoAction()
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
                pagina = "/Servlets/ManifiestoCarga.jsp";
            } else
            if(Guardar != null)
            {
                long secmanifiesto = model.GrabarManifiesto(Integer.parseInt(Dia), Integer.parseInt(Mes), Integer.parseInt(Anio), Vuelo, Equipo, Float.parseFloat(Peso), Integer.parseInt(Piezas), Observaciones, Origen, Destino, Long.parseLong(Nummanifiesto));
                if(Secuencial != null)
                {
                    secuencial = Integer.parseInt(Secuencial);
                    for(i = 1; i <= secuencial; i++)
                    {
                        String Codigo = request.getParameter("Guia" + String.valueOf(i));
                        if(Codigo == null)
                            Codigo = "0";
                        model.GrabarGuiasManifiesto(Long.parseLong(Codigo), secmanifiesto);
                    }

                }
                model.ListaGuiasManifiesto(secmanifiesto);
                model.BuscarManifiesto(secmanifiesto);
                pagina = "/Servlets/ImprimeManifiesto.jsp";
            } else
            if(Manifiesto != null && Grabar == null)
            {
                if(Secuencial != null)
                {
                    secuencial = Integer.parseInt(Secuencial);
                    for(i = 1; i <= secuencial; i++)
                    {
                        String Codigo = request.getParameter("Guia" + String.valueOf(i));
                        if(Codigo == null)
                            Codigo = "0";
                        if(i == 1)
                            cadena = Codigo;
                        else
                            cadena = cadena + "," + Codigo;
                    }

                    if(secuencial > 0)
                        model.ListaGuias(cadena);
                    pagina = "/Servlets/GuiasManif.jsp";
                }
            } else
            if(Grabar != null)
            {
                model.Borraguias(Long.parseLong(Secmanifiesto));
                pagina = "/Servlets/ModificarManifiesto.jsp";
                if(Secuencial != null)
                {
                    secuencial = Integer.parseInt(Secuencial);
                    for(i = 1; i <= secuencial; i++)
                    {
                        String Codigo = request.getParameter("Guia" + String.valueOf(i));
                        if(Codigo == null)
                            Codigo = "0";
                        model.GrabarGuiasManifiesto(Long.parseLong(Codigo), Long.parseLong(Secmanifiesto));
                    }

                }
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
