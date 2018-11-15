// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:58:54
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   GuiasBuscargAction.java

package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class GuiasBuscargAction extends Action
{

    public GuiasBuscargAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Dia = request.getParameter("Dia");
        String Mes = request.getParameter("Mes");
        String Anio = request.getParameter("Anio");
        String baseurl = request.getParameter("baseurl");
        String Buscar = request.getParameter(baseurl + "/images/Forma/forma_r3_c14.y");
        String Nueva = request.getParameter(baseurl + "/images/Forma/forma_r3_c18.x");
        String Factura = request.getParameter(baseurl + "/images/Forma/forma_r3_c12.x");
        String Incrementar = request.getParameter("Incrementar");
        String Nuevo = request.getParameter("Nuevo");
        String pagina = "/Echo.jsp";
        int dia = 0;
        int mes = 0;
        int anio = 0;
        if(Dia != null)
            dia = Integer.parseInt(Dia);
        if(Mes != null)
            mes = Integer.parseInt(Mes);
        if(Anio != null)
            anio = Integer.parseInt(Anio);
        model.setAccion("");
        model.setError("");
        try
        {
            model.setError(null);
            if(Buscar != null)
            {
                model.Guiaslista(dia, mes, anio);
                model.setAccion("1");
                pagina = "/Servlets/GuiadeCarga.jsp";
            } else
            if(Nueva != null){
                model.setIsNewGF(1);
                pagina = "/Servlets/NuevaGuia.jsp";
            }
            else
            if(Factura != null){
                model.setIsNewGF(1);
                pagina = "/Servlets/NuevaFacturag.jsp";
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
