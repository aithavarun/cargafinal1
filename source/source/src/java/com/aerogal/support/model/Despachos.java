// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:39:57
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Despachos.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.*;
import java.util.Date;

public class Despachos
    implements Serializable
{

    public Despachos()
    {
    }

    public static Despachos load(ResultSet rs)
        throws SQLException
    {
        Despachos despacho = new Despachos();
        long valor = 0L;
        valor = rs.getLong(1);
        despacho.setCodigo(valor);
        despacho.setNumero(rs.getInt(2));
        despacho.setFecha(rs.getDate(3));
        despacho.setPiezas(rs.getInt(4));
        despacho.setPeso(rs.getFloat(5));
        despacho.setPesov(rs.getFloat(6));
        despacho.setContiene(rs.getString(7));
        despacho.setRemitente(rs.getString(8));
        despacho.setDestinatario(rs.getString(9));
        despacho.setRuc(rs.getString(10));
        despacho.setTelefono(rs.getString(11));
        despacho.setDireccion(rs.getString(12));
        despacho.setQuienr(rs.getString(13));
        despacho.setCedulaqr(rs.getString(14));
        despacho.setObservacion(rs.getString(15));
        despacho.setFechar(rs.getTimestamp(16));
        despacho.setOrigen(rs.getString(17));
        despacho.setDestino(rs.getString(18));
        despacho.setNombrecliente(rs.getString(19));
        despacho.setCodcliente(rs.getInt(20));
        despacho.setEntregado(rs.getInt(21));
        despacho.setTelefonor(rs.getString(22));
        return despacho;
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

    public int getNumero()
    {
        return numero;
    }

    public void setNumero(int numero)
    {
        this.numero = numero;
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

    public float getPesov()
    {
        return pesov;
    }

    public void setPesov(float pesov)
    {
        this.pesov = pesov;
    }

    public String getContiene()
    {
        return contiene;
    }

    public void setContiene(String contiene)
    {
        this.contiene = contiene;
    }

    public String getRemitente()
    {
        return remitente;
    }

    public void setRemitente(String remitente)
    {
        this.remitente = remitente;
    }

    public String getDestinatario()
    {
        return destinatario;
    }

    public void setDestinatario(String destinatario)
    {
        this.destinatario = destinatario;
    }

    public String getRuc()
    {
        return ruc;
    }

    public void setRuc(String ruc)
    {
        this.ruc = ruc;
    }

    public String getTelefono()
    {
        return telefono;
    }

    public void setTelefono(String telefono)
    {
        this.telefono = telefono;
    }

    public String getDireccion()
    {
        return direccion;
    }

    public void setDireccion(String direccion)
    {
        this.direccion = direccion;
    }

    public String getQuienr()
    {
        return quienr;
    }

    public void setQuienr(String quienr)
    {
        this.quienr = quienr;
    }

    public String getCedulaqr()
    {
        return cedulaqr;
    }

    public void setCedulaqr(String cedulaqr)
    {
        this.cedulaqr = cedulaqr;
    }

    public String getObservacion()
    {
        return observacion;
    }

    public void setObservacion(String observacion)
    {
        this.observacion = observacion;
    }

    public Timestamp getFechar()
    {
        return fechar;
    }

    public void setFechar(Timestamp fechar)
    {
        this.fechar = fechar;
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

    public String getNombrecliente()
    {
        return nombrecliente;
    }

    public void setNombrecliente(String nombrecliente)
    {
        this.nombrecliente = nombrecliente;
    }

    public int getCodcliente()
    {
        return codcliente;
    }

    public void setCodcliente(int codcliente)
    {
        this.codcliente = codcliente;
    }

    public int getEntregado()
    {
        return entregado;
    }

    public void setEntregado(int entregado)
    {
        this.entregado = entregado;
    }

    public String getTelefonor()
    {
        return telefonor;
    }

    public void setTelefonor(String telefonor)
    {
        this.telefonor = telefonor;
    }

    private long codigo;
    private int numero;
    private Date Fecha;
    private int piezas;
    private float peso;
    private float pesov;
    private String contiene;
    private String remitente;
    private String destinatario;
    private String ruc;
    private String telefono;
    private String direccion;
    private String quienr;
    private String cedulaqr;
    private String observacion;
    private Timestamp fechar;
    private String origen;
    private String destino;
    private String nombrecliente;
    private int codcliente;
    private int entregado;
    private String telefonor;
}
