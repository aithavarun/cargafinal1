//Primero personalizamos el objeto Date con los nombres de los meses y de los días de 
//la semana. Ademas se añade un método para obtener el nombre del día de la semana
Date.prototype.sMeses = new Array();
Date.prototype.sMeses[0] = 'Enero';
Date.prototype.sMeses[1] = 'Febrero';
Date.prototype.sMeses[2] = 'Marzo';
Date.prototype.sMeses[3] = 'Abril';
Date.prototype.sMeses[4] = 'Mayo';
Date.prototype.sMeses[5] = 'Junio';
Date.prototype.sMeses[6] = 'Julio';
Date.prototype.sMeses[7] = 'Agosto';
Date.prototype.sMeses[8] = 'Septiembre';
Date.prototype.sMeses[9] = 'Octubre';
Date.prototype.sMeses[10] = 'Noviembre';
Date.prototype.sMeses[11] = 'Diciembre';
Date.prototype.sDias = new Array('Domingo','Lunes','Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado');
Date.prototype.getsDia = getsDia;
function getsDia()
{
var idia=this.getDay();
return this.sDias[idia];
}

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
function dibujaTabla(filas,cols, cab, lugar, idn)
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
	FUNCTION:	descrCelda
	ARGS:		tabla, indice de la celda, valor a escribir
	RETURN:		nada
	DESCRIP:	Escribe valor en la celda ind de la tabla pasada como argumento
=====================================================================================*/
function escrCelda(tabla, ind, valor, est)
{
var tCelda, textNode, Col, Fil;
var Col = ind%7;
var	Fil = Math.floor(ind/7);
tCelda = tabla.rows[Fil].cells[Col];
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

function calendario(ames,anio, ini, lugar, idtabla)
{
var fecha = new Date(ames+'/01/'+anio)
var diaSem = fecha.getDay()
var indDia, tCelda, textNode, mes, diasmes, numSem;
var mitabla;
var inis = ini?2:''
mes = ames-1;
diasmes = 27;
//Calcula el número de días del mes
while (mes == fecha.getMonth())
	{
	diasmes++; 
	fecha = new Date((mes+1)+'/'+diasmes+'/'+anio);
	}
diasmes--;
//Determina el dia de la semana del primer día del mes.
if (diaSem == 0) diaSem = 7;
//Calcula el número de semanas o fracciones del mes
numSem = Math.ceil((diasmes+diaSem)/7+1);

//Dibuja la tabla con las filas adecuadas y el título.
mitabla = dibujaTabla(numSem,7, fecha.sMeses[mes], lugar, idtabla);
//Fila con los nombres de días de la semana
for (indDia=0; indDia < 7; indDia++)
	{
	if (indDia == 6)
		escrCelda(mitabla, indDia, fecha.sDias[0].substr(0,inis));
	else
		escrCelda(mitabla, indDia, fecha.sDias[indDia+1].substr(0,inis));
	}
mitabla.rows[0].className = CSSnombdias;
//Dias del mes
for (indDia = 0; indDia < diasmes; indDia++)
	{
	if ((indDia+diaSem) % 7 == 0)	
		est = CSSfiesta
	else
		est = CSSnormal		
	escrCelda(mitabla, indDia+diaSem+6, indDia+1, est);
/*
	if ((indDia+diaSem) % 7 == 0)	
		mitabla.cells[indDia+diaSem+6].className = CSSfiesta;
	else
		mitabla.cells[indDia+diaSem+6].className = CSSnormal;
*/		
	}

}
//Esta función simplemente llama a la función calendario 
function vermes(mes, anio)
{
anio = parseInt(anio);
if (anio < 1980 || anio >2099) alert("límites excedidos");
else calendario(mes[mes.selectedIndex].value, anio, true, 'micalendario', 'tabla1');
}

function vermestexto(mes, anio)
{
anio = parseInt(anio);

if (anio < 1980 || anio >2099) alert("límites excedidos");
else calendario(mes, anio, true, 'micalendario', 'tabla1');
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


function comisionesf(filas,columnas, ini, lugar, idtabla)
{
//var fecha = new Date();
//var diaSem = fecha.getDay();
var indDia, tCelda, textNode, mes, diasmes, numSem;
var mitabla1;
var inis = ini?2:'';
mitabla = dibujamiTabla(filas,columnas, 'Comisiones', lugar, idtabla);
//Fila con los nombres de días de la semana
escrmiCelda(mitabla, 0, 'Base',CSStitulo);
escrmiCelda(mitabla, 1, 'Comision',CSStitulo);
escrmiCelda(mitabla, 2, '% Comision',CSStitulo);
mitabla.rows[0].className = CSSnombdias;

}
function dibujamiTabla(filas,cols, cab, lugar, idn)
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
tabla.cellpading=3;

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
	FUNCTION:	descrCelda
	ARGS:		tabla, indice de la celda, valor a escribir
	RETURN:		nada
	DESCRIP:	Escribe valor en la celda ind de la tabla pasada como argumento
=====================================================================================*/
function escrmiCelda(tabla, ind, valor, est)
{
var tCelda, textNode, Col, Fil;
var Col = ind%3;
var	Fil = Math.floor(ind/3);
tCelda = tabla.rows[Fil].cells[Col];
textNode = document.createTextNode(valor);
tCelda.appendChild(textNode);
if (est)
	tCelda.className = est;
}