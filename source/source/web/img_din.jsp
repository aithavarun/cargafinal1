<%@page import="com.sun.image.codec.jpeg.JPEGImageEncoder"%>
<%@ page import="com.sun.image.codec.jpeg.JPEGCodec"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page contentType="image/jpeg" 
         import="java.awt.*,javax.servlet.*,java.util.*,java.text.*,Acme.JPM.Encoders.GifEncoder" 
         %>
<%

//Trae los parámetros que digitó el usuario
String sbX1 = request.getParameter("x1");
String sbY1 = request.getParameter("y1");
String sbX2 = request.getParameter("x2");
String sbY2 = request.getParameter("y2");

//Convierte a enteros
int iX1 = Integer.parseInt(sbX1);
int iY1 = Integer.parseInt(sbY1);
int iX2 = Integer.parseInt(sbX2);
int iY2 = Integer.parseInt(sbY2);

// Debe crear un objeto BufferedImage (para poder ser codificado en JPEG)
BufferedImage imgPantalla = new BufferedImage(200, 200, BufferedImage.TYPE_INT_RGB);

//El objeto grafico donde se pinta lo que usted quiera
Graphics graPantalla = imgPantalla.getGraphics();

// Color de fondo
graPantalla.setColor(Color.green);
graPantalla.fillRect(0, 0, 200, 200);

//Línea
graPantalla.setColor(Color.blue);
graPantalla.drawLine(iX1, iY1, iX2, iY2);

// Prepara el JSP para responder la petición del usuario
ServletOutputStream objSalida = response.getOutputStream();

// Crea un objeto para codificar en JPEG
JPEGImageEncoder objCodifica = JPEGCodec.createJPEGEncoder(objSalida);

//Codifica la imagen en JPEG
objCodifica.encode(imgPantalla);

%>
