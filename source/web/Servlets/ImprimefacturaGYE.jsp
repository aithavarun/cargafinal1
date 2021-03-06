<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<%
    DecimalFormat f = new DecimalFormat("0.00");
    java.util.Date mifechar;

    int mesr = 0;
    int anior = 0;
    int diar = 0;
    int piezas = 0;
    float peso = 0;
    String contiene = "";
    String remitente = "";
    String destinatario = "";
    float flete = 0;
    float edomicilio = 0;
    float tadicional = 0;
    float sadicional = 0;
    float pesov = 0;
    float seguro = 0;
    float descuento = 0;
    float iva = 0;
    String obs = "";
    String obs1 = "";
    String obsaux = "";
    int lonobs = 0;

    float subtotal = 0;
    float vdescuento = 0;
    float total = 0;
    String lfecha = "";
    String lhora = "";
    int hora = 0;
    int minutos = 0;
    String origen = "";
    String destino = "";
    String telefono = "";
    String direccion = "";
    String ruc = "";
    String tipop = "";
    float pagoe = 0;
    float pagoc = 0;
    float otros = 0;
    String sucursal = "";
    int ptotal = 0;
    String domicilio = "";
    String oficina = "";
    String aeropuerto = "";
    String guiafac = "";
    String usuariox = "";
    long numfactura = 0;
    Usuarios usuario = model.getUsuarios();
    java.util.Calendar inicior = java.util.Calendar.getInstance();

    List list = model.getGuiasLista();
    List list1 = model.getVueloreserva();
    List list2 = model.getPagosCarga();

    if (list != null) {
        Iterator it = list.iterator();
        while (it.hasNext()) {
            Guias guia = (Guias) it.next();
            contiene = guia.getContiene();
            mifechar = guia.getFecha();
            inicior.setTime(mifechar);
            mesr = inicior.get(Calendar.MONTH) + 1;
            anior = inicior.get(Calendar.YEAR);
            diar = inicior.get(Calendar.DATE);
            lfecha = diar + "/" + mesr + "/" + anior;
            hora = guia.getHora();
            minutos = guia.getMinutos();
            lhora = hora + ":" + minutos;
            piezas = guia.getPiezas();
            peso = guia.getPeso();
            pesov = guia.getPesov();
            remitente = guia.getRemitente();
            destinatario = guia.getDestinatario();
            telefono = guia.getTelefono();
            direccion = guia.getDireccion();
            ruc = guia.getRuc();
            origen = guia.getOrigen();
            destino = guia.getDestino();
            guiafac = guia.getTipo();
            flete = guia.getFlete();
            edomicilio = guia.getEdomicilio();
            tadicional = guia.getTransportea();
            sadicional = guia.getServicioa();
            seguro = guia.getSeguro();
            descuento = guia.getDescuento();
            iva = guia.getIva();
            //obs=guia.getObservacion();
            obsaux = guia.getObservacion().trim();
            lonobs = obsaux.length();
            obs = obsaux;
            if (lonobs > 50) {
                obs = obsaux.substring(0, 50);
                if (lonobs > 51) {
                    obs1 = obsaux.substring(50, lonobs);
                }
            }

            subtotal = flete + sadicional + seguro + edomicilio + tadicional;
            //vdescuento= (subtotal *(descuento/100)); 
            subtotal = subtotal - vdescuento;
            //usuariox=guia.getUsuario();
            usuariox = usuario.getNombreCompleto();
            total = guia.getTotal();
            otros = guia.getOtros();
            //out.print("<h1>w"+guia.getOtros()+"w</h1>");
            sucursal = guia.getSucursal();
            numfactura = guia.getNumero();
            if (guia.getEntregaen() == 1) {
                domicilio = "X";
            } else if (guia.getEntregaen() == 2) {
                oficina = "X";
            } else if (guia.getEntregaen() == 3) {
                aeropuerto = "X";
            }

        }
    }


    if (list1 != null) {
        Iterator itx = list1.iterator();
        while (itx.hasNext()) {
            Vuelosreserva vuelo = (Vuelosreserva) itx.next();
            // origen=vuelo.getOrigen();
            //destino=vuelo.getDestino();
        }
    }



    if (list2 != null) {
        tipop = "XX";
        Iterator ity = list2.iterator();
        while (ity.hasNext()) {
            Pagosc pagos = (Pagosc) ity.next();
            tipop = pagos.getTipo();
            if (tipop.equals("EF")) {
                pagoe += pagos.getValor();
            } else {
                pagoc += pagos.getValor();
            }

        }

    }


%>


