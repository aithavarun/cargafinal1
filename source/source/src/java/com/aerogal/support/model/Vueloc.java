// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:43:42
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Vueloc.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

// Referenced classes of package com.aerogal.support.model:
//            Util

public class Vueloc
    implements Serializable
{

    public Vueloc()
    {
    }

    public static Vueloc load(ResultSet rs)
        throws SQLException
    {
        Vueloc vuelos = new Vueloc();
        String value = null;
        vuelos.setCodigo(rs.getLong(1));
        value = rs.getString(2);
        if(value != null)
            vuelos.setOrigen(value);
        value = rs.getString(3);
        if(value != null)
            vuelos.setDestino(value);
        vuelos.setHora(rs.getInt(4));
        vuelos.setMinuto(rs.getInt(5));
        vuelos.setPax(rs.getInt(6));
        vuelos.setInfantes(rs.getInt(7));
        vuelos.setPaxreservados(rs.getInt(8));
        vuelos.setInfantesn(rs.getInt(9));
        value = rs.getString(10);
        if(value != null)
            vuelos.setNumero(value);
        value = rs.getString(11);
        if(value != null)
            vuelos.setAvion(value);
        vuelos.setCodavion(rs.getInt(12));
        vuelos.setFecha(rs.getDate(13));
        return vuelos;
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        if(getOrigen() != null)
            sb.append(Util.quote(getOrigen()));
        sb.append(",");
        if(getDestino() != null)
            sb.append(Util.quote(getDestino()));
        sb.append(",");
        if(getNumero() != null)
            sb.append(Util.quote(getNumero()));
        sb.append(",");
        if(getAvion() != null)
            sb.append(Util.quote(getAvion()));
        sb.append(",");
        sb.append(",");
        sb.append(getCodigo());
        return sb.toString();
    }

    public int getHora()
    {
        return hora;
    }

    public void setHora(int hora)
    {
        this.hora = hora;
    }

    public int getMinuto()
    {
        return minuto;
    }

    public void setMinuto(int minuto)
    {
        this.minuto = minuto;
    }

    public String getOrigen()
    {
        return Origen;
    }

    public void setOrigen(String Origen)
    {
        this.Origen = Origen;
    }

    public String getDestino()
    {
        return Destino;
    }

    public void setDestino(String Destino)
    {
        this.Destino = Destino;
    }

    public int getInfantesn()
    {
        return infantes;
    }

    public void setInfantesn(int infantes)
    {
        this.infantes = infantes;
    }

    public int getPaxreservados()
    {
        return pax;
    }

    public void setPaxreservados(int pax)
    {
        this.pax = pax;
    }

    public int getPax()
    {
        return numpax;
    }

    public void setPax(int numpax)
    {
        this.numpax = numpax;
    }

    public int getInfantes()
    {
        return numinfantes;
    }

    public void setInfantes(int numinfantes)
    {
        this.numinfantes = numinfantes;
    }

    public String getNumero()
    {
        return Numero;
    }

    public void setNumero(String Numero)
    {
        this.Numero = Numero;
    }

    public String getAvion()
    {
        return Avion;
    }

    public void setAvion(String Avion)
    {
        this.Avion = Avion;
    }

    public long getCodigo()
    {
        return Codigo;
    }

    public void setCodigo(long Codigo)
    {
        this.Codigo = Codigo;
    }

    public int getCodavion()
    {
        return codavion;
    }

    public void setCodavion(int codavion)
    {
        this.codavion = codavion;
    }

    public Date getFecha()
    {
        return fecha;
    }

    public void setFecha(Date fecha)
    {
        this.fecha = fecha;
    }

    private String Origen;
    private String Destino;
    private String Numero;
    private String Avion;
    private int pax;
    private int infantes;
    private int numpax;
    private int numinfantes;
    private long Codigo;
    private int hora;
    private int minuto;
    private int codavion;
    private Date fecha;
}
