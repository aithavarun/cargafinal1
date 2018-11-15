// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:59:00
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   GuiasBuscargfacAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class GuiasBuscargfacAction extends Action
{

    public GuiasBuscargfacAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Dia = request.getParameter("Dia");
        String Mes = request.getParameter("Mes");
        String Anio = request.getParameter("Anio");
        String Dia2 = request.getParameter("Dia2");
        String Mes2 = request.getParameter("Mes2");
        String Anio2 = request.getParameter("Anio2");
        String baseurl = request.getParameter("baseurl");
        String Buscar = request.getParameter(baseurl + "/images/Forma/forma_r3_c14.y");
        String Nueva = request.getParameter(baseurl + "/images/Forma/forma_r3_c18.x");
        String Factura = request.getParameter(baseurl + "/images/Forma/forma_r3_c12.x");
        String Cliente = request.getParameter("Cliente");
        String Incrementar = request.getParameter("Incrementar");
        String Nuevo = request.getParameter("Nuevo");
        String Secuencial = request.getParameter("Secuencial");
        String milista = "";
        String Codigo = "0";
        String Total = request.getParameter("Total");
        String Observacion = request.getParameter("Observacion");
        String Nfactura = request.getParameter("Factura");
        String Grabar = request.getParameter("Grabar");
        if(Cliente == null)
            Cliente = "-1";
        int secuencial = 0;
        int i = 0;
        if(Secuencial != null)
        {
            secuencial = Integer.parseInt(Secuencial);
            for(i = 1; i <= secuencial; i++)
            {
                Codigo = request.getParameter("Guia" + String.valueOf(i));
                if(Codigo == null)
                    Codigo = "0";
                if(i == 1)
                    milista = Codigo;
                else
                    milista = milista + "," + Codigo;
            }

        }
        String pagina = "/Servlets/FacturacionGuias.jsp";
        int dia = 0;
        int mes = 0;
        int anio = 0;
        if(Dia != null)
            dia = Integer.parseInt(Dia);
        if(Mes != null)
            mes = Integer.parseInt(Mes);
        if(Anio != null)
            anio = Integer.parseInt(Anio);
        int dia2 = 0;
        int mes2 = 0;
        int anio2 = 0;
        if(Dia2 != null)
            dia2 = Integer.parseInt(Dia2);
        if(Mes2 != null)
            mes2 = Integer.parseInt(Mes2);
        if(Anio2 != null)
            anio2 = Integer.parseInt(Anio2);
        model.setAccion("");
        model.setError("");
        try
        {
            model.setError(null);
            if(Buscar != null)
            {
                model.GuiasAFacturar(Integer.parseInt(Cliente));
                model.setAccion("1");
                pagina = "/Servlets/FacturacionGuias.jsp";
            } else
            if(Factura != null && milista.length() > 0)
            {
                model.GuiasAFacturarL(milista);
                model.setAccion("1");
                pagina = "/Servlets/NuevaFacturaC.jsp";
            } else
            if(Grabar != null && milista.length() > 0)
            {
                model.setAccion("1");
                model.InsertaFacturaC(dia, mes, anio, Integer.parseInt(Cliente), Observacion, Long.parseLong(Nfactura), Float.parseFloat(Total), milista);
                pagina = "/Servlets/FacturacionGuias.jsp";
            }
        }
        catch(SQLException e)
        {
            throw new ServletException("No se puede mostrar Guias a Facturas: " + e.getMessage());
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
