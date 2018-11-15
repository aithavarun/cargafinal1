// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:56:11
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ControllerServlet.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

// Referenced classes of package com.aerogal.support.controller:
//            Action

public class ControllerServlet extends HttpServlet
{

    public ControllerServlet()
    {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        String ErrorPage = "/WEB-INF/ErrorPage.jsp";
        int modeloError = 0;
        Map actionMap = (Map)session.getAttribute("actionMap");
        if(actionMap == null)
        {
            actionMap = new HashMap();
            session.setAttribute("actionMap", actionMap);
        }
        ServletContext context = getServletContext();
        try
        {
            String pathInfo = request.getPathInfo();
            if(pathInfo == null)
                throw new ServletException("Estado Interno Invalido - no hay informaci\363n de Ruta");
            Action action = (Action)actionMap.get(pathInfo);
            if(action == null)
            {
                StringTokenizer st = new StringTokenizer(pathInfo, "/");
                if(st.countTokens() != 2)
                    throw new ServletException("Estado Interno inv\341lido - no hay informaci\363n de la ruta [" + pathInfo + "]");
                String state = st.nextToken();
                String event = st.nextToken();
                String className = "";
                if(event.indexOf("-") != -1)
                {
                    StringTokenizer st1 = new StringTokenizer(event, "-");
                    String event1 = st1.nextToken();
                    className = "com.aerogal.support.controller.Reservaciones" + event1 + "Action";
                } else
                if(event.indexOf("Aerogal/Servlets/controller/pagos") != -1)
                    className = "com.aerogal.support.controller.pagos";
                else
                    className = "com.aerogal.support.controller." + state + event + "Action";
                try
                {
                    Class actionClass = Class.forName(className);
                    action = (Action)actionClass.newInstance();
                }
                catch(ClassNotFoundException e)
                {
                    throw new ServletException("No se pudo cargar la clase de retorno " + className + ": " + e.getMessage());
                }
                catch(InstantiationException e)
                {
                    throw new ServletException("No se pudo crear un ejemplar de la clase " + className + ": " + e.getMessage());
                }
                catch(IllegalAccessException e)
                {
                    throw new ServletException("No se aceder a la clase " + className + ": " + e.getMessage());
                }
                actionMap.put(pathInfo, action);
            }
            Modl_1_1 model = (Modl_1_1)session.getAttribute("model");
            if(model == null)
            {
                modeloError = 1;
                ErrorPage = "/WEB-INF/ErrorPage.jsp";
                throw new ServletException("Pagina ha caducado por favor vuelva a entrar a por favor, Gracias ");
            }
            action.setRequest(request);
            action.setResponse(response);
            action.setApplication(context);
            action.setModel(model);
            action.run();
        }
        catch(ServletException e)
        {
            request.setAttribute("javax.servlet.jsp.jspException", e);
            String pagina = ErrorPage;
            RequestDispatcher rd = context.getRequestDispatcher(pagina);
            if(response.isCommitted())
                rd.include(request, response);
            else
                rd.forward(request, response);
        }
    }
}
