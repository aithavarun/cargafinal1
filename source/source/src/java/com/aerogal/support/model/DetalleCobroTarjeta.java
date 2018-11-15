/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Cesar
 */
public class DetalleCobroTarjeta implements Serializable{
    
    
    public static DetalleCobroTarjeta load(ResultSet rs)
        throws SQLException
    {
        DetalleCobroTarjeta detalle = new DetalleCobroTarjeta();
        detalle.setNumero_cierre(rs.getString(1));
        detalle.setObservaciones(rs.getString(2));
        return detalle;
    }

    public static DetalleCobroTarjeta loadFull(ResultSet rs)
        throws SQLException
    {
        DetalleCobroTarjeta detalle = new DetalleCobroTarjeta();
        detalle.setId_detalletarjeta(rs.getInt(1));
        detalle.setDetbanco(rs.getString(2));
        detalle.setDetfranquicia(rs.getString(3));
        detalle.setDetpagocarga(rs.getInt(4));
        detalle.setFecha_vencimiento(rs.getString(5));
        detalle.setUltimosdigitos(rs.getString(6));
        detalle.setNumero_autorizacion(rs.getString(7));
        detalle.setNumero_cierre(rs.getString(8));
        detalle.setObservaciones(rs.getString(9));
        detalle.setDownloaded(rs.getInt(10));
        detalle.setPagstipo(rs.getString(11));
        detalle.setPagnvalor(rs.getFloat(12));
        return detalle;
    }
        
    public String getNumero_cierre() {
        return numero_cierre;
    }

    public void setNumero_cierre(String numero_cierre) {
        this.numero_cierre = numero_cierre;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public int getId_detalletarjeta() {
        return id_detalletarjeta;
    }

    public void setId_detalletarjeta(int id_detalletarjeta) {
        this.id_detalletarjeta = id_detalletarjeta;
    }

    public String getDetbanco() {
        return detbanco;
    }

    public void setDetbanco(String detbanco) {
        this.detbanco = detbanco;
    }

    public String getDetfranquicia() {
        return detfranquicia;
    }

    public void setDetfranquicia(String detfranquicia) {
        this.detfranquicia = detfranquicia;
    }

    public int getDetpagocarga() {
        return detpagocarga;
    }

    public void setDetpagocarga(int detpagocarga) {
        this.detpagocarga = detpagocarga;
    }

    public String getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(String fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    public String getUltimosdigitos() {
        return ultimosdigitos;
    }

    public void setUltimosdigitos(String ultimosdigitos) {
        this.ultimosdigitos = ultimosdigitos;
    }

    public String getNumero_autorizacion() {
        return numero_autorizacion;
    }

    public void setNumero_autorizacion(String numero_autorizacion) {
        this.numero_autorizacion = numero_autorizacion;
    }

    public int getDownloaded() {
        return downloaded;
    }

    public void setDownloaded(int downloaded) {
        this.downloaded = downloaded;
    }

    public String getPagstipo() {
        return pagstipo;
    }

    public void setPagstipo(String pagstipo) {
        this.pagstipo = pagstipo;
    }

    public Float getPagnvalor() {
        return pagnvalor;
    }

    public void setPagnvalor(Float pagnvalor) {
        this.pagnvalor = pagnvalor;
    }

    private String numero_cierre;
    private String observaciones;
    private int id_detalletarjeta;
    private String detbanco;
    private String detfranquicia;
    private int detpagocarga;
    private String fecha_vencimiento;
    private String ultimosdigitos;
    private String numero_autorizacion;
    private int downloaded;
    private String pagstipo;
    private Float pagnvalor;
    
}
