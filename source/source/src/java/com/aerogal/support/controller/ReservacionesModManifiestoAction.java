// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:01:13
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesModManifiestoAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import com.aerogal.support.model.Usuarios;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesModManifiestoAction extends Action
{

    public ReservacionesModManifiestoAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        Calendar hoy = Calendar.getInstance();
        int dia = hoy.get(5);
        int mes = hoy.get(2) + 1;
        int anio = hoy.get(1);
        try
        {
            model.setError(null);
            model.Limpiarlistas();
            model.BuscarManifiestos(dia, mes, anio, dia, mes, anio, model.getUsuarios().getSucursal().substring(0, 3), "*");
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar Manifiestos: " + e.getMessage());
        }
        String Idioma = "/Servlets/ModificarManifiesto.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un error en clientes carga" + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
