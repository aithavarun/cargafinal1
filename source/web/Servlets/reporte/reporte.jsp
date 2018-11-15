<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.DecimalFormatSymbols" %>
<%! 
public char separa_decimal;
public String formatoNumero;
public void setFormato(String Formato,char decimal){
	this.separa_decimal=decimal;
	this.formatoNumero=Formato;
}
public String format(Object o,boolean formateado){
if(!formateado){
	return o.toString();
}
 DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
  simbolos.setDecimalSeparator(separa_decimal);
  DecimalFormat formateador = new DecimalFormat(formatoNumero,simbolos);
 
//return formateador.format (Double.valueOf(o.toString()).doubleValue())+"|"+o;
return formateador.format (Double.valueOf(o.toString()).doubleValue());
}  %>
<%
String Acciondef33="text/html; charset=utf-8";
if (request.getParameter("formato") !=null) {
Acciondef33="application/vnd.ms-excel";
}else{
Acciondef33="text/html; charset=utf-8";
}%>


<% 
if (request.getParameter("formato") !=null) {
String nombre = "fichero_"+request.getParameter("offset")+".xls";
response.setHeader("contentType",Acciondef33);
response.setHeader("Content-Disposition","attachment; filename=\""+ nombre + "\"");
}
 %>
<%
String rs_guiadecarga__MMColParam = "1";
if (request.getParameter("fecha_ini") !=null) {rs_guiadecarga__MMColParam = (String)request.getParameter("fecha_ini");}
String rs_guiadecarga__MMColParam_2 = "1";
if (request.getParameter("fecha_fin") !=null) {rs_guiadecarga__MMColParam_2 = (String)request.getParameter("fecha_fin");}
String direccion2k779sd="";
%>
<%
		ServletContext context=application;
		String jdbcDriver = context.getInitParameter("jdbcDriver");
        if(jdbcDriver == null)
            throw new ServletException("JDBC no definida en Servlet");
        String databaseURL = context.getInitParameter("databaseURL");
        if(databaseURL == null)
            throw new ServletException("databaseURL no definida en Servlet");
        String usuario = context.getInitParameter("username");
        if(usuario == null)
            throw new ServletException("usuario no definida en Servlet");
        String clave = context.getInitParameter("password");
        if(clave == null)
            throw new ServletException("Clave no definida en Servlet");

Driver Driverrs_guiadecarga = (Driver)Class.forName(jdbcDriver).newInstance();
Connection Connrs_guiadecarga = DriverManager.getConnection(databaseURL,usuario,clave);
PreparedStatement Statementrs_guiadecarga = Connrs_guiadecarga.prepareStatement("SELECT guilcodigo, guilnumero, to_char(guidfecha,'DD/MM/YYYY') as guidfecha, guiipiezas, guinpeso, guiscontiene, guisremitente, guisdestinatario, guisruc, guistelefono, guincredito, clilcodigo, guissucursal, guiientregaen, guibentregadosino, usuarioentrega, guisobservacion, guisusuario, guinflete, guinedomicilio, guintransportea, guinseguro, guinotros, guindescuento, guiniva, guintotal, prolsecuencial, guinpesovol, guinservicioa, guiihora, guiiminutos, guisestado, guisdireccion, guisguiafactura, manlsecuencial, usuariorecibe, fechagrabaentrega, fechagrabarecibe, guisorigen, guisdestino, faclnumfactura, tiplsecuencial, guisquienretira, guisciquienretira, guisobservadespacho, guindescuentop, guistransito, guilmanifiestotransito, guisserie, guistelefonor, guintarifaneta  FROM guiadecarga WHERE guidfecha between to_timestamp(?, 'DD/MM/YYYY') and to_timestamp(?, 'DD/MM/YYYY')  order by guilnumero");
Statementrs_guiadecarga.setObject(1, rs_guiadecarga__MMColParam);
Statementrs_guiadecarga.setObject(2, rs_guiadecarga__MMColParam_2);
ResultSet rs_guiadecarga = Statementrs_guiadecarga.executeQuery();
boolean rs_guiadecarga_isEmpty = !rs_guiadecarga.next();
boolean rs_guiadecarga_hasData = !rs_guiadecarga_isEmpty;
Object rs_guiadecarga_data;
int rs_guiadecarga_numRows = 0;
%>
<%
int Repeat1__numRows = 1000;
int Repeat1__index = 0;
rs_guiadecarga_numRows += Repeat1__numRows;
%>
<%
// *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

