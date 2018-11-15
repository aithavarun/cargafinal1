// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:43:20
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Tipot.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Tipot
    implements Serializable
{

    public Tipot()
    {
    }

    public static Tipot load(ResultSet rs)
        throws SQLException
    {
        Tipot tipot = new Tipot();
        tipot.setSecuencial(rs.getLong(1));
        String valor = null;
        valor = rs.getString(2);
        if(valor != null)
            tipot.setNombre(valor);
        valor = rs.getString(3);
        if(valor != null)
            tipot.setObservacion(valor);
        return tipot;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public long getSecuencial()
    {
        return secuencial;
    }

    public void setSecuencial(long secuencial)
    {
        this.secuencial = secuencial;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getObservacion()
    {
        return observacion;
    }

    public void setObservacion(String observacion)
    {
        this.observacion = observacion;
    }

    private long secuencial;
    private String nombre;
    private String observacion;
}
