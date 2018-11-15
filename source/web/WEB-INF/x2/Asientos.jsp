<table width="100%" align="CENTER">


<%
  List lista2 = model.getAsientos();
  int filas=model.getMaximafila();
  int columnas=model.getMaximacolumna();
  String color="#FF9900";
  String Matriz [][]=new String[filas+1][columnas+1];
  String Color="#FF9900";
  String Color1="#FF9900";
  int c=0;
  int c1=99;
  int c2=0;
  int c3=0;
  String Asiento="";
  if  (lista2 != null)  {
       Iterator itr = lista2.iterator();
       while (itr.hasNext()) {
            Asientos asiento=(Asientos) itr.next();
            Matriz[asiento.getFila()][asiento.getColumna()]=asiento.getAsienton(); 
            if (!Color.equals(asiento.getGrupo().trim()))
            {
                Color=asiento.getGrupo().trim();
                
                
                Color1="#FF"+f.format(c)+f.format(c1);
               c3++;
               if (c3  > (columnas))
                 c3=0;  
                
            } 
            
            
             Matriz[0][c3]=Color;
             Matriz[asiento.getFila()][0]=Color1;
            c2=c1;
            c1=c;
            c+=c2;
       }
  }
  // veo ocupacion
  
  List listaasiento = model.getAviones();
  String ocupados="";
  if  (listaasiento != null)  {
       Iterator itasiento = listaasiento.iterator();
       while (itasiento.hasNext()) {
            String ocupado=(String) itasiento.next();
            String fi=ocupado.substring(ocupado.length()-1,ocupado.length());
            ocupado=ocupado.trim();
            String col="";
            int lon=ocupado.length();
            if (lon==2)
            {
                fi=ocupado.substring(1);
                col=ocupado.substring(0,1);
            }
            else
            {
                fi=ocupado.substring(2,3);
                col=ocupado.substring(0,2);
            }
            int x=0;
            if (fi.equals("A"))
                x=1;
            else if (fi.equals("B"))
                x=2;
            else if (fi.equals("C"))
                x=3;
            else if (fi.equals("D"))
                x=5;
            else if (fi.equals("E"))
                x=6;
            else if (fi.equals("F"))
                x=7;
            if (filas==0)
                x=0;
            if (columnas+1<Integer.parseInt(col))
                col="0";
            Matriz[Integer.parseInt(col)][x]="*"+Matriz[Integer.parseInt(col)][x];
            //ocupados=ocupados+ocupado+"."+fi+"-"+col+"$";
            
       }
  }        
  
  for (int i=columnas;i>=0;i--)
  {
      
%>
<tr>
<%
     c3=0;
    for (int j=1;j<=filas;j++)
    {
        if (Matriz[j][i]==null)
        { 
            Matriz[j][i]="";
             color="#CCCCCC";
             Asiento="";
        }
        else
        {
            if (i==0)
            {
                
                if (!color.equals(Matriz[j][i]))
                {
                   c3++;
                    color=Matriz[j][i];
                    if (c3>columnas)
                        c3=0;
                }
                Asiento=Matriz[0][c3];
                //Asiento=Matriz[j][i];
            }
            else 
            {
                Asiento=Matriz[j][i];
               
                if (Asiento.indexOf("*")>=0)
                {
                    color="#FFCCFF";
                    //Asiento=String.valueOf(Asiento.indexOf("*"));
                }
                else
                {
                    color="#0099FF";
                }
                
            }
        }%>

       <td bgcolor="<%=color%>"><%=Asiento%></td> 
  <%}%>
  </tr>
  <%}
%>
</table>