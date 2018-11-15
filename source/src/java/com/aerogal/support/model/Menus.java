// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:42:08
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Menus.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Menus
    implements Serializable
{

    public Menus()
    {
    }

    public static Menus load(ResultSet rs)
        throws SQLException
    {
        Menus menu = new Menus();
        menu.setCodmenu(rs.getInt(1));
        menu.setCodperfil(rs.getInt(2));
        menu.setClave(rs.getString(3));
        menu.setNombre(rs.getString(4));
        menu.setPosicion(rs.getString(5));
        return menu;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    public int getCodmenu()
    {
        return codmenu;
    }

    public void setCodmenu(int codmenu)
    {
        this.codmenu = codmenu;
    }

    public int getCodperfil()
    {
        return codperfil;
    }

    public void setCodperfil(int codperfil)
    {
        this.codperfil = codperfil;
    }

    public String getClave()
    {
        return clave;
    }

    public void setClave(String clave)
    {
        this.clave = clave;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getPosicion()
    {
        return posicion;
    }

    public void setPosicion(String posicion)
    {
        this.posicion = posicion;
    }

    private int codmenu;
    private int codperfil;
    private String clave;
    private String nombre;
    private String posicion;
}
