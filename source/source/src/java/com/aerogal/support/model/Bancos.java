/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aerogal.support.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Cesar
 */
public class Bancos implements Serializable {

    public static Bancos load(ResultSet rs) throws SQLException {
        Bancos banco = new Bancos();
        banco.setInciales(rs.getString(1));
        banco.setNombre_banco(rs.getString(2));
        return banco;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }
    protected String inciales;
    protected String nombre_banco;

    public String getInciales() {
        return inciales;
    }

    public void setInciales(String inciales) {
        this.inciales = inciales;
    }

    public String getNombre_banco() {
        return nombre_banco;
    }

    public void setNombre_banco(String nombre_banco) {
        this.nombre_banco = nombre_banco;
    }

}
