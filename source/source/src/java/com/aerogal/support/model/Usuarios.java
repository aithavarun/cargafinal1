// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:43:25
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Usuarios.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

// Referenced classes of package com.aerogal.support.model:
//            Util

public class Usuarios
    implements Serializable
{

    public Usuarios()
    {
    }

    public static Usuarios load(ResultSet rs)
        throws SQLException
    {
        Usuarios usuario = new Usuarios();
        String valor = null;
        valor = rs.getString(1);
        if(valor != null)
            usuario.setNombre(valor);
        valor = rs.getString(2);
        if(valor != null)
            usuario.setCodigo(valor);
        valor = rs.getString(3);
        if(valor != null)
            usuario.setGrupo(valor);
        valor = rs.getString(4);
        if(valor != null)
            usuario.setSucursal(valor);
        usuario.setTipo(rs.getInt(5));
        usuario.setAcceso(rs.getInt(6));
        usuario.setNombreCompleto(rs.getString(7));
        usuario.setNumfac(rs.getLong(8));
        usuario.setNumguia(rs.getLong(9));
        return usuario;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        if(getCodigo() != null)
            sb.append(Util.quote(getCodigo()));
        if(getNombre() != null)
            sb.append(Util.quote(getNombre()));
        if(getGrupo() != null)
            sb.append(Util.quote(getGrupo()));
        if(getSucursal() != null)
            sb.append(Util.quote(getSucursal()));
        return sb.toString();
    }

    public int getTipo()
    {
        return tipo;
    }

    public void setTipo(int tipo)
    {
        this.tipo = tipo;
    }

    public int getAcceso()
    {
        return Acceso;
    }

    public void setAcceso(int Acceso)
    {
        this.Acceso = Acceso;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getCodigo()
    {
        return codigo;
    }

    public void setCodigo(String codigo)
    {
        this.codigo = codigo;
    }

    public String getGrupo()
    {
        return grupo;
    }

    public void setGrupo(String grupo)
    {
        this.grupo = grupo;
    }

    public String getSucursal()
    {
        return sucursal;
    }

    public void setSucursal(String sucursal)
    {
        this.sucursal = sucursal;
    }

    public String getNombreCompleto()
    {
        return nombrecompleto;
    }

    public void setNombreCompleto(String nombrecompleto)
    {
        this.nombrecompleto = nombrecompleto;
    }

    public long getNumguia()
    {
        return numguia;
    }

    public void setNumguia(long numguia)
    {
        this.numguia = numguia;
    }

    public long getNumfac()
    {
        return numfac;
    }

    public void setNumfac(long numfac)
    {
        this.numfac = numfac;
    }

    private String nombre;
    private String nombrecompleto;
    private String codigo;
    private String grupo;
    private String sucursal;
    private int tipo;
    private int Acceso;
    private long numfac;
    private long numguia;
}
