<table width="100%" align="right">
<%DecimalFormat f1 =new DecimalFormat("0000");
String Dia=request.getParameter("Dia");
         String Mes=request.getParameter("Mes");
         String Anio=request.getParameter("Anio");
         int dia=0;
         int mes=0;
         int anio=0;
         Calendar hoy=Calendar.getInstance();
        
         if (Dia==null)
             dia=hoy.get(Calendar.DATE);
         else
             dia=Integer.parseInt(Dia);
         
         if (Mes==null)
             mes=hoy.get(Calendar.MONTH)+1;
         else
             mes=Integer.parseInt(Mes);
         
         if (Anio==null)
             anio=hoy.get(Calendar.YEAR);
         else
             anio=Integer.parseInt(Anio);

%>
<tr class="form1">
<th colspan="6">
Vuelos en Chequeo
</th>
</tr>
<tr>
<th>No.</th>
<th>Org</th>
<th>Des</th>
<th>Hora</th>
<th>Estado</th>

</tr>
<%
 List list1 = model.getVueloreserva();
 
 //String Numero1="0";
 //String Fondo1="#66CCFF";
 int cont1=0;
 long chequeov=0;
 String Estado="";
 if (list1 != null) {
      Iterator it1 = list1.iterator();
      while (it1.hasNext()) {
          Chequeo vuelo=(Chequeo) it1.next();
          String seleccionUrl=CONTROLLER+"/Chequeo/Selecciona?codigo="+vuelo.getCodigo() ;
          if (chequeov!=vuelo.getCodigo())
          {
              Estado="";
              if (!Numero.equals(vuelo.getNumero()))
              {
                  Numero=vuelo.getNumero();
                  if (Fondo!="#ffffff")
                      Fondo="#ffffff";
                  else
                      Fondo="#66CCFF";
              }
              cont1++;
          chequeov=vuelo.getCodigo();
          %>
  <tr bgcolor="<%=Fondo%>">
      
       <td><A HREF="<%=seleccionUrl%>"> 
      
       <input type="checkbox" name="revisado<%=cont1%>" value= "<%=vuelo.getCodigo() %>"><%=vuelo.getNumero()%>
       </a></td>
       <td><%=vuelo.getOrigen()%></td>
       <td><%=vuelo.getDestino()%></td>
       <td><%=f1.format(vuelo.getHora())%></td>
       <td colspan="2"><%=vuelo.getEstadov()%></td>
       
      
  </tr>    
  <%}
          String tipo="";
          String estado="";
          
          if (vuelo.getEstado()==null)
              estado="";
          else
              estado=vuelo.getEstado();
          if (vuelo.getTipo()==null)
              tipo="";
          else
              tipo=vuelo.getTipo();
          if (Estado.equals(estado))
          {
              estado="";
          }
          else
          {
              
              Estado=vuelo.getEstado();
              estado=Estado;
          }
%>
  <tr  class="vuelo">
  <td><%=estado%></td>
  <td><%=tipo%></td>
  <td colspan="4"><%=vuelo.getPax()%></td>
  </tr>
 <%}}%>
 <input name="j" value="<%=cont1%>" 
type="hidden"  >

 <input name="Dia" value="<%=dia%>"
 type="hidden"  >         
 <input name="Mes" value="<%=mes%>"
 type="hidden"  > 
 <input name="Anio" value="<%=anio%>"
 type="hidden"  > 
 
</table>
