// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 11:00:33
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ReservacionesDespachadonoAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ReservacionesDespachadonoAction extends Action
{

    public ReservacionesDespachadonoAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Salir = request.getParameter("Salir");
        String dia = request.getParameter("Dia");
        String mes = request.getParameter("Mes");
        String anio = request.getParameter("Anio");
        String diah = request.getParameter("Dia2");
        String mesh = request.getParameter("Mes2");
        String anioh = request.getParameter("Anio2");
        String sucursal = request.getParameter("Sucursal");
        String pagina = "/Servlets/Buscarnoentregada.jsp";
        if(sucursal == null)
            sucursal = "UIO";
        int idia = 0;
        if(dia == null)
            idia = 0;
        else
            idia = Integer.parseInt(dia);
        int imes = 0;
        if(mes == null)
            imes = 0;
        else
            imes = Integer.parseInt(mes);
        int ianio = 0;
        if(anio == null)
            ianio = 0;
        else
            ianio = Integer.parseInt(anio);
        int idiah = 0;
        if(diah == null)
            idiah = 0;
        else
            idiah = Integer.parseInt(diah);
        int imesh = 0;
        if(mesh == null)
            imesh = 0;
        else
            imesh = Integer.parseInt(mesh);
        int ianioh = 0;
        if(anioh == null)
            ianioh = 0;
        else
            ianioh = Integer.parseInt(anioh);
        if(Salir != null)
            pagina = "/Servlets/Banner.jsp";
        else
            try
            {
                model.BucarGuianoDespacho(idia, imes, ianio, idiah, imesh, ianioh, sucursal);
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
