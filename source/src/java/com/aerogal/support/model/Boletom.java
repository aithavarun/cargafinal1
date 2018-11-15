// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:39:22
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Boletom.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.*;

public class Boletom
    implements Serializable
{

    public Boletom()
    {
    }

    public static Boletom load(ResultSet rs)
        throws SQLException
    {
        Boletom boletom = new Boletom();
        String aux = rs.getString(1);
        if(aux != null)
            boletom.setOrigen(aux);
        aux = rs.getString(2);
        if(aux != null)
            boletom.setDestino(aux);
        boletom.setFecha(rs.getTimestamp(3));
        aux = rs.getString(4);
        if(aux != null)
            boletom.setApellido(aux);
        aux = rs.getString(5);
        if(aux != null)
            boletom.setNombre(aux);
        boletom.setBoleto(rs.getLong(6));
        boletom.setBoletoant(rs.getLong(7));
        boletom.setTarifa(rs.getFloat(8));
        boletom.setQ(rs.getFloat(9));
        boletom.setIva(rs.getFloat(10));
        boletom.setTasa(rs.getFloat(11));
        boletom.setSeguro(rs.getFloat(12));
        boletom.setComision(rs.getFloat(13));
        boletom.setSc(rs.getFloat(14));
        boletom.setPenalidad(rs.getFloat(15));
        boletom.setEfectivo(rs.getFloat(16));
        boletom.setTarjeta(rs.getFloat(17));
        boletom.setCheque(rs.getFloat(18));
        boletom.setOtros(rs.getFloat(19));
        aux = rs.getString(20);
        if(aux != null)
            boletom.setObservacion(aux);
        return boletom;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public void setOrigen(String Origen)
    {
        this.Origen = Origen;
    }

    public String getOrigen()
    {
        return Origen;
    }

    public void setDestino(String Destino)
    {
        this.Destino = Destino;
    }

    public String getDestino()
    {
        return Destino;
    }

    public void setFecha(Timestamp Fecha)
    {
        this.Fecha = Fecha;
    }

    public Timestamp getFecha()
    {
        return Fecha;
    }

    public void setApellido(String Apellido)
    {
        this.Apellido = Apellido;
    }

    public String getApellido()
    {
        return Apellido;
    }

    public void setNombre(String Nombre)
    {
        this.Nombre = Nombre;
    }

    public String getNombre()
    {
        return Nombre;
    }

    public void setBoleto(long Boleto)
    {
        this.Boleto = Boleto;
    }

    public long getBoleto()
    {
        return Boleto;
    }

    public void setBoletoant(long Boletoant)
    {
        this.Boletoant = Boletoant;
    }

    public long getBoletoant()
    {
        return Boletoant;
    }

    public void setTarifa(float Tarifa)
    {
        this.Tarifa = Tarifa;
    }

    public float getTarifa()
    {
        return Tarifa;
    }

    public void setQ(float Q)
    {
        this.Q = Q;
    }

    public float getQ()
    {
        return Q;
    }

    public void setIva(float Iva)
    {
        this.Iva = Iva;
    }

    public float getIva()
    {
        return Iva;
    }

    public void setTasa(float Tasa)
    {
        this.Tasa = Tasa;
    }

    public float getTasa()
    {
        return Tasa;
    }

    public void setSeguro(float Seguro)
    {
        this.Seguro = Seguro;
    }

    public float getSeguro()
    {
        return Seguro;
    }

    public void setComision(float Comision)
    {
        this.Comision = Comision;
    }

    public float getComision()
    {
        return Comision;
    }

    public void setSc(float Sc)
    {
        this.Sc = Sc;
    }

    public float getSc()
    {
        return Sc;
    }

    public void setPenalidad(float Penalidad)
    {
        this.Penalidad = Penalidad;
    }

    public float getPenalidad()
    {
        return Penalidad;
    }

    public void setEfectivo(float Efectivo)
    {
        this.Efectivo = Efectivo;
    }

    public float getEfectivo()
    {
        return Efectivo;
    }

    public void setTarjeta(float Tarjeta)
    {
        this.Tarjeta = Tarjeta;
    }

    public float getTarjeta()
    {
        return Tarjeta;
    }

    public void setCheque(float Cheque)
    {
        this.Cheque = Cheque;
    }

    public float getCheque()
    {
        return Cheque;
    }

    public void setOtros(float Otros)
    {
        this.Otros = Otros;
    }

    public float getOtros()
    {
        return Otros;
    }

    public void setObservacion(String Observacion)
    {
        this.Observacion = Observacion;
    }

    public String getObservacion()
    {
        return Observacion;
    }

    private String Origen;
    private String Destino;
    private Timestamp Fecha;
    private String Apellido;
    private String Nombre;
    private long Boleto;
    private long Boletoant;
    private float Tarifa;
    private float Q;
    private float Iva;
    private float Tasa;
    private float Seguro;
    private float Comision;
    private float Sc;
    private float Penalidad;
    private float Efectivo;
    private float Tarjeta;
    private float Cheque;
    private float Otros;
    private String Observacion;
}
