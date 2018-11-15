// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:43:49
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Vuelosreserva.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.*;

public class Vuelosreserva
    implements Serializable
{

    public Vuelosreserva()
    {
    }

    public static Vuelosreserva load(ResultSet rs)
        throws SQLException
    {
        Vuelosreserva vuelo = new Vuelosreserva();
        String valor = null;
        valor = rs.getString(1);
        if(valor != null)
            vuelo.setOrigen(valor);
        valor = rs.getString(2);
        if(valor != null)
            vuelo.setDestino(valor);
        vuelo.setHora(rs.getInt(3));
        vuelo.setMinuto(rs.getInt(4));
        vuelo.setFecha(rs.getTimestamp(5));
        valor = rs.getString(6);
        if(valor != null)
            vuelo.setNumero(valor);
        valor = rs.getString(7);
        if(valor != null)
            vuelo.setAvion(valor);
        vuelo.setCodigo(rs.getLong(8));
        vuelo.setCodigoavion(rs.getInt(9));
        return vuelo;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public String getOrigen()
    {
        return Origen;
    }

    public void setOrigen(String Origen)
    {
        this.Origen = Origen;
    }

    public String getDestino()
    {
        return Destino;
    }

    public void setDestino(String Destino)
    {
        this.Destino = Destino;
    }

    public String getAvion()
    {
        return Avion;
    }

    public void setAvion(String Avion)
    {
        this.Avion = Avion;
    }

    public String getNumero()
    {
        return Numero;
    }

    public void setNumero(String Numero)
    {
        this.Numero = Numero;
    }

    public int getHora()
    {
        return Hora;
    }

    public void setHora(int Hora)
    {
        this.Hora = Hora;
    }

    public int getMinuto()
    {
        return Minuto;
    }

    public void setMinuto(int Minuto)
    {
        this.Minuto = Minuto;
    }

    public int getCodigoavion()
    {
        return avionCod;
    }

    public void setCodigoavion(int avionCod)
    {
        this.avionCod = avionCod;
    }

    public void setFecha(Timestamp Fecha)
    {
        this.Fecha = Fecha;
    }

    public Timestamp getFecha()
    {
        return Fecha;
    }

    public void setCodigo(long Codigo)
    {
        this.Codigo = Codigo;
    }

    public long getCodigo()
    {
        return Codigo;
    }

    private String Origen;
    private String Destino;
    private String Avion;
    private String Numero;
    private int Hora;
    private int Minuto;
    private Timestamp Fecha;
    private long Codigo;
    private int avionCod;
}
