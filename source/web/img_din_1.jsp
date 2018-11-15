<%@page import="com.sun.image.codec.jpeg.JPEGImageEncoder"%>
<%@ page import="com.sun.image.codec.jpeg.JPEGCodec"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page contentType="image/jpeg" 
         import="java.awt.*,javax.servlet.*,java.util.*,java.text.*,Acme.JPM.Encoders.GifEncoder" 
         %>
<%
            
Frame ventanaMarco = new Frame(); 
     ventanaMarco.addNotify(); 
     Graphics contextoGrafico=null;
int w = 200;
          int h = 50;

          Image offscreen = ventanaMarco.createImage(w, h);
          contextoGrafico = offscreen.getGraphics();
      
          contextoGrafico.setFont(new Font("Arial", Font.BOLD | Font.ITALIC, 20));

          contextoGrafico.draw3DRect(0,0,w-1,h-1,true);

          Date ahora = new Date();
          SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy HH:mm");

          contextoGrafico.drawString(formateador.format(ahora), 20, 30);

          // Encode the off screen graphics into a GIF and send it to the client
          //res.setContentType("image/gif");
          //GifEncoder encoder = new GifEncoder(offscreen, bufferSalida);
          // encoder.encode();

          //bufferSalida.flush();
          //bufferSalida.close();

%>
