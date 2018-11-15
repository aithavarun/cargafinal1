// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:01:26
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesReporteCargaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesReporteCargaAction extends Action
{

    public ReservacionesReporteCargaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Salir = request.getParameter("Salir");
        String Origen = request.getParameter("Origen");
        String Destino = request.getParameter("Destino");
        long numguia = 0L;
        String pagina = "/Servlets/Carga.jsp";
        if(Origen == null)
            Origen = "";
        if(Destino == null)
            Destino = "";
        if(Salir != null)
            pagina = "/Servlets/Banner.jsp";
        else
            try
            {
                if(Origen.length() > 0 && Destino.length() > 0)
                    model.Guiaslista(Origen, Destino);
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible reservas : " + e.getMessage());
            }
        String next = pagina;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en aviones " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
