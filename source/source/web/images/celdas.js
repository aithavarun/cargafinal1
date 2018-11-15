/**
* Fichero JavaScript para la iluminaci�n de filas en tabla. Cross-browser
* @ Autor:  Luciano Moreno   http://www.htmlweb.net
* � Luciano Moreno   Prohibido su uso y reproducci�n sin permiso del autor
*/

    /**
    * Detectamos el navegador y lo asignamos a una variable global
    */
    nc = (document.layers)? true:false
    ie =  (document.all)? true:false
    n6 = (document.getElementById)? true:false

    /**
    * Funci�n principal de iluminaci�n
    * param n > n�mero identificador de la  fila a iluminar
    */
    function oscura(n)
    {
        /**
        * Para Internet Explorer
        */
        if(ie)
        {       
            /**
            * Ponemos cada fila de su color
           */
           for(j=1;j<=filas;j+=2)
            {
                if(j<=filas)
                {
                    id=('fila'+j)           
                    eval("document.all['"+id+"'].style.background='#efefef'");
                }
                if(j+1<=filas)
                {
                    id=('fila'+(j+1))        
                    eval("document.all['"+id+"'].style.background='white'");
                }
            }
            /**
            * Si es mouseover iluminamos la fila correspondiente
            */
            if(n!=0)
            {
                id=('fila'+n)
                eval("document.all['"+id+"'].style.background='#ffcc99'");
            }
        }
        /**
        * Lo mismo para Netscape 4x
        */
        else if(nc)
        {
           for(i=1;i<=columnas;i++)
            { /*<BR>*/               for(j=1;j<=filas;j+=2)
                {
                    if(j<=filas)
                    {
                        id=('td'+j+i)
                        eval('document.layers[id].bgColor="#efefef"');
                    }
                    if((j+1)<=filas)
                    {
                        id=('td'+(j+1)+i)
                        eval('document.layers[id].bgColor="white"');
                    }       
                }
            }
            if(n!=0)
            {
               for(i=1;i<=columnas;i++)
                {
                    id=('td'+n+i)
                    eval('document.layers[id].bgColor="#ffcc99"');
                }
            }
        }
        /**
        * Lo mismo para Netscape 6x
        */
        else if(n6)
        { /*<BR>*/           for(j=1;j<=filas;j+=2)
            {
                if(j<=filas)
                {
                    id=('fila'+j)           
                    eval("document.getElementById('"+id+"').style.background='#efefef'");
                }
                if(j+1<=filas)
                {
                    id=('fila'+(j+1))           
                    eval("document.getElementById('"+id+"').style.background='white'");
                }
            }
            if(n!=0)
            {
                id=('fila'+n)
                eval("document.getElementById('"+id+"').style.background='#ffcc99'");
            }
        }
    }

/**
* Fin del fichero
*/