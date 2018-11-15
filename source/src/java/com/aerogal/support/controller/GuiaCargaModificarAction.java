// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:58:34
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   GuiaCargaModificarAction.java

package com.aerogal.support.controller;

import com.aerogal.support.controller.dto.GuiaDeCargaDTO;
import com.aerogal.support.model.Guias;
import com.aerogal.support.model.Modl_1_1;
import com.aerogal.support.model.Usuarios;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class GuiaCargaModificarAction extends Action
{

    public GuiaCargaModificarAction()
    {
    }

    public void run()
        throws ServletException, IOException
    {
        model.Limpiarlistas();
        String Origen = request.getParameter("Origen").toUpperCase().trim();
        String Destino = request.getParameter("Destino").toUpperCase().trim();
        String Transito = request.getParameter("Transito").toUpperCase().trim();
        String Cliente = request.getParameter("Cliente");
        String Nguia = request.getParameter("Nguia").trim();
        String Mese = request.getParameter("Mese").trim();
        String Diae = request.getParameter("Diae").trim();
        String Anioe = request.getParameter("Anioe").trim();
        String Piezas = request.getParameter("piezas").trim();
        String Peso = request.getParameter("peso").trim();
        String Contiene = request.getParameter("Contiene").trim();
        String Remitente = request.getParameter("Remitente").toUpperCase().trim();
        String Destinatario = request.getParameter("Destinatario").toUpperCase().trim();
        String Observacion = request.getParameter("Observacion").toUpperCase().trim();
        String Flete = request.getParameter("Flete").trim();
        //String Entregad = request.getParameter("Edomicilio").trim();
        //String Tadicional = request.getParameter("Tadicional").trim();
        String Entregad = "0";
        String Tadicional ="0";
        String Sadicional ="0"; 
        if(request.getParameter("Sadicional")==null){
           Sadicional ="0"; 
        }else{
            Sadicional = request.getParameter("Sadicional").trim();
        }
        String Seguros = request.getParameter("Seguros").trim();
        String Pesov = request.getParameter("pesovolumen").trim();
        String codigo = request.getParameter("codigo").trim();
        String descuento="0";
        if(request.getParameter("Descuentos")==null){
            descuento = "0";
        }else{
            descuento = request.getParameter("Descuentos").trim();
        }
        String Calcular = request.getParameter("Calcula");
        String Pagos = request.getParameter("Pagos");
        String Efectivo = request.getParameter("Efectivo");
        String Credito = request.getParameter("Credito");
        String Retencion = request.getParameter("Retencion");
        String Cheque = request.getParameter("cheque");
        String tCredito = request.getParameter("tCredito");
        String tDebito = request.getParameter("tDebito");
        String franquiciasDeb = request.getParameter("franquiciasDeb");
        String franquiciasCred = request.getParameter("franquiciasCred");
        String bancosDeb = request.getParameter("bancosDeb");
        String bancosCred = request.getParameter("bancosCred");
        String mesDeb = request.getParameter("mesDeb");
        String anioDeb = request.getParameter("anioDeb");
        String dateVenDeb = mesDeb +"/"+ anioDeb;
        String mesCred = request.getParameter("mesCred");
        String anioCred = request.getParameter("anioCred");
        String dateVenCred = mesCred +"/"+ anioCred;
        String fourDigDeb = request.getParameter("fourDigDeb");
        String fourDigCred = request.getParameter("fourDigCred");
        String numberAuthDeb = request.getParameter("numberAuthDeb");
        String numberAuthCred = request.getParameter("numberAuthCred");
        String Aplica = request.getParameter("Aplica");
        String Hora = request.getParameter("Hora");
        String Minutos = request.getParameter("Minutos");
        String Telefono = request.getParameter("Telefono");
        String Ruc = request.getParameter("Ruc");
        String tipo = request.getParameter("Tipo");
        String direccion = request.getParameter("Direccion");
        String Entregaen = request.getParameter("Entregaen");
        String Tipot = request.getParameter("Tipot");
        String ImprimeMec = request.getParameter("ImprimirMec");
        String ImprimeNueva = request.getParameter("ImprimirNuevoFormato");
        String Imprime2017 = request.getParameter("ImprimirFormato2017");
        String ImprimeGYE = request.getParameter("ImprimirFormatoGYE");
        String Direccion = request.getParameter("Direccion");
        String Tipo = request.getParameter("Tipo").trim();
        String Serie = request.getParameter("Serie").trim();

        String Pesoaux = "0";
        int midia = 0;
        Calendar inicio = Calendar.getInstance();
        inicio.set(Integer.parseInt(Anioe), Integer.parseInt(Mese) - 1, Integer.parseInt(Diae));
        midia = inicio.get(7);
        if(midia == 1)
            midia = 7;
        else
            midia--;
        float kgratis = 0.0F;
        long vueloi = 0L;
        long tarifai = 0L;
        float pago = 0.0F;
        String Continente = "-1";
        int ttarifa = -1;
        int tarifa = -1;
        String Salir = request.getParameter("Salir");
        String Grabar = request.getParameter("Grabar");
        String pagina ="";
        if (Calcular != null ) {
             pagina = "/Servlets/GuiadeCarga.jsp";   
        }
        try
        {
            model.setError(null);
            if(Aplica != null)
            {
                Continente = model.TraerContinenteono(Origen, Destino);
                ttarifa = Integer.parseInt(Tipot);
                if(Float.parseFloat(Pesov) <= 0.0F)
                    Pesoaux = Peso;
                else
                    Pesoaux = Pesov;
                tarifa = model.BuscarTarifaCargaxpeso(Continente, Destino, Float.parseFloat(Pesoaux), ttarifa, Origen);
                if(ttarifa == -1 || tarifa == -1)
                {
                    model.setError("Tarifa no Encontradax" + Pesov + Peso + ttarifa + tarifa);
                } else
                {
                    kgratis = model.BuscarKilosgratis(Integer.parseInt(Cliente), midia);
                    model.ModificaGuiaCargaC(Long.parseLong(codigo), Origen, Destino, Integer.parseInt(Mese), Integer.parseInt(Diae), Integer.parseInt(Anioe), Integer.parseInt(Piezas), Float.parseFloat(Peso), Contiene, Remitente, Destinatario, Float.parseFloat(Flete), Float.parseFloat(Entregad), Float.parseFloat(Tadicional), Float.parseFloat(Sadicional), Float.parseFloat(Seguros), Long.parseLong(Cliente), Observacion, vueloi, Float.parseFloat(Pesov), Float.parseFloat(descuento), Integer.parseInt(Hora), Integer.parseInt(Minutos), Telefono, Ruc, tipo, direccion, Integer.parseInt(Entregaen), ttarifa, kgratis, Transito);
                }
                model.BuscarGuia(Long.parseLong(codigo));
                model.Grabarbitacoraguia(Long.parseLong(codigo), " TipoTarifa:" + ttarifa + " Origen:" + Origen + " Destino:" + Destino + " Cliente:" + Cliente + " Piezas:" + Piezas + " Peso:" + Peso + " Pesov:" + Pesov, "Cambio de Tarifa ", model.getUsuarios().getNombre());
                //System.out.println("=123se>");
                pagina = "/Servlets/ModificaGuia.jsp";
            } else
            if(Calcular != null)
            {
                if (!Origen.equals(Destino)) {
                    Continente = model.TraerContinenteono(Origen, Destino);
                    ttarifa = model.BuscarTipotarifaCliente(Integer.parseInt(Cliente));
                    if(Float.parseFloat(Pesov) <= 0.0F)
                        Pesoaux = Peso;
                    else
                        Pesoaux = Pesov;
                    tarifa = model.BuscarTarifaCargaxpeso(Continente, Destino, Float.parseFloat(Pesoaux), ttarifa, Origen);
                    if(ttarifa == -1 || tarifa == -1)
                    {
                        model.setError("Tarifa no Encontrada, Seleccione un Cliente");
                    } else
                    {
                        kgratis = model.BuscarKilosgratis(Integer.parseInt(Cliente), midia);
                        model.ModificaGuiaCargaC(Long.parseLong(codigo), Origen, Destino, Integer.parseInt(Mese), Integer.parseInt(Diae), Integer.parseInt(Anioe), Integer.parseInt(Piezas), Float.parseFloat(Peso), Contiene, Remitente, Destinatario, Float.parseFloat(Flete), Float.parseFloat(Entregad), Float.parseFloat(Tadicional), Float.parseFloat(Sadicional), Float.parseFloat(Seguros), Long.parseLong(Cliente), Observacion, vueloi, Float.parseFloat(Pesov), Float.parseFloat(descuento), Integer.parseInt(Hora), Integer.parseInt(Minutos), Telefono, Ruc, tipo, direccion, Integer.parseInt(Entregaen), ttarifa, kgratis, Transito);
                    }
                }else{
                    model.setError("El Destino no puede ser igual al Origen");
                }
                
//                model.BuscarGuia(Long.parseLong(codigo));
                GuiaDeCargaDTO dto = model.InsertaGuiaCargaCTemp(Origen, Destino, Long.parseLong(Nguia), Integer.parseInt(Mese), Integer.parseInt(Diae), Integer.parseInt(Anioe), Integer.parseInt(Piezas), Float.parseFloat(Peso), Contiene, Remitente, Destinatario, Float.parseFloat(Flete), Float.parseFloat(Entregad), Float.parseFloat(Tadicional), Float.parseFloat(Sadicional), Float.parseFloat(Seguros), Long.parseLong(Cliente), Observacion, vueloi, Float.parseFloat(Pesov), 0.0F, Telefono, Ruc, Integer.parseInt(Hora), Integer.parseInt(Minutos), Direccion, Integer.parseInt(Entregaen), Tipo, ttarifa, kgratis, Transito, Serie);
                model.guiaFacturaTemporal(dto);
                model.setDtoToPrint(dto);
                //System.out.println("=2xcfse>");
               pagina = "/Servlets/ModificaGuia.jsp";
            } else
            if(Grabar != null || ImprimeMec != null || ImprimeNueva != null || Imprime2017 != null || ImprimeGYE != null)
            {
               Guias guia = model.validateGuiaFactura(Long.parseLong(Nguia), tipo);
               
               if(guia==null){
               
                   GuiaDeCargaDTO dto = model.getDtoToPrint();
                   dto.setGuisobservacion(Observacion);
                    long nguia = model.InsertaGuiaCargaC( dto.getGuilnumero(),dto.getGuidfecha(),dto.getGuiipiezas(),
                            dto.getGuinpeso(), dto.getGuiscontiene(), dto.getGuisremitente(), dto.getGuisdestinatario(),
                            dto.getGuisruc(), dto.getGuistelefono(), dto.getGuincredito(), dto.getClilcodigo(),
                            dto.getGuissucursal(),dto.getGuiientregaen(),dto.getGuisobservacion(),
                            dto.getGuisusuario(),dto.getGuinflete(),dto.getGuinedomicilio(),dto.getGuintransportea(),
                            dto.getGuinseguro(),dto.getGuinotros(),dto.getGuindescuento(),dto.getGuiniva(),dto.getGuintotal(),
                            dto.getProlsecuencial(),dto.getGuinpesovol(),dto.getGuinservicioa(),dto.getGuiihora(),dto.getGuiiminutos(),
                            dto.getGuisdireccion(),dto.getGuisguiafactura(),dto.getUsuariorecibe(),dto.getGuisorigen(),
                            dto.getGuisdestino(),dto.getTiplsecuencial(),dto.getGuindescuentop(),dto.getGuistransito(),dto.getGuisserie(),
                            dto.getGuinimpuio(),dto.getGuinimpgps(),dto.getGuinimpscy(),dto.getGuintarifaneta());
                    codigo = model.BuscarGuiaNumeroS(nguia,tipo)+"";
               }
               else
               {
                   codigo = model.BuscarGuiaNumeroS(guia.getNumero(),tipo)+"";
                   Origen = guia.getOrigen();
                   Destino = guia.getDestino();
                   Pesov = guia.getPesov()+"";
                   ttarifa = guia.getTipotar();
               }
               
                Continente = model.TraerContinenteono(Origen, Destino);
                ttarifa = model.BuscarTipotarifaCliente(Integer.parseInt(Cliente));
                model.BuscarTarifaCargaxpeso(Continente, Destino, Float.parseFloat(Pesov), ttarifa, Origen);
                if(Efectivo != null)
                    pago = Float.parseFloat(Efectivo);
                else
                    pago = 0.0F;
                model.BorraPagosCarga(Long.parseLong(codigo));
                if(pago > 0.0F){
                    model.GrabarPagosCarga(Long.parseLong(codigo), "EF", Observacion, pago);
                }
                if(Credito != null)
                    pago = Float.parseFloat(Credito);
                else
                    pago = 0.0F;
                if(pago > 0.0F){
                    model.GrabarPagosCarga(Long.parseLong(codigo), "CR", Observacion, pago);
                }
                if(Retencion != null)
                    pago = Float.parseFloat(Retencion);
                else
                    pago = 0.0F;
                if(pago > 0.0F){
                    model.GrabarPagosCarga(Long.parseLong(codigo), "RT", Observacion, pago);                    
                }
                if(Cheque != null)
                    pago = Float.parseFloat(Cheque);
                else
                    pago = 0.0F;
                if(pago > 0.0F){
                    model.GrabarPagosCarga(Long.parseLong(codigo), "CH", Observacion, pago);                    
                }                
                                
                if(tCredito != null)
                    pago = Float.parseFloat(tCredito);
                else
                    pago = 0.0F;
                if(pago > 0.0F){
                    model.GrabarPagosCargaTarjetas(Long.parseLong(codigo), "CC", Observacion, pago,franquiciasCred,bancosCred,dateVenCred,fourDigCred,numberAuthCred);//Credit Card
                }
                
                if(tDebito != null)
                    pago = Float.parseFloat(tDebito);
                else
                    pago = 0.0F;
                if(pago > 0.0F){
                    model.GrabarPagosCargaTarjetas(Long.parseLong(codigo), "DC", Observacion, pago,franquiciasDeb,bancosDeb,dateVenDeb,fourDigDeb,numberAuthDeb); //Debit Card
                }
                
                model.BuscarGuia(Long.parseLong(codigo));
                model.ActualizaEstadoGuia(Long.parseLong(codigo), "I");
                model.BuscarPagoCarga(Long.parseLong(codigo));
                if(tipo.equals("G")){
                    if(Imprime2017 !=null){
                        model.setIsNewGF(0);
                        pagina ="/Servlets/Imprimeguia2017.jsp";
                    }
                    if(ImprimeGYE != null){
                        model.setIsNewGF(0);
                        pagina ="/Servlets/ImprimeguiaGYE.jsp";
                    }
                    if(ImprimeNueva != null){
                        model.setIsNewGF(0);
                        pagina = "/Servlets/Imprimeguia.jsp";
                    }
                }else{
                if(ImprimeMec != null){
                    model.setIsNewGF(0);
                    pagina = "/Servlets/ImprimeFacturaMec.jsp";
                }
                if(ImprimeNueva != null){
                    model.setIsNewGF(0);
                    pagina = "/Servlets/Imprimefacturanueva.jsp";
                }
                if(Imprime2017 !=null){
                    model.setIsNewGF(0);
                    pagina = "/Servlets/Imprimefactura2017.jsp";
                }
                if(ImprimeGYE != null){
                     model.setIsNewGF(0);
                    pagina ="/Servlets/ImprimefacturaGYE.jsp";
                }
                }
            }
        }
        catch(SQLException e)
        {
            throw new ServletException("es Aqui " + e.getMessage());
        }
        String next = pagina;
        RequestDispatcher rd = application.getRequestDispatcher(next);
        if(rd == null)
        {
            throw new ServletException("Existe un Error en esta p\341gina " + next);
        } else
        {
            rd.forward(request, response);
            return;
        }
    }
}
