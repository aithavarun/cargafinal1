// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:59:55
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesAnularGuiaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesAnularGuiaAction extends Action
{

    public ReservacionesAnularGuiaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Guia = request.getParameter("guia");
        String observaciones = request.getParameter("observaciones");
        String tipo = request.getParameter("Tipo");
        String anular = request.getParameter("Anular");
        Calendar miCal = Calendar.getInstance();
        int dia = miCal.get(5);
        int mes = miCal.get(2);
        int anio = miCal.get(1);
        String Pagina = "/Servlets/AnulaGuia.jsp";
        long guia = 0L;
        int retorno = 0;
        model.setError(null);
        if(Guia != null)
            guia = Long.parseLong(Guia);
        if(anular != null)
            try
            {
                if(guia > 0L)
                {
                    model.InsertarGuiaAnulado(observaciones, guia, tipo);
                    model.Guiaslistau(dia, mes + 1, anio);
                    model.setAccion("1");
                    Pagina = "/Servlets/AnulaGuia.jsp";
                }
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible insertar Guia Anulada: " + e.getMessage());
            }
        String next = Pagina;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en tarifas " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