<html>
    <head>
        <style type="text/css">
            body   { background:#FFF;
                     margin:0; padding:0;}
            .fc   { color     : black;
                    font-weight   : bold;
                    font-size : 9pt;
                    line-height   : 9pt;
                    font-family   : sans-serif;}
            p  { color     : black;
                 text--indent  : 0.5in;
                 font-size : 12pt;
                 font-family   : Times,serif;}
            .numbcolumn {color     : black;
                    font-weight   : bold;
                    font-size : 10pt;
                    font-family   : sans-serif;}
            .bordes{position:absolute; left:0cm;top:0cm; border:#000 solid 2px; visibility:hidden; }
            @media print {
                /* style sheet for print goes here */
                body   { background:#FFF;
                         margin:0; padding:0; background-image:none;}
            }

        </style>
    </head>
    <body onLoad="window.print();window.location='<%=CONTROLLER%>/Guias/Guias-';">
       <div  style="position:absolute; left:20.7cm;top:0.00cm">
            <span class="fc"><%=numfactura%></span>
        </div>
        <div  style="position:absolute; left:16.2cm;top:0.00cm">
            <span class="fc"><%=contiene%></span>
        </div>
        <div  style="position:absolute; left:0.01cm;top:0.25cm">
            <span class="fc"><%=lfecha%></span>
        </div>
        <div  style="position:absolute; left:3.0cm; top:0.25cm">
            <span class="fc"><%=lhora%></span>
        </div>
        <div  style="position:absolute; left:5.9cm; top:0.25cm"> 
            <span class="fc"><%=piezas%></span>
        </div>
        <div  style="position:absolute; left:8.5cm;top:0.25cm">
            <span class="fc"><%=f.format(peso)%></span>
        </div>
        <div  style="position:absolute; left:11.4cm;top:0.25cm">
            <span class="fc"><%=f.format(pesov)%></span>
        </div>
        <div  style="position:absolute; left:17.8cm;top:0.25cm">
            <span class="fc">S.V.D.</span>
        </div>
        <div  style="position:absolute; left:1.5cm;top:0.85cm">
            <span class="fc"><%=remitente%></span>
        </div>
        <div  style="position:absolute; left:10.5cm; top:0.85cm">
            <span class="fc"><%=destino%></span>
        </div>
        <div  style="position:absolute; left:16.5cm; top:0.85cm">
            <span class="fc"><%=destinatario%></span>
        </div>
        <div  style="position:absolute; left:3.3cm;top:1.40cm">
            <span class="fc"><%=origen%></span>
        </div>
        <div  style="position:absolute; left:6.0cm;top:1.40cm">
            <span class="fc"><%=telefono%></span>
        </div>
        <div  style="position:absolute; left:16.4cm; top:1.40cm">
            <span class="fc"><%=direccion%></span>
        </div>
        <div  style="position:absolute; left:1.2cm;top:1.9cm">
            <span class="fc"><%=ruc%></span>
        </div>
        <div  style="position:absolute; left:11.8cm;top:1.9cm">
            <span class="fc"><%=sucursal%></span>
        </div>
        <div  style="position:absolute; left:1.3cm;top:3.2cm">
            <span class="fc"><%=obs%></span>
        </div>
        <div  style="position:absolute; left:19.9cm; top:3.45cm">
            <span class="numbcolumn"><%=f.format(flete)%></span>
        </div>
        <div  style="position:absolute; left:1.3cm;top:3.7cm ">
            <span class="fc"><%=obs1%></span>
        </div>
        <div  style="position:absolute; left:19.9cm; top:4.1cm">
            <span class="numbcolumn"><%=f.format(seguro)%></span>
        </div>

        <div  style="position:absolute; left:0.01cm;top:5.4cm">
            <span class="fc"><%=usuariox%></span>
        </div>
        <% if (otros > 0) {
            
			String ciu_23ssd="";
                        int lo=0;
			if ("GPS".equalsIgnoreCase(destino)||
			"GPS".equalsIgnoreCase(origen)) {
				ciu_23ssd="GPS";
                                lo++;
			}
                        if ("UIO".equalsIgnoreCase(destino)||
			"UIO".equalsIgnoreCase(origen)) {
                                if(lo>0){ciu_23ssd=ciu_23ssd+"-";}
				ciu_23ssd=ciu_23ssd+("UIO");
                                lo++;
			}
                        if ("SCY".equalsIgnoreCase(destino)||
			"SCY".equalsIgnoreCase(origen)) {
                                if(lo>0){ciu_23ssd=ciu_23ssd+"-";}
				ciu_23ssd=ciu_23ssd+("SCY");                                
			}
                        
        %>
        <div  style="position:absolute; left:18.5cm; top:4.8cm">
            <span class="numbcolumn">Imp. <%=ciu_23ssd%> (<%=f.format(otros)%>)</span>
        </div>        
       
        <%
        } else {
        %>
        <div  style="position:absolute; left: 19.9cm; top:4.8cm">
            <span class="numbcolumn">0.00</span>
        </div>
        <%}%>
        <div  style="position:absolute; left: 19.9cm; top:5.45cm; ">
            <span class="numbcolumn"><%=f.format(subtotal)%></span>
        </div> 
        <div  style="position:absolute; left:19.9cm; top:6.05cm">
            <span class="numbcolumn">0.00</span>
        </div>
        <% if (iva > 0) {
        %>    

        <div  style="position:absolute; left: 16.0cm;top:6.4cm;">
            <span class="numbcolumn"><%=12%></span>
        </div>  

        <%
            }
        %>
        <div  style="position:absolute; left:19.9cm; top:6.65cm">
            <span class="numbcolumn"><%=f.format(iva)%></span>
        </div>

        <div  style="position:absolute; left:19.9cm; top:7.35cm">
            <span class="numbcolumn"><%=f.format(total)%></span>
        </div>
    </body> 
</html>