// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:39:08
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Aviones.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Aviones
    implements Serializable
{

    public Aviones()
    {
    }

    public static Aviones load(ResultSet rs)
        throws SQLException
    {
        Aviones avion = new Aviones();
        String valor = null;
        valor = rs.getString(1);
        if(valor != null)
            avion.setDescripcion(valor);
        avion.setCodigo(rs.getInt(2));
        avion.setCapacidadPax(rs.getInt(3));
        avion.setCapacidadCarga(rs.getFloat(4));
        return avion;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public int getCodigo()
    {
        return codigo;
    }

    public void setCodigo(int codigo)
    {
        this.codigo = codigo;
    }

    public String getDescripcion()
    {
        return descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }

    public int getCapacidadPax()
    {
        return capacidadpax;
    }

    public void setCapacidadPax(int capacidadpax)
    {
        this.capacidadpax = capacidadpax;
    }

    public float getCapacidadCarga()
    {
        return capacidadcarga;
    }

    public void setCapacidadCarga(float capacidadcarga)
    {
        this.capacidadcarga = capacidadcarga;
    }

    private String descripcion;
    private int codigo;
    private int capacidadpax;
    private float capacidadcarga;
}
