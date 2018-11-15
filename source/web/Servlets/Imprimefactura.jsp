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
    <head><title>IMPRESION GUIA DE CARGA</title>
        <style type="text/css">
            body   { background:#FFF;
                     margin:0; padding:0; background-image:url(http://192.168.140.27:8080/Carga/images/fact1-2.jpg); background-repeat:no-repeat;}
            .fc   { color     : black;
                    font-weight   : bold;
                    font-size : 11pt;
                    line-height   : 9pt;
                    font-family   : sans-serif;}
            p  { color     : black;
                 text--indent  : 0.5in;
                 font-size : 12pt;
                 font-family   : Times,serif;}
            .bordes{position:absolute; left:0cm;top:0cm; border:#000 solid 2px; visibility:hidden; }
            @media print {
                /* style sheet for print goes here */
                body   { background:#FFF;
                         margin:0; padding:0; background-image:none;}
            }

        </style>
        </head>
        
            <body onLoad="window.print();window.location='<%=CONTROLLER%>/Guias/Guias-';">    

            <div  style="position:absolute; left:19cm;top:0.8cm ">
            <span class="cam"><%=numfactura%></span>
        </div>

        <div  style="position:absolute; left:14cm;top:1.3cm ">
            <span class="cam"><%=contiene%></span>
        </div>

        <div  style="position:absolute; left:0.5cm;top:1.7cm ">
            <span class="cam"><%=lfecha%></span>
        </div>

        <div  style="position:absolute; left:5cm; top:1.7cm ">
            <span class="cam"><%=lhora%></span>
        </div>


        <div  style="position:absolute; left:6.5cm; top:1.7cm "> 
            <span class="cam"><%=piezas%></span>
        </div>


        <div  style="position:absolute; left:9cm;top:1.7cm ">
            <span class="cam"><%=f.format(peso)%></span>
        </div>

        <div  style="position:absolute; left:11.5cm;top:1.7cm ">
            <span class="cam"><%=f.format(pesov)%></span>
        </div>


        <div  style="position:absolute; left:16cm;top:1.7cm ">
            <span class="cam">S.V.D.</span>
        </div>

        <div  style="position:absolute; left:4.5cm;top:2.2cm ">
            <span class="cam"><%=remitente%></span>
        </div>

        <div  style="position:absolute; left:15cm;top:2.2cm ">
            <span class="cam"><%=destinatario%></span>
        </div>

        <div  style="position:absolute; left:0.5cm;top:3.1cm ">
            <span class="cam"><%=origen%></span>
        </div>


        <div  style="position:absolute; left:4cm;top:3.1cm ">
            <span class="cam"><%=telefono%></span>
        </div>


        <div  style="position:absolute; left:11cm;top:3.1cm ">
            <span class="cam"><%=destino%></span>
        </div>

        <div  style="position:absolute; left:15cm;top:3.1cm ">
            <span class="cam"><%=direccion%></span>
        </div>

        <div  style="position:absolute; left:1.5cm;top:4.1cm ">
            <span class="cam"><%=ruc%></span>
        </div>

        <div  style="position:absolute; left:11cm;top:4.1cm ">
            <span class="cam"><%=sucursal%></span>
        </div>


        <div  style="position:absolute; left:16.2cm;top:4.1cm ">
            <span class="cam"><%=domicilio%></span>
        </div>
        <div  style="position:absolute; left:18.0cm;top:4.1cm ">
            <span class="cam"><%=oficina%></span>
        </div>
        <div  style="position:absolute; left:19.7cm;top:4.1cm ">
            <span class="cam"><%=aeropuerto%></span>
        </div>


        <div  style="position:absolute; left:1.0cm;top:5cm ">
            <span class="cam"><%=obs%></span>
        </div>
        <%
            //ptotal=13;
            //ptotal=16;
            if (tipop.trim().equals("CR")) {
                ptotal = 18;
            } else {
                ptotal = 16;
            }
        %>

        <div  style="position:absolute; left:<%=ptotal%>cm;top:5.0cm ">
            <span class="cam"><%=f.format(flete)%> </span>
        </div>




        <div  style="position:absolute; left:<%=ptotal%>cm;top:5.4cm ">
            <span class="cam"><%=f.format(edomicilio)%></span>
        </div>

        <%%>
        <div  style="position:absolute; left:1cm;top:5.5cm ">
            <span class="cam"><%=obs1%></span>
        </div>
        <%%>


        <div  style="position:absolute; left:<%=ptotal%>cm;top:5.8cm ">
            <span class="cam"><%=f.format(tadicional)%> </span>
        </div>

        <div  style="position:absolute; left:<%=ptotal%>cm;top:6.2cm ">
            <span class="cam"><%=f.format(sadicional)%></span>
        </div>

        <div  style="position:absolute; left:<%=ptotal%>cm;top:6.6cm ">
            <span class="cam"><%=f.format(seguro)%></span>
        </div>

        <div  style="position:absolute; left:1cm;top:6.8cm ">
            <span class="cam"><%=usuariox%></span>
        </div>

        <div  style="position:absolute; left:<%=ptotal%>cm;top:7.0cm ">
            <span class="cam"><%=f.format(subtotal)%></span>
        </div>

        <div  style="position:absolute; left:<%=ptotal%>cm;top:7.4cm ">
            <span class="cam"><%=f.format(descuento)%></span>
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
        <div  style="position:absolute; /*left:<%=(ptotal - 3)%>cm;*/top:6.959cm; left: 595px;">
            <span class="fc"> Imp. <%=ciu_23ssd%> (<%=f.format(otros)%>)</span>
        </div>        
        <%
        } else {
        %>
        <div  style="position:absolute; /*left:<%=ptotal%>cm;*/top:7.17cm; left: 666px;">
            <span class="fc">0.00</span>
        </div>
        <%}%>

        <% if (iva > 0) {
        %>    

        <div  style="position:absolute; left:<%=(16 - 2.5)%>cm;top:8.2cm ">
            <span class="cam"><%=12%></span>
        </div>  

        <%
            }
        %>


        <div  style="position:absolute; left:<%=ptotal%>cm;top:8.2cm ">
            <span class="cam"><%=f.format(iva)%></span>
        </div>

        <div  style="position:absolute; left:<%=ptotal%>cm;top:8.6cm ">
            <span class="cam"><%=f.format(total)%> </span>
        </div>
    </body> 
</html>

