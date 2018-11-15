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
 * @author capalacios
 */
public class ReservacionesReporteCierreVentasPosAction extends Action{

    @Override
    public void run() throws ServletException, IOException {
       try{
        model.setError(null);
        model.setExito(null);
        String Idioma = "/Servlets/CierreVentasPos.jsp";
        String next = Idioma;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if (rd == null) {
            throw new ServletException("Existe un error en Cierre de ventas POS " + next);
        } else {
            rd.forward(request, response);
            return;
        }
       }catch(Exception ex){
           throw new ServletException("No es posible encontrar Cierre de ventas POS : " + ex.getMessage());
       }  
    }
    
}
