<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<link rel="stylesheet" href="<%=BASEURL%>/estilo1.css">
<html>
<head>

<title>Aerogal Agencias</title>
<script language="JavaScript" type="text/javascript" > 
Salir="asa";
 function cuantosDias(mes, anyo)
    {
        var cuantosDias = 31;
        if (mes == 4 || mes == 6 || mes == 9 || mes == 11)
      cuantosDias = 30;
        if (mes == 2 && (anyo/4) != Math.floor(anyo/4))
      cuantosDias = 28;
        if (mes == 2 && (anyo/4) == Math.floor(anyo/4))
      cuantosDias = 29;
        return cuantosDias;
    }
function valor(v,v1)
    {
    retorno=v1
     if (v!="null")
     {
        retorno=v;
     }
     return retorno;
    }

function cambiodestino(desti,booking)
{
    
    destino = eval("document.Agencias.destinoI");
    origen = eval("document.Agencias.origenI");
    diai=eval("document.Agencias.diaI");
    mesi=eval("document.Agencias.mesI");
    anioi=eval("document.Agencias.anioI");
    diar=eval("document.Agencias.diaR");
    mesr=eval("document.Agencias.mesR");
    anior=eval("document.Agencias.anioR");
   
    <%------urlS="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
          +"&destinoI="+detino.value + "&origenI="+origen.value
          +"&anioI="+anioi.value + "&mesI="+mesi.value+"&diaR="+diai.value
          +"&anioR="+anior.value + "&mesR="+mesr.value+"&diaR="+diar.value;
    -------%>      
    
    if(destino.value!=desti)
    {
        
       <%------------- /*location="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
                 +"&destinoI="+evalua.value + "&origenI="+origen.value;*/
        ---------------------%>         
         
          location="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
          +"&destinoI="+destino.value + "&origenI="+origen.value
          +"&anioI="+anioi.value + "&mesI="+mesi.value+"&diaI="+diai.value
          +"&anioR="+anior.value + "&mesR="+mesr.value+"&diaR="+diar.value;     
       
         
    }
    
    
    
}

function cambioorigen(ori,booking)
{
    
   
    destino = eval("document.Agencias.destinoI");
    origen = eval("document.Agencias.origenI");
    diai=eval("document.Agencias.diaI");
    mesi=eval("document.Agencias.mesI");
    anioi=eval("document.Agencias.anioI");
    diar=eval("document.Agencias.diaR");
    mesr=eval("document.Agencias.mesR");
    anior=eval("document.Agencias.anioR");
    urlS="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
          +"&destinoI="+destino.value + "&origenI="+origen.value
          +"&anioI="+anioi.value + "&mesI="+mesi.value+"&diaI="+diai.value
          +"&anioR="+anior.value + "&mesR="+mesr.value+"&diaR="+diar.value;
    if(origen.value!=ori)
    {
        
        /*location="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
                 +"&origenI="+evalua.value+"&destinoI="+destino.value;*/
        location=urlS;                
       
       
    }
    
    
    
}

function cambiodiaI(dia,booking)
{
    
    
    destino = eval("document.Agencias.destinoI");
    origen = eval("document.Agencias.origenI");
    diai=eval("document.Agencias.diaI");
    mesi=eval("document.Agencias.mesI");
    anioi=eval("document.Agencias.anioI");
    diar=eval("document.Agencias.diaR");
    mesr=eval("document.Agencias.mesR");
    anior=eval("document.Agencias.anioR");
    urlS="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
          +"&destinoI="+destino.value + "&origenI="+origen.value
          +"&anioI="+anioi.value + "&mesI="+mesi.value+"&diaI="+diai.value
          +"&anioR="+anior.value + "&mesR="+mesr.value+"&diaR="+diar.value;
    if(diai.value!=dia)
    {
        
        /*location="<%=CONTROLLER%>/Reservas/Selecciona?booking="+
                 booking+"&diaI="+evalua.value;*/
       location=urlS;       
       
    }
    
    
    
}


function cambiomesI(mes,booking)
{
    
   
    destino = eval("document.Agencias.destinoI");
    origen = eval("document.Agencias.origenI");
    diai=eval("document.Agencias.diaI");
    mesi=eval("document.Agencias.mesI");
    anioi=eval("document.Agencias.anioI");
    diar=eval("document.Agencias.diaR");
    mesr=eval("document.Agencias.mesR");
    anior=eval("document.Agencias.anioR");
    urlS="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
          +"&destinoI="+destino.value + "&origenI="+origen.value
          +"&anioI="+anioi.value + "&mesI="+mesi.value+"&diaI="+diai.value
          +"&anioR="+anior.value + "&mesR="+mesr.value+"&diaR="+diar.value;
    if(mesi.value!=mes)
    {
        
        /*location="<%=CONTROLLER%>/Reservas/Selecciona?booking="+
        booking+"&mesI="+evalua.value;*/
        location=urlS;       
       
       
    }
    
    
    
}

