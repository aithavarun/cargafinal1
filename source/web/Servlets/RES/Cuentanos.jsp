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
<h4>Misi�n</h4> 
<p>
Cubrimos los cielos de nuestro pa�s conectando a sus habitantes y fortaleciendo 
sus relaciones.</p> 
<p>Buscamos superar cualquier expectativa de calidad 
y servicio que nuestros 
clientes deseen de nosotros.</p>
<img src="<%=BASEURL%>/images/vision1.png" alt="" width="201" height="91"> 
<h4>Visi�n</h4> 
<p>Para el 2008 somos y seguiremos siendo l�deres en la 
transportaci�n a�rea del Ecuador.</p>

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
Si Usted desea mayor informaci�n, tiene alguna inquietud, 
sugerencia y/o comentario puede comunicarse a la l�nea gratuita 
1800 ? AEROGAL y r�pidamente nuestros agentes estar�n 
gustosos de atenderle. 
O env�enos un correo electr�nico a la direcci�n: 
 <a href="mailto:gsommerfeld@aerogal.com.ec        
">gsommerfeld@aerogal.com.ec  </a></p>  

<h4>Valores</h4>
<h3>Ser Seguros</h3> �
<p>
Compromiso en cumplir con todas las regulaciones y est�ndares 
nacionales e internacionales de seguridad. 
</p>
<h3>Ser Serviciales</h3>
<p>�
Brindarse al cliente en todas nuestras actividades. �
</p>
<h3>Personal Automotivado �</h3>
�<p>
Inspirar a la gente motivarla, y permitirle que realice 
su trabajo esperando de ello la generaci�n del m�ximo 
valor alineado con los objetivos de su departamento/ compa��a. 
</p>
<h3>�Ser Motivador �</h3>
�<p>
Crear y mantener una ventaja competitiva, mediante un ingenio 
bien empleado. 
</p>�
<h3>Compromiso con la Empresa�</h3>
�<p>�
Alinearse con los intereses de AEROGAL: operar como un solo 
equipo alineados con nuestra misi�n.
</p>
<h4>Flota</h4>
<img src="<%=BASEURL%>/images/servicio2.jpg" alt="" width="284" height="99">               
<p>
Modelo:Boeing 727 - 200 ADVANCE
</p>
<p>��
Pasajeros:149
</p>
<p>��
Autonom�a:5 horas de vuelo 
</p>
<p>��
Or�gen:U.S.A
�</p>
<p>�
Total:1
</p>
<img src="<%=BASEURL%>/images/servicio3.jpg" alt="" width="284" height="99">               
<p>
Modelo:Boeing 737 - 200 ADVANCE 
</p>
<p>��
Pasajeros:118
</p>
<p>��
Autonom�a:4.5 horas de vuelo 
</p>
<p>��
Or�gen:U.S.A
</p>
<p>��
Total:3
</p>
�
�---------------------------%>
<%@ include file="/Servlets/Servicio.jsp"%>           
               <%break;
         case 3:%>
<%-------------------------         
              <%//Video=BASEURL+"/respaldos/cuentenos.swf"; %>   
<img src="<%=BASEURL%>/images/Cuentanos.png" alt="" width="127" height="127"> 
<h4>C�entanos tu Viaje</h4> 
<p>
Cu�ntanos an�cdotas o datos curiosos de alg�n viaje que hayas realizado 
por Aerogal y participa por sorteos de pasajes a Quito y Guayaquil.</p>
<p>Las mejores historias ser�n publicadas en esta p�gina a final de cada mes,
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
Para reducir los gastos de su empresa en viajes a�reos.
AeroGal le ofrece las chequeras corporativas.</p>
<p>Valor: $ 44.00 c/u m�s un boleto gratis ( $3.00 tasas aeroportuarias) si el pago es al contado.</p>
<p>Incluye: 15 boletos de una v�a incluidos 12% I.V.A. y tasas de aeropuerto</p>
<p>Ruta: Quito/Guayaquil o Guayaquil /Quito </p>
<p>Nombre: Puede colocarse el nombre de cualquier pasajero adulto.</p>
<p>Recordatorio: Realizar las reservaciones del cupo.</p>
<p>Restricciones: Boletos v�lidos para volar �nicamente en AEROGAL.</p>
<p>No aplican reembolsos ni endosos.</p>
<p>Cont�ctanos a <a href="mailto:ventasmatriz@aerogal.com.ec       
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
<p>�
:: Uso de la sala VIP.
</p>
<p>
:: Los pasajeros podr�n presentarse 30 minutos antes del vuelo directamente al Counter de AEROGAL. 
</p>
<p>

:: Para el check-in se asignar� una columna claramente identificada exclusivamente para pasajeros VIP.
</p>
<p>

:: No se necesita realizar reservaci�n: cupo confirmado. 
</p>
<p>

:: Se asignar� asientos en las primeras filas.
</p>
<p>

:: Prioridad al abordar. 
</p>
<p>

:: Se permitir� como equipaje 30 kilos por pasajero. 
</p>
<p>

