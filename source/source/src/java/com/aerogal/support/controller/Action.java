// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:51:04
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Action.java

package com.aerogal.support.controller;

import com.aerogal.support.model.Modl_1_1;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Action
{

    public Action()
    {
    }

    public abstract void run()
        throws ServletException, IOException;

    public void setRequest(HttpServletRequest request)
    {
        this.request = request;
    }

    public void setResponse(HttpServletResponse response)
    {
        this.response = response;
    }

    void setApplication(ServletContext application)
    {
        this.application = application;
    }

    void setModel(Modl_1_1 model)
    {
        this.model = model;
    }

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected ServletContext application;
    protected Modl_1_1 model;
}
