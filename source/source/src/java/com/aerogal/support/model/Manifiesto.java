// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:42:03
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Manifiesto.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Manifiesto
    implements Serializable
{

    public Manifiesto()
    {
    }

    public static Manifiesto load(ResultSet rs)
        throws SQLException
    {
        Manifiesto manifiesto = new Manifiesto();
        long valor = 0L;
        valor = rs.getLong(1);
        manifiesto.setCodigo(valor);
        manifiesto.setNumero(rs.getLong(2));
        manifiesto.setFecha(rs.getDate(3));
        manifiesto.setVuelo(rs.getString(4));
        manifiesto.setEquipo(rs.getString(5));
        manifiesto.setPeso(rs.getFloat(6));
        manifiesto.setPiezas(rs.getInt(7));
        manifiesto.setUsuario(rs.getString(8));
        manifiesto.setObservacion(rs.getString(9));
        manifiesto.setSucursal(rs.getString(10));
        manifiesto.setOrigen(rs.getString(11));
        manifiesto.setDestino(rs.getString(12));
        return manifiesto;
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

    public long getNumero()
    {
        return nummanifiesto;
    }

    public void setNumero(long numero)
    {
        nummanifiesto = numero;
    }

    public Date getFecha()
    {
        return Fecha;
    }

    public void setFecha(Date Fecha)
    {
        this.Fecha = Fecha;
    }

    public int getPiezas()
    {
        return piezas;
    }

    public void setPiezas(int piezas)
    {
        this.piezas = piezas;
    }

    public float getPeso()
    {
        return peso;
    }

    public void setPeso(float peso)
    {
        this.peso = peso;
    }

    public String getSucursal()
    {
        return sucursal;
    }

    public void setSucursal(String sucursal)
    {
        this.sucursal = sucursal;
    }

    public String getObservacion()
    {
        return observaciones;
    }

    public void setObservacion(String observacion)
    {
        observaciones = observacion;
    }

    public String getUsuario()
    {
        return usuario;
    }

    public void setUsuario(String usuario)
    {
        this.usuario = usuario;
    }

    public String getVuelo()
    {
        return vuelo;
    }

    public void setVuelo(String vuelo)
    {
        this.vuelo = vuelo;
    }

    public String getEquipo()
    {
        return equipo;
    }

    public void setEquipo(String equipo)
    {
        this.equipo = equipo;
    }

    public String getOrigen()
    {
        return origen;
    }

    public void setOrigen(String origen)
    {
        this.origen = origen;
    }

    public String getDestino()
    {
        return destino;
    }

    public void setDestino(String destino)
    {
        this.destino = destino;
    }

    private String descripcion;
    private long codigo;
    private long nummanifiesto;
    private Date Fecha;
    private String vuelo;
    private String equipo;
    private String destinatario;
    private float peso;
    private int piezas;
    private String observaciones;
    private String sucursal;
    private String usuario;
    private String origen;
    private String destino;
}