:: El equipaje tendr� una etiqueta VIP para identificarlo claramente y as� poder entregarlo �gilmente. </p>
<p>Cont�ctanos a <a href="mailto:ventasmatriz@aerogal.com.ec       
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
<h3>FERIA TRAVEL MART - LIMA�</h3>
</p>
<p>
AEROGAL particip� en la Feria Internacional "Travel Mart"  en la ciudad de Lima los d�as 14-15-16 de Septiembre.
</p>                 
<p>
Para esta feria Aerogal  realiz� una importante alianza con empresas como Ecoventura, Hotel Oro Verde y Swisshotel los mismos que realizaron un coctail para promocionar al Pa�s
</p>
<p>
En la foto consta nuestro stand con Jorge Luis P�ez, Jefe de Ventas.
</p>                 
<img src="<%=BASEURL%>/images/noticiaiguana.jpg" alt="" width="207" height="129"> 
<p>
<h3>Ecuador 2005�</h3>
</p>
<p>
En el hotel Hampton Inn se realiz� la presentaci�n del 
nuevo paquete tur�stico Ecuador 2005, 
el cual cont� con la presencia de los principales funcionarios 
de cada empresa auspiciante: 
Aerogal, Hemisferios, Ecuador Amazing y Seguros Coris. 
</p>
<p>
De esta forma Aerogal fomenta nuevamente al desarrollo 
tur�stico del pa�s. 
</p>
<h3>Grand Gymkana Mercure 2004�</h3>
El Grand Hotel Mercure Alameda Quito y -Le Club- 
organizaron el pasado 18 de diciembre la Grand Gymkana 
Mercure con el fin de aumentar las donaciones a ?Luces de Esperanza?. 
</p>
<p>
Aerogal fue uno de los auspiciantes de este evento, 
que tiene la finalidad de recaudar fondos que ser�n entregados a 
UNICEF, para los programas de la ni�ez ecuatoriana.
</p>
<img src="<%=BASEURL%>/images/fotonoticias.jpg" alt="" width="207" height="129"> 
<h3>Bingo �</h3>
<p>�
El 13 de diciembre, se realiz� el Metro Bingo organizado por 
Metropolitan Touring Guayaquil y el Hotel Hilton Col�n, 
con el fin de festejar a sus principales clientes. 
</p>
<p>
El Bingo se realiz� en las instalaciones del hotel. 
Aerogal, fue uno de los principales auspiciantes. 
</p>
<h3>Peque�os Escritores</h3> �
<p>
�Aerogal como uno de los auspiciantes del Concurso de Cuentos,
 organizado por Mr. Books el mi�rcoles 15 de diciembre en el 
local de Mall El Jard�n, 
don� dos pasajes a Gal�pagos para el ganador.
</p>
<h3>Feria Asomatur �</h3>
�<p>
El pasado 9 de diciembre del 2004 en el Grand Hotel Guayaquil 
se realiz� la Feria ASOMATUR, 
Asociaci�n de Mayoristas de Turismo del Ecuador, 
cap�tulo Guayaquil. 
</p>
<p>
Este evento se realiz� entre las 10h00 y 17h30 de ese d�a, 
en donde Aerogal fue uno de los auspiciantes 
junto a los principales hoteles, 
agencias de viajes y otras aerol�neas, 
que expusieron sus principales productos y servicios. 
</p>
<%-----<h3>Super Golazo�</h3>
�<p>
Este� 23 y 24 de octubre todos los� ecuatorianos aficionados al 
f�tbol pudieron jugar la primera apuesta de Super Golazo, 
un juego de pron�sticos deportivos, 
que arranc� con los partidos de� la liguilla final nacional.
</p>
<p>
Super Golazo tiene 3 categor�as. 
La primera consiste en acertar los 13 partidos; 
la segunda, 12 de los 13 partidos y la tercera consiste en 
acertar 11 de los 13 juegos.
</p>

Aerogal es uno de los patrocinadores oficiales de este juego, el cual beneficiar� econ�micamente al desarrollo del deporte en el pa�s, gracias a lo que recaude cada fin de semana. </p>
<img src="<%=BASEURL%>/images/supergolazo.gif" alt="" width="468" height="60"> 
<p>Cont�ctanos a <a href="mailto:ventasmatriz@aerogal.com.ec       
">ventasmatriz@aerogal.com.ec </a> </p> 
 -------------%>                
               <%break;
          case 9:
              //Video=BASEURL+"/respaldos/contactos.swf";      
              %>
<%-------------------------------------              
<h4>Cont�ctenos</h4> 

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
Amazonas 607 y Carri�n. Tel�f. (593 2) 2567664
</p>
<p>
P.O. Box: 17 ? 01 ? 244.
</p>
<p>
E-mail: <a href="mailto:ventasmatriz@aerogal.com.ec       
">ventasmatriz@aerogal.com.ec </a>
</p>
�
<h3>GUAYAQUIL:</h3>
<p>
Aeropuerto Sim�n Bol�var. Tel�f: (593 4) 2284218
</p>
<p>
Punto de Ventas:
</p>
<p>
Jun�n 440 y C�rdova. Tel�f: (593 4) 2310346
</p>
<p>
Reservas: (593 4) 2310352 / 2303076 / 2303077
</p>�
<h3>CUENCA:</h3>
<p>
Av. Aurelio Aguilar y Solano. Tel�f: (593 7) 2815250 / 2810789 / 2889500
</p>
<p>
Av. Espa�a 1091 y Francisco Pizarro. Tel�f: (593 7) 2861041 / 2804444
</p>
<h3>�GAL�PAGOS:</h3>
<p>
Aeropuerto Isla San Crist�bal. Tel�f: (593 5) 2521117 / 2521118 / 2521120
</p>
<p>
Aeropuerto Isla Baltra. Tel�f: (593 5) 2520405
</p>
<p>
Oficina Santa Cruz: Tel�f: (593 5) 2526798 / 2596797
�</p>
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
<h3>REPRESENTANTES DE AEROGAL EN ESPA�A: </h3>
<p>
connexions aviation & tourism
</p>              

<p>
Oficina MADRID:
</p>
<p>
Serrano 93, 2�A
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
Paseo de Gracia, 11-7�
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