function cambioanioI(anio,booking)
{
    
   
    destino = eval("document.Agencias.destinoI");
    origen = eval("document.Agencias.origenI");
    diai=eval("document.Agencias.diaI");
    mesi=eval("document.Agencias.mesI");
    anioi=eval("document.Agencias.anioI");
    diar=eval("document.Agencias.diaR");
    mesr=eval("document.Agencias.mesR");
    anior=eval("document.Agencias.anioR");
    urlS="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
          +"&destinoI="+destino.value + "&origenI="+origen.value
          +"&anioI="+anioi.value + "&mesI="+mesi.value+"&diaI="+diai.value
          +"&anioR="+anior.value + "&mesR="+mesr.value+"&diaR="+diar.value;
    if(anioi.value!=anio)
    {
        
        /*location="<%=CONTROLLER%>/Reservas/Selecciona?booking="+
        booking+"&anioI="+evalua.value;*/
       location=urlS;       
       
    }
    
    
    
}


function cambiodiaR(dia,booking)
{
    
    
    destino = eval("document.Agencias.destinoI");
    origen = eval("document.Agencias.origenI");
    diai=eval("document.Agencias.diaI");
    mesi=eval("document.Agencias.mesI");
    anioi=eval("document.Agencias.anioI");
    diar=eval("document.Agencias.diaR");
    mesr=eval("document.Agencias.mesR");
    anior=eval("document.Agencias.anioR");
    urlS="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
          +"&destinoI="+destino.value + "&origenI="+origen.value
          +"&anioI="+anioi.value + "&mesI="+mesi.value+"&diaI="+diai.value
          +"&anioR="+anior.value + "&mesR="+mesr.value+"&diaR="+diar.value;
    if(diar.value!=dia)
    {
        
        /*location="<%=CONTROLLER%>/Reservas/Selecciona?booking="+
                 booking+"&diaR="+evalua.value;*/
       location=urlS;       
       
    }
    
    
    
}


function cambiomesR(mes,booking)
{
    
    
    destino = eval("document.Agencias.destinoI");
    origen = eval("document.Agencias.origenI");
    diai=eval("document.Agencias.diaI");
    mesi=eval("document.Agencias.mesI");
    anioi=eval("document.Agencias.anioI");
    diar=eval("document.Agencias.diaR");
    mesr=eval("document.Agencias.mesR");
    anior=eval("document.Agencias.anioR");
    urlS="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
          +"&destinoI="+destino.value + "&origenI="+origen.value
          +"&anioI="+anioi.value + "&mesI="+mesi.value+"&diaI="+diai.value
          +"&anioR="+anior.value + "&mesR="+mesr.value+"&diaR="+diar.value;
    
    if(mesr.value!=mes)
    {
        
        /*location="<%=CONTROLLER%>/Reservas/Selecciona?booking="+
                  booking+"&mesI="+evalua.value;*/
       location=urlS;       
       
    }
    
    
    
}

function cambioanioR(anio,booking)
{
    
    
    destino = eval("document.Agencias.destinoI");
    origen = eval("document.Agencias.origenI");
    diai=eval("document.Agencias.diaI");
    mesi=eval("document.Agencias.mesI");
    anioi=eval("document.Agencias.anioI");
    diar=eval("document.Agencias.diaR");
    mesr=eval("document.Agencias.mesR");
    anior=eval("document.Agencias.anioR");
    urlS="<%=CONTROLLER%>/Reservas/Selecciona?booking="+booking
          +"&destinoI="+destino.value + "&origenI="+origen.value
          +"&anioI="+anioi.value + "&mesI="+mesi.value+"&diaI="+diai.value
          +"&anioR="+anior.value + "&mesR="+mesr.value+"&diaR="+diar.value;
    if(anior.value!=anio)
    {
        
        /*location="<%=CONTROLLER%>/Reservas/Selecciona?booking="+
                  booking+"&anioR="+evalua.value;*/
       location=urlS;       
       
    }
    
    
    
}