int rs_guiadecarga_first = 1;
int rs_guiadecarga_last  = 1;
int rs_guiadecarga_total = -1;

if (rs_guiadecarga_isEmpty) {
  rs_guiadecarga_total = rs_guiadecarga_first = rs_guiadecarga_last = 0;
}

//set the number of rows displayed on this page
if (rs_guiadecarga_numRows == 0) {
  rs_guiadecarga_numRows = 1;
}
%>
<%
// *** Recordset Stats: if we don't know the record count, manually count them

if (rs_guiadecarga_total == -1) {

  // count the total records by iterating through the recordset
    for (rs_guiadecarga_total = 1; rs_guiadecarga.next(); rs_guiadecarga_total++);

  // reset the cursor to the beginning
  rs_guiadecarga.close();
  rs_guiadecarga = Statementrs_guiadecarga.executeQuery();
  rs_guiadecarga_hasData = rs_guiadecarga.next();

  // set the number of rows displayed on this page
  if (rs_guiadecarga_numRows < 0 || rs_guiadecarga_numRows > rs_guiadecarga_total) {
    rs_guiadecarga_numRows = rs_guiadecarga_total;
  }

  // set the first and last displayed record
  rs_guiadecarga_first = Math.min(rs_guiadecarga_first, rs_guiadecarga_total);
  rs_guiadecarga_last  = Math.min(rs_guiadecarga_first + rs_guiadecarga_numRows - 1, rs_guiadecarga_total);
}
%>
<% String MM_paramName = ""; %>
<%
// *** Move To Record and Go To Record: declare variables

ResultSet MM_rs = rs_guiadecarga;
int       MM_rsCount = rs_guiadecarga_total;
int       MM_size = rs_guiadecarga_numRows;
String    MM_uniqueCol = "";
          MM_paramName = "";
int       MM_offset = 0;
boolean   MM_atTotal = false;
boolean   MM_paramIsDefined = (MM_paramName.length() != 0 && request.getParameter(MM_paramName) != null);
%>
<%
// *** Move To Record: handle 'index' or 'offset' parameter

if (!MM_paramIsDefined && MM_rsCount != 0) {

  //use index parameter if defined, otherwise use offset parameter
  String r = request.getParameter("index");
  if (r==null) r = request.getParameter("offset");
  if (r!=null) MM_offset = Integer.parseInt(r);

  // if we have a record count, check if we are past the end of the recordset
  if (MM_rsCount != -1) {
    if (MM_offset >= MM_rsCount || MM_offset == -1) {  // past end or move last
      if (MM_rsCount % MM_size != 0)    // last page not a full repeat region
        MM_offset = MM_rsCount - MM_rsCount % MM_size;
      else
        MM_offset = MM_rsCount - MM_size;
    }
  }

  //move the cursor to the selected record
  int i;
  for (i=0; rs_guiadecarga_hasData && (i < MM_offset || MM_offset == -1); i++) {
    rs_guiadecarga_hasData = MM_rs.next();
  }
  if (!rs_guiadecarga_hasData) MM_offset = i;  // set MM_offset to the last possible record
}
%>
<%
// *** Move To Record: if we dont know the record count, check the display range

