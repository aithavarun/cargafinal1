// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:57:38
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   GuiaCargaGrabarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.controller.dto.GuiaDeCargaDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;
import javax.servlet.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class GuiaCargaGrabarAction extends Action
{

    public GuiaCargaGrabarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Origen = request.getParameter("Origen").toUpperCase().trim();
        String Destino = request.getParameter("Destino").toUpperCase().trim();
        String Transito = request.getParameter("Transito").toUpperCase().trim();
        String Cliente = request.getParameter("Cliente");
        String Nguia = request.getParameter("Nguia").trim();
        String Mese = request.getParameter("Mese").trim();
        String Diae = request.getParameter("Diae").trim();
        String Anioe = request.getParameter("Anioe").trim();
        String Piezas = request.getParameter("piezas").trim();
        String Peso = request.getParameter("peso").trim();
        String Contiene = request.getParameter("Contiene").trim();
        String Remitente = request.getParameter("Remitente").toUpperCase().trim();
        String Destinatario = request.getParameter("Destinatario").toUpperCase().trim();
        String Observacion = request.getParameter("Observacion").toUpperCase().trim();
        String Flete = request.getParameter("Flete").trim();
        //String Entregad = request.getParameter("Edomicilio").trim();
        //String Tadicional = request.getParameter("Tadicional").trim();
        //String Sadicional = "0";
        String Entregad ="0";
        String Tadicional = "0";
        String Sadicional ="0";
        if(request.getParameter("Sadicional") !=null){
            Sadicional = request.getParameter("Sadicional").trim();
        }
        String Seguros = request.getParameter("Seguros").trim();
        String Tarifa = request.getParameter("Tarifa");
        String Valorizacion = request.getParameter("Valorizacion");
        String Pesov = request.getParameter("pesovolumen").trim();
        String Tipo = request.getParameter("Tipo").trim();
        String Serie = request.getParameter("Serie").trim();
        long vueloi = 0L;
        long guia = 0L;
        String Salir = request.getParameter("Salir");
        String Grabar = request.getParameter("Grabar");
        String Calcular = request.getParameter("Calcula");
        String Hora = request.getParameter("Hora");
        String Minutos = request.getParameter("Minutos");
        String Telefono = request.getParameter("Telefono");
        String Ruc = request.getParameter("Ruc");
        String Direccion = request.getParameter("Direccion");
        String Entregaen = request.getParameter("Entregaen");
        String Continente = "-1";
        String Pesoaux = "0";
        int midia = 0;
        Calendar inicio = Calendar.getInstance();
        inicio.set(Integer.parseInt(Anioe), Integer.parseInt(Mese) - 1, Integer.parseInt(Diae));
        midia = inicio.get(7);
        if(midia == 1)
            midia = 7;
        else
            midia--;
        float kgratis = 0.0F;
        long nguia = 0L;
        int ttarifa = -1;
        int tarifa = -1;
        String pagina = "/Servlets/GuiadeCarga.jsp";
        
        try
        {
            model.setError(null);
            if(Calcular != null)
            {
                Continente = model.TraerContinenteono(Origen, Destino);
                ttarifa = model.BuscarTipotarifaCliente(Integer.parseInt(Cliente));
                
                if(Pesov.equals("0"))
                    Pesoaux = Peso;
                else
                    Pesoaux = Pesov;
                tarifa = model.BuscarTarifaCargaxpeso(Continente, Destino, Float.parseFloat(Pesoaux), ttarifa, Origen);
                if(ttarifa == -1 || tarifa == -1)
                {
                    model.setError("Tarifa no Encontrada");
                    if (Tipo.equals("G")) {
                        pagina = "/Servlets/NuevaGuia.jsp";
                    }else if (Tipo.equals("F")) {
                        pagina = "/Servlets/NuevaFacturag.jsp";
                    }
                            
                    
                } else
                if(!Continente.equals("-1"))
                {
                    kgratis = model.BuscarKilosgratis(Integer.parseInt(Cliente), midia);
//                    model.Borraguiaf(Long.parseLong(Nguia), Tipo);//Esto lo borramos en el nuevo proceso
                    //nguia = model.InsertaGuiaCargaC(Origen, Destino, Long.parseLong(Nguia), Integer.parseInt(Mese), Integer.parseInt(Diae), Integer.parseInt(Anioe), Integer.parseInt(Piezas), Float.parseFloat(Peso), Contiene, Remitente, Destinatario, Float.parseFloat(Flete), Float.parseFloat(Entregad), Float.parseFloat(Tadicional), Float.parseFloat(Sadicional), Float.parseFloat(Seguros), Long.parseLong(Cliente), Observacion, vueloi, Float.parseFloat(Pesov), 0.0F, Telefono, Ruc, Integer.parseInt(Hora), Integer.parseInt(Minutos), Direccion, Integer.parseInt(Entregaen), Tipo, ttarifa, kgratis, Transito, Serie);
//                    guia = model.BuscarGuiaNumeroS(nguia);
//                    model.BuscarGuia(guia);
                   
                   GuiaDeCargaDTO dto = model.InsertaGuiaCargaCTemp(Origen, Destino, Long.parseLong(Nguia), Integer.parseInt(Mese), Integer.parseInt(Diae), Integer.parseInt(Anioe), Integer.parseInt(Piezas), Float.parseFloat(Peso), Contiene, Remitente, Destinatario, Float.parseFloat(Flete), Float.parseFloat(Entregad), Float.parseFloat(Tadicional), Float.parseFloat(Sadicional), Float.parseFloat(Seguros), Long.parseLong(Cliente), Observacion, vueloi, Float.parseFloat(Pesov), 0.0F, Telefono, Ruc, Integer.parseInt(Hora), Integer.parseInt(Minutos), Direccion, Integer.parseInt(Entregaen), Tipo, ttarifa, kgratis, Transito, Serie);
                   //System.out.println("========== Otros: " + dto.getGuinotros())  ;
                   model.guiaFacturaTemporal(dto);
                     model.setDtoToPrint(dto);
                    //System.out.println("=ad3se>");
                    model.setClienteCbx(Cliente);
                    model.setDestinoCbx(Destino);
                    pagina = "/Servlets/ModificaGuia.jsp";
                } else
                {
                    pagina = "/Servlets/NuevaGuia.jsp";
                }
            }
        }
        catch(SQLException e)
        {
            throw new ServletException("es Aqui " + e.getMessage());
        }
        String next = pagina;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un Error en esta p\341gina " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
    
}