function seleccion(){
      // Recorre todos los campos de radio de nombre opcion y cuando encuentra
      //  el que est&aacute; seleccionado muestra mensaje en el objeto de texto.
      //alert("seleccion");
      if (document.Agencias.vueloID!=null)
      {
      for (var i = 0; i < document.Agencias.vueloID.length; i++ ){
        //alert(document.Agencias.vueloID[i].value);
        if (document.Agencias.vueloID[i].checked){
        //alert("encuentra");
          return 1;
        }//del if.
      }//del for.
      //alert("noencontro");
      }
      return 0;
    }//seleccion. 

    function seleccionR(){
      // Recorre todos los campos de radio de nombre opcion y cuando encuentra
      //  el que est&aacute; seleccionado muestra mensaje en el objeto de texto.
      //alert("seleccion");
      if (document.Agencias.vueloIDR!=null)
      {
      for (var i = 0; i < document.Agencias.vueloIDR.length; i++ ){
        //alert(document.Agencias.vueloIDR[i].value);
        if (document.Agencias.vueloIDR[i].checked){
        //alert("encuentra");
          return 1;
        }//del if.
      }//del for.
      //alert("noencontro");
      }
      return 0;
    }//seleccion. 
function checkEMAIL(frm)
  {
    var Byte="";
    var Arroba=0;
    var Punto=0;
    if (frm.Nemail.value.length==0) 
    {
      frm.Nemail.focus();
      alert("Debe introducir su direcci&oacute;n de e-mail");
      return(false);
    }
    for (var i=0;i<frm.Nemail.value.length;i++)
    {
      Byte=frm.Nemail.value.substring(i,i+1);
      if(Byte=="@")
        Arroba=Arroba+1;
      if (Byte==".")
        Punto=Punto+1;  
    }
    if (Arroba!=1 || Punto==0)
    {
      frm.Nemail.focus();  
      alert ("La dirección Email no es correcta");
      return(false);
    }
    return true;
  }
function salir()
{
Salir="kk";
}
function validate(frm)
{
  var fecha=new Date();
  var dia = frm.diaI.value;
  var mes =new String(frm.mesI.value);
  var mes1=frm.mesI.value;
  var anio=frm.anioI.value;
  var cuando=new Date(anio,mes1-1,dia);
   var dias=cuantosDias(mes1,anio);
   
    if(Salir=="kk")
       return true;
    if (frm.Nnombre.value=='')
    {
        alert("Es Obligatorio el nombre de quien reserva");
        return false;
    }    
   if (frm.NTelefono.value=='')
    {
        alert("Es Obligatorio el teléfono de quien reserva");
        return false;
    }    
    if (frm.Nemail.value=='')
    {
        alert("Es Obligatorio el e-mail de quien reserva");
        return false;
    }
  if (!checkEMAIL(frm))   
  {
        return false;
   }
   if (frm.nAdultos!=null)
   {
   if (frm.nAdultos.value < frm.nInfantes.value)
        {
            alert("No puede reservar un número mayor de infantes que de adultos");
            return false;
        }
   }     
   if (seleccion()==0)
     {
           alert("Debe seleccionar un vuelo de Ida");
            return false;
     }
   if (dias < dia)
        {
            alert("Mes  no tiene  " + dia + " dias");
            return false;
        }
        
    if (fecha >= cuando)
        {
            alert("Las reservas deben tener 24 horas de anticipacion");
            return false;
        }
        var origen=frm.origenI.value;
    if (origen == "")
        {
            alert("Debe seleccionar un Origen");
            return false;
        }
    var destino=frm.destinoI.value;
    if (destino == "")
        {
            alert("Debe seleccionar un Destino");
            return false;
        }
    if (destino == origen)
        {
            alert("origen debe ser distinto a Destino");
            return false;
        }
   dia=frm.diaR.value;
   mes=frm.mesR.value;
   if ((dia != "00") && (mes != "00"))
      {
               if (seleccionR()==0)
                    {
                         alert("Debe seleccionar un vuelo de Retorno");
                            return false;
                       }         
                fecha=cuando;
                mes1=mes;
                anio=frm.anioR.value;
                cuando=new Date(anio,mes1-1,dia);
                dias=cuantosDias(mes1,anio);
                
                if (dias < dia)
                     {
                        alert("Mes en retorno  no tiene " + dia + " dias");
                        return false;
                       }
        
                if (fecha > cuando)
                    {
                        alert("El retorno debe ser luego de la ida");
                        return false;
                    }
             
              
              
       }

    
    return true;
    
}


 </script>

</head>
<body bgcolor=#a0a0a0
  >
 
