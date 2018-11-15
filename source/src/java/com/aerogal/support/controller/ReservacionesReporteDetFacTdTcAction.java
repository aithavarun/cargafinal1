/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

/**
 *
 * @author Cesar
 */
public class ReservacionesReporteDetFacTdTcAction extends Action{

    @Override
    public void run() throws ServletException, IOException {
       try{
            model.Limpiarlistas();
            String Salir = request.getParameter("Salir");
            String diaini = request.getParameter("Dia");
            String mesini = request.getParameter("Mes");
            String anioini = request.getParameter("Anio");
            String diafin = request.getParameter("Dia2");
            String mesfin = request.getParameter("Mes2");
            String aniofin = request.getParameter("Anio2");
            String sinvalprev= request.getParameter("sinvalprev");
            String descargarExc = request.getParameter("Buscar");
            String estacion =  request.getParameter("user_estacion");
                
            if(descargarExc!=null){
                model.setIsLoadedTabledT(1);
            }else{
                model.setIsLoadedTabledT(0);
            }
            
            int sinvali =0;
            if(sinvalprev!=null){
                sinvali = Integer.parseInt(sinvalprev);
            }
            int idia = 0;
            if (diaini == null) {
                idia = 0;
            } else {
                idia = Integer.parseInt(diaini);
            }
            int imes = 0;
            if (mesini == null) {
                imes = 0;
            } else {
                imes = Integer.parseInt(mesini);
            }
            int ianio = 0;
            if (anioini == null) {
                ianio = 0;
            } else {
                ianio = Integer.parseInt(anioini);
            }
            int idiaf = 0;
            if (diafin == null) {
                idiaf = 0;
            } else {
                idiaf = Integer.parseInt(diafin);
            }
            int imesf = 0;
            if (mesfin == null) {
                imesf = 0;
            } else {
                imesf = Integer.parseInt(mesfin);
            }
            int ianiof = 0;
            if (aniofin == null) {
                ianiof = 0;
            } else {
                ianiof = Integer.parseInt(aniofin);
            }

            model.obtenerDetFacturacionAR(idia, imes, ianio, idiaf, imesf, ianiof,0,sinvali);       
       }catch(Exception ex){
           throw new ServletException("No es posible encontrar Cierre de ventas POS : " + ex.getMessage());
       }  
       model.setError(null);
        String Idioma = "/Servlets/DetFactdtc.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if (rd == null) {
            throw new ServletException("Existe un error en Cierre de ventas POS " + next);
        } else {
            rd.forward(request, response);
            return;
        }
    }
    
}
