// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:42:59
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Repventasc.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Repventasc
    implements Serializable
{

    public Repventasc()
    {
    }

    public static Repventasc load(ResultSet rs)
        throws SQLException
    {
        //System.out.println("laksjd7877/*");
        Repventasc repventac = new Repventasc();
        repventac.setCodigo(rs.getLong(1));
        repventac.setNumero(rs.getLong(2));
        repventac.setOrigen(rs.getString(3));
        repventac.setDestino(rs.getString(4));
        repventac.setFlete(rs.getFloat(5));
        repventac.setEdomicilio(rs.getFloat(6));
        repventac.setServicioa(rs.getFloat(7));
        repventac.setSeguro(rs.getFloat(8));
        repventac.setDescuento(rs.getFloat(9));
        repventac.setIva(rs.getFloat(10));
        repventac.setTotal(rs.getFloat(11));
        repventac.setTipo(rs.getString(12));
        repventac.setValor(rs.getFloat(13));
        repventac.setObservacion(rs.getString(14));
        repventac.setUsuario(rs.getString(15));
        repventac.setEfectivo(rs.getFloat(16));
        repventac.setCredito(rs.getFloat(17));
        repventac.setCanje(rs.getFloat(18));
        repventac.setCliente(rs.getString(19));
        repventac.setPesov(rs.getFloat(20));
        repventac.setPeso(rs.getFloat(21));
        repventac.setEstado(rs.getString(22));
        repventac.setOtros(rs.getFloat(23));
        repventac.setFecha(rs.getDate(24));
        
        repventac.setImpUIO(rs.getFloat(25));
        repventac.setImpGPS(rs.getFloat(26));
        repventac.setImpSCY(rs.getFloat(27));
        repventac.setTarifaNeta(rs.getFloat(28));
        //System.out.println("lksdu8s97/*");
        return repventac;
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
        return numero;
    }

    public void setNumero(long numero)
    {
        this.numero = numero;
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

    public float getFlete()
    {
        return flete;
    }

    public void setFlete(float flete)
    {
        this.flete = flete;
    }

    public float getEdomicilio()
    {
        return edomicilio;
    }

    public void setEdomicilio(float edomicilio)
    {
        this.edomicilio = edomicilio;
    }

    public float getServicioa()
    {
        return servicioa;
    }

    public void setServicioa(float servicioa)
    {
        this.servicioa = servicioa;
    }

    public float getSeguro()
    {
        return seguro;
    }

    public void setSeguro(float seguro)
    {
        this.seguro = seguro;
    }

    public float getDescuento()
    {
        return descuento;
    }

    public void setDescuento(float descuento)
    {
        this.descuento = descuento;
    }

    public float getIva()
    {
        return iva;
    }

    public void setIva(float iva)
    {
        this.iva = iva;
    }

    public float getTotal()
    {
        return total;
    }

    public void setTotal(float total)
    {
        this.total = total;
    }

    public String getTipo()
    {
        return tipo;
    }

    public void setTipo(String Tipo)
    {
        tipo = tipo;
    }

    public float getValor()
    {
        return valor;
    }

    public void setValor(float valor)
    {
        this.valor = valor;
    }

    public String getObservacion()
    {
        return observacion;
    }

    public void setObservacion(String observacion)
    {
        this.observacion = observacion;
    }

    public String getUsuario()
    {
        return usuario;
    }

    public void setUsuario(String usuario)
    {
        this.usuario = usuario;
    }

    public void setEfectivo(float efectivo)
    {
        this.efectivo = efectivo;
    }

    public float getEfectivo()
    {
        return efectivo;
    }

    public void setCredito(float credito)
    {
        this.credito = credito;
    }

    public float getCredito()
    {
        return credito;
    }

    public void setCanje(float canje)
    {
        this.canje = canje;
    }

    public float getCanje()
    {
        return canje;
    }

    public void setCliente(String micliente)
    {
        this.micliente = micliente;
    }

    public String getCliente()
    {
        return micliente;
    }

    public void setPesov(float pesov)
    {
        this.pesov = pesov;
    }

    public float getPesov()
    {
        return pesov;
    }

    public void setPeso(float peso)
    {
        this.peso = peso;
    }

    public float getPeso()
    {
        return peso;
    }

    public void setEstado(String estado)
    {
        this.estado = estado;
    }

    public String getEstado()
    {
        return estado;
    }

    public void setOtros(float otros)
    {
        this.otros = otros;
    }

    public float getOtros()
    {
        return otros;
    }

    public Date getFecha()
    {
        return Fecha;
    }

    public void setFecha(Date Fecha)
    {
        this.Fecha = Fecha;
    }

    /**
     * @return the impUIO
     */
    public float getImpUIO() {
        return impUIO;
    }

    /**
     * @param impUIO the impUIO to set
     */
    public void setImpUIO(float impUIO) {
        this.impUIO = impUIO;
    }

    /**
     * @return the impGPS
     */
    public float getImpGPS() {
        return impGPS;
    }

    /**
     * @param impGPS the impGPS to set
     */
    public void setImpGPS(float impGPS) {
        this.impGPS = impGPS;
    }

    /**
     * @return the impSCY
     */
    public float getImpSCY() {
        return impSCY;
    }

    /**
     * @param impSCY the impSCY to set
     */
    public void setImpSCY(float impSCY) {
        this.impSCY = impSCY;
    }

    private long codigo;
    private long numero;
    String Origen;
    String Destino;
    private float flete;
    private float edomicilio;
    private float servicioa;
    private float seguro;
    private float descuento;
    private float iva;
    private float total;
    String tipo;
    private float valor;
    String observacion;
    String usuario;
    private float efectivo;
    private float credito;
    private float canje;
    String micliente;
    private float peso;
    private float pesov;
    private float otros;
    String estado;
    private Date Fecha;
    
    private float impUIO;
    private float impGPS;
    private float impSCY;
    
    private float tarifaNeta;

    public float getTarifaNeta() {
        return tarifaNeta;
    }

    public void setTarifaNeta(float tarifaNeta) {
        this.tarifaNeta = tarifaNeta;
    }
}
