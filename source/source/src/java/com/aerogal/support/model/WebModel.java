// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:43:56
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   WebModel.java

package com.aerogal.support.model;

import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

// Referenced classes of package com.aerogal.support.model:
//            Model

public class WebModel extends Modl_1_1
    implements HttpSessionBindingListener
{

    public WebModel()
    {
    }

    public void init(ServletContext context)
        throws ServletException
    {
        //String jdbcDriver = context.getInitParameter("jdbcDriver");
        //ADDED ON OCT 2018
        String jdbcDriver = System.getenv("jdbcDriver");
        //ADDED ON OCT 2018 - END
        if(jdbcDriver == null)
            throw new ServletException("JDBC no definida en Servlet");
        setJdbcDriver(jdbcDriver);
        //String databaseURL = context.getInitParameter("databaseURL");
		//ADDED ON OCT 2018
        String databaseURL = System.getenv("databaseURL");
        databaseURL = databaseURL.replace("\"", "");
        //databaseURL = databaseURL.replace("postgres//", "postgres");
       // System.out.println("************* databaseURL from WebModel.java 1 "+databaseURL);
        //this.databaseURL = String.format("%s",this.databaseURL); 
        //System.out.println("************* databaseURL from WebModel.java 2 "+databaseURL);
		//ADDED ON OCT 2018 - END
        if(databaseURL == null)
            throw new ServletException("databaseURL no definida en Servlet");
        setDatabaseURL(databaseURL);
        
        //String usuario = context.getInitParameter("username");
        //ADDED ON OCT 2018
        String usuario = System.getenv("user_name");
        //ADDED ON OCT 2018-END
        if(usuario == null)
            throw new ServletException("usuario no definida en Servlet");
        setUsuario(usuario);
        
        //String clave = context.getInitParameter("password");
        //ADDED ON OCT 2018
        String clave = System.getenv("password");
        //ADDED ON OCT 2018-END
        if(clave == null)
            throw new ServletException("Clave no definida en Servlet");
        setClave(clave);
        
        try
        {
            connect();
        }
        catch(SQLException e)
        {
            throw new ServletException("es en carga de driver : " + e.getMessage());
        }
    }

    public void valueBound(HttpSessionBindingEvent httpsessionbindingevent)
    {
    }

    public void valueUnbound(HttpSessionBindingEvent event)
    {
        disconect();
    }
}