if (MM_rsCount == -1) {

  // walk to the end of the display range for this page
  int i;
  for (i=MM_offset; rs_guiadecarga_hasData && (MM_size < 0 || i < MM_offset + MM_size); i++) {
    rs_guiadecarga_hasData = MM_rs.next();
  }

  // if we walked off the end of the recordset, set MM_rsCount and MM_size
  if (!rs_guiadecarga_hasData) {
    MM_rsCount = i;
    if (MM_size < 0 || MM_size > MM_rsCount) MM_size = MM_rsCount;
  }

  // if we walked off the end, set the offset based on page size
  if (!rs_guiadecarga_hasData && !MM_paramIsDefined) {
    if (MM_offset > MM_rsCount - MM_size || MM_offset == -1) { //check if past end or last
      if (MM_rsCount % MM_size != 0)  //last page has less records than MM_size
        MM_offset = MM_rsCount - MM_rsCount % MM_size;
      else
        MM_offset = MM_rsCount - MM_size;
    }
  }

  // reset the cursor to the beginning
  rs_guiadecarga.close();
  rs_guiadecarga = Statementrs_guiadecarga.executeQuery();
  rs_guiadecarga_hasData = rs_guiadecarga.next();
  MM_rs = rs_guiadecarga;

  // move the cursor to the selected record
  for (i=0; rs_guiadecarga_hasData && i < MM_offset; i++) {
    rs_guiadecarga_hasData = MM_rs.next();
  }
}
%>
<%
// *** Move To Record: update recordset stats

// set the first and last displayed record
rs_guiadecarga_first = MM_offset + 1;
rs_guiadecarga_last  = MM_offset + MM_size;
if (MM_rsCount != -1) {
  rs_guiadecarga_first = Math.min(rs_guiadecarga_first, MM_rsCount);
  rs_guiadecarga_last  = Math.min(rs_guiadecarga_last, MM_rsCount);
}

// set the boolean used by hide region to check if we are on the last record
MM_atTotal  = (MM_rsCount != -1 && MM_offset + MM_size >= MM_rsCount);
%>
<%
// *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

String MM_keepBoth,MM_keepURL="",MM_keepForm="",MM_keepNone="";
String[] MM_removeList = { "index", MM_paramName };

// create the MM_keepURL string
if (request.getQueryString() != null) {
  MM_keepURL = '&' + request.getQueryString();
  for (int i=0; i < MM_removeList.length && MM_removeList[i].length() != 0; i++) {
  int start = MM_keepURL.indexOf(MM_removeList[i]) - 1;
    if (start >= 0 && MM_keepURL.charAt(start) == '&' &&
        MM_keepURL.charAt(start + MM_removeList[i].length() + 1) == '=') {
      int stop = MM_keepURL.indexOf('&', start + 1);
      if (stop == -1) stop = MM_keepURL.length();
      MM_keepURL = MM_keepURL.substring(0,start) + MM_keepURL.substring(stop);
    }
  }
}

// add the Form variables to the MM_keepForm string
if (request.getParameterNames().hasMoreElements()) {
  java.util.Enumeration items = request.getParameterNames();
  while (items.hasMoreElements()) {
    String nextItem = (String)items.nextElement();
    boolean found = false;
    for (int i=0; !found && i < MM_removeList.length; i++) {
      if (MM_removeList[i].equals(nextItem)) found = true;
    }
    if (!found && MM_keepURL.indexOf('&' + nextItem + '=') == -1) {
      MM_keepForm = MM_keepForm + '&' + nextItem + '=' + java.net.URLEncoder.encode(request.getParameter(nextItem));
    }
  }
}

String tempStr = "";
for (int i=0; i < MM_keepURL.length(); i++) {
  if (MM_keepURL.charAt(i) == '<') tempStr = tempStr + "&lt;";
  else if (MM_keepURL.charAt(i) == '>') tempStr = tempStr + "&gt;";
  else if (MM_keepURL.charAt(i) == '"') tempStr = tempStr +  "&quot;";
  else tempStr = tempStr + MM_keepURL.charAt(i);
}
MM_keepURL = tempStr;

tempStr = "";
for (int i=0; i < MM_keepForm.length(); i++) {
  if (MM_keepForm.charAt(i) == '<') tempStr = tempStr + "&lt;";
  else if (MM_keepForm.charAt(i) == '>') tempStr = tempStr + "&gt;";
  else if (MM_keepForm.charAt(i) == '"') tempStr = tempStr +  "&quot;";
  else tempStr = tempStr + MM_keepForm.charAt(i);
}
MM_keepForm = tempStr;

