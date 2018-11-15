// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:02:44
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   SucursalModificarAction.java

package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class SucursalModificarAction extends Action
{

    public SucursalModificarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String codigo = request.getParameter("Codigo");
        String descripcion = request.getParameter("Descripcion");
        String Manifiesto = request.getParameter("Manifiesto");
        String numguia= request.getParameter("Nguia");
        String numfactura= request.getParameter("Nfactura");
        String rguia= request.getParameter("Rguia");
        String rfactura= request.getParameter("Rfactura");
        
        
        String Serie = request.getParameter("Serie");
        String guardar = request.getParameter("Guardar");
        String parametros = "/Servlets/Sucursales.jsp";
        try
        {
            if(guardar != null){
                //System.out.print("numguia "+numguia);
                model.ActualizaSucursales(codigo, descripcion, Serie, Long.parseLong(Manifiesto),Long.parseLong(numguia),Long.parseLong(numfactura),rguia,rfactura );
            }
            model.BuscarSucursales();
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar sucursales: " + e.getMessage());
        }
        String next = parametros;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("No Existe Sucursales" + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
