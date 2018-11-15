<%------------------------nuevo------------------------%>


    <div id="cabeceradestino<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=model.EsCiudad(destino.trim())%>
    </div>

    <div id="cabecera1void<%=capa%><%=jj%>" style="position:absolute; left:4.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                          
    VOID
    </div>
    <div id="cabecera2void<%=capa%><%=jj%>" style="position:absolute; left:5.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="cabecera3void<%=capa%><%=jj%>" style="position:absolute; left:5.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="cabecera4<%=capa%><%=jj%>" style="position:absolute; left:7.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="cabecera5<%=capa%><%=jj%>" style="position:absolute; left:8.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="cabecera6<%=capa%><%=jj%>" style="position:absolute; left:10cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OK
    </div>
    <div id="cabecera7<%=capa%><%=jj%>" style="position:absolute; left:11cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="cabecera8<%=capa%><%=jj%>" style="position:absolute; left:14.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    0000
    </div>
    <div id="cabecera9<%=capa%><%=jj%>" style="position:absolute; left:16cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    0000
    </div>
    <div id="cabecera10<%=capa%><%=jj%>" style="position:absolute; left:17.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    00
    </div>
<%while (jj<4)/// era 5 vear
{
       posy+=0.4;
       jj++;
       %>
    <div id="cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="Acabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:4.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                          
    VOID
    </div>
    <div id="b2cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:5.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="c3cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:5.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="d4cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:7.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="e5cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:8.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="f6cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:10cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    OK
    </div>
    <div id="g7cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:11cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    VOID
    </div>
    <div id="h8cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:14.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    0000
    </div>
    <div id="i9cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:16cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    0000
    </div>
    <div id="j10cabecera<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:17.5cm;top:<%=12+posy%>cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    00
    </div>
       
<%
//postotal+=posy+12.5;

}%>
<%
acceso=model.AccesoCiudad(origen.trim().toUpperCase());
porcentajeiva=12;
if (origen.equals(destino))
    oneway=2;
 if (acceso==1)
 {
     if (oneway==2)
         porcentajeiva=8;
     else
         porcentajeiva=16;
 }

porcentajeiva=porcentajeiva/100;

%>


<%
//porcentajeiva=12;

if (origen.trim().equals(destino.trim()))
    oneway=2;
 if (acceso==1)
 {
    cotiz=model.getCotizacion();
    pais="YS";
    moneda="PESOS";
    equivalente=valor+q;
 }

%>

    <div id="cabeceratarifatotal<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:13.8cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    USD <%=f.format(valor+q)%>
    </div>
    <div id="cabeceraequivalente<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:14.2cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=moneda%> <%=f.format((equivalente)*cotiz)%>
    </div>
    <div id="cabecerapagos<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:4cm;top:14.2cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
<%------------------
<%=pagosrutas%> 2K <%=f.format(segunda)%> <%=destino%> 2K <%=f.format(reserva.getValor())%> TTL USD <%=f.format(reserva.getValor()*2)%>
-------------------%>
    <%=pagosrutas%> TTL  <%=f.format(platas)%>
    </div>
    <div id="cabeceraiva<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:14.6cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=moneda%> <%=pais%>  <%=f.format((valor+q)*porcentajeiva*cotiz)%>
    </div>
    <div id="cabecerawt<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:15cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=moneda%> WT <%=f.format(tasa*cotiz)%>
    </div>
    <div id="cabecerapta<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:10cm;top:15cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=documento%>
<%if (contacto.getCodigopta()>0)
{
%>                    
    PTA: <%=contacto.getNumeropta()%> <%=contacto.getNombrepta()%>
<%}%>

    </div>
    <div id="cabeceraxt<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:15.4cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">                        
    <%=moneda%> XT <%=f.format(seguro*cotiz)%>
    </div>

    <div id="cabecerandac<%=jj%>void<%=capa%><%=jj%>" style="position:absolute; left:1cm;top:15.8cm ;font-family:'sans-serif'; font-size:10px; font-style:normal;">    
<%
if (contacto.getCodigopta()>0)
{
%>                    
    N.A.D.C. 
<%}
else
{%>

    <%=moneda%>   <%=f.format((sc+tasa+seguro+valor+q+(valor+q)*porcentajeiva)*cotiz)%>

<%}%>
    </div>
</div>
<script language="JavaScript"> 
//alert("entra");
document.getElementById("TTotal<%=capa%>").innerHTML="<%=origen%> <%=destino%>";
//alert("sale");
</script>
