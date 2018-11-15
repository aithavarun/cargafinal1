// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:40:02
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Free.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Free
    implements Serializable
{

    public Free()
    {
    }

    public static Free load(ResultSet rs)
        throws SQLException
    {
        Free free = new Free();
        free.setCodigo(rs.getLong(1));
        free.setClicodigo(rs.getLong(2));
        free.setDia(rs.getInt(3));
        free.setKilos(rs.getFloat(4));
        return free;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public long getCodigo()
    {
        return codigo;
    }

    public void setCodigo(long codigo)
    {
        this.codigo = codigo;
    }

    public long getClicodigo()
    {
        return cliente;
    }

    public void setClicodigo(long cliente)
    {
        this.cliente = cliente;
    }

    public int getDia()
    {
        return dia;
    }

    public void setDia(int dia)
    {
        this.dia = dia;
    }

    public float getKilos()
    {
        return kilos;
    }

    public void setKilos(float kilos)
    {
        this.kilos = kilos;
    }

    private long codigo;
    private int dia;
    private float kilos;
    private long cliente;
}
