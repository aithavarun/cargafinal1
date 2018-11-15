/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.controller;

import com.aerogal.support.model.DetalleCobroTarjeta;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

/**
 *
 * @author Cesar
 */
public class ReservacionesCierreAction extends Action {

    @Override
    public void run() throws ServletException, IOException {
        String pagina = "/Servlets/CalculoCierrePos.jsp";
        try {  
            model.Limpiarlistas();
            String btnGuardar;
            String numeroCierre = "";
            String Observacion ="";
            String dia = request.getParameter("Dia").trim();
            String mes = request.getParameter("Mes").trim();
            String anio = request.getParameter("Anio").trim();
            btnGuardar = request.getParameter("Guardar");
            numeroCierre = request.getParameter("numeroCierre");
            Observacion = request.getParameter("Observacion");
            String valorCierre= request.getParameter("resultado");
            String estacion = request.getParameter("user_estacion");
            String cierre = "";
            int diaI = Integer.parseInt(dia);
            int mesI= Integer.parseInt(mes);
            int anioI = Integer.parseInt(anio);
            model.setError(null);
            model.setExito(null);
            //si es nulo o vacio, consultar
            if(btnGuardar ==null){
                //consultar el valor del cierre
                float resultado =model.cierrePOS(1, diaI , mesI , anioI, cierre,Observacion,estacion);
                model.setResultadoCierre(resultado);
                if(resultado==0){
                    model.setError("El valor de cierre es cero");
                    pagina = "/Servlets/CierreVentasPos.jsp";
                }else{
                    //consulta la cantidad de transacciones que ya poseen numero de cierre
                    float cont = model.cierrePOS(3, diaI, mesI, anioI, numeroCierre, Observacion,estacion);
                    //si es mayor que cero quiere decir que ese cierre ya existe y se debe presentar la advertencia
                    if(cont>0){
                        //recuperar la informacion registrada como numero de cierre y observacion
                        model.cierrePOS(4, diaI, mesI, anioI, numeroCierre, Observacion,estacion);
                        DetalleCobroTarjeta detalle = model.getDetalleCobro();
                        //se construye mensaje a mostrar
                        model.setError("El Número de cierre para la fecha " + anio+"-"+mes+"-"+dia +"  ya fue ingresado, corresponde a " + detalle.getNumero_cierre()+ "y tiene un valor de "+resultado+" con la siguiente Observación: ."+detalle.getObservaciones()); 
                        //se redirecciona a pagina inicial
                        pagina = "/Servlets/CierreVentasPos.jsp";
                    }
                }
                
            }
            //si btnGuardar tiene valor es porque se guiere registrar el cierre
            if(btnGuardar!= null){
                model.cierrePOS(2, diaI,mesI ,anioI ,numeroCierre,Observacion,estacion);
                model.setExito("El Número de cierre "+numeroCierre+" para la fecha " + anio+"-"+mes+"-"+dia +" fue ingresado con Exito, con un valor de "+valorCierre+" con la siguiente Observación: ."+Observacion);
                pagina = "/Servlets/CierreVentasPos.jsp";
            }

        } catch (Exception ex) {
            throw new ServletException("No es posible encontrar Cierre de ventas POS : " + ex.getMessage());
        }

        String next = pagina;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if (rd == null) {
            throw new ServletException("Existe un error en Cierre de ventas POS " + next);
        } else {
            rd.forward(request, response);
            return;
        }
    }

}
