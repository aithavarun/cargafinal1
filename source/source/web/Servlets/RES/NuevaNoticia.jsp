<%@ page session="true"%>
<%@ page errorPage="/WEB-INF/ErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aerogal.support.model.*"%>
<%@ include file="/WEB-INF/InitModel.jsp"%>
<%@ page import="java.text.DecimalFormat" %>
<link rel="stylesheet" href="<%=BASEURL%>/estilo1.css">
<html>
<head>


<script LANGUAGE="JavaScript"> 

function validate(frm)
{
        return true;    
}
</SCRIPT>
<title>Aerogal Intranet</title>
</head>
<body bgcolor=#a0a0a0
  >
 
<!--[if gte mso 9]><xml>
 <v:background id="_x0000_s1025" o:bwmode="white" o:targetscreensize="800,600">
  <v:fill src="/WEB-INF/IMAGES/fondorayas.jpg" o:title="fondo rayas" type="frame"/>
 </v:background></xml><![endif]-->
 <%----------------------------------------
<form  method="post" name="IntranetReservas"
            action="<%=CONTROLLER%>/Intranet/Password" onSubmit="return validate(this)">
            <input name="Idioma" id="Idioma" value="0" type= "hidden" >
            -----------------------------%>


            <%
            
             
             String Video=request.getParameter("Idioma");
             String Nuevo=request.getParameter("Nuevo");
             String Titulo="";
             String TituloIngles="";
             String Archivo="";
             String Parrafo="";
             String Noticia="";
             long Codigo=-1;
             %>
             <%
            List list = model.getNoticias();
            if(Nuevo==null)
            {
            if (list != null) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Noticias noticia=(Noticias) it.next();
                Titulo=noticia.getTitulo();
                TituloIngles=noticia.getTituloIngles();
                Archivo=noticia.getArchivo();
                Parrafo=noticia.getParrafo();
                Noticia=noticia.getNoticia();
                Codigo=noticia.getCodigo();
                if (Archivo==null)
                    Archivo="";
            }
            }
                        }
            else
            {
                Titulo="";
                Archivo="";
                Parrafo="";
                Noticia="";
                Codigo=-1;
                
            }
      %>  
            
 <%@ include file="/WEB-INF/Banner.jsp"%>       
</table>   

<table border="0" cellpadding="0" cellspacing="0" width="780" align="center">
<!-- fwtable fwsrc="<%=BASEURL%>/images/FormaAgencias.png" fwbase="<%=BASEURL%>/images/FormaAgencias.gif" fwstyle="Dreamweaver" fwdocid = "2019518708" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="21" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="721" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="38" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/FormaAgencias_r1_c1" src="<%=BASEURL%>/images/MantenimientoNoticias.gif" width="780" height="88" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="88" border="0" alt=""></td>
  </tr>
  <tr>
   <td background="<%=BASEURL%>/images/FormaAgencias_r2_c1.gif">&nbsp;</td>
   <td  valign="top" bgcolor="#ffffff" align="center"> 
   <form  method="post" name="NoticiasGrabar" enctype='multipart/form-data' 
    action="<%=CONTROLLER%>/Noticias/Grabar" onSubmit="return validate(this)">
    <input name="Codigo" value="<%=Codigo%>" type= "hidden" >    
    <input name="Respaldo" value="<%=Archivo%>" type= "hidden" >
    <table   width='100%' border="0" align="center" cellpadding="1" cellspacing="1" valign="top">        
    <tr>
    <td>
                   <table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1" >
                   <tr>
                   <td width="25%">Titulo Español:</td>
                   <td width="25%">Titulo Ingles:</td>
                   <td width="50%">Archivo Imagen:</td>
                   
                   </tr>
                   <tr>
                   <td width="25%">
                   
                   <input name= "Titulo" id="Titulo" type="text" class="entrada" size="30" value="<%=Titulo%>">
                   </td>
                   <td width="25%">
                   
                   <input name= "TituloIngles" id="TituloIngles" type="text" class="entrada" size="30" value="<%=TituloIngles%>">
                   </td>
                   <td width="50%">
                   
                   <input name= "Archivo" id="Archivo" type="file" class="entrada" size="25" value="<%=BASEURL%>/images/<%=Archivo%>">
                   </TD>
                   </tr>
                   <%if (!Archivo.equals(""))
                   {%>
                   <tr>
                   <td colspan="2">
                   <img src="<%=BASEURL%>/images/<%=Archivo%>"  border="0" alt="">
                   
                   </td>
                   </tr>
                   <%}%>
                   </table>
                   
                   <table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1" >
                   <tr>
                   <td >Parrafo Español:</td>
                   </tr>
                   <tr>
                   <td >
                   <textarea name="Parrafo" id="Parrafo" class="Entrada" cols="80" rows="4"><%=Parrafo%></textarea>
                   </td>
                   </tr>
                   <tr>
                   <td >Parrafo Ingles:</td>
                   </tr>
                   <tr>
                   <td >
                   <textarea name="Noticia" id="Noticia" class="Entrada" cols="80" rows="10" ><%=Noticia%></textarea>
                   </td>
                   </tr>
                   
                   </table>
                   
    </td>
    </tr>
    <tr>
    <td align="center">
                    <table  width='100%' border="0" align="center" cellpadding="1" cellspacing="1" >
                <tr>
                
                <td><input align="center" TYPE="SUBMIT" NAME="Grabar"  value=":: Grabar ::"  ></td>
                <td><input align="center" TYPE="SUBMIT" NAME="Borrar"  value=":: Borrar ::"  ></td>
                <td><input align="center" TYPE="SUBMIT" NAME="Salir"  value=":: Salir ::" ></td>
                
                

                </tr>
                </table>
                
    </td>
    </tr>
    </table>
    </form>
   </td>
   <td background="<%=BASEURL%>/images/FormaAgencias_r2_c3.gif">&nbsp;</td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/FormaAgencias_r3_c1" src="<%=BASEURL%>/images/FormaAgencias_r3_c1.gif" width="780" height="51" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="51" border="0" alt=""></td>
  </tr>
  </table>

</body>
</html>
