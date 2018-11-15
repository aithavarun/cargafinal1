<%------------
<div id="content"> 
  <div class="feature"> 
  ------------%>
  <% switch(Vid){
          case 1:
             //Video=BASEURL+"/respaldos/video1.swf";
             
            // Video=BASEURL+"/Servlets/Cuentanos.jsp";%>
<img name="<%=BASEURL%>/images/MisionVision" src="<%=BASEURL%>/images/MisionVision.gif" width="420" height="420" border="0" alt="">
<%---------------------------
<img src="<%=BASEURL%>/images/mision1.png" alt="" width="201" height="91"> 
<h4>Misión</h4> 
<p>
Cubrimos los cielos de nuestro país conectando a sus habitantes y fortaleciendo 
sus relaciones.</p> 
<p>Buscamos superar cualquier expectativa de calidad 
y servicio que nuestros 
clientes deseen de nosotros.</p>
<img src="<%=BASEURL%>/images/vision1.png" alt="" width="201" height="91"> 
<h4>Visión</h4> 
<p>Para el 2008 somos y seguiremos siendo líderes en la 
transportación aérea del Ecuador.</p>

<p>Sugerencias a: <a href="mailto:ventasmatriz@aerogal.com.ec       
">ventasmatriz@aerogal.com.ec </a></p>  
------------------------%>            
           <%   break;
          case 2:
              //Video=BASEURL+"/respaldos/serviciocl.swf";%>
<%-----------------------------------              
<img src="<%=BASEURL%>/images/servicio1.jpg" alt="" width="143" height="96">               
<h4>Servicio al Cliente</h4> 
<p>
Si Usted desea mayor información, tiene alguna inquietud, 
sugerencia y/o comentario puede comunicarse a la línea gratuita 
1800 ? AEROGAL y rápidamente nuestros agentes estarán 
gustosos de atenderle. 
O envíenos un correo electrónico a la dirección: 
 <a href="mailto:gsommerfeld@aerogal.com.ec        
">gsommerfeld@aerogal.com.ec  </a></p>  

<h4>Valores</h4>
<h3>Ser Seguros</h3>  
<p>
Compromiso en cumplir con todas las regulaciones y estándares 
nacionales e internacionales de seguridad. 
</p>
<h3>Ser Serviciales</h3>
<p> 
Brindarse al cliente en todas nuestras actividades.  
</p>
<h3>Personal Automotivado  </h3>
 <p>
Inspirar a la gente motivarla, y permitirle que realice 
su trabajo esperando de ello la generación del máximo 
valor alineado con los objetivos de su departamento/ compañía. 
</p>
<h3> Ser Motivador  </h3>
 <p>
Crear y mantener una ventaja competitiva, mediante un ingenio 
bien empleado. 
</p> 
<h3>Compromiso con la Empresa </h3>
 <p> 
Alinearse con los intereses de AEROGAL: operar como un solo 
equipo alineados con nuestra misión.
</p>
<h4>Flota</h4>
<img src="<%=BASEURL%>/images/servicio2.jpg" alt="" width="284" height="99">               
<p>
Modelo:Boeing 727 - 200 ADVANCE
</p>
<p>  
Pasajeros:149
</p>
<p>  
Autonomía:5 horas de vuelo 
</p>
<p>  
Orígen:U.S.A
 </p>
<p> 
Total:1
</p>
<img src="<%=BASEURL%>/images/servicio3.jpg" alt="" width="284" height="99">               
<p>
Modelo:Boeing 737 - 200 ADVANCE 
</p>
<p>  
Pasajeros:118
</p>
<p>  
Autonomía:4.5 horas de vuelo 
</p>
<p>  
Orígen:U.S.A
</p>
<p>  
Total:3
</p>
 
 ---------------------------%>
<%@ include file="/Servlets/Servicio.jsp"%>           
               <%break;
         case 3:%>
<%-------------------------         
              <%//Video=BASEURL+"/respaldos/cuentenos.swf"; %>   
<img src="<%=BASEURL%>/images/Cuentanos.png" alt="" width="127" height="127"> 
<h4>Cúentanos tu Viaje</h4> 
<p>
Cuéntanos anécdotas o datos curiosos de algún viaje que hayas realizado 
por Aerogal y participa por sorteos de pasajes a Quito y Guayaquil.</p>
<p>Las mejores historias serán publicadas en esta página a final de cada mes,
junto con los nombres de los ganadores.</p>
<p>Evianos tus Historias a <a href="mailto:ventasmatriz@aerogal.com.ec       
">ventasmatriz@aerogal.com.ec </a></p>  
-----------------%>
<%@ include file="/Servlets/Cuentanos1.jsp"%>           
               <%break;
         case 4:
              //Video=BASEURL+"/respaldos/chequeras.swf";      
             %>
<%-------------------------             
<img src="<%=BASEURL%>/images/chequera.png" alt="" width="207" height="129"> 
<h4>Chequeras Coorporativas</h4> 
<p>
Para reducir los gastos de su empresa en viajes aéreos.
AeroGal le ofrece las chequeras corporativas.</p>
<p>Valor: $ 44.00 c/u más un boleto gratis ( $3.00 tasas aeroportuarias) si el pago es al contado.</p>
<p>Incluye: 15 boletos de una vía incluidos 12% I.V.A. y tasas de aeropuerto</p>
<p>Ruta: Quito/Guayaquil o Guayaquil /Quito </p>
<p>Nombre: Puede colocarse el nombre de cualquier pasajero adulto.</p>
<p>Recordatorio: Realizar las reservaciones del cupo.</p>
<p>Restricciones: Boletos válidos para volar únicamente en AEROGAL.</p>
<p>No aplican reembolsos ni endosos.</p>
<p>Contáctanos a <a href="mailto:ventasmatriz@aerogal.com.ec       
">ventasmatriz@aerogal.com.ec </a> </p> 
------------------------%>
<%@ include file="/Servlets/Chequeras.jsp"%>           
               <%break;
          case 5:
              Video=BASEURL+"/respaldos/itinerarios.swf";     
              %>
              <%@ include file="/Servlets/itinerarios.jsp"%> 
               <%break;
           case 6:
                 Video=BASEURL+"/respaldos/video1.swf";%>
      <tr>
      <td >
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="250" height="184">
        <param name="movie" value="<%=Video%>">
        <param name="quality" value="high">
        <PARAM NAME="Loop" VALUE="1">
        <PARAM NAME="Play" VALUE="1">
        <embed src="<%=Video%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="250" height="184">
        </embed>
      </object>
      </td>
      <td>
      <img name="<%=BASEURL%>/images/aero" src="<%=BASEURL%>/images/aero.jpg" width="160" height="240" border="0" alt="">
      </td >
      </tr>
      <tr>
      <td colspan="2">
      <img name="<%=BASEURL%>/images/tickete" src="<%=BASEURL%>/images/tickete.gif" width="420" height="240" border="0" alt="">
      </td>
      </tr>
      
              <% break;
            case 7:
              //Video=BASEURL+"/respaldos/socios.swf";      
                %>
<%----------------------------------------------                
<img src="<%=BASEURL%>/images/soscios1.png" alt="" width="199" height="141"> 
<h4>Socios V.I.P.</h4> 

<h3>Beneficios de los pasajeros portadores de la Tarjeta VIP</h3>
<p> 
:: Uso de la sala VIP.
</p>
<p>
:: Los pasajeros podrán presentarse 30 minutos antes del vuelo directamente al Counter de AEROGAL. 
</p>
<p>

:: Para el check-in se asignará una columna claramente identificada exclusivamente para pasajeros VIP.
</p>
<p>

:: No se necesita realizar reservación: cupo confirmado. 
</p>
<p>

:: Se asignará asientos en las primeras filas.
</p>
<p>

:: Prioridad al abordar. 
</p>
<p>

:: Se permitirá como equipaje 30 kilos por pasajero. 
</p>
<p>

:: El equipaje tendrá una etiqueta VIP para identificarlo claramente y así poder entregarlo ágilmente. </p>
<p>Contáctanos a <a href="mailto:ventasmatriz@aerogal.com.ec       
">ventasmatriz@aerogal.com.ec </a> </p> 
<DIV class="feature" 
STYLE="position:absolute; top:270px; left:330px; width:140px;">              
<img src="<%=BASEURL%>/images/soscios2.png" alt="" width="201" height="119">                 
</div>
-----------------------------%>
<%@ include file="/Servlets/Socios.jsp"%>           
               <%break;
             case 8:
              //Video=BASEURL+"/respaldos/noticias.swf";      
                 %>
    <%-------------------------             
<h4>Noticias</h4> 


<p>
<img src="<%=BASEURL%>/images/joseluis.jpg" alt="" width="207" height="129"> 
<h3>FERIA TRAVEL MART - LIMA </h3>
</p>
<p>
AEROGAL participó en la Feria Internacional "Travel Mart"  en la ciudad de Lima los días 14-15-16 de Septiembre.
</p>                 
<p>
Para esta feria Aerogal  realizó una importante alianza con empresas como Ecoventura, Hotel Oro Verde y Swisshotel los mismos que realizaron un coctail para promocionar al País
</p>
<p>
En la foto consta nuestro stand con Jorge Luis Páez, Jefe de Ventas.
</p>                 
<img src="<%=BASEURL%>/images/noticiaiguana.jpg" alt="" width="207" height="129"> 
<p>
<h3>Ecuador 2005 </h3>
</p>
<p>
En el hotel Hampton Inn se realizó la presentación del 
nuevo paquete turístico Ecuador 2005, 
el cual contó con la presencia de los principales funcionarios 
de cada empresa auspiciante: 
Aerogal, Hemisferios, Ecuador Amazing y Seguros Coris. 
</p>
<p>
De esta forma Aerogal fomenta nuevamente al desarrollo 
turístico del país. 
</p>
<h3>Grand Gymkana Mercure 2004 </h3>
El Grand Hotel Mercure Alameda Quito y -Le Club- 
organizaron el pasado 18 de diciembre la Grand Gymkana 
Mercure con el fin de aumentar las donaciones a ?Luces de Esperanza?. 
</p>
<p>
Aerogal fue uno de los auspiciantes de este evento, 
que tiene la finalidad de recaudar fondos que serán entregados a 
UNICEF, para los programas de la niñez ecuatoriana.
</p>
<img src="<%=BASEURL%>/images/fotonoticias.jpg" alt="" width="207" height="129"> 
<h3>Bingo  </h3>
<p> 
El 13 de diciembre, se realizó el Metro Bingo organizado por 
Metropolitan Touring Guayaquil y el Hotel Hilton Colón, 
con el fin de festejar a sus principales clientes. 
</p>
<p>
El Bingo se realizó en las instalaciones del hotel. 
Aerogal, fue uno de los principales auspiciantes. 
</p>
<h3>Pequeños Escritores</h3>  
<p>
 Aerogal como uno de los auspiciantes del Concurso de Cuentos,
 organizado por Mr. Books el miércoles 15 de diciembre en el 
local de Mall El Jardín, 
donó dos pasajes a Galápagos para el ganador.
</p>
<h3>Feria Asomatur  </h3>
 <p>
El pasado 9 de diciembre del 2004 en el Grand Hotel Guayaquil 
se realizó la Feria ASOMATUR, 
Asociación de Mayoristas de Turismo del Ecuador, 
capítulo Guayaquil. 
</p>
<p>
Este evento se realizó entre las 10h00 y 17h30 de ese día, 
en donde Aerogal fue uno de los auspiciantes 
junto a los principales hoteles, 
agencias de viajes y otras aerolíneas, 
que expusieron sus principales productos y servicios. 
</p>
<%-----<h3>Super Golazo </h3>
 <p>
Este  23 y 24 de octubre todos los  ecuatorianos aficionados al 
fútbol pudieron jugar la primera apuesta de Super Golazo, 
un juego de pronósticos deportivos, 
que arrancó con los partidos de  la liguilla final nacional.
</p>
<p>
Super Golazo tiene 3 categorías. 
La primera consiste en acertar los 13 partidos; 
la segunda, 12 de los 13 partidos y la tercera consiste en 
acertar 11 de los 13 juegos.
</p>

Aerogal es uno de los patrocinadores oficiales de este juego, el cual beneficiará económicamente al desarrollo del deporte en el país, gracias a lo que recaude cada fin de semana. </p>
<img src="<%=BASEURL%>/images/supergolazo.gif" alt="" width="468" height="60"> 
<p>Contáctanos a <a href="mailto:ventasmatriz@aerogal.com.ec       
">ventasmatriz@aerogal.com.ec </a> </p> 
 -------------%>                
               <%break;
          case 9:
              //Video=BASEURL+"/respaldos/contactos.swf";      
              %>
<%-------------------------------------              
<h4>Contáctenos</h4> 

<h3>QUITO:</h3>
<p>
Av. Amazonas 7797.
</p>
<p>
Reservas: (593 2) 2257202 / 2257203 / 2257204
</p>
<p>
Adm: (593 2) 2258086-087 / 2257203
</p>
<p>
Fax: (593 2) 2430487
</p>
<p>
Aeropuerto: (593 2) 2456105
</p>
<p>
Punto de Ventas:
</p>
<p>
Amazonas 607 y Carrión. Teléf. (593 2) 2567664
</p>
<p>
P.O. Box: 17 ? 01 ? 244.
</p>
<p>
E-mail: <a href="mailto:ventasmatriz@aerogal.com.ec       
">ventasmatriz@aerogal.com.ec </a>
</p>
 
<h3>GUAYAQUIL:</h3>
<p>
Aeropuerto Simón Bolívar. Teléf: (593 4) 2284218
</p>
<p>
Punto de Ventas:
</p>
<p>
Junín 440 y Córdova. Teléf: (593 4) 2310346
</p>
<p>
Reservas: (593 4) 2310352 / 2303076 / 2303077
</p> 
<h3>CUENCA:</h3>
<p>
Av. Aurelio Aguilar y Solano. Teléf: (593 7) 2815250 / 2810789 / 2889500
</p>
<p>
Av. España 1091 y Francisco Pizarro. Teléf: (593 7) 2861041 / 2804444
</p>
<h3> GALÁPAGOS:</h3>
<p>
Aeropuerto Isla San Cristóbal. Teléf: (593 5) 2521117 / 2521118 / 2521120
</p>
<p>
Aeropuerto Isla Baltra. Teléf: (593 5) 2520405
</p>
<p>
Oficina Santa Cruz: Teléf: (593 5) 2526798 / 2596797
 </p>
<h3>REPRESENTANTES DE AEROGAL EN USA: </h3>
<p>
288 Aragon Avenue - Suite "A"
</p>
<p>
Coral Gables, Florida 33134
</p>
<p>
(866) 496 9600 - (305) 445 9600 Fax (305) 445 5132
</p>
<p>
E-mail: <a href="mailto:mar@gttours.sabre.net       
">mar@gttours.sabre.net </a>
</p>
<h3>REPRESENTANTES DE AEROGAL EN ESPAÑA: </h3>
<p>
connexions aviation & tourism
</p>              

<p>
Oficina MADRID:
</p>
<p>
Serrano 93, 2ºA
</p>
<p>
28006 MADRID
</p>
<p>
Tel. + 34 91 411 07 47
</p>
<p>
Fax + 34 91 563 80 62
</p>
<p>

Oficina BARCELONA:
</p>
<p>
Paseo de Gracia, 11-7º
</p>
<p>
08007 BARCELONA
<p>	
Tel. + 34 93 270 18 32
</p>
<p>
Fax + 34 93 270 18 33
</p>
         


----------------------%>
<%@include file="/Servlets/Contactanos.jsp"%>  
               <%break;
               
      default:
          
Video=BASEURL+"/respaldos/video1.swf";%>
      <tr>
      <td >
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="250" height="184">
        <param name="movie" value="<%=Video%>">
        <param name="quality" value="high">
        <PARAM NAME="Loop" VALUE="1">
        <PARAM NAME="Play" VALUE="1">
        <embed src="<%=Video%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="250" height="184">
        </embed>
      </object>
      </td>
      <td>
      <img name="<%=BASEURL%>/images/aero" src="<%=BASEURL%>/images/aero.jpg" width="160" height="240" border="0" alt="">
      </td >
      </tr>
      <tr>
      <td colspan="2">
      <img name="<%=BASEURL%>/images/tickete" src="<%=BASEURL%>/images/tickete.gif" width="420" height="240" border="0" alt="">
      </td>
      
      </tr>
      <tr>
      <td colspan="2">
      <%model.BuscarNoticias(0);%>
      <%@ include file="/Servlets/NoticiasI.jsp"%>
      </td>
      
      </tr>
      <%----------------
      <%@ include file="/Servlets/Buscar.jsp"%>
      
      <%@ include file="/Servlets/Consulta.jsp"%>
      
      <%----------------
       <jsp:useBean 
            id="clima" 
            class="com.aerogal.support.model.Clima" >
      
       </jsp:useBean>    
       <jsp:setProperty
           name="clima"
           property="aeropuertoCodigo"
           value="RDU"/>
    
      <table width='95%' border="0" align="center" cellpadding="0" cellspacing="0">
        <th> Clima </th>
        <tr>
        <td>
        <jsp:getProperty name="clima" property="locacion"/>
        
        </td>
        </tr>
        <tr>
        <td>
        <jsp:getProperty name="clima" property="time"/>
        
        </td>
        <tr>
        <td>
        <jsp:getProperty name="clima" property="temperatura"/>C&deg;
        
        </td>
        </tr>
        <td>
        <jsp:getProperty name="clima" property="aeropuertoCodigo"/>
        
        </td>
        </tr>
        </table>
          <%--------------------------%>     
          <%break;
        }%>
<%---------------   
  </div> 
</div>
------------------------%>