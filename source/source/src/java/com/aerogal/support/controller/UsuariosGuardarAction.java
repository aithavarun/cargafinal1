// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:03:39
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   UsuariosGuardarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class UsuariosGuardarAction extends Action
{

    public UsuariosGuardarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String nombre = request.getParameter("Nombre");
        String nombrecompleto = request.getParameter("NombreCompleto");
        String clave = request.getParameter("Clave");
        String sucursal = request.getParameter("Sucursal");
        String grupo = request.getParameter("Grupo");
        String Tipo = request.getParameter("Tipo");
        String guardar = request.getParameter("Guardar");
        String parametros = "/Servlets/Usuarios.jsp";
        try
        {
            model.setError(null);
            if(guardar != null)
            {
                String existeusuario = model.ExisteUsuario(nombre);
                if(existeusuario.equals("0"))
                {
                    model.GrabarUsuarios(clave, nombre, sucursal, grupo, Integer.parseInt(Tipo), nombrecompleto);
                    model.BuscarUsuarios();
                } else
                {
                    model.setError(".: Error  :.<br> Usuario ya registrado en alguna sucursal, digite otro <br> ");
                    parametros = "/Servlets/Usuarios.jsp";
                }
            }
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar usuarios: " + e.getMessage());
        }
        String next = parametros;
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