<!--[if gte mso 9]><xml>
 <v:background id="_x0000_s1025" o:bwmode="white" o:targetscreensize="800,600">
  <v:fill src="/WEB-INF/IMAGES/fondorayas.jpg" o:title="fondo rayas" type="frame"/>
 </v:background></xml><![endif]-->
<form  method="post" name="Agencias"
            action="<%=CONTROLLER%>/Agencias/Nombres" 
onSubmit="return validate(this)">

            <%int acion=model.getAcion();
            Calendar calHoy = Calendar.getInstance();
            calHoy.setTime(new Date());
            calHoy.add(Calendar.DAY_OF_MONTH, 1);
            int diaHoy=calHoy.get(Calendar.DAY_OF_MONTH);
            int mesHoy=calHoy.get(Calendar.MONTH)+1;
            int anioHoy=calHoy.get(Calendar.YEAR);%>
            <%
            
            String origen=request.getParameter("origenI");
            String destino=request.getParameter("destinoI");
            String booking=request.getParameter("booking");
            String ack=request.getParameter("accion");
            DecimalFormat f =new DecimalFormat("00");
            String Video=request.getParameter("Idioma");
            //String pasajero=request.getParameter("pasajero");%>
            <%String diaI=request.getParameter("diaI");
            String mesI=request.getParameter("mesI");
            String anioI=request.getParameter("anioI");
            String diaR=request.getParameter("diaR");
            String mesR=request.getParameter("mesR");
            String anioR=request.getParameter("anioR");
            String Send =request.getParameter("Send");

            String QuienR=request.getParameter("Nnombre");
            String Telefono=request.getParameter("NTelefono");
            String email=request.getParameter("Nemail");
            String Observaciones=request.getParameter("obs");
            %>
            <%int vias=1;
            int d=0;
            int m=0;
            int a=0;
            int dr=0;
            int mr=0;
            int ar=0;
            long vueloI=0;
            long vueloR=0;
            
            int Vias=0;
            Usuarios usr=model.getAgencias();
            %>
            <%
            List lista = model.getReservas();
              if  (lista != null)  {
                    Iterator itC = lista.iterator();
                    if (itC.hasNext()) {
                        DosVias reserva=(DosVias) itC.next();
                        Calendario calendario1=null;
                        calendario1=Calendario.load();
                %>
                
                <%
                        d=reserva.getDiai();
                        m=reserva.getMesi();
                        a=reserva.getAnioi();
                        dr=reserva.getDiar();
                        mr=reserva.getMesr();
                        ar=reserva.getAnior();     
                        if (QuienR==null)
                            QuienR=reserva.getRx();
                        if (QuienR==null)
                            QuienR="";
                        if (Observaciones==null)
                            Observaciones=reserva.getObservaciones();
                        if (Observaciones==null)
                            Observaciones="";   
                        if (Telefono==null)
                           Telefono=reserva.getTelefono();
                        if (Telefono==null)
                           Telefono="";
                        if (email==null)
                            email=reserva.getMail();
                        if (email==null)
                            email="";
                           
                    
                        vias=reserva.getVias();
                        Vias=reserva.getVias();
                        if (origen==null)
                            origen=reserva.getOrigen().toUpperCase();
                        if (origen==null)
                            origen="";
                         if (destino==null)
                            destino=reserva.getDestino().toUpperCase();
                        if (destino==null)
                            destino="";
                         if (diaI==null)
                         {
                             diaI= f.format(reserva.getDiai());
                             if (diaI==null)
                                 diaI=String.valueOf(calendario1.getDia()+1);
                         }
                         else
                         {
                             d=Integer.parseInt(diaI);
                         }   
                         if (mesI==null)
                         {
                             mesI=f.format(reserva.getMesi());
                             if (mesI==null)
                             mesI= String.valueOf(calendario1.getMes());
                         }
                         else
                         {
                             m=Integer.parseInt(mesI);  
                         }    
                        if (anioI==null)
                        {
                            anioI=f.format(reserva.getAnioi());
                            if (anioI==null)
                              anioI=  String.valueOf(calendario1.getAnio());
                        }
                        else
                        {
                             a=Integer.parseInt(anioI);
                        }
                        
                        if (diaR==null)
                             diaR= f.format(reserva.getDiar());
                         else
                             dr=Integer.parseInt(diaR);
                             vias=2;
                         if (mesR==null)
                             mesR=f.format(reserva.getMesr());
                         else
                             mr=Integer.parseInt(mesR);  
                        if (anioR==null)
                            anioR=f.format(reserva.getAnior());
                        else
                             ar=Integer.parseInt(anioR);
                        %>
                        <% model.BuscarVuelosA(origen,destino, d, m, a);
                        vueloI=reserva.getCodigovr();
                        vueloR=reserva.getCodigovi();
                        // Falta tomar Vuelo
                     }
                    else
                    {
                    booking=model.getBooking();
                    d=diaHoy;
                    m=mesHoy;
                    a=anioHoy;
                    if (origen==null)
                        origen="";
                    if (destino==null)
                       destino="";
                    if (diaI==null)

                         diaI= String.valueOf(d);
                     else
                     {
                         d=Integer.parseInt(diaI);
                         model.BuscarVuelosA(origen,destino, d, m, a);    
                     }
                     if (mesI==null)
                         mesI=String.valueOf(m);
                     else
                         m=Integer.parseInt(mesI);    
                    if (anioI==null)
                        anioI=String.valueOf(a);
                    else
                         a=Integer.parseInt(anioI);

                    if (diaR==null)
                         diaR= "00";
                     else
                         dr=Integer.parseInt(diaR);
                     vias=2;

                     if (mesR==null)
                         mesR="00";
                     else
                         mr=Integer.parseInt(mesR);  
                    if (anioR==null)
                        anioR="00";
                    else
                         ar=Integer.parseInt(anioR);
                   if (QuienR==null)
                        QuienR="";
                   if (Observaciones==null)
                        Observaciones="";
                    if (Telefono==null)
                        Telefono="";
                    if (email==null)
                        email="";


                        }
                     } 
               
                else
                {
                %>
                
                <%
                booking=model.getBooking();
                d=diaHoy;
                m=mesHoy;
                a=anioHoy;
                if (origen==null)
                    origen="";
                if (destino==null)
                   destino="";
                if (diaI==null)
                    
                     diaI= String.valueOf(d);
                 else
                 {
                     d=Integer.parseInt(diaI);
                     model.BuscarVuelosA(origen,destino, d, m, a);    
                 }
                 if (mesI==null)
                     mesI=String.valueOf(m);
                 else
                     m=Integer.parseInt(mesI);    
                if (anioI==null)
                    anioI=String.valueOf(a);
                else
                     a=Integer.parseInt(anioI);

                if (diaR==null)
                     diaR= "00";
                 else
                     dr=Integer.parseInt(diaR);
                 vias=2;
                     
                 if (mesR==null)
                     mesR="00";
                 else
                     mr=Integer.parseInt(mesR);  
                if (anioR==null)
                    anioR="00";
                else
                     ar=Integer.parseInt(anioR);
               if (QuienR==null)
                    QuienR="";
               if (Observaciones==null)
                    Observaciones="";
                if (Telefono==null)
                    Telefono="";
                if (email==null)
                    email="";
                
                 
                }
            %>
