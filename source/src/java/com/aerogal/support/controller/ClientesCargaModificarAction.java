// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:55:44
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ClientesCargaModificarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import com.aerogal.support.model.Usuarios;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ClientesCargaModificarAction extends Action
{

    public ClientesCargaModificarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String nombre = request.getParameter("Nombre");
        String codigo = request.getParameter("codigo");
        String codigos = request.getParameter("codigos");
        String direccion = request.getParameter("Direccion");
        String ciudad = request.getParameter("Ciudad");
        String telefono = request.getParameter("Telefono");
        String ruc = request.getParameter("Ruc");
        String credito = request.getParameter("Credito");
        String vendedor = request.getParameter("Vendedor");
        String saldo = request.getParameter("Saldo");
        String cuenta = request.getParameter("Cuenta");
        String contribuyente = request.getParameter("Contribuyente");
        String descuento = request.getParameter("Descuento");
        String mindescuento = request.getParameter("Minimo");
        String tipotarifa = request.getParameter("Tipo");
        String guardar = request.getParameter("Guardar");
        String creditocontado = request.getParameter("CreditoContado");
        String clicorreo = request.getParameter("CliCorreo");
        String lunes = "0";
        String martes = "0";
        String miercoles = "0";
        String jueves = "0";
        String viernes = "0";
        String sabado = "0";
        String domingo = "0";
        String gratishasta = "0";
        String parametros = "/Servlets/ClientesCarga.jsp";
        String diagratis = "0";
        if(lunes != null && lunes.equals("1"))
            diagratis = diagratis + lunes;
        if(martes != null && martes.equals("2"))
            diagratis = diagratis + martes;
        if(miercoles != null && miercoles.equals("3"))
            diagratis = diagratis + miercoles;
        if(jueves != null && jueves.equals("4"))
            diagratis = diagratis + jueves;
        if(viernes != null && viernes.equals("5"))
            diagratis = diagratis + viernes;
        if(sabado != null && sabado.equals("6"))
            diagratis = diagratis + sabado;
        if(domingo != null && domingo.equals("7"))
            diagratis = diagratis + domingo;
        if(contribuyente == null)
            contribuyente = "0";
        try
        {
            if(guardar != null)
            {
                model.ModificarClientesCarga(nombre, direccion, ciudad, telefono, ruc, Float.parseFloat(credito), vendedor, Float.parseFloat(saldo), cuenta, codigos, Integer.parseInt(codigo), Integer.parseInt(contribuyente), Float.parseFloat(descuento), Float.parseFloat(mindescuento), Integer.parseInt(diagratis), Float.parseFloat(gratishasta), Integer.parseInt(tipotarifa), creditocontado,clicorreo);
                String registro = "Modifica Nombre:" + nombre.trim() + " Direccion:" + direccion.trim() + " Ciudad:" + ciudad.trim() + " Telefono:" + telefono.trim() + " Ruc:" + ruc.trim() + " Credito:" + credito + " Vendedor:" + vendedor.trim() + " Saldo:" + saldo + " Cuenta:" + cuenta.trim() + " Codigo:" + codigos.trim() + " CCC:" + contribuyente + " Descuento:" + descuento + " Mindescuento:" + mindescuento + "Diagratis: " + diagratis + " GratisHasta:" + gratishasta + " Tarifa:" + tipotarifa + " CreditoContado:" + creditocontado;
                model.Grabarbitacoratc(Integer.parseInt(codigo), registro, model.getUsuarios().getNombre(), "clientescarga");
            }
            model.BuscarClientesCarga("*");
        }
        catch(SQLException e)
        {
            throw new ServletException("No es posible encontrar vuelos: " + e.getMessage());
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