// create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL + MM_keepForm;
if (MM_keepBoth.length() > 0) MM_keepBoth = MM_keepBoth.substring(1);
if (MM_keepURL.length() > 0)  MM_keepURL = MM_keepURL.substring(1);
if (MM_keepForm.length() > 0) MM_keepForm = MM_keepForm.substring(1);
%>
<%
// *** Move To Record: set the strings for the first, last, next, and previous links

String MM_moveFirst,MM_moveLast,MM_moveNext,MM_movePrev;
{
  String MM_keepMove = MM_keepBoth;  // keep both Form and URL parameters for moves
  String MM_moveParam = "index=";

  // if the page has a repeated region, remove 'offset' from the maintained parameters
  if (MM_size > 1) {
    MM_moveParam = "offset=";
    int start = MM_keepMove.indexOf(MM_moveParam);
    if (start != -1 && (start == 0 || MM_keepMove.charAt(start-1) == '&')) {
      int stop = MM_keepMove.indexOf('&', start);
      if (start == 0 && stop != -1) stop++;
      if (stop == -1) stop = MM_keepMove.length();
      if (start > 0) start--;
      MM_keepMove = MM_keepMove.substring(0,start) + MM_keepMove.substring(stop);
    }
  }

  // set the strings for the move to links
  StringBuffer urlStr = new StringBuffer(request.getRequestURI()).append('?').append(MM_keepMove);
  if (MM_keepMove.length() > 0) urlStr.append('&');
  urlStr.append(MM_moveParam);
  MM_moveFirst = urlStr + "0";
  MM_moveLast  = urlStr + "-1";
  MM_moveNext  = urlStr + Integer.toString(MM_offset+MM_size);
  MM_movePrev  = urlStr + Integer.toString(Math.max(MM_offset-MM_size,0));
  direccion2k779sd=urlStr.toString();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.:Reporte-Carga:.</title>
<style type="text/css">
.num{ background:#EAF4FF;}
</style>
<style type="text/css">
.fech{ background:#E6FFE6;}
</style>
</head>

<body>
<% int rowncount=0;%>
<% setFormato(request.getParameter("formato_numero"),(request.getParameter("sepa_decimal").toString()).charAt(0)); %>
<% for(int j=0; j<=rs_guiadecarga_total ;j=j+Repeat1__numRows ) { %>
<% if (request.getParameter("formato") ==null) { %> <a href="<%= direccion2k779sd %><%= j %>&formato=excel">Segmento_<%= j %></a><br /><% } %>
  <%  
  }
  %>
<% String apc="";
	boolean f=false;  
  if (request.getParameter("formato") !=null) {  
  f=true;
  apc="&nbsp;";  
  } %>
  <%= apc %>
<table border="1">
  <tr>
    <td>#</td>
    <td>guilcodigo</td>
    <td>guilnumero</td>
    <td class="fech">guidfecha</td>
    <td class="num">guiipiezas</td>
    <td class="num">guinpeso</td>
    <td>guiscontiene</td>
    <td>guisremitente</td>
    <td>guisdestinatario</td>
    <td>guisruc</td>
    <td>guistelefono</td>
    <td class="num">guincredito</td>
    <td>clilcodigo</td>
    <td>guissucursal</td>
    <td>guiientregaen</td>
    <td>guibentregadosino</td>
    <td>usuarioentrega</td>
    <td>guisobservacion</td>
    <td>guisusuario</td>
    <td class="num">guintarifaneta</td>
    <td class="num">guinflete</td>
    <td class="num">guinedomicilio</td>
    <td class="num">guintransportea</td>
    <td class="num">guinseguro</td>
    <td class="num">guinotros</td>
    <td class="num">guindescuento</td>
    <td class="num">guiniva</td>
    <td class="num">guintotal</td>
    <td>prolsecuencial</td>
    <td class="num">guinpesovol</td>
    <td class="num">guinservicioa</td>
    <td>guiihora</td>
    <td>guiiminutos</td>
    <td>guisestado</td>
    <td>guisdireccion</td>
    <td>guisguiafactura</td>
    <td>manlsecuencial</td>
    <td>usuariorecibe</td>
    <td>fechagrabaentrega</td>
    <td>fechagrabarecibe</td>
    <td>guisorigen</td>
    <td>guisdestino</td>
    <td>faclnumfactura</td>
    <td>tiplsecuencial</td>
    <td>guisquienretira</td>
    <td>guisciquienretira</td>
    <td>guisobservadespacho</td>
    <td class="num">guindescuentop</td>
    <td>guistransito</td>
    <td>guilmanifiestotransito</td>
    <td>guisserie</td>
    <td>guistelefonor</td>
  </tr>
  <% while ((rs_guiadecarga_hasData)&&(Repeat1__numRows-- != 0)) { %>
    <tr>
      <td><%=rs_guiadecarga_first+rowncount %> <% rowncount++;%></td>	
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guilcodigo"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guilnumero"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td class="fech"><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guidfecha"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guiipiezas"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guinpeso"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guiscontiene"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisremitente"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisdestinatario"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisruc"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%><%= apc %></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guistelefono"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guincredito"))==null || rs_guiadecarga.wasNull())?"":format(rs_guiadecarga_data,f))%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("clilcodigo"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guissucursal"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guiientregaen"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guibentregadosino"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("usuarioentrega"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisobservacion"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisusuario"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guintarifaneta"))==null || rs_guiadecarga.wasNull())?"":format(rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guinflete"))==null || rs_guiadecarga.wasNull())?"":format(rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guinedomicilio"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guintransportea"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guinseguro"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guinotros"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guindescuento"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guiniva"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guintotal"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("prolsecuencial"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>      
	  <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guinpesovol"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guinservicioa"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guiihora"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guiiminutos"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisestado"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisdireccion"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisguiafactura"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("manlsecuencial"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("usuariorecibe"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("fechagrabaentrega"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("fechagrabarecibe"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisorigen"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisdestino"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("faclnumfactura"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("tiplsecuencial"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisquienretira"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisciquienretira"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisobservadespacho"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>      
	  <td class="num"><%=(((rs_guiadecarga_data = rs_guiadecarga.getDouble("guindescuentop"))==null || rs_guiadecarga.wasNull())?"":format (rs_guiadecarga_data,f))%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guistransito"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guilmanifiestotransito"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guisserie"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
      <td><%= apc %><%=(((rs_guiadecarga_data = rs_guiadecarga.getObject("guistelefonor"))==null || rs_guiadecarga.wasNull())?"":rs_guiadecarga_data)%></td>
    </tr>
    <%
  Repeat1__index++;
  rs_guiadecarga_hasData = rs_guiadecarga.next();
}
%>
</table>
<% if (request.getParameter("formato") ==null) { %>
<table border="0">
  <tr>
    <td><% if (MM_offset !=0) { %>
        <a href="<%=MM_moveFirst%>">Primero</a>
        <% } /* end MM_offset != 0 */ %>
    </td>
    <td><% if (MM_offset !=0) { %>
        <a href="<%=MM_movePrev%>">Anterior</a>
        <% } /* end MM_offset != 0 */ %>
    </td>
    <td><% if (!MM_atTotal) { %>
        <a href="<%=MM_moveNext%>">Siguiente</a>
        <% } /* end !MM_atTotal */ %>
    </td>
    <td><% if (!MM_atTotal) { %>
        <a href="<%=MM_moveLast%>">Último</a>
        <% } /* end !MM_atTotal */ %>
    </td>
  </tr>
</table>
<br />
Registros <%=(rs_guiadecarga_first)%> a <%=(rs_guiadecarga_last)%> de <%=(rs_guiadecarga_total)%>
<% } %>
</body>
</html>
<%
rs_guiadecarga.close();
Statementrs_guiadecarga.close();
Connrs_guiadecarga.close();
%>
