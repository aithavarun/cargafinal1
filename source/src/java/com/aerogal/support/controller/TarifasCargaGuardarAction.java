// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:02:55
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   TarifasCargaGuardarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import com.aerogal.support.model.Usuarios;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class TarifasCargaGuardarAction extends Action
{

    public TarifasCargaGuardarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        int Restricciones = 0;
        String Desde = request.getParameter("Desde");
        String Hasta = request.getParameter("Hasta");
        String Minimo = request.getParameter("Minimo");
        String Tarifa = request.getParameter("Tarifa");
        String Valorizacion = request.getParameter("Valorizacion");
        String Seguro = request.getParameter("Seguro");
        String Iva = request.getParameter("Iva");
        String Tipo = request.getParameter("Tipo");
        String DentroFuera = request.getParameter("DentroFuera");
        String guardar = request.getParameter("Guardar");
        String Valorizacionf = request.getParameter("Vfija");
        String Descuento = request.getParameter("Descuento");
//        String FechaIni = request.getParameter("FechaCreacion");
        
        Date fecha = new Date();
        java.sql.Date FechaIni = new java.sql.Date(fecha.getTime());
        String pagina = "/Servlets/TarifasCarga.jsp";
        if(Minimo == null)
            Minimo = "0";
        if(Valorizacionf == null)
            Valorizacionf = "0";
        if(guardar != null)
            try
            {
                model.GrabarTarifasCarga(Float.parseFloat(Desde), Float.parseFloat(Hasta), Integer.parseInt(Minimo), Float.parseFloat(Tarifa), Float.parseFloat(Valorizacion), Float.parseFloat(Seguro), Float.parseFloat(Iva), Integer.parseInt(Tipo), DentroFuera, Float.parseFloat(Descuento), Integer.parseInt(Valorizacionf),FechaIni);
                long sectarifa = model.Traersecuencial(Float.parseFloat(Desde), Float.parseFloat(Hasta), Integer.parseInt(Minimo), Float.parseFloat(Tarifa), Float.parseFloat(Valorizacion), Float.parseFloat(Seguro), Float.parseFloat(Iva), Integer.parseInt(Tipo), DentroFuera, Float.parseFloat(Descuento));
                String observaciones = "Inserta Desde:" + Desde + " Hasta:" + Hasta + " Minimo:" + Minimo + " Tarifa:" + Tarifa + " Valorizacion:" + Valorizacion + " Seguro:" + Seguro + " Iva:" + Iva + "Tipo:" + Tipo + " DentroFuera:" + DentroFuera + " V.fija:" + Valorizacionf + " Descuento:" + Descuento + " Fecha Creacion:" + FechaIni;
                model.Grabarbitacoratc(sectarifa, observaciones, model.getUsuarios().getNombre(), "tarifascarga");
                model.BuscarTarifasCarga();
                pagina = "/Servlets/TarifasCarga.jsp";
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible encontrar vuelos: " + e.getMessage());
            }
        else
            try
            {
                model.Limpiarlistas();
                model.BuscarTarifasCarga();
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible encontrar vuelos: " + e.getMessage());
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
