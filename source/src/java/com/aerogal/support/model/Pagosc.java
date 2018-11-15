// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:42:52
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Pagosc.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Pagosc
    implements Serializable
{

    public Pagosc()
    {
    }

    public static Pagosc load(ResultSet rs)
        throws SQLException
    {
        Pagosc pagosc = new Pagosc();
        String valor = null;
        valor = rs.getString(1);
        if(valor != null)
            pagosc.setTipo(valor);
        pagosc.setDocumento(rs.getString(2));
        pagosc.setObservacion(rs.getString(3));
        pagosc.setValor(rs.getFloat(4));
        return pagosc;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public String getTipo()
    {
        return tipo;
    }

    public void setTipo(String tipo)
    {
        this.tipo = tipo;
    }

    public String getDocumento()
    {
        return documento;
    }

    public void setDocumento(String documento)
    {
        this.documento = documento;
    }

    public String getObservacion()
    {
        return observacion;
    }

    public void setObservacion(String observacion)
    {
        this.observacion = observacion;
    }

    public float getValor()
    {
        return valor;
    }

    public void setValor(float valor)
    {
        this.valor = valor;
    }

    private long codigo;
    private String tipo;
    private String documento;
    private String observacion;
    private float valor;
}
