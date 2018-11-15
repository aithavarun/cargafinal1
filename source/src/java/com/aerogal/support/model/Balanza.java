// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:39:13
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Balanza.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.*;

public class Balanza
    implements Serializable
{

    public Balanza()
    {
    }

    public static Balanza load(ResultSet rs)
        throws SQLException
    {
        Balanza balanza = new Balanza();
        balanza.setPeso(rs.getFloat(1));
        balanza.setFecha(rs.getTimestamp(2));
        balanza.setSucursal(rs.getString(3));
        return balanza;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public float getPeso()
    {
        return peso;
    }

    public void setPeso(float peso)
    {
        this.peso = peso;
    }

    public Timestamp getFecha()
    {
        return fecha;
    }

    public void setFecha(Timestamp fecha)
    {
        this.fecha = fecha;
    }

    public String getSucursal()
    {
        return sucursal;
    }

    public void setSucursal(String sucursal)
    {
        this.sucursal = sucursal;
    }

    private float peso;
    private Timestamp fecha;
    private String sucursal;
}
