// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:38:55
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Asientos.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Asientos
    implements Serializable
{

    public Asientos()
    {
    }

    public static Asientos load(ResultSet rs)
        throws SQLException
    {
        Asientos asiento = new Asientos();
        String valor = null;
        valor = rs.getString(1);
        if(valor != null)
            asiento.setCodigo(Integer.parseInt(valor));
        asiento.setFila(rs.getInt(2));
        asiento.setColumna(rs.getInt(3));
        valor = rs.getString(4);
        if(valor != null)
            asiento.setGrupo(valor);
        return asiento;
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

    public int getFila()
    {
        return fila;
    }

    public void setFila(int fila)
    {
        this.fila = fila;
    }

    public int getColumna()
    {
        return columna;
    }

    public void setColumna(int columna)
    {
        this.columna = columna;
    }

    public String getAsienton()
    {
        String c = "";
        if(columna == 1)
            c = "A";
        else
        if(columna == 2)
            c = "B";
        else
        if(columna == 3)
            c = "C";
        else
        if(columna == 5)
            c = "D";
        else
        if(columna == 6)
            c = "E";
        else
        if(columna == 7)
            c = "F";
        return String.valueOf(fila).trim() + c;
    }

    public String getGrupo()
    {
        return grupo;
    }

    public void setGrupo(String grupo)
    {
        this.grupo = grupo;
    }

    private int codigo;
    private int fila;
    private int columna;
    private String grupo;
}
