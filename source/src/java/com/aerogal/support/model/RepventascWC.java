// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:42:59
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Repventasc.java

package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class RepventascWC
    implements Serializable
{
    public RepventascWC()
    {
    }

    public static RepventascWC load(ResultSet rs)
        throws SQLException
    {
        //System.out.println("laksjd7877/*");
        RepventascWC repventac = new RepventascWC();
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
        repventac.setCanje(rs.getFloat(18));//aka retencion
        repventac.setCheque(rs.getFloat(19));
        repventac.setTdebito(rs.getFloat(20));
        repventac.setTcredito(rs.getFloat(21));
        repventac.setCliente(rs.getString(22));
        repventac.setPesov(rs.getFloat(23));
        repventac.setPeso(rs.getFloat(24));
        repventac.setEstado(rs.getString(25));
        repventac.setOtros(rs.getFloat(26));
        repventac.setFecha(rs.getDate(27));
        
        repventac.setImpUIO(rs.getFloat(28));
        repventac.setImpGPS(rs.getFloat(29));
        repventac.setImpSCY(rs.getFloat(30));
        repventac.setTarifaNeta(rs.getFloat(31));
        repventac.setDetbancoTD((rs.getString(32)));
        repventac.setDetfranquiciaTD((rs.getString(33)));
        repventac.setFecha_vencimientoTD((rs.getString(34)));
        repventac.setUltimosdigitosTD((rs.getString(35)));
        repventac.setNumero_autorizacionTD((rs.getString(36)));
        repventac.setDetbancoTC((rs.getString(37)));
        repventac.setDetfranquiciaTC((rs.getString(38)));
        repventac.setFecha_vencimientoTC((rs.getString(39)));
        repventac.setUltimosdigitosTC((rs.getString(40)));
        repventac.setNumero_autorizacionTC((rs.getString(41)));
        repventac.setNumero_cierre((rs.getString(42)));

//        if(repventac.getTipo()!=null){
//            if(repventac.getTipo().equals("CC")){
//                repventac.setValorTC(repventac.getValor());
//                repventac.setDetbancoTC(repventac.getDetbanco());
//                repventac.setDetfranquiciaTC(repventac.getDetfranquicia());
//                repventac.setFecha_vencimientoTC(repventac.getFecha_vencimiento());
//                repventac.setUltimosdigitosTC(repventac.getUltimosdigitos());
//                repventac.setNumero_autorizacionTC(repventac.getNumero_autorizacion());
//            }
//            if(repventac.getTipo().equals("DC")){
//                repventac.setValorTD(repventac.getValor());
//                repventac.setDetbancoTD(repventac.getDetbanco());
//                repventac.setDetfranquiciaTD(repventac.getDetfranquicia());
//                repventac.setFecha_vencimientoTD(repventac.getFecha_vencimiento());
//                repventac.setUltimosdigitosTD(repventac.getUltimosdigitos());
//                repventac.setNumero_autorizacionTD(repventac.getNumero_autorizacion());
//            }
//        }
        //System.out.println("lksdu8s97/*");
        //return reorder(repventac);
        return repventac;
    }
/**
 * Metodo para reasignar corretamente los valores a utilizar en el resporte, si es TC o TD en sus respectivos campos.
 * @param venta
 * @return 
 */
//        public static RepventascWC reorder(RepventascWC venta){
//        RepventascWC repventaWc = venta;
//        if(repventaWc.getTipo().equals("CC")){
//            repventaWc.setValorTC(repventaWc.getValor());
//            repventaWc.setDetbancoTC(repventaWc.getDetbanco());
//            repventaWc.setDetfranquiciaTC(repventaWc.getDetfranquicia());
//            repventaWc.setFecha_vencimientoTC(repventaWc.getFecha_vencimiento());
//            repventaWc.setUltimosdigitosTC(repventaWc.getUltimosdigitos());
//            repventaWc.setNumero_autorizacionTC(repventaWc.getNumero_autorizacion());
//            repventaWc.setNumero_cierreTC(repventaWc.getNumero_cierre());
//        }
//        if(repventaWc.getTipo().equals("DC")){
//            repventaWc.setValorTD(repventaWc.getValor());
//            repventaWc.setDetbancoTD(repventaWc.getDetbanco());
//            repventaWc.setDetfranquiciaTD(repventaWc.getDetfranquicia());
//            repventaWc.setFecha_vencimientoTD(repventaWc.getFecha_vencimiento());
//            repventaWc.setUltimosdigitosTD(repventaWc.getUltimosdigitos());
//            repventaWc.setNumero_autorizacionTD(repventaWc.getNumero_autorizacion());
//            repventaWc.setNumero_cierreTD(repventaWc.getNumero_cierre());
//        }
//        return repventaWc;
//    }
//        
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
        this.tipo = Tipo;
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
    private String Origen;
    private String Destino;
    private float flete;
    private float edomicilio;
    private float servicioa;
    private float seguro;
    private float descuento;
    private float iva;
    private float total;
    private String tipo;
    private float valor;
    private String observacion;
    private String usuario;
    private float efectivo;
    private float credito;
    private float canje;
    private String micliente;
    private float peso;
    private float pesov;
    private float otros;
    private String estado;
    private Date Fecha;
    
    private float impUIO;
    private float impGPS;
    private float impSCY;
    
    private float tarifaNeta;
    private float Cheque;
//    private String detbanco;
//    private String detfranquicia;
//    private String fecha_vencimiento;
//    private String ultimosdigitos;
//    private String numero_autorizacion; 
    private String numero_cierre;
    
    
    //tarjeta debito
    private float Tdebito;
    private String detbancoTD;
    private String detfranquiciaTD;
    private String fecha_vencimientoTD;
    private String ultimosdigitosTD;
    private String numero_autorizacionTD; 

    //Tarjeta credito
    
    private float Tcredito;
    private String detbancoTC;
    private String detfranquiciaTC;
    private String fecha_vencimientoTC;
    private String ultimosdigitosTC;
    private String numero_autorizacionTC;

    public float getTarifaNeta() {
        return tarifaNeta;
    }

    public void setTarifaNeta(float tarifaNeta) {
        this.tarifaNeta = tarifaNeta;
    }

    public float getCheque() {
        return Cheque;
    }

    public void setCheque(float Cheque) {
        this.Cheque = Cheque;
    }

    public float getTdebito() {
        return Tdebito;
    }

    public void setTdebito(float Tdebito) {
        this.Tdebito = Tdebito;
    }

    public float getTcredito() {
        return Tcredito;
    }

    public void setTcredito(float Tcredito) {
        this.Tcredito = Tcredito;
    }
    
    

//    public String getDetbanco() {
//        return detbanco;
//    }
//
//    public void setDetbanco(String detbanco) {
//        this.detbanco = detbanco;
//    }
//
//    public String getDetfranquicia() {
//        return detfranquicia;
//    }
//
//    public void setDetfranquicia(String detfranquicia) {
//        this.detfranquicia = detfranquicia;
//    }
//
//    public String getFecha_vencimiento() {
//        return fecha_vencimiento;
//    }
//
//    public void setFecha_vencimiento(String fecha_vencimiento) {
//        this.fecha_vencimiento = fecha_vencimiento;
//    }
//
//    public String getUltimosdigitos() {
//        return ultimosdigitos;
//    }
//
//    public void setUltimosdigitos(String ultimosdigitos) {
//        this.ultimosdigitos = ultimosdigitos;
//    }
//
//    public String getNumero_autorizacion() {
//        return numero_autorizacion;
//    }
//
//    public void setNumero_autorizacion(String numero_autorizacion) {
//        this.numero_autorizacion = numero_autorizacion;
//    }

    public String getNumero_cierre() {
        return numero_cierre;
    }

    public void setNumero_cierre(String numero_cierre) {
        this.numero_cierre = numero_cierre;
    }

//    public float getValorTD() {
//        return valorTD;
//    }
//
//    public void setValorTD(float valorTD) {
//        this.valorTD = valorTD;
//    }

    public String getDetbancoTD() {
        return detbancoTD;
    }

    public void setDetbancoTD(String detbancoTD) {
        this.detbancoTD = detbancoTD;
    }

    public String getDetfranquiciaTD() {
        return detfranquiciaTD;
    }

    public void setDetfranquiciaTD(String detfranquiciaTD) {
        this.detfranquiciaTD = detfranquiciaTD;
    }

    public String getFecha_vencimientoTD() {
        return fecha_vencimientoTD;
    }

    public void setFecha_vencimientoTD(String fecha_vencimientoTD) {
        this.fecha_vencimientoTD = fecha_vencimientoTD;
    }

    public String getUltimosdigitosTD() {
        return ultimosdigitosTD;
    }

    public void setUltimosdigitosTD(String ultimosdigitosTD) {
        this.ultimosdigitosTD = ultimosdigitosTD;
    }

    public String getNumero_autorizacionTD() {
        return numero_autorizacionTD;
    }

    public void setNumero_autorizacionTD(String numero_autorizacionTD) {
        this.numero_autorizacionTD = numero_autorizacionTD;
    }

//    public float getValorTC() {
//        return valorTC;
//    }
//
//    public void setValorTC(float valorTC) {
//        this.valorTC = valorTC;
//    }

    public String getDetbancoTC() {
        return detbancoTC;
    }

    public void setDetbancoTC(String detbancoTC) {
        this.detbancoTC = detbancoTC;
    }

    public String getDetfranquiciaTC() {
        return detfranquiciaTC;
    }

    public void setDetfranquiciaTC(String detfranquiciaTC) {
        this.detfranquiciaTC = detfranquiciaTC;
    }

    public String getFecha_vencimientoTC() {
        return fecha_vencimientoTC;
    }

    public void setFecha_vencimientoTC(String fecha_vencimientoTC) {
        this.fecha_vencimientoTC = fecha_vencimientoTC;
    }

    public String getUltimosdigitosTC() {
        return ultimosdigitosTC;
    }

    public void setUltimosdigitosTC(String ultimosdigitosTC) {
        this.ultimosdigitosTC = ultimosdigitosTC;
    }

    public String getNumero_autorizacionTC() {
        return numero_autorizacionTC;
    }

    public void setNumero_autorizacionTC(String numero_autorizacionTC) {
        this.numero_autorizacionTC = numero_autorizacionTC;
    }    
}
