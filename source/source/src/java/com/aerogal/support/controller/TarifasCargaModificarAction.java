// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:03:00
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   TarifasCargaModificarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import com.aerogal.support.model.Usuarios;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class TarifasCargaModificarAction extends Action
{

    public TarifasCargaModificarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Desde = request.getParameter("Desde");
        String Hasta = request.getParameter("Hasta");
        String Minimo = request.getParameter("Minimo");
        String Codigo = request.getParameter("codigo");
        String Tarifa = request.getParameter("Tarifa");
        String Valorizacion = request.getParameter("Valorizacion");
        String Seguro = request.getParameter("Seguro");
        String Iva = request.getParameter("Iva");
        String DentroFuera = request.getParameter("DentroFuera");
        String guardar = request.getParameter("Guardar");
        String tipo = request.getParameter("Tipo");
        String Vfija = request.getParameter("Vfija");
        String Descuento = request.getParameter("Descuento");
        String pagina = "/Servlets/TarifasCarga.jsp";
        java.util.Date fecha = new java.util.Date();
        java.sql.Date FechaMod = new java.sql.Date(fecha.getTime());
        if(Minimo == null)
            Minimo = "0";
        if(Vfija == null)
            Vfija = "0";
        if(guardar != null)
            try
            {
                model.ActualizaTarifasCarga(Long.parseLong(Codigo), Float.parseFloat(Desde), Float.parseFloat(Hasta), Integer.parseInt(Minimo), Float.parseFloat(Tarifa), Float.parseFloat(Valorizacion), Float.parseFloat(Seguro), Float.parseFloat(Iva), Integer.parseInt(tipo), DentroFuera, Integer.parseInt(Vfija), Float.parseFloat(Descuento),FechaMod);
                String observaciones = "Modifica Desde:" + Desde + " Hasta:" + Hasta + " Minimo:" + Minimo + " Tarifa:" + Tarifa + " Valorizacion:" + Valorizacion + " Seguro:" + Seguro + " Iva:" + Iva + "Tipo:" + tipo + " DentroFuera:" + DentroFuera + " V.Fija:" + Vfija + " Descuento:" + Descuento + "Fecha Modificacion: " + FechaMod;
                model.Grabarbitacoratc(Long.parseLong(Codigo), observaciones, model.getUsuarios().getNombre(), "tarifascarga");
                model.BuscarTarifasCarga();
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible encontrar tarifas: " + e.getMessage());
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
            throw new ServletException("No Existe tarifas para esa Fecha " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
