/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author capalacios
 */
public class GuiasAnuladas implements Serializable {

    public GuiasAnuladas() {
    }

    public static GuiasAnuladas load(ResultSet rs) throws SQLException {
        GuiasAnuladas guiasAnuladas = new GuiasAnuladas();
        guiasAnuladas.setNumero(rs.getInt(1));
        guiasAnuladas.setFecha(rs.getDate(2));
        guiasAnuladas.setPiezas(rs.getInt(3));
        guiasAnuladas.setPeso(rs.getFloat(4));
        guiasAnuladas.setContiene(rs.getString(5));
        guiasAnuladas.setRemitente(rs.getString(6));
        guiasAnuladas.setDestinatario(rs.getString(7));
        guiasAnuladas.setCredito(rs.getFloat(8));
        guiasAnuladas.setSucursal(rs.getString(9));
        guiasAnuladas.setUsuario(rs.getString(10));
        guiasAnuladas.setFlete(rs.getFloat(11));
        guiasAnuladas.setSeguro(rs.getFloat(12));
        guiasAnuladas.setOtros(rs.getFloat(13));
        guiasAnuladas.setIva(rs.getFloat(14));
        guiasAnuladas.setTotal(rs.getFloat(15));
        guiasAnuladas.setOrigen(rs.getString(16));
        guiasAnuladas.setDestino(rs.getString(17));
        return guiasAnuladas;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }

    public int getPiezas() {
        return piezas;
    }

    public void setPiezas(int piezas) {
        this.piezas = piezas;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public String getContiene() {
        return contiene;
    }

    public void setContiene(String contiene) {
        this.contiene = contiene;
    }

    public String getRemitente() {
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public float getCredito() {
        return credito;
    }

    public void setCredito(float credito) {
        this.credito = credito;
    }

    public String getSucursal() {
        return sucursal;
    }

    public void setSucursal(String sucursal) {
        this.sucursal = sucursal;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public float getFlete() {
        return flete;
    }

    public void setFlete(float flete) {
        this.flete = flete;
    }

    public float getSeguro() {
        return seguro;
    }

    public void setSeguro(float seguro) {
        this.seguro = seguro;
    }

    public float getOtros() {
        return otros;
    }

    public void setOtros(float otros) {
        this.otros = otros;
    }

    public float getIva() {
        return iva;
    }

    public void setIva(float iva) {
        this.iva = iva;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    private int numero;
    private Date Fecha;
    private int piezas;
    private float peso;
    private String contiene;
    private String remitente;
    private String destinatario;
    private float credito;
    private String sucursal;
    private String usuario;
    private float flete;
    private float seguro;
    private float otros;
    private float iva;
    private float total;
    private String origen;
    private String destino;

}
