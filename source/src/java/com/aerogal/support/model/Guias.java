// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:41:55
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Guias.java

package com.aerogal.support.model;

import com.aerogal.support.controller.dto.GuiaDeCargaDTO;
import java.io.Serializable;
import java.sql.*;
import java.util.Date;

public class Guias
    implements Serializable
{

    public Guias()
    {
    }
    
    public static Guias load(GuiaDeCargaDTO dto)
    {
        Guias guia = new Guias();
        long valor = 0L;
        guia.setCodigo(valor);
        guia.setNumero(dto.getGuilnumero().intValue());
        guia.setFecha(dto.getGuidfecha());
        guia.setPiezas(dto.getGuiipiezas());
        guia.setPeso(dto.getGuinpeso());
        guia.setContiene(dto.getGuiscontiene());
        guia.setRemitente(dto.getGuisremitente());
        guia.setDestinatario(dto.getGuisdestinatario());
        guia.setRuc(dto.getGuisruc());
        guia.setTelefono(dto.getGuistelefono());
        guia.setCredito(dto.getGuincredito());
        guia.setCodcliente(dto.getClilcodigo().intValue());
        guia.setSucursal(dto.getGuissucursal());
        guia.setEntregaen(dto.getGuiientregaen());
        guia.setEntregadosino(0);
        guia.setFechae(toTimestamp(new Date()));
        guia.setQuienentrega("");
        guia.setObservacion(dto.getGuisobservacion());
        guia.setUsuario(dto.getGuisusuario());
        guia.setFlete(dto.getGuinflete());
        guia.setEdomicilio(dto.getGuinedomicilio());
        guia.setTransportea(dto.getGuintransportea());
        guia.setSeguro(dto.getGuinseguro());
        guia.setOtros(dto.getGuinotros());
        guia.setDescuento(dto.getGuindescuento());
        guia.setIva(dto.getGuiniva());
        guia.setTotal(dto.getGuintotal());
        guia.setVuelo(dto.getProlsecuencial());
        guia.setPesov(dto.getGuinpesovol());
        guia.setServicioa(dto.getGuinservicioa());
        guia.setHora(dto.getGuiihora());
        guia.setMinutos(dto.getGuiiminutos());
        guia.setTipo(dto.getGuisguiafactura());
        guia.setDireccion(dto.getGuisdireccion());
        guia.setOrigen(dto.getGuisorigen());
        guia.setDestino(dto.getGuisdestino());
        guia.setTipotar(dto.getTiplsecuencial());
        guia.setNombreCliente("");
        guia.setDescuentop(dto.getGuindescuentop());
        guia.setEstado("D");
        guia.setTransito(dto.getGuistransito());
        guia.setSerie(dto.getGuisserie());
        guia.setImpUIO(dto.getGuinimpuio());
        guia.setImpSCY(dto.getGuinimpscy());
        guia.setImpGPS(dto.getGuinimpgps());
        return guia;
    }

    public static Guias load(ResultSet rs)
        throws SQLException
    {
        Guias guia = new Guias();
        long valor = 0L;
        valor = rs.getLong(1);
        guia.setCodigo(valor);
        guia.setNumero(rs.getInt(2));
        guia.setFecha(rs.getDate(3));
        guia.setPiezas(rs.getInt(4));
        guia.setPeso(rs.getFloat(5));
        guia.setContiene(rs.getString(6));
        guia.setRemitente(rs.getString(7));
        guia.setDestinatario(rs.getString(8));
        guia.setRuc(rs.getString(9));
        guia.setTelefono(rs.getString(10));
        guia.setCredito(rs.getFloat(11));
        guia.setCodcliente(rs.getInt(12));
        guia.setSucursal(rs.getString(13));
        guia.setEntregaen(rs.getInt(14));
        guia.setEntregadosino(rs.getInt(15));
        guia.setFechae(rs.getTimestamp(16));
        guia.setQuienentrega(rs.getString(17));
        guia.setObservacion(rs.getString(18));
        guia.setUsuario(rs.getString(19));
        guia.setFlete(rs.getFloat(20));
        guia.setEdomicilio(rs.getFloat(21));
        guia.setTransportea(rs.getFloat(22));
        guia.setSeguro(rs.getFloat(23));
        guia.setOtros(rs.getFloat(24));
        guia.setDescuento(rs.getFloat(25));
        guia.setIva(rs.getFloat(26));
        guia.setTotal(rs.getFloat(27));
        guia.setVuelo(rs.getLong(28));
        guia.setPesov(rs.getFloat(29));
        guia.setServicioa(rs.getFloat(30));
        guia.setHora(rs.getInt(31));
        guia.setMinutos(rs.getInt(32));
        guia.setTipo(rs.getString(33));
        guia.setDireccion(rs.getString(34));
        guia.setOrigen(rs.getString(35));
        guia.setDestino(rs.getString(36));
        guia.setTipotar(rs.getInt(37));
        guia.setNombreCliente(rs.getString(38));
        guia.setDescuentop(rs.getFloat(39));
        guia.setEstado(rs.getString(40));
        guia.setTransito(rs.getString(41));
        guia.setSerie(rs.getString(42));
        guia.setImpUIO(rs.getFloat(43));
        guia.setImpGPS(rs.getFloat(44));
        guia.setImpSCY(rs.getFloat(45));
        return guia;
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

    public float getCredito()
    {
        return credito;
    }

    public void setCredito(float credito)
    {
        this.credito = credito;
    }

    public int getCodcliente()
    {
        return codcliente;
    }

    public void setCodcliente(int codcliente)
    {
        this.codcliente = codcliente;
    }

    public String getSucursal()
    {
        return sucursal;
    }

    public void setSucursal(String sucursal)
    {
        this.sucursal = sucursal;
    }

    public int getEntregaen()
    {
        return entregaen;
    }

    public void setEntregaen(int entregaen)
    {
        this.entregaen = entregaen;
    }

    public int getEntregadosino()
    {
        return entregadosino;
    }

    public void setEntregadosino(int entregadosino)
    {
        this.entregadosino = entregadosino;
    }

    public Timestamp getFechae()
    {
        return Fechae;
    }

    public void setFechae(Timestamp Fechae)
    {
        this.Fechae = Fechae;
    }

    public String getQuienentrega()
    {
        return quienentrega;
    }

    public void setQuienentrega(String quienentrega)
    {
        this.quienentrega = quienentrega;
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

    public float getTransportea()
    {
        return transportea;
    }

    public void setTransportea(float transportea)
    {
        this.transportea = transportea;
    }

    public float getSeguro()
    {
        return seguro;
    }

    public void setSeguro(float seguro)
    {
        this.seguro = seguro;
    }

    public float getOtros()
    {
        return otros;
    }

    public void setOtros(float otros)
    {
        this.otros = otros;
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

    public long getVuelo()
    {
        return prolsecuencial;
    }

    public void setVuelo(long prolsecuencial)
    {
        this.prolsecuencial = prolsecuencial;
    }

    public float getPesov()
    {
        return pesov;
    }

    public void setPesov(float pesov)
    {
        this.pesov = pesov;
    }

    public float getServicioa()
    {
        return servicioa;
    }

    public void setServicioa(float servicioa)
    {
        this.servicioa = servicioa;
    }

    public int getHora()
    {
        return hora;
    }

    public void setHora(int hora)
    {
        this.hora = hora;
    }

    public int getMinutos()
    {
        return minutos;
    }

    public void setMinutos(int minutos)
    {
        this.minutos = minutos;
    }

    public String getTipo()
    {
        return tipo;
    }

    public void setTipo(String tipo)
    {
        this.tipo = tipo;
    }

    public String getDireccion()
    {
        return direccion;
    }

    public void setDireccion(String direccion)
    {
        this.direccion = direccion;
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

    public int getTipotar()
    {
        return tipot;
    }

    public void setTipotar(int tipot)
    {
        this.tipot = tipot;
    }

    public String getNombreCliente()
    {
        return nombrecliente;
    }

    public void setNombreCliente(String nombrecliente)
    {
        this.nombrecliente = nombrecliente;
    }

    public float getDescuentop()
    {
        return descuentop;
    }

    public void setDescuentop(float descuentop)
    {
        this.descuentop = descuentop;
    }

    public String getEstado()
    {
        return estado;
    }

    public void setEstado(String estado)
    {
        this.estado = estado;
    }

    public String getTransito()
    {
        return transito;
    }

    public void setTransito(String transito)
    {
        this.transito = transito;
    }

    public String getSerie()
    {
        return serie;
    }

    public void setSerie(String serie)
    {
        this.serie = serie;
    }

    public float getImpUIO() {
        return ImpUIO;
    }

    public void setImpUIO(float ImpUIO) {
        this.ImpUIO = ImpUIO;
    }

    public float getImpGPS() {
        return ImpGPS;
    }

    public void setImpGPS(float ImpGPS) {
        this.ImpGPS = ImpGPS;
    }

    public float getImpSCY() {
        return ImpSCY;
    }

    public void setImpSCY(float ImpSCY) {
        this.ImpSCY = ImpSCY;
    }
    
    public static Timestamp toTimestamp(Date d) {
		return d == null ? null : new Timestamp(d.getTime());
	}

    private String descripcion;
    private long codigo;
    private int numero;
    private Date Fecha;
    private int piezas;
    private float peso;
    private String contiene;
    private String remitente;
    private String destinatario;
    private String ruc;
    private String telefono;
    private float credito;
    private int codcliente;
    private String sucursal;
    private int entregaen;
    private int entregadosino;
    private Timestamp Fechae;
    private String quienentrega;
    private String observacion;
    private String usuario;
    private float flete;
    private float edomicilio;
    private float transportea;
    private float seguro;
    private float otros;
    private float descuento;
    private float iva;
    private float total;
    private long prolsecuencial;
    private float pesov;
    private float servicioa;
    private int hora;
    private int minutos;
    private String tipo;
    private String direccion;
    private String origen;
    private String destino;
    private String numerov;
    private float tarifa;
    private float valorizacion;
    private int tipot;
    private String nombrecliente;
    private float descuentop;
    private String estado;
    private String transito;
    private String serie;
    private float ImpUIO;
    private float ImpGPS;
    private float ImpSCY;
            
}
