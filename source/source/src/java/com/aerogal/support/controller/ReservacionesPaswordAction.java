// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:01:21
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesPaswordAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesPaswordAction extends Action
{

    public ReservacionesPaswordAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Idioma = "/Echo.jsp";
        String nombre = request.getParameter("Usuario");
        String password = request.getParameter("Password");
        String Send = request.getParameter("Send");
        String XML = request.getParameter("XML");
        int Respuesta = 0;
        if(Send != null)
        {
            try
            {
                Respuesta = model.BuscarUsuariosIntranet(nombre, password);
                model.setIpdir(request.getRemoteAddr());
            }
            catch(SQLException e)
            {
                throw new ServletException("No es posible encontrar Usuario: " + e.getMessage());
                //ADDED ON OCT 2018
              // throw new ServletException("No es posible encontrar Usuario: " + e.getMessage() + " URL "+ model.getDatabaseURL());
                //ADDED ON OCT 2018 - END
            }
            if(Respuesta == 0)
            {
                if(XML == null)
                {
                    Idioma = "/index.jsp";
                    model.setError(".: Error de autenticaci\363n :.<br> No existe Usuario con ese paswword<br> ");
                } else
                {
                    Idioma = "/Servlets/Valida.jsp";
                }
            } else
            if(XML == null)
                Idioma = "/Servlets/Primera.jsp";
            else
                Idioma = "/Servlets/Valiada.jsp";
        }
        String next = Idioma;
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
