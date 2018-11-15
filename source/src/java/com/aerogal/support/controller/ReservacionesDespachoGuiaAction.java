// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:00:39
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesDespachoGuiaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesDespachoGuiaAction extends Action
{

    public ReservacionesDespachoGuiaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Salir = request.getParameter("Salir");
        String Remitente = request.getParameter("Remitente");
        String Destinatario = request.getParameter("Destinatario");
        String Cliente = request.getParameter("Cliente");
        String Guia = request.getParameter("Guia");
        String Despachado = request.getParameter("Despachado");
        long numguia = 0L;
        String pagina = "/Servlets/BuscarGuia.jsp";
        if(Guia != null)
            numguia = Long.parseLong(Guia);
        if(Remitente == null)
            Remitente = "";
        if(Destinatario == null)
            Destinatario = "";
        if(Cliente == null)
            Cliente = "-1";
        long codcliente = Long.parseLong(Cliente);
        if(Salir != null)
            pagina = "/Servlets/Banner.jsp";
        else
            try
            {
                if(numguia > 0L)
                    model.BuscarGuiaDespacho(numguia);
                else
                if(Remitente.length() > 0 || Destinatario.length() > 0 || codcliente != -1L)
                    model.BuscarGuiaDespacho(Remitente, Destinatario, Long.parseLong(Cliente), Integer.parseInt(Despachado));
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