<%@ include file="/WEB-INF/Banner.jsp"%>          
</table>
<input name="vueloRetorno" value="<%=vueloR%>" type= "hidden" >    
<input name="vueloIda" value="<%=vueloI%>" type= "hidden" >
<input name="nvueloRetorno" value="<%=vueloR%>" type= "hidden" >    
<input name="nvueloIda" value="<%=vueloI%>" type= "hidden" >
<input name="accion" id="accion" value="0" type= "hidden" >
<input name="booking" value="<%=booking%>" type= "hidden" >
<input name="Vias" value="<%=Vias%>" type= "hidden" >


<table border="0" cellpadding="0" cellspacing="0" width="780" align="center">
<!-- fwtable fwsrc="<%=BASEURL%>/images/FormaAgencias.png" fwbase="<%=BASEURL%>/images/FormaAgencias.gif" fwstyle="Dreamweaver" fwdocid = "2019518708" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="21" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="721" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="38" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/FormaAgencias_r1_c1" src="<%=BASEURL%>/images/FormaAgencias_r1_c1.gif" width="780" height="88" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="88" border="0" alt=""></td>
  </tr>
  <tr>
   <td background="<%=BASEURL%>/images/FormaAgencias_r2_c1.gif">&nbsp;</td>
   <td  valign="top" bgcolor="#ffffff"> 
   
    <table   width='100%' border="0" align="center" cellpadding="1" cellspacing="1" valign="top">        
    <tr>
    <td>




              <table class="tablablanca"  width='100%' border="0" align="center" cellpadding="1" cellspacing="0">
             
             <th color="red">Sucursal :</th>
             <th><%=usr.getAgencia()+usr.getNAgencia()%></th>
             <th color="red">Booking :</th>
             <th><%=booking%></th>
             <th color="red">Agencia :</th>
              <th><%=usr.getNombre()%></th>
              <th color="red">Usuario :</th>
              <th><%=usr.getCodigo()%></th>
              
              
           
             
              </table>
              
              </td>
              </tr>
              <tr>
              <td>
               
               
               <table  class="tablaborde" width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >
                <%--------------------------------Izquierda ----------------------%>
                <tr >
                <td width="30%" valign="top">
                <table class="tablaborde"  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
                <tr>
                <th>Vuelo Ida </th>
                </tr>
                </table>
                <table class="tablaborde"  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
                <tr>
                    <tH align="center">Hora</th>
                    <th align="center">Vuelo</th>
                    <th align="center">Estado</th>
                </tr>
               <%List listV = model.getVuelos();
                String aux;
                String estado;
                String cheqeado="";
                int signo=0;
                //int estilo=0;
                if (listV != null) {
                    Iterator itV = listV.iterator();
                    while (itV.hasNext()) {
                        Vuelos vuelo=(Vuelos) itV.next();
                        
                        aux=vuelo.getHora();
                         aux=aux.trim();
                         cheqeado="";
                         if (vueloI==vuelo.getCodigo())
                             cheqeado="checked";
                         if (vuelo.getEstado().equals("C"))
                         {
                             estado="Activo";
                             signo=1;
                          }
                         else
                         {
                             estado="Stop Booking";
                             signo=-1;
                         }
                %>
                <tr>
                <td class="Vuelos"><input class="lineaazul"
                name="vueloID"
                type="radio" <%=cheqeado%>
                value="<%=vuelo.getCodigo()*signo%>"
                onclick="vueloIda.value='<%=vuelo.getCodigo()%>' 
                 ; nvueloIda.value='<%=vuelo.getNumero()%>'">
                 <%=aux%></td>
                <td class="Vuelos" align="center"><%= vuelo.getNumero()%></td>
                <td class="Vuelos" align="center"><%= estado%></td>   
                </tr>
                <%}}%>
                
                </table>
                <table  class="tablaborde" width='100%' border="0" align="center" cellpadding="1" cellspacing="0"  >
                <tr>
                <th align="center">Ciudades </th><tr>

                </table>

                <table  class="tablaborde" width='100%' border="0" align="center" cellpadding="1" cellspacing="0"  >
                <tr>
                <tH align="center">Codigo</th>
                <tH align="center">Ciudad</th>
                </tr>

