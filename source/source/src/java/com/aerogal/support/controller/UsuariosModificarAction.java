// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:03:44
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   UsuariosModificarAction.java

package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class UsuariosModificarAction extends Action
{

    public UsuariosModificarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String nombre = request.getParameter("Nombre");
        String nombrecompleto = request.getParameter("NombreCompleto");
        String clave = request.getParameter("Clave");
        String grupo = request.getParameter("Grupo");
        String sucursal = request.getParameter("Sucursal");
        String Tipo = request.getParameter("Tipo");
        //String numfac = request.getParameter("Factura");
        //String numguia = request.getParameter("Guia");
        String guardar = request.getParameter("Guardar");
        String Secuencial = request.getParameter("Secuencial");
        String parametros = "/Servlets/Usuarios.jsp";
        int secuencial = 0;
        int j = 0;
        if(Secuencial != null)
            secuencial = Integer.parseInt(Secuencial);
        int cadena[] = new int[secuencial];
        if(Secuencial != null)
        {
            for(int i = 1; i <= secuencial; i++)
            {
                String Codigo = request.getParameter("Menu" + String.valueOf(i));
                if(Codigo != null)
                {
                    cadena[j] = Integer.parseInt(Codigo);
                    j++;
                }
            }

        }
        try
        {
            if(guardar != null)
                model.ActualizaUsuarios(nombre, clave, grupo, sucursal, Integer.parseInt(Tipo), nombrecompleto);
            model.BuscarUsuarios();
            model.BorraPerfil(nombre);
            for(int i = 0; i < j; i++)
                model.ActualizaPerfil(nombre, cadena[i]);

        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar usuarios: " + e.getMessage());
        }
        String next = parametros;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe usuarios " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
