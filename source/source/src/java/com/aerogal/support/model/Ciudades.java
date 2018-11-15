// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:39:29
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Ciudades.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Ciudades
    implements Serializable
{

    public Ciudades()
    {
    }

    public static Ciudades load(ResultSet rs)
        throws SQLException
    {
        Ciudades ciudad = new Ciudades();
        String valor = null;
        valor = rs.getString(1);
        if(valor != null)
            ciudad.setCodigo(valor);
        ciudad.setNombre(rs.getString(2));
        ciudad.setWeb(rs.getInt(3));
        ciudad.setImpuesto(rs.getFloat(4));
        ciudad.setSeguro(rs.getFloat(5));
        ciudad.setTasa(rs.getFloat(6));
        ciudad.setAcceso(rs.getInt(7));
        ciudad.setContinente(rs.getString(8));
        return ciudad;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public String getCodigo()
    {
        return codigo;
    }

    public void setCodigo(String codigo)
    {
        this.codigo = codigo;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public int getWeb()
    {
        return web;
    }

    public void setWeb(int web)
    {
        this.web = web;
    }

    public int getAcceso()
    {
        return Acceso;
    }

    public void setAcceso(int Acceso)
    {
        this.Acceso = Acceso;
    }

    public float getImpuesto()
    {
        return impuesto;
    }

    public void setImpuesto(float impuesto)
    {
        this.impuesto = impuesto;
    }

    public float getSeguro()
    {
        return seguro;
    }

    public void setSeguro(float seguro)
    {
        this.seguro = seguro;
    }

    public float getTasa()
    {
        return tasa;
    }

    public void setTasa(float tasa)
    {
        this.tasa = tasa;
    }

    public String getContinente()
    {
        return continente;
    }

    public void setContinente(String continente)
    {
        this.continente = continente;
    }

    private String codigo;
    private String nombre;
    private int web;
    private float impuesto;
    private float seguro;
    private float tasa;
    private String continente;
    private int Acceso;
}
