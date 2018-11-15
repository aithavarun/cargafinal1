// Decompiled by DJ v3.11.11.95 Copyright 2009 Atanas Neshkov  Date: 25/02/2011 10:43:36
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Util.java

package com.aerogal.support.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Util
{

    public Util()
    {
    }

    public static String FormatoFecha(Date d)
    {
        return d != null ? FORMATO_LARGO.format(d) : "";
    }

    public static String dateFormat(Date d)
    {
        return d != null ? DATE_FORMAT.format(d) : "";
    }

    public static String dateTimeFormat(Date d)
    {
        return d != null ? DATE_TIME_FORMAT.format(d) : "";
    }

    public static Timestamp toTimestamp(Date d)
    {
        return d != null ? new Timestamp(d.getTime()) : null;
    }

    public static String quote(String s)
    {
        if(s != null && s.indexOf(",") > -1)
        {
            StringBuffer sb = new StringBuffer();
            sb.append('"');
            sb.append(s);
            sb.append('"');
            s = sb.toString();
        }
        return s;
    }

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy/MM/dd");
    private static final SimpleDateFormat FORMATO_LARGO = new SimpleDateFormat("E , d MMM - yyyy");
    private static final SimpleDateFormat DATE_TIME_FORMAT = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

}
