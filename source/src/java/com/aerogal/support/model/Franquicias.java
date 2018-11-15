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
public class Franquicias implements Serializable{

    public static Franquicias load(ResultSet rs) throws SQLException {
        Franquicias franquicia = new Franquicias();
        franquicia.setIniciales(rs.getString(1));
        franquicia.setNombre_franquicia(rs.getString(2));
        return franquicia;
    }
    public String toString() {
        StringBuffer sb = new StringBuffer();
        return sb.toString();
    }

    protected String iniciales;
    protected String nombre_franquicia;

    public String getIniciales() {
        return iniciales;
    }

    public void setIniciales(String iniciales) {
        this.iniciales = iniciales;
    }

    public String getNombre_franquicia() {
        return nombre_franquicia;
    }

    public void setNombre_franquicia(String nombre_franquicia) {
        this.nombre_franquicia = nombre_franquicia;
    }

}
