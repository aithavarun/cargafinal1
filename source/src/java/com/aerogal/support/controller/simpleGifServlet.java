/*
* simpleGifServlet.java
*
* Created on June 29, 2003, 10:42 PM
*/
package com.aerogal.support.controller;
import java.awt.*; 

import java.io.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.util.*; 
import java.text.*; 

import Acme.JPM.Encoders.GifEncoder; 

/**
*
* @author Administrator
* @version
*/
public class simpleGifServlet extends HttpServlet {

/** Initializes the servlet.
*/
public void init(ServletConfig config) throws ServletException {
super.init(config);

}

/** Destroys the servlet.
*/
public void destroy() {}

/** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
* @param request servlet request
* @param response servlet response
*/
protected void processRequest(HttpServletRequest req, HttpServletResponse res)
throws ServletException, java.io.IOException 
{

     ServletOutputStream bufferSalida = res.getOutputStream();

     Frame ventanaMarco = new Frame(); 
     ventanaMarco.addNotify(); 
     Graphics contextoGrafico=null;

     try 
     {
      // Construct a matching-size off screen graphics context
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
          res.setContentType("image/gif");
          GifEncoder encoder = new GifEncoder(offscreen, bufferSalida);
          encoder.encode();

          bufferSalida.flush();
          bufferSalida.close();
     }
     finally 
     {
          if (contextoGrafico != null) contextoGrafico.dispose();
     }
}

/** Handles the HTTP <code>GET</code> method.
* @param request servlet request
* @param response servlet response
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, java.io.IOException {
processRequest(request, response);
}

/** Handles the HTTP <code>POST</code> method.
* @param request servlet request
* @param response servlet response
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, java.io.IOException {
processRequest(request, response);
}

/** Returns a short description of the servlet.
*/
public String getServletInfo() {
return "Short description";
}

}
