// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:56:21
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   DescuentocNuevoAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class DescuentocNuevoAction extends Action
{

    public DescuentocNuevoAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        String codigo = request.getParameter("Codigocli");
        String motivo = request.getParameter("Motivo");
        model.Limpiarlistas();
        String parametros = "/Servlets/Nuevofree.jsp";
        String next = parametros;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe descuentos para esa Fecha " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
