// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:39:02
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Auditoria.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.*;

public class Auditoria
    implements Serializable
{

    public Auditoria()
    {
    }

    public static Auditoria load(ResultSet rs)
        throws SQLException
    {
        Auditoria auditoria = new Auditoria();
        auditoria.setFecha(rs.getTimestamp(1));
        auditoria.setObservaciones(rs.getString(2));
        auditoria.setUsuario(rs.getString(3));
        auditoria.setSecuencial(rs.getLong(4));
        auditoria.setTabla(rs.getString(5));
        return auditoria;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public Timestamp getFecha()
    {
        return fecha;
    }

    public void setFecha(Timestamp fecha)
    {
        this.fecha = fecha;
    }

    public String getObservaciones()
    {
        return observaciones;
    }

    public void setObservaciones(String observaciones)
    {
        this.observaciones = observaciones;
    }

    public String getUsuario()
    {
        return usuario;
    }

    public void setUsuario(String usuario)
    {
        this.usuario = usuario;
    }

    public long getSecuencial()
    {
        return secuencial;
    }

    public void setSecuencial(long secuencial)
    {
        this.secuencial = secuencial;
    }

    public String getTabla()
    {
        return tabla;
    }

    public void setTabla(String tabla)
    {
        this.tabla = tabla;
    }

    private Timestamp fecha;
    private String observaciones;
    private String usuario;
    private long secuencial;
    private String tabla;
}
