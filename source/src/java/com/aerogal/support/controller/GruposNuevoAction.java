// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:57:15
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   GruposNuevoAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class GruposNuevoAction extends Action
{

    public GruposNuevoAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Nuevo = request.getParameter("Nuevo");
        String Salir = request.getParameter("Salir");
        String pagina = "/Servlets/NuevoGrupo.jsp";
        int Respuesta = 0;
        if(Nuevo == null)
            pagina = "/Servlets/Primera.jsp";
        String next = pagina;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe Grupos " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
