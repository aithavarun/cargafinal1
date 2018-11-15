<style type="text/css">
<!--
#itinerario { font-family: Arial, Helvetica, sans-serif; font-size: 9px; font-weight: bold;  border-style: outset; border-top-width: thin; border-right-width: thin; border-bottom-width: thin; border-left-width: thin}
#itinerario .nombmes {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #0000CC; background-color: #CCCCCC; border-color: black black #0033FF; font-weight: bold; height: 5px; padding-top: 3px; line-height: 12px; border-style: ridge; border-top-width: 0px; border-right-width: 0px; border-bottom-width: thin; border-left-width: 0px}
#itinerario  .nombdias {font-family: Arial, Helvetica, sans-serif; font-size: 9px; font-weight: bold;   color: #0000CC}
#itinerario  .dianormal {  font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #000099; font-size: 9px}
#itinerario  .diafiesta {  font-family: Arial, Helvetica, sans-serif; font-size: 9px; font-weight: bold; color: #FF0000}
#itinerario  caption {  font-size: 12px; font-weight: bold; color: #3300CC; background: #FFFF99; line-height: 70%; padding-top: 4px; clip:    rect(   ); border-style: outset; border-top-width: thin; border-right-width: thin; border-bottom-width: thin; border-left-width: medium}
-->
</style>
<script LANGUAGE="JavaScript"> 
/*=====================================================================================
	FUNCTION:	dibujaTabla
	ARGS:		filas: filas de la tabla.
				cols: columnas de la tabla
				cab: título de la tabla.
				lugar: ID del bloque donde se escribirá la tabla
				idn: valor para el ID de la tabla 
	RETURN:		referencia al objeto tabla
	DESCRIP:	Crea y escribe un elemento TABLE en la página web
=====================================================================================*/
function dibujarTabla(filas,cols, cab, lugar, idn)
{
var cuerpo = document.getElementById(lugar);
var tabla, tituloTabla
var f, c, tFila, tCelda;
//Si esta tabla ya existe la elimina
tabla=document.getElementById(idn);
if (tabla) 
	cuerpo.removeChild(tabla);
tabla = document.createElement('TABLE');
tabla.id = idn;
tabla.border = 0;
tabla.align ="center";
var cuerpoTabla = document.createElement("TBODY");
if (cab+'' != '')
	{
	tituloTabla = document.createElement("CAPTION");
    textNode = document.createTextNode(cab);
    tituloTabla.appendChild(textNode);
	tabla.appendChild(tituloTabla);
	}
for (f=0;f<filas;f++)
	{
	tFila = document.createElement("TR");
	for(c=0; c<cols; c++)
		{
		tCelda = document.createElement("TD");
		textVal='';
      	textNode = document.createTextNode(textVal);
      	tCelda.appendChild(textNode);
		tCelda.align="center";
		tFila.appendChild(tCelda);
		}
	cuerpoTabla.appendChild(tFila);
	}
tabla.appendChild(cuerpoTabla)
cuerpo.appendChild(tabla);
return tabla;
}
/*=====================================================================================
	FUNCTION:	escribeCelda
	ARGS:		tabla, indice de la celda, valor a escribir
	RETURN:		nada
	DESCRIP:	Escribe valor en la celda ind de la tabla pasada como argumento
=====================================================================================*/
function escribeCelda(tabla, fila,col, valor, est)
{

var tCelda, textNode;

tCelda = tabla.rows[fila].cells[col];
textNode = document.createTextNode(valor);
tCelda.appendChild(textNode);
if (est)
	tCelda.className = est;
}

/*=====================================================================================
	FUNCTION:	calendario
	ARGS:		ames: número del mes (1: Enero a 12 Diciembre)
				anio: número de año 
				ini: lógico:true escribe las dos primeras letras de los dias 
							false escribe los nombres completos
				lugar: ID del bloque en el que se escribirá la tabla	
	RETURN:		nada
	DESCRIP:	Rellena la tabla con los días de semana y del mes.
=====================================================================================*/

function itinerario(origen,destino, ini, lugar, idtabla)
{

var titulo=origen.toUpperCase()+'-'+destino.toUpperCase();
var ind,indice, tCelda, textNode ;
var mitabla;
var inis = ini?2:''
indice=0;
<%
 List list = model.getVistaItinerarios();
 //String Origen="";
 //String Destino="";
 
 if (list != null) {
      Iterator it = list.iterator();
      while (it.hasNext()) {
          VistaItinerarios vuelo=(VistaItinerarios) it.next();
          Destino=vuelo.getDestino();
          Origen=vuelo.getOrigen();
          %>
          if ((origen.toUpperCase()=="<%=Origen%>") && (destino.toUpperCase()=="<%=Destino%>"))
              indice++;
          
          <%
      }
 }
          %>
//Dibuja la tabla con las filas adecuadas y el título.

mitabla = dibujarTabla(indice+1,3, titulo, lugar, idtabla);
//Fila con los nombres de los campos
escribeCelda(mitabla,0,0, "Numero");
escribeCelda(mitabla, 0,1, "Hora");
escribeCelda(mitabla, 0,2, "Periodo");
mitabla.rows[0].className = CSSnombdias;
<%---
for (ind= 0; ind < indice; ind++)
{
---%>
ind=0;
<% 
String aux="";
if (list != null) {
      Iterator it1 = list.iterator();
      while (it1.hasNext()) {
          VistaItinerarios vuelo=(VistaItinerarios) it1.next();
          Destino=vuelo.getDestino();
          Origen=vuelo.getOrigen();
          if (vuelo.getDesde().equals(vuelo.getHasta()))
              aux=vuelo.getDesde().substring(0,3);
          else
              aux=vuelo.getDesde().substring(0,3)+"-"+vuelo.getHasta().substring(0,3);
          %>
          if ((origen.toUpperCase()=="<%=Origen%>") && (destino.toUpperCase()=="<%=Destino%>"))
          {
          ind++;
escribeCelda(mitabla,ind,0,"<%=vuelo.getNumero()%>","dianormal");
escribeCelda(mitabla, ind,1, "<%=f.format(vuelo.getHora())+":"+f.format(vuelo.getMinuto())%>","dianormal");
escribeCelda(mitabla, ind,2, "<%=aux%>","dianormal");


}
         <%
      }
 }
          %>
<%------
	}
-----%>
}

function veritinerariotexto(origen, destino)
{



itinerario(origen, destino, true, 'itinerario', 'tabla2');
}
//Algunas variables globales, para facilitar cambios
var CSSnombdias = "nombdias"
var CSSfiesta = "diafiesta"
var CSSnormal = "dianormal"
var CSStitulo = "caption"
/******************Nota:
Para que este código funcione correctamente deben existir disponibles una serie de estilos CSS, bien en la propia página o en un archivo linkado. Los estilos aquí usados son:
.diafiesta
	se usa para resaltar los domingos.
.dianormal
	para los días que no son domingos.
caption
	estilo del nombre del mnes en el calendario. 
.nombdias
	estilo del nombre de los días de semana
#micalendario
	estilo del bloque en el que se inserte el calendario. En el ejemplo es un bloque DIV 
	con posicionamiento absoluto. Este nombre corresponde al atributo ID de este elemento DIV

***********************************/

</script>




<div id="itinerario" style="position:absolute; width:120px; top:350px;height:auto; z-index:1;  overflow: visible"> 
</div>