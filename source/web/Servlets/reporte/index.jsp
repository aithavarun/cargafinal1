<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="/WEB-INF/ErrorPage.jsp" %>
<%@ page session="true" %>
<%@ page import="com.aerogal.support.model.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/WEB-INF/InitModel.jsp"%>
 
<%
       
         //Usuarios usuario=model.getUsuarios();
        
        %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t&iacute;tulo</title>
</head>

<body>
<%@ include file="/WEB-INF/Banner.jsp"%> 
<table width="100%" border="0" cellspacing="0" cellpadding="4">
  <thead>
    <tr style="text-align: center;background-color: #da2912;color: white;">
      <td colspan="3">Reporte General</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td width="1%">&nbsp;</td>
      <td width="76%" style="text-align: right;"><form id="form1" name="form1" method="get" action="reporte.jsp">
        <table width="100%" border="1">
        <tr>
          <td width="18%">Fecha inicio</td>
          <td width="27%">
            <label>
              <input name="fecha_ini" type="text" id="fecha_ini" size="12" maxlength="10" />
              </label>                DD/MM/YYYY</td>
          <td width="7%">Fecha fin</td>
          <td width="28%"><input name="fecha_fin" type="text" id="fecha_fin" size="12" maxlength="10" />
            DD/MM/YYYY</td>
          <td colspan="2"><label>
            <input type="submit" name="Buscar" id="Buscar" value="Buscar" />
          </label></td>
          </tr>
        <tr>
          <td>Formato Numero</td>
          <td><label>
            <input name="formato_numero" type="text" id="formato_numero" value="###########.####" />
          </label></td>
          <td>Separador Decimal</td>
          <td><label>
            <input name="sepa_decimal" type="text" id="sepa_decimal" value="," size="2" maxlength="1" />
          </label></td>
          <td width="13%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
        </tr>
      </table>
      </form></td>
      <td width="23%"><%=usuario.getNombre()+"--"+usuario.getSucursal()+"--"+usuario.getGrupo() %></td>
    </tr>
    <tr>
      <td colspan="3"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color: #333333;">
        <tr>
          <td height="1"></td>
        </tr>
      </table></td>
    </tr>
  </tbody>
</table>


</body>
</html>
