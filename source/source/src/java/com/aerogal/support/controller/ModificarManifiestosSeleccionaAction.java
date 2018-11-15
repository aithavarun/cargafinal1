// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:59:22
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ModificarManifiestosSeleccionaAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import com.aerogal.support.model.Usuarios;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ModificarManifiestosSeleccionaAction extends Action
{

    public ModificarManifiestosSeleccionaAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        String codigo = request.getParameter("codigo");
        String usuario = request.getParameter("Usuario");
        String Origen = request.getParameter("Origen");
        String Destino = request.getParameter("Destino");
        String Idioma = "/Echo.jsp";
        try
        {
            model.setError(null);
            model.Limpiarlistas();
            if(usuario != null)
            {
                usuario = usuario.trim();
                if(usuario.equals(model.getUsuarios().getNombre().trim()))
                {
                    if(codigo == null)
                        codigo = "0";
                    model.Guiaslista(Origen.trim(), Destino.trim());
                    model.BuscarManifiesto(Long.parseLong(codigo));
                    model.ListaGuiasManifiesto(Long.parseLong(codigo));
                    Idioma = "/Servlets/ModificaManifiesto.jsp";
                } else
                {
                    model.setError(".: Error de autenticaci\363n :.<br> Usuario sin permiso para realizar la modificacion<br> ");
                    Idioma = "/Servlets/ModificarManifiesto.jsp";
                }
            }
        }
        catch(SQLException e)
        {
            throw new ServletException("es Aqui " + e.getMessage());
        }
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe Guias para esa Fecha " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
