// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:41:48
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Grupos.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Grupos
    implements Serializable
{

    public Grupos()
    {
    }

    public static Grupos load(ResultSet rs)
        throws SQLException
    {
        Grupos grupo = new Grupos();
        String valor = null;
        valor = rs.getString(1);
        if(valor != null)
            grupo.setCodigo(valor);
        grupo.setNombre(rs.getString(2));
        return grupo;
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
        return descripcion;
    }

    public void setNombre(String descripcion)
    {
        this.descripcion = descripcion;
    }

    private String descripcion;
    private String codigo;
}
