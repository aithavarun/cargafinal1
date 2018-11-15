// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:39:42
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Comision.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Comision
    implements Serializable
{

    public Comision()
    {
    }

    public static Comision load(ResultSet rs)
        throws SQLException
    {
        Comision Comisiones = new Comision();
        Comisiones.setCodigocli(rs.getInt(1));
        String valor = null;
        valor = rs.getString(2);
        if(valor != null)
            Comisiones.setBase(valor);
        Comisiones.setValor(rs.getFloat(3));
        Comisiones.setCodigo(rs.getInt(4));
        return Comisiones;
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

    public int getCodigocli()
    {
        return clicodigo;
    }

    public void setCodigocli(int clicodigo)
    {
        this.clicodigo = clicodigo;
    }

    public float getValor()
    {
        return Valor;
    }

    public void setValor(float Valor)
    {
        this.Valor = Valor;
    }

    public String getBase()
    {
        return Tarifa;
    }

    public void setBase(String Tarifa)
    {
        this.Tarifa = Tarifa;
    }

    private int codigo;
    private int clicodigo;
    private String Tarifa;
    private float Valor;
}
