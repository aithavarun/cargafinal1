/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

/**
 *
 * @author nrubio
 */
public class GuiasBuscarGuiaAnularAction extends Action {

    @Override
    public void run() throws ServletException, IOException {

        String pagina = "";

        String buscarGuia = request.getParameter("buscarGuia");
        String anularGuia = request.getParameter("anularGuia");

        model.Limpiarlistas();
        model.setError(null);
        //System.out.println("lkjasdu-98a7sd");
        if (buscarGuia != null) {
            //System.out.println("jliasdh998y-0=*");
            // obteniendo los parametros del request
            String serie = request.getParameter("serie");
            String fechaInicio = request.getParameter("fechaInicio");
            String fechaFin = request.getParameter("fechaFin");
            String tipoDoc = request.getParameter("tipoDoc");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//			long numGuia = Long.parseLong(request.getParameter("numGuia"));
//			Calendar fechaEmision = Calendar.getInstance();
//			String tipoDoc = request.getParameter("tipoDoc");
//			fechaEmision.set(Integer.parseInt(request.getParameter("Anio")),
//					Integer.parseInt(request.getParameter("Mes")) - 1,
//					Integer.parseInt(request.getParameter("Dia")));

            try {
                
                //System.out.println("idhf0078nnx=*");
                //request.setAttribute("datos", numGuia + "|" + fechaEmision.getTime() + "|" + tipoDoc);
                //model.Guiaslista(dia, mes, anio);
//				model.BuscarGuiaxNumFecha(numGuia, fechaEmision.getTime().getTime(), tipoDoc);
                model.BuscarGuiaxSerie(serie, format.parse(fechaInicio).getTime(), format.parse(fechaFin).getTime(), tipoDoc);
                //model.setAccion("1");
                pagina = "/Servlets/AnularGuiaFactura.jsp";

            } catch (SQLException e) {
                throw new ServletException("No es posible encontrar Guia: " + e.getMessage(), e);
            } catch (ParseException pe) {
                throw new ServletException("Error con parseo de fecha: " + pe.getMessage(), pe);
            }

        } else if (anularGuia != null) {
            //System.out.println("oihASASDWh/**/");
            String[] codGuias = request.getParameterValues("codAnular");
//			long codGuia = Long.parseLong(request.getParameter("codAnular"));
//                          
            //System.out.println("oihASASDWh/*222*/");
            try {
                //System.out.println("oihASASDWh/*invalo*/");
                model.BuscarGuiaxCodigo(codGuias);
                //System.out.println("9jajdsf8**sdh8");    
                pagina = "/Servlets/ValidarAnulacion.jsp";
            } catch (SQLException ex) {
                throw new ServletException("No es posible encontrar Guia: " + ex.getMessage(), ex);
            }

        }

        RequestDispatcher rd = application.getRequestDispatcher(pagina);
        if (rd == null) {
            throw new ServletException("No Existe Vuelos para esa Fecha " + pagina);
        } else {
            rd.forward(request, response);
        }

    }
}
