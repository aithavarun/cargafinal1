// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:39:51
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Descuentosc.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Descuentosc
    implements Serializable
{

    public Descuentosc()
    {
    }

    public static Descuentosc load(ResultSet rs)
        throws SQLException
    {
        Descuentosc descuentoc = new Descuentosc();
        descuentoc.setCodigo(rs.getLong(1));
        descuentoc.setClicodigo(rs.getLong(2));
        descuentoc.setOrigen(rs.getString(3));
        descuentoc.setDestino(rs.getString(4));
        descuentoc.setDescuento(rs.getFloat(5));
        descuentoc.setMindescuento(rs.getFloat(6));
        return descuentoc;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public long getCodigo()
    {
        return Codigo;
    }

    public void setCodigo(long Codigo)
    {
        this.Codigo = Codigo;
    }

    public long getClicodigo()
    {
        return Clicodigo;
    }

    public void setClicodigo(long Clicodigo)
    {
        this.Clicodigo = Clicodigo;
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

    public float getDescuento()
    {
        return Descuento;
    }

    public void setDescuento(float Descuento)
    {
        this.Descuento = Descuento;
    }

    public float getMindescuento()
    {
        return Mindescuento;
    }

    public void setMindescuento(float Mindescuento)
    {
        this.Mindescuento = Mindescuento;
    }

    public String getUsuario()
    {
        return Usuario;
    }

    public void setUsuario(String Usuario)
    {
        this.Usuario = Usuario;
    }

    private long Codigo;
    private long Clicodigo;
    private String Origen;
    private String Destino;
    private float Descuento;
    private float Mindescuento;
    private String Usuario;
}
