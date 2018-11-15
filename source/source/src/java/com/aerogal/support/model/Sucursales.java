// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:43:09
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Sucursales.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Sucursales
    implements Serializable
{

    public Sucursales()
    {
    }

    public static Sucursales load(ResultSet rs)
        throws SQLException
    {
        Sucursales sucursal = new Sucursales();
        String valor = null;
        valor = rs.getString(1);
        if(valor != null)
            sucursal.setCodigo(valor);
        sucursal.setDescripcion(rs.getString(2));
        sucursal.setAcceso(rs.getInt(3));
        sucursal.setSerie(rs.getString(4));
        sucursal.setManifiesto(rs.getLong(5));
        sucursal.setNumguia(rs.getLong(6));
        sucursal.setNumfac(rs.getLong(7));
        sucursal.setRangoguia(rs.getString(8));
        sucursal.setRangofactura(rs.getString(9));
        return sucursal;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public int getAcceso()
    {
        return acceso;
    }

    public void setAcceso(int acceso)
    {
        this.acceso = acceso;
    }

    public String getCodigo()
    {
        return codigo;
    }

    public void setCodigo(String codigo)
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

    public String getSerie()
    {
        return serie;
    }

    public void setSerie(String serie)
    {
        this.serie = serie;
    }

    public long getManifiesto()
    {
        return manifiesto;
    }

    public void setManifiesto(long manifiesto)
    {
        this.manifiesto = manifiesto;
    }
    
        public long getNumfac()
    {
        return numfac;
    }

    public void setNumfac(long numfac)
    {
        this.numfac = numfac;
    }
    
        public long getNumguia()
    {
        return numguia;
    }

    public void setNumguia(long numguia)
    {
        this.numguia = numguia;
    }
    
    
    public String getRangoguia()
    {
        return rguia;
    }

    public void setRangoguia(String rguia)
    {
        this.rguia = rguia;
    }

        public String getRangofactura()
    {
        return rfactura;
    }

    public void setRangofactura(String rfactura)
    {
        this.rfactura = rfactura;
    }
    
    private String codigo;
    private String descripcion;
    private int acceso;
    private String serie;
    private long manifiesto;
    private long numfac;
    private long numguia;
    private String rguia="";
    private String rfactura="";
}