<%
 List lstCiudades=model.todaslasciudades();
 if (lstCiudades!=null){
    Iterator itCiudades =lstCiudades.iterator();

    while (itCiudades.hasNext()){
        Ciudades ciudades=(Ciudades) itCiudades.next();
        String codCiudad=ciudades.getCiudadesCodigo();
        String nomCiudad=ciudades.getCiudadesNombre();%>

                <tr>
                <td><%=codCiudad%></td>
                <td><%=nomCiudad%></td>
                </tr>        

<%}}%>

                </table>

                
               
               <%------------------Centro----------------------%>
               
               <td width="40%" valign="top">
               <table  class="tablaborde" width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >
               <tr>
                <td>
               <table  class="tablaborde" width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >
               
                <tr>
                    <th align="center"  class="tablaborde" width='100%'>Datos del Viaje </th>
               </tr>
               </table>
               </td>
               </tr>
                <tr>
                <td>
              
               <table  class="tablaborde" width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >
               <tr>
                <td width="50%" class='txt-arialch'>Origen</td>
                <td width="50%" class='txt-arialch'  >Fecha Ida</td>
                </tr>
               </table>
               
              </td>
               </tr>
              <tr> 
              <td>
              
                <table  width='100%' border="0" align="center" cellpadding="3" cellspacing="3" >
                <tr>
                <td width="50%" class='txt-arialch'>
                <input name= "origenI" id="origenI" type="text" class="entrada" value="<%=origen%>" ONCHANGE="cambioorigen('<%=origen%>','<%=booking%>')">
                </td>
                <td width="10%" class='txt-arialch' align="left">
                <input name= "diaI" id="diaI" type="text" class="Entrada" size="2" value="<%=diaI%>" ONCHANGE="cambiodiaI('<%=diaI%>','<%=booking%>')">
                </td>
                <td width="10%" class='txt-arialch' align="left">
                <input name= "mesI" id="mesI" type="text" class="entrada" size="2" value="<%=mesI%>" ONCHANGE="cambiomesI('<%=mesI%>','<%=booking%>')">
                </td>
                <td width="30%" class='txt-arialch' >
                <input name= "anioI" id="anioI" type="text" class="entrada" size="4" value="<%=anioI%>" ONCHANGE="cambioanioI('<%=anioI%>','<%=booking%>')">
                </td>
                </tr>
                
                <tr> 
                <td width="50%" class='txt-arialch' valign='top'>&nbsp;</td>  
                <td width="10%" class='txt-arialch' valign='top'> D&iacute;a</td>
                <td width="10%" class='txt-arialch' valign='top'> Mes</td>
                <td width="15%" class='txt-arialch' valign='top'> A&ntilde;o</td>
                </tr>
              
                 
                </table>
                
                </td>
                 </tr>
                 
                 <tr>
                 <td>
                 
                <table  width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >
                <tr>
                <td width="50%" class='txt-arialch'>Destino</td>
                <td width="70%" class='txt-arialch' align="left" >Fecha Retorno</td>
                </tr>
                </table>
                
                </td>
                 </tr>
                 
                 <tr>
                 <td>
                 
                <table  width='100%' border="0" align="center" cellpadding="3" cellspacing="3" >
                <tr>
                <td width="30%" class='txt-arialch'>
                <input name= "destinoI" id="destinoI" type="text" class="entrada" value="<%=destino%>"  ONCHANGE="cambiodestino('<%=destino%>','<%=booking%>')">
                </td>
                <td width="10%" class='txt-arialch'>
                <input name= "diaR" id="diaR" type="text" class="Entrada" size="2" value="<%=diaR%>" ONCHANGE="cambiodiaR('<%=diaR%>','<%=booking%>')">
                </td>
                <td width="10%" class='txt-arialch'>
                <input name= "mesR" id="mesR" type="text" class="entrada" size="2" value="<%=mesR%>" ONCHANGE="cambiomesR('<%=mesR%>','<%=booking%>')">
                </td>
                <td width="30%" class='txt-arialch' >
                <input name= "anioR" id="anioR" type="text" class="entrada" size="4" value="<%=anioR%>" ONCHANGE="cambioanioR('<%=anioR%>','<%=booking%>')">
                </td>
                </tr>
                <tr> 
                <td width="50%" class='txt-arialch' valign='top'>&nbsp;</td>  
                <td width="10%" class='txt-arialch' valign='top'> D&iacute;a</td>
                <td width="10%" class='txt-arialch' valign='top'> Mes</td>
                <td width="15%" class='txt-arialch' valign='top'> A&ntilde;o</td>
                </tr>
                
               </table>
               </td>
               </tr>
               <tr>
               <td>
  
              <% if (Vias==0)
{%>
       </td>
               </tr>
               <tr>
               <td>
  
                <table  width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >
                <th align="center"> Pasajeros </th>
                </table>
                </td>
                </tr>
                <tr>
                <td>
                <table  width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >

                <tr> 

                  <td width="33%" class='txt-arialch' valign='top'> Adultos</td>
                  <td width="33%" class='txt-arialch' valign='top'> Ni&ntilde;os</td>
                  <td width="33%" class='txt-arialch' valign='top'> Infantes</td>
                </tr>
                <tr> 
                 <td class='txt-arialch' valign='top'> 
                <select name='nAdultos' class='txt-arialimput'>
                      <option value='1'>1 </option>
                      <option value='2'>2</option>
                      <option value='3'>3</option>
                      <option value='4'>4</option>
                      <option value='5'>5</option>
                      <option value='6'>6</option>
                      <option value='7'>7</option>
                      <option value='8'>8</option>
                      <option value='9'>9</option>
                    </select> </td>
                  <td class='txt-arialch' valign='top'>
                 <select name='nNinos' class='txt-arialimput'>
                      <option value='0'>0 </option>
                      <option value='1'>1</option>
                      <option value='2'>2</option>
                      <option value='3'>3</option>
                      <option value='4'>4</option>
                      <option value='5'>5</option>
                      <option value='6'>6</option>
                      <option value='7'>7</option>
                      <option value='8'>8</option>
                      <option value='9'>9</option>
                    </select><br>(2-11 a&ntilde;os) </td>
                  <td class='txt-arialch' valign='top'>
                 <select name='nInfantes' class='txt-arialimput'>
                      <option value='0'>0 </option>
                      <option value='1'>1</option>
                      <option value='2'>2</option>
                      <option value='3'>3</option>
                    </select> <br>(0-1 a&ntilde;o)</td>
                </tr>
                </table>      
                
<%}%>

               </td>
               </tr>
               <tr>
               <td>
               
               <table  width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >
               <th align="center"> Datos Adicionales </th>
               </table>
               </td>
               </tr>
               <tr>
               <td>
                <table  width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >
                <tr><td width="50%" class='txt-arialch'>Solicitado X.:</td>
                <td width="50%" class='txt-arialch' >Fono:</td>
                </tr>
                <tr><td width="50%" class='txt-arialch'>
                <input name="Nnombre" id="Nnombre" class="Entrada" type="text"  value="<%=QuienR%>"size=20></td>
                <td width="50%" class='txt-arialch'>
                <input name="NTelefono" id="NTelefono" class="Entrada" type="text" size=20  value="<%=Telefono%>" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
                </tr>
                </table>
                </td>
               </tr>
               <tr>
               <td>
                <table  width='100%' border="0" align="center" cellpadding="0" cellspacing="0" >
                <tr><td width="50%" class='txt-arialch'>e-mail:</td>
                <td width="50%" class='txt-arialch'>&nbsp;</td></tr>
                <tr><td width="90%" class='txt-arialch'><input name="Nemail" id="Nemail" class="Entrada" type="text" size=50 value="<%=email%>"></td></tr>
                <td  class='txt-arialch' >Observaciones:</td>
                <tr><td><textarea name="obs" id="obs" class="Entrada" cols="40" rows="4"><%=Observaciones%></textarea></td></tr>

                </table>
                </td>
               </tr>
               <tr>
               <td>
                <table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1" >
                <tr>
                <td>&nbsp;</td>
                <td><input align="center" TYPE="SUBMIT" NAME="Grabar"  value=":: Grabar ::" ></td>
                <td>&nbsp;</td>
                <td><input align="right" TYPE="SUBMIT" NAME="Nombres"  value=":: Nombres Paxs. ::"  ></td>
                <td>&nbsp;</td>
                <td><input align="right" TYPE="SUBMIT" NAME="Salir"  value=":: Salir ::" onclick="salir()" ></td>
                </tr>
                </table>
               
               </td>
               </tr>
               <%------------------------------------Fin Centro ------------------%>
               </table>
               <%-----------------------------Izquierda-----------------------%>
               <td width="30%" valign="top">
               
               <table class="tablaborde"  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
              <tr>
                <th>Vuelo Retorno  </th></tr>
                <tr>
                </table>
                <table class="tablaborde"  width='100%' border="0" align="center" cellpadding="1" cellspacing="1">
                <tH align="center">Hora</th>
                <th align="center">Vuelo</th>
                <th align="center">Estado</th>
               </tr>
               <%
               if (vias==2){
               /*d=Integer.parseInt(diaR);
               m=Integer.parseInt(mesR);
               a=Integer.parseInt(anioR);     */
               
               model.BuscarVuelosA(destino,origen, dr, mr, ar);     
               List listV2 = model.getVuelos();
                
                
                if (listV2 != null) {
                    Iterator itV2 = listV2.iterator();
                    while (itV2.hasNext()) {
                        Vuelos vuelo=(Vuelos) itV2.next();
          
                        aux=vuelo.getHora();
                         aux=aux.trim();
                         cheqeado="";
                         if (vueloR==vuelo.getCodigo())
                             cheqeado="checked";
                         if (vuelo.getEstado().equals("C"))
                         {
                             estado="Activo";
                             signo=1;
                          }
                         else
                         {
                             estado="Stop Booking";
                             signo=-1;
                         }
                %>
                <tr>
                <td class="Vuelos"><input 
                name="vueloIDR"
                type="radio" <%=cheqeado%>
                value="<%=vuelo.getCodigo()*signo%>"
                onclick="vueloRetorno.value='<%=vuelo.getCodigo()%>' 
                 ; nvueloRetorno.value='<%=vuelo.getNumero()%>'">
                 <%=aux%></td>
                <td class="Vuelos" align="center"><%= vuelo.getNumero()%></td>
                <td  class="Vuelos"align="center"><%= estado%></td>   
                </tr>
                <%}}}%>
               </table>
               
               <%-----------------------------------Fin Izquierda-----------%>
               </td>
               </tr>
               </table>
               
            <%-----------------------
             
-------------------------%>             

</td>
</tr>
     

</table>

   </td>
   <td background="<%=BASEURL%>/images/FormaAgencias_r2_c3.gif">&nbsp;</td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/FormaAgencias_r3_c1" src="<%=BASEURL%>/images/FormaAgencias_r3_c1.gif" width="780" height="51" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="51" border="0" alt=""></td>
  </tr>
  </table>

</form>
</body>
</html>
