// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:59:50
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesAnularGAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesAnularGAction extends Action
{

    public ReservacionesAnularGAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Pagina = "/Servlets/AnulaGuia.jsp";
        String Observacion = "";
        model.setError(null);
        Calendar miCal = Calendar.getInstance();
        int dia = miCal.get(5);
        int mes = miCal.get(2);
        int anio = miCal.get(1);
        try
        {
            model.Guiaslistau(dia, mes + 1, anio);
            model.setAccion("1");
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible Manifiestos: " + e.getMessage());
        }
        String next = Pagina;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en Anular Guias " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
