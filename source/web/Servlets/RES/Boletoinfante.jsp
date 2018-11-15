<%   
reservas=0;
  if  (lista3 != null)  {
      Iterator itri = lista3.iterator();
      while (itri.hasNext()) {
            Tarifasreservas reserva=(Tarifasreservas) itri.next();
            i++;
            //TarifaString[i]=reserva.getBase();
            segunda=reserva.getValor();
            
            
%>
<%
                   //}}
   if ((reservas!=reserva.getBoleto()) && (reservas > 0))
            { 
                posy+=0.4;
                jj++;
                origen=reserva.getOrigen();
           //Impresion+="<p><a href=javascript:imprSelec('"+String.valueOf(reserva.getBoleto())+"')>"+ reserva.getApellido()+"/"+reserva.getNombre() +"</a></p>";
%>
<%}%>
<%
            //if (reservas!=reserva.getReservacodigo())
            if (reservas!=reserva.getBoleto())
            {
                i=0;
                platas=0;
                reservas=reserva.getBoleto();
                postotal+=17.3;
                capa++;    
                seguro=0;
                tasa=0;
                valor=0;
                q=0;
                sc=0;
                iva=0;
                pagosrutas="";
                 //posy=-5
                jj=0;
                posy=-0.4;
                origen=reserva.getOrigen();
            %> 
<div id="B<%=reserva.getBoleto()%>" style="position:absolute; left:0cm;top:<%=postotal%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <div id="origendestinoi<%=capa%>" style="position:absolute; left:12cm;top:9.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <span id="TTotal<%=capa%>">
    UIO-UIO
    </span>
    </div>
    <div id="cabecerafechai<%=capa%>" style="position:absolute; left:14.5cm;top:9.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    AEROGAL-<%=FORMATOFECHA.format(hoy.getTime())%> 
    </div>
    <div id="cabeceranotendi<%=capa%>" style="position:absolute; left:4cm;top:9.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
<%
if (contacto.getCodigopta()>0) 
{
%>
    NOT END
<%
}
else
{
%>
    NO REFUND 
<%}%>
    </div>
    <div id="cabecerianotendbr<%=capa%>" style="position:absolute; left:4cm;top:9.8cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
 <%if (usuario.getAcceso()==1)
         {%>
         BR=<%=model.getCotizacion()%>
         <%}%>
    </div>
    <div id="cabecerabookingi<%=capa%>" style="position:absolute; left:12cm;top:9.8cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
<%=contacto.getBooking()%>
    </div>
    <div id="cabeceraruci<%=capa%>" style="position:absolute; left:14.5cm;top:9.8cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
<%if (usuario.getAcceso()==1)
 {%>
    N.I.T.:900090331-2 <%=usuario.getNombre()%>
 <%}
else
{%>
    R.U.C.:1790727203001 <%=usuario.getNombre()%>
<%}%>
    </div>
    <div id="cabeceraniti<%=capa%>" style="position:absolute; left:3cm;top:10cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
<% if(!contacto.getRuc().trim().equals(""))
  {%>
         <%if (usuario.getAcceso()==1)
         {%>
             N.I.T.:R.U.C.:<%=contacto.getRuc()%> - Razon social:<%=contacto.getRazon()%>
         <%}
        else
        {%>
            R.U.C.:<%=contacto.getRuc()%> - Razon social:<%=contacto.getRazon()%>
        <%}%>

     
  <%}%> 
    </div>
    <div id="cabecerasucursali<%=capa%>" style="position:absolute; left:12cm;top:10.1cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <%=usuario.getSucursal()%>
    </div>

    <div id="cabeceraciudadi<%=capa%>" style="position:absolute; left:14.5cm;top:10.1cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
<%if (usuario.getAcceso()==1)
 {%>
    BOGOTA - COLOMBIA
 <%}
else
{%>
    QUITO - ECUADOR 
<%}%>
    </div>
    <div id="cabeceranombrei<%=capa%>" style="position:absolute; left:1cm;top:10.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <a href="javascript:imprSelec('B<%=String.valueOf(reserva.getBoleto())%>')"><%=reserva.getNombre()%> <%=reserva.getApellido()%></a>
    </div>
    <div id="cabeceratouri<%=capa%>" style="position:absolute; left:10cm;top:10.5cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">
    <%=contacto.getTour()%> 
    </div>

   <%}
          else
                {
                
                 if (reserva.getSegurovias()==1)
                    reserva.setSeguro(0);
                if (reserva.getTasavias()==1)
                    reserva.setTasa(0);
            }   
   destino="";
   //jj=0;
   //pagosrutas="";
   
   segunda=reserva.getValor();
   
     posy+=0.4  ; 
      j++; 
       jj++;
  seguro+=reserva.getSeguro();
  tasa+=reserva.getTasa();
  valor+=reserva.getValor()*(1-reserva.getDescuento()/100);
  q+=reserva.getCola();
  iva+=reserva.getIva()*(1-reserva.getDescuento()/100);
  destino=reserva.getDestino();
  sc=reserva.getSc();
  platas+=(reserva.getValor()*(1-reserva.getDescuento()/100)+reserva.getCola());
  if (q==0)
   pagosrutas+=reserva.getOrigen().trim()+" 2K "+String.valueOf(reserva.getValor())+" "+reserva.getDestino().trim()  + " 2K " ;   
  else
  pagosrutas+=reserva.getOrigen().trim()+" 2K "+String.valueOf(reserva.getValor())+" Q: "+String.valueOf(reserva.getCola())+" "+reserva.getDestino().trim()  + " 2K " ;
  %>

    <div id="cabeceraviajei<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=model.EsCiudad(reserva.getOrigen())%>
    </div>
    <div id="cabecera2ki<%=capa%><%=jj%>" style="position:absolute; left:4.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                          
    2K
    </div>
<%if (!reserva.getNumero().trim().equals("OPEN"))
{
                     %>

    <div id="cabeceranumeroi<%=capa%><%=jj%>" style="position:absolute; left:5.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getNumero()%>
    </div>
    <div id="cabecerabasei<%=capa%><%=jj%>" style="position:absolute; left:6.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getBase().trim().substring(0,1)%>
    </div>
    <div id="cabecerafechaviajei<%=capa%><%=jj%>" style="position:absolute; left:7.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(reserva.getFecha())%>
    </div>
    <div id="cabecerahorai<%=capa%><%=jj%>" style="position:absolute; left:8.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=f1.format(reserva.getHora())+":"+f1.format(reserva.getMinuto())%>
    </div>
    <div id="cabeceraoki<%=capa%><%=jj%>" style="position:absolute; left:10cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OK
    </div>
    <div id="cabeceratarifabasei<%=capa%><%=jj%>" style="position:absolute; left:11cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getBase()%>
    </div>
    <div id="cabeceradesdei<%=capa%><%=jj%>" style="position:absolute; left:14.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(hoy.getTime())%>
    </div>
    <div id="cabecerahastai<%=capa%><%=jj%>" style="position:absolute; left:16cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(reserva.getValidez())%>
    </div>
    <div id="cabecera20i<%=capa%><%=jj%>" style="position:absolute; left:17.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    20
    </div>
<%}
else
{%>
    <div id="cabeceraoi1" style="position:absolute; left:5.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getNumero()%>
    </div>
    <div id="cabeceraoi2" style="position:absolute; left:6.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getBase().trim().substring(0,1)%>
    </div>
    <div id="cabeceraoi3" style="position:absolute; left:7.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OPEN
    </div>
    <div id="cabeceraoi4" style="position:absolute; left:9.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OPEN
    </div>
    <div id="cabeceraoi5" style="position:absolute; left:10cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OPEN
    </div>
    <div id="cabeceraoi6" style="position:absolute; left:11cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=reserva.getBase()%>
    </div>
    <div id="cabeceraoi7" style="position:absolute; left:14.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(hoy.getTime())%>
    </div>
    <div id="cabeceraoi8" style="position:absolute; left:16cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=FORMATOFECHA.format(reserva.getValidez())%>
    </div>
    <div id="cabeceraoi9" style="position:absolute; left:17.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    20
    </div>

<%}}}%> 
 <% posy+=0.4;
         jj++;
 //if (cuantos==1)
 //{
%>         
<%-------------------------- retirar luego-------%>
<%@ include file="/Servlets/Boletodetalle.jsp"%>  
<%-------------------------- retirar luego--------%>
