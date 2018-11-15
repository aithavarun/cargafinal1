// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:39:35
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Clientesc.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Clientesc
    implements Serializable
{

    public Clientesc()
    {
    }

    public static Clientesc load(ResultSet rs)
        throws SQLException
    {
        Clientesc clientec = new Clientesc();
        String valor = null;
        valor = rs.getString(1);
        clientec.setCodigo(rs.getInt(1));
        clientec.setNombre(rs.getString(2));
        clientec.setDireccion(rs.getString(3));
        clientec.setCiudad(rs.getString(4));
        clientec.setTelefono(rs.getString(5));
        clientec.setRuc(rs.getString(6));
        clientec.setCredito(rs.getFloat(7));
        clientec.setVendedor(rs.getString(8));
        clientec.setSaldo(rs.getFloat(9));
        clientec.setCuenta(rs.getString(10));
        clientec.setCodigos(rs.getString(11));
        clientec.setContribuyente(rs.getInt(12));
        clientec.setDescuento(rs.getFloat(13));
        clientec.setMindescuento(rs.getFloat(14));
        clientec.setDiagratis(rs.getInt(15));
        clientec.setGratisHasta(rs.getFloat(16));
        clientec.setNombretarifa(rs.getString(17));
        clientec.setTipotarifa(rs.getInt(18));
        clientec.setCreditoContado(rs.getString(19));
        clientec.setClicorreo(rs.getString(20));
        return clientec;
    }

    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer();
        //return sb.toString();
    
        return "Clientesc{" + "codigo=" + codigo + ", nombre=" + nombre + ", direccion=" + direccion + ", ciudad=" + ciudad + ", telefono=" + telefono + ", vendedor=" + vendedor + ", cuenta=" + cuenta + ", credito=" + credito + ", saldo=" + saldo + ", ruc=" + ruc + ", codigos=" + codigos + ", Contribuyente=" + Contribuyente + ", descuento=" + descuento + ", mindescuento=" + mindescuento + ", diagratis=" + diagratis + ", gratishasta=" + gratishasta + ", nombretarifa=" + nombretarifa + ", tipotarifa=" + tipotarifa + ", creditocontado=" + creditocontado + ", clicorreo=" + clicorreo + '}'+"["+sb.toString()+"]";
        
    }

    

    public int getCodigo()
    {
        return codigo;
    }

    public void setCodigo(int codigo)
    {
        this.codigo = codigo;
    }

    public int getContribuyente()
    {
        return Contribuyente;
    }

    public void setContribuyente(int Contribuyente)
    {
        this.Contribuyente = Contribuyente;
    }

    public String getCodigos()
    {
        return codigos;
    }

    public void setCodigos(String codigos)
    {
        this.codigos = codigos;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getDireccion()
    {
        return direccion;
    }

    public void setDireccion(String direccion)
    {
        this.direccion = direccion;
    }

    public String getCiudad()
    {
        return ciudad;
    }

    public void setCiudad(String ciudad)
    {
        this.ciudad = ciudad;
    }

    public String getTelefono()
    {
        return telefono;
    }

    public void setTelefono(String telefono)
    {
        this.telefono = telefono;
    }

    public String getRuc()
    {
        return ruc;
    }

    public void setRuc(String ruc)
    {
        this.ruc = ruc;
    }

    public float getCredito()
    {
        return credito;
    }

    public void setCredito(float credito)
    {
        this.credito = credito;
    }

    public String getVendedor()
    {
        return vendedor;
    }

    public void setVendedor(String vendedor)
    {
        this.vendedor = vendedor;
    }

    public float getSaldo()
    {
        return saldo;
    }

    public void setSaldo(float saldo)
    {
        this.saldo = saldo;
    }

    public String getCuenta()
    {
        return cuenta;
    }

    public void setCuenta(String cuenta)
    {
        this.cuenta = cuenta;
    }

    public float getDescuento()
    {
        return descuento;
    }

    public void setDescuento(float descuento)
    {
        this.descuento = descuento;
    }

    public float getMindescuento()
    {
        return mindescuento;
    }

    public void setMindescuento(float mindescuento)
    {
        this.mindescuento = mindescuento;
    }

    public int getDiagratis()
    {
        return diagratis;
    }

    public void setDiagratis(int diagratis)
    {
        this.diagratis = diagratis;
    }

    public float getGratisHasta()
    {
        return gratishasta;
    }

    public void setGratisHasta(float gratishasta)
    {
        this.gratishasta = gratishasta;
    }

    public String getNombretarifa()
    {
        return nombretarifa;
    }

    public void setNombretarifa(String nombretarifa)
    {
        this.nombretarifa = nombretarifa;
    }

    public int getTipotarifa()
    {
        return tipotarifa;
    }

    public void setTipotarifa(int tipotarifa)
    {
        this.tipotarifa = tipotarifa;
    }

    public String getCreditoContado()
    {
        return creditocontado;
    }

    public void setCreditoContado(String creditocontado)
    {
        this.creditocontado = creditocontado;
    }

    private int codigo;
    private String nombre;
    private String direccion;
    private String ciudad;
    private String telefono;
    private String vendedor;
    private String cuenta;
    private float credito;
    private float saldo;
    private String ruc;
    private String codigos;
    private int Contribuyente;
    private float descuento;
    private float mindescuento;
    private int diagratis;
    private float gratishasta;
    private String nombretarifa;
    private int tipotarifa;
    private String creditocontado;
    private String clicorreo;

    public String getClicorreo() {
        if (clicorreo == null) {
            return "";
        }
        return clicorreo;
    }

    public void setClicorreo(String clicorreo) {
        this.clicorreo = clicorreo;
    }
}
