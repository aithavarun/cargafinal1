// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:43:15
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Tarifasc.java
package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Tarifasc
        implements Serializable {

    public Tarifasc() {
    }

    public static Tarifasc load(ResultSet rs)
            throws SQLException {
        Tarifasc tarifac = new Tarifasc();
        tarifac.setCodigo(rs.getLong(1));
        String aux = "";
        tarifac.setMinimo(rs.getInt(2));
        tarifac.setTarifa(rs.getFloat(3));
        tarifac.setValorizacion(rs.getFloat(4));
        tarifac.setSeguro(rs.getFloat(5));
        tarifac.setIva(rs.getFloat(6));
        tarifac.setTipo(rs.getString(7));
        tarifac.setInicio(rs.getFloat(8));
        tarifac.setFin(rs.getFloat(9));
        tarifac.setContinente(rs.getString(10));
        tarifac.setSecuencialtipo(rs.getInt(11));
        tarifac.setValorizfija(rs.getInt(12));
        tarifac.setDescuento(rs.getFloat(13));
        tarifac.setFecha_creacion(rs.getDate(14));
        tarifac.setFecha_modificacion(rs.getDate(15));
        return tarifac;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public long getCodigo() {
        return codigo;
    }

    public void setMinimo(int minimo) {
        this.minimo = minimo;
    }

    public int getMinimo() {
        return minimo;
    }

    public void setTarifa(float tarifa) {
        this.tarifa = tarifa;
    }

    public float getTarifa() {
        return tarifa;
    }

    public void setValorizacion(float valorizacion) {
        this.valorizacion = valorizacion;
    }

    public float getValorizacion() {
        return valorizacion;
    }

    public void setSeguro(float seguro) {
        this.seguro = seguro;
    }

    public float getSeguro() {
        return seguro;
    }

    public void setIva(float iva) {
        this.iva = iva;
    }

    public float getIva() {
        return iva;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setSecuencialtipo(int secuencialtipo) {
        this.secuencialtipo = secuencialtipo;
    }

    public int getSecuencialTipo() {
        return secuencialtipo;
    }

    public void setInicio(float inicio) {
        this.inicio = inicio;
    }

    public float getInicio() {
        return inicio;
    }

    public void setFin(float fin) {
        this.fin = fin;
    }

    public float getFin() {
        return fin;
    }

    public void setContinente(String continente) {
        escontinente = continente;
    }

    public String getContinente() {
        return escontinente;
    }

    public void setValorizfija(int valorizfija) {
        this.valorizfija = valorizfija;
    }

    public int getValorizfija() {
        return valorizfija;
    }

    public void setDescuento(float descuento) {
        this.descuento = descuento;
    }

    public float getDescuento() {
        return descuento;
    }

    public Date getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(Date fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public Date getFecha_modificacion() {
        return fecha_modificacion;
    }

    public void setFecha_modificacion(Date fecha_modificacion) {
        this.fecha_modificacion = fecha_modificacion;
    }
        
    private long codigo;
    private int pesominimo;
    private float tarifadentro;
    private float valorizaciond;
    private float segurodentro;
    private float ivadentro;
    private float valorminimo;
    private float tarifafuera;
    private float tarnivafuera;
    private float tarnvalorizacionf;
    private float segurofuera;
    private String origen;
    private String destino;
    private int minimo;
    private float tarifa;
    private float valorizacion;
    private float seguro;
    private float iva;
    private String tipo;
    private float inicio;
    private float fin;
    private String escontinente;
    private int secuencialtipo;
    private int valorizfija;
    private float descuento;
    private Date fecha_creacion;
    private Date fecha_modificacion;
    
    @Override
    public String toString() {
        return "Tarifasc{" + "codigo=" + codigo + ", pesominimo=" + pesominimo + ", tarifadentro=" + tarifadentro + ", valorizaciond=" + valorizaciond + ", segurodentro=" + segurodentro + ", ivadentro=" + ivadentro + ", valorminimo=" + valorminimo + ", tarifafuera=" + tarifafuera + ", tarnivafuera=" + tarnivafuera + ", tarnvalorizacionf=" + tarnvalorizacionf + ", segurofuera=" + segurofuera + ", origen=" + origen + ", destino=" + destino + ", minimo=" + minimo + ", tarifa=" + tarifa + ", valorizacion=" + valorizacion + ", seguro=" + seguro + ", iva=" + iva + ", tipo=" + tipo + ", inicio=" + inicio + ", fin=" + fin + ", escontinente=" + escontinente + ", secuencialtipo=" + secuencialtipo + ", valorizfija=" + valorizfija + ", descuento=" + descuento + '}';
    }
    
    
}
