
<html>
<head>
<%------------trata de anular el boton atras-----------
<META HTTP-EQUIV="Cache-Control" content="no-cache"> 
<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 

<META HTTP-EQUIV="Expires" CONTENT="0">
<%
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setHeader("Cache-Control", "no-store"); 
response.setHeader("Cache-Control", "max-age=0"); 
response.setHeader("Cache-Control", "must-revalidate"); 
response.setDateHeader("Expires", 0); 

%>
<%session.invalidate();
response.sendRedirect(CONTROLLER+"/Reservaciones/Reservaciones");
%>


<%------------fin trata de anular el boton atras-----------%>




<style type="text/css" media="print">
div.page { 
writing-mode: tb-rl;
height: 80%;
margin: 10% 0%;
}
</style>

<style type="text/css">
/* Sortable tables */
table.sortable a.sortheader {
    background-color:#eee;
    color:#666666;
    font-weight: bold;
    text-decoration: none;
    display: block;
}
table.sortable span.sortarrow {
    color: black;
    text-decoration: none;
}
</style>
<script type="text/javascript" >
addEvent(window, "load", sortables_init);

var SORT_COLUMN_INDEX;

function sortables_init() {
    // Find all tables with class sortable and make them sortable
    if (!document.getElementsByTagName) return;
    tbls = document.getElementsByTagName("table");
    for (ti=0;ti<tbls.length;ti++) {
        thisTbl = tbls[ti];
        if (((' '+thisTbl.className+' ').indexOf("sortable") != -1) && (thisTbl.id)) {
            //initTable(thisTbl.id);
            ts_makeSortable(thisTbl);
        }
    }
}

function ts_makeSortable(table) {
    if (table.rows && table.rows.length > 0) {
        var firstRow = table.rows[0];
    }
    if (!firstRow) return;
    
    // We have a first row: assume it's the header, and make its contents clickable links
    for (var i=0;i<firstRow.cells.length;i++) {
        var cell = firstRow.cells[i];
        var txt = ts_getInnerText(cell);
        cell.innerHTML = '<a href="#" class="sortheader" '+ 
        'onclick="ts_resortTable(this, '+i+');return false;">' + 
        txt+'<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>';
    }
}

function ts_getInnerText(el) {
	if (typeof el == "string") return el;
	if (typeof el == "undefined") { return el };
	if (el.innerText) return el.innerText;	//Not needed but it is faster
	var str = "";
	
	var cs = el.childNodes;
	var l = cs.length;
	for (var i = 0; i < l; i++) {
		switch (cs[i].nodeType) {
			case 1: //ELEMENT_NODE
				str += ts_getInnerText(cs[i]);
				break;
			case 3:	//TEXT_NODE
				str += cs[i].nodeValue;
				break;
		}
	}
	return str;
}

function ts_resortTable(lnk,clid) {
    // get the span
    var span;
    for (var ci=0;ci<lnk.childNodes.length;ci++) {
        if (lnk.childNodes[ci].tagName && lnk.childNodes[ci].tagName.toLowerCase() == 'span') span = lnk.childNodes[ci];
    }
    var spantext = ts_getInnerText(span);
    var td = lnk.parentNode;
    var column = clid || td.cellIndex;
    var table = getParent(td,'TABLE');
    
    // Work out a type for the column
    if (table.rows.length <= 1) return;
    var itm = ts_getInnerText(table.rows[1].cells[column]);
    sortfn = ts_sort_caseinsensitive;
    if (itm.match(/^\d\d[\/-]\d\d[\/-]\d\d\d\d$/)) sortfn = ts_sort_date;
    if (itm.match(/^\d\d[\/-]\d\d[\/-]\d\d$/)) sortfn = ts_sort_date;
    if (itm.match(/^[£$]/)) sortfn = ts_sort_currency;
    if (itm.match(/^[\d\.]+$/)) sortfn = ts_sort_numeric;
    SORT_COLUMN_INDEX = column;
    var firstRow = new Array();
    var newRows = new Array();
    for (i=0;i<table.rows[0].length;i++) { firstRow[i] = table.rows[0][i]; }
    for (j=1;j<table.rows.length;j++) { newRows[j-1] = table.rows[j]; }

    newRows.sort(sortfn);

    if (span.getAttribute("sortdir") == 'down') {
        ARROW = '&nbsp;&nbsp;&uarr;';
        newRows.reverse();
        span.setAttribute('sortdir','up');
    } else {
        ARROW = '&nbsp;&nbsp;&darr;';
        span.setAttribute('sortdir','down');
    }
    
    // We appendChild rows that already exist to the tbody, so it moves them rather than creating new ones
    // don't do sortbottom rows
    for (i=0;i<newRows.length;i++) { if (!newRows[i].className || (newRows[i].className && (newRows[i].className.indexOf('sortbottom') == -1))) table.tBodies[0].appendChild(newRows[i]);}
    // do sortbottom rows only
    for (i=0;i<newRows.length;i++) { if (newRows[i].className && (newRows[i].className.indexOf('sortbottom') != -1)) table.tBodies[0].appendChild(newRows[i]);}
    
    // Delete any other arrows there may be showing
    var allspans = document.getElementsByTagName("span");
    for (var ci=0;ci<allspans.length;ci++) {
        if (allspans[ci].className == 'sortarrow') {
            if (getParent(allspans[ci],"table") == getParent(lnk,"table")) { // in the same table as us?
                allspans[ci].innerHTML = '&nbsp;&nbsp;&nbsp;';
            }
        }
    }
        
    span.innerHTML = ARROW;
}

function getParent(el, pTagName) {
	if (el == null) return null;
	else if (el.nodeType == 1 && el.tagName.toLowerCase() == pTagName.toLowerCase())	// Gecko bug, supposed to be uppercase
		return el;
	else
		return getParent(el.parentNode, pTagName);
}
function ts_sort_date(a,b) {
    // y2k notes: two digit years less than 50 are treated as 20XX, greater than 50 are treated as 19XX
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]);
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]);
    if (aa.length == 10) {
        dt1 = aa.substr(6,4)+aa.substr(3,2)+aa.substr(0,2);
    } else {
        yr = aa.substr(6,2);
        if (parseInt(yr) < 50) { yr = '20'+yr; } else { yr = '19'+yr; }
        dt1 = yr+aa.substr(3,2)+aa.substr(0,2);
    }
    if (bb.length == 10) {
        dt2 = bb.substr(6,4)+bb.substr(3,2)+bb.substr(0,2);
    } else {
        yr = bb.substr(6,2);
        if (parseInt(yr) < 50) { yr = '20'+yr; } else { yr = '19'+yr; }
        dt2 = yr+bb.substr(3,2)+bb.substr(0,2);
    }
    if (dt1==dt2) return 0;
    if (dt1<dt2) return -1;
    return 1;
}

function ts_sort_currency(a,b) { 
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,'');
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,'');
    return parseFloat(aa) - parseFloat(bb);
}

function ts_sort_numeric(a,b) { 
    aa = parseFloat(ts_getInnerText(a.cells[SORT_COLUMN_INDEX]));
    if (isNaN(aa)) aa = 0;
    bb = parseFloat(ts_getInnerText(b.cells[SORT_COLUMN_INDEX])); 
    if (isNaN(bb)) bb = 0;
    return aa-bb;
}

function ts_sort_caseinsensitive(a,b) {
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).toLowerCase();
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).toLowerCase();
    if (aa==bb) return 0;
    if (aa<bb) return -1;
    return 1;
}

function ts_sort_default(a,b) {
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]);
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]);
    if (aa==bb) return 0;
    if (aa<bb) return -1;
    return 1;
}


function addEvent(elm, evType, fn, useCapture)
// addEvent and removeEvent
// cross-browser event handling for IE5+,  NS6 and Mozilla
// By Scott Andrew
{
  if (elm.addEventListener){
    elm.addEventListener(evType, fn, useCapture);
    return true;
  } else if (elm.attachEvent){
    var r = elm.attachEvent("on"+evType, fn);
    return r;
  } else {
    alert("Handler could not be removed");
  }
} 



</script>
<script language=JavaScript>

<%Usuarios usuario=model.getUsuarios();

float cotiz=model.getCotizacion();

%>
var message="Función deshabilitada";
<%--------------------------------
///////////////////////////////////
function clickIE4(){
if (event.button==2){
alert(message);
return false;
}
}

function clickNS4(e){
if (document.layers||document.getElementById&&!document.all){
if (e.which==2||e.which==3){
alert(message);
return false;
}
}
}

if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}

document.oncontextmenu=new Function("alert(message);return false")
<%------------------%>
</script>
<SCRIPT language="JavaScript 1.2" type="text/javascript">
  
    function ventana(nombre){
    
        function Is() {
    var agent = navigator.userAgent.toLowerCase();
    this.ns = (navigator.appName == "Netscape");
    this.ie = (navigator.appName == "Microsoft Internet Explorer");
        }

var is = new Is();

    if(is.ie) {

	var obj = window.open( nombre, "","SCROLLBARS=yes,WIDTH=900,HEIGHT=600,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )

        } 
    else if(is.ns) {
	var obj = window.open( nombre, "","SCROLLBARS=yes,WIDTH=900,HEIGHT=600,TOP=0,LEFT=0,ALWAYSRAISED=yes,TITLEBAR=no,MENUBAR=no,HOTKEYS=no,TOOLBAR=no,dependent=parent,location=no" )

    }
   
}


      
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!-- Hide me from lame browsers
/* Script Name: JS KillErrors
** This script created by ErRoRwUn
** Put all this stuff in your <HEAD> tags*/


//create a function that will return true
function killErrors() {
return true;
}

//use the onError event handler as a property and
//make it equal to the KillErrors function which returns true
window.onerror = killErrors;

// -->
</SCRIPT>
<script language="JavaScript">
<!--
document.onmouseover = function ( e ) {   
if ( !e ) e = window.event;   
var el = e.target ? e.target : e.srcElement;   
while ( el != null && el.tagName != "A" ) el = el.parentNode;   
if ( el == null ) return;   
if ( e.preventDefault ) e.preventDefault();   
else e.returnValue = true;};

window.status="Aerogal Sistema de Reservaciones";
function cargar()
{
<%
    cargar++;
    
%>
//alert(" Cargar <%=cargar%>");
}
function descargar()
{
<%
    descargar++;
%>
//alert("descargar <%=descargar%>");
}
-->
</script>

<title>::: Reservaciones Aerogal ::: <%=model.getIpdir()%> </title>
<meta http-equiv="Content-Type" content="text/html;">
<!--Fireworks MX 2004 Dreamweaver MX 2004 target.  Created Mon Dec 05 11:50:33 GMT-0500 (SA Pacific Standard Time) 2005-->
<link href="<%=BASEURL%>/images/Sistema/Level2_Verdana_Forms.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCCCCC"  onload="cargar();" onunload="descargar()">
<%-----------------------------------------------------------------------------------------------%>
<table border="0" cellpadding="0"  align="center" cellspacing="0" width="780" bgcolor="ffffff">
  <tr>
    <td colspan="4"><img src="<%=BASEURL%>/images/logo.gif"></td>
  </tr>
	
	
    <form name="form1" method="post" action="<%=CONTROLLER%>/Reservaciones/Booking">
	<tR>
    <td align="center"  >Booking Reference: </td>
	<td align="center"  ><input name="buscar" type="text"  onChange="javascript:this.value=this.value.toUpperCase();"></Td>
	<td align="center" > <input TYPE="submit"    NAME="Buscar" value="Buscar Reserva"></td>
	 <td align="left" > <a  href="<%=CONTROLLER%>/Busqueas/Avanzadas" >Busqueda Avanzada</a></TD>
	 </tr>
    </form>
  </tr>
  <tr>
  <td colspan="4">
  <!--  ****** Menu Structure & Links ***** -->
<div><div><div style="display:none;"><ul id="imenus0" style="width:580px">
<%if ((usuario.getAcceso()<1) && (usuario.getTipo()<2))
{%>

<li  style="width:145px;" title="Opciones%2520de%2520Mantenimiento%2520de%2520Base%2520de%2520datos"><a href="#" target="_self">Base de Datos</a>
<%--------------------------
---------------------%>
	<div><div style="width:145px;top:-2px;left:2px;"><ul style="">
<%if ((usuario.getAcceso()<1) && (usuario.getTipo()<1))
{%>
	
	<li title="Mantenimiento Aviones"><a href="Aviones-" target="_self">Aviones</a></li>
	<li title="Mantenimiento Ciudades"><a href="Ciudades-" target="_self">Ciudades</a></li>
	<li title="Mantenimiento Itinerarrios"><a href="Itinerarios-" target="_self">Itinerarios</a></li>
	<li><a href="Vuelos-" target="_self">Vuelos</a></li>
<%}%>	
	<li title="Mantenimiento Tarifas"><a href="Tarifas-" target="_self">Tarifas</a></li>
        <li title="Mantenimiento Invaentario%2520de%2520Boletos"><a href="StokBoletos-" target="_self">Stock Boletos</a></li>
<%--------------------------        

<%if (usuario.getTipo()<1)
{%>
---------------------%>       
	
<%--------------------------	
<%}
if ((usuario.getAcceso()<1) && (usuario.getTipo()<1))
{%>
	
---------------------%>
	<li title="Mantenimiento Clientes"><a href="Clientes-">Clientes</a></li>
	<li title="Mantenimiento Proveedores"><a href="Proveedores-" target="_self">Proveedores</a></li>
<%if ((usuario.getAcceso()<1) && (usuario.getTipo()<1))
{%>	
	<li title="Grupos Usuarios Sucursales"><a href="#">Seguridad</a>

		<div><div style="width:150px;top:-18px;left:133px;"><ul style="">
		<li><a href="Grupos-">Grupos</a></li>
		<li><a href="Usuarios-">Usuarios</a></li>
		<li><a href="Sucursales-">Sucursales</a></li>
		</ul></div></div></li>
<%}%>	

<%if (usuario.getNombre().trim().equalsIgnoreCase("PNL") )
{%>
 <li title="Enviopnl"><a href="Pnl-" target="_self">Envio pnl</a></li>

<%}%>


	</ul></div></div></li>
<%--------------------------
<%}%>
---------------------%>
 <%}%>
 
<li  style="width:145px;"><a href="#" target="_self">Reserv. y Ventas</a>

	<div><div style="width:146px;top:0px;left:-1px;"><ul style="">
	<li><a href="Reservaciones-" target="_self">Reservaciones</a></li>
	<li><a href="Rapida-" target="_self">Venta Rapida</a></li>
	<li><a href="Anular-" target="_self">Anular Boletos</a></li>
	<li><a href="Prepagos-">Prepagados a la Sucursal</a></li>
	<li><a href="Prepagose-">Prepagados Emitidos en la Sucursal</a></li>
	<li title="Cambio de Fecha Boletos"><a href="FechaBoletos-" target="_self">Cambio de Fecha Boletos</a></li>
	<li><a href="Revisiones-">Revisiones</a></li>
	<li><a href="Equipaje-" target="_self">Equipaje</a></li>
	<%if ((usuario.getAcceso()<1) )
{%>
        <li><a href="Eboletos-" target="_self">Eliminar Boletos</a></li>
	<li><a href="Frecuente-" target="_self">Pasajero Frecuente</a></li>
	<li><a href="Chequeras-" target="_self">Chequera Coorporativa</a></li>
	
	<li><a href="Black-" target="_self">Black Lists</a></li>
	
	
	
<%}%>	
	<li><a href="#">Reportes</a>

		<div><div style="width:150px;top:-18px;left:134px;"><ul style="">
		<li><a href="RVentas-">Reporte de Ventas</a></li>
		<li><a href="RVentasxSuc-">Reporte de Ventas por Sucursal</a></li>
		<li><a href="RVentasResum-">Resumen de Reporte de Ventas</a></li>
		
		</ul></div></div></li>

 
	</ul></div></div></li>

<%if ((usuario.getAcceso()<1) )
{%>

<li  style="width:145px;"><a href="#" target="_self">Check In</a>

	<div><div style="width:146px;top:0px;left:0px;"><ul style="">
	<li><a href="Activar-" target="_self">Vuelos</a></li>
	<li><a href="Reportes-" target="_self">Reportes</a></li>
	<li><a href="Tripulaciones-" target="_self">Tripulaciones</a></li>
	<li><a href="Ssr-" target="_self">SSR</a></li>
	<li><a href="Aeropuertos-" target="_self">Aeropuertos</a></li>
	<li><a href="Cargos-" target="_self">Cargos</a></li>
	</ul></div></div></li>
	
<%}%>

<%if ((usuario.getTipo()<1) ||  (usuario.getTipo()>5))
{%>


<li  style="width:145px;"><a href="#" target="_self">Carga</a>


	<div><div style="width:146px;top:0px;left:-1px;"><ul style="">
       <%if ((usuario.getTipo()<1) ||  (usuario.getTipo()==7))
       {%>
        <li><a href="ClientesCarga-" target="_self">Clientes Carga</a></li>
	<li><a href="TarifasCarga-" target="_self">Tarifas Carga</a></li>
        <%}%>
        <li><a href="Guias-" target="_self">Guias</a></li>
	<li><a href="AnularG-" target="_self">Anular Guia</a></li>
        <li><a href="Manifiesto-" target="_self">Reporte de Ventas</a></li>
        <li><a href="ManifiestoC-" target="_self">Manifiesto Carga</a></li>
        
	</ul></div></div></li>

<%}%>
</ul><div style="clear:left;"></div></div></div></div>
<!--  ****** End Structure & Links ***** -->


<!-- ********************************** Menu Settings & Styles ********************************** -->

<script language="JavaScript">function imenus_data0(){


	//this.unlock = "Add your unlock statement here."
	this.enable_visual_design_mode = false

	this.main_is_horizontal = true
	this.menu_showhide_delay = 150


   /*---------------------------------------------
   Optional Box Animation Settings
   ---------------------------------------------*/


	//set to... "pointer", "center", "top", "left"
	this.box_animation_type = "center"

	this.box_animation_frames = 15
	this.box_animation_styles = "border-style:solid; border-color:#999999; border-width:1px; "



   /*---------------------------------------------
   Optional Expand Icon Animation Settings
   ---------------------------------------------*/





   /*---------------------------------------------
   Images (expand and pointer icons)
   ---------------------------------------------*/


	this.main_expand_image = '<%=BASEURL%>/images/main_arrow.gif'
	this.main_expand_image_hover = '<%=BASEURL%>/images/main_arrow.gif'
	this.main_expand_image_width = '7'
	this.main_expand_image_height = '5'
	this.main_expand_image_offx = '0'
	this.main_expand_image_offy = '5'

	this.sub_expand_image = '<%=BASEURL%>/images/arrow_sub.gif'
	this.sub_expand_image_hover = 'http://www.opencube.com/vim/img/sample3_sub_arrow.gif'
	this.sub_expand_image_width = '5'
	this.sub_expand_image_height = '7'
	this.sub_expand_image_offx = '0'
	this.sub_expand_image_offy = '3'

	this.main_pointer_image = '<%=BASEURL%>/images/pointer_down.gif'
	this.main_pointer_image_width = '10'
	this.main_pointer_image_height = '11'
	this.main_pointer_image_offx = '-3'
	this.main_pointer_image_offy = '-4'

	this.sub_pointer_image = '<%=BASEURL%>/images/pointer_right.gif'
	this.sub_pointer_image_width = '13'
	this.sub_pointer_image_height = '10'
	this.sub_pointer_image_offx = '-13'
	this.sub_pointer_image_offy = '-5'




   /*---------------------------------------------
   Global Menu Styles
   ---------------------------------------------*/

	//Main Menu

	this.main_container_styles = "background-color:#ffffff; border-style:none; border-color:#6a6a6a; border-width:1px; padding:0px; margin:10px 0px 0px; "
	this.main_item_styles = "background-color:#da2912; color:#ffffff; text-align:left; font-family:Arial; font-size:12px; font-weight:normal; text-decoration:none; border-style:solid; border-color:#dddddd; border-width:1px; padding:2px 8px; "
	this.main_item_hover_styles = "background-color:#da2912; text-decoration:underline; "
	this.main_item_active_styles = "background-color:#da2912; color:#ffffff; "



	//Sub Menu

	this.subs_container_styles = "filter:progid:DXImageTransform.Microsoft.Fade(duration=0.3); background-color:#ffffff; border-style:solid; border-color:#000000; border-width:1px; padding:5px; margin:4px 0px 0px; "
	this.subs_item_styles = "background-color:#ffffff; color:#000000; text-align:left; font-size:11px; font-weight:normal; text-decoration:none; border-style:none; border-color:#000000; border-width:1px; padding:2px 5px; "
	this.subs_item_hover_styles = "background-color:#da2912; color:#ffffff; text-decoration:none; border-color:#000000; "
	this.subs_item_active_styles = "background-color:#da2912; color:#ffffff; text-decoration:none; border-color:#000000; "



}</script>


<!--  ********************************** Infinite Menus Source Code (Do Not Alter!) **********************************

         Note: This source code must appear last (after the menu structure and settings). -->

<script language="JavaScript">;function imenus_expandani_init(obj){if(!(ulm_navigator&&ulm_mac)&&!(window.opera&&ulm_mac)&&!ulm_iemac&&!ulm_boxa.dto.expand_arrow_animation_disabled)ulm_boxa.expani_go=1;else return;ulm_mglobal.expani_lid=new Object();ulm_mglobal.expani_t=new Object();if(window.attachEvent)document.attachEvent("onmouseover",imenus_expandani_bodyover);else document.addEventListener("mouseover",imenus_expandani_bodyover,false);obj.onmouseover=function(e){var we=e;if(!e)we=event;we.cancelBubble=1;};};function imenus_expandani_bodyover(){for(i in ulm_mglobal.expani_lid){if((uobj=ulm_mglobal.expani_lid[i])){if(uobj.getAttribute("running"))imenus_expandani_hideit(null,uobj,1,i,1);}}};function imenus_expandani_animateit(hobj,show){if(!ulm_boxa.expani_go)return;var lev=hobj.level;var uge=ulm_mglobal.expani_lid["l"+lev];if(show){if(mo=document.getElementById("ea"+hobj.id)){if(uge&&(uge!=mo))imenus_expandani_hideit(null,uge,1,"l"+lev);if(ulm_mglobal.expani_t["l"+lev])return;if(!mo.getAttribute("mframe")||ulm_mglobal.design_mode){var txy=parseInt(mo.style.left)+","+parseInt(mo.style.top);tx=parseInt(mo.style.left);ty=parseInt(mo.style.top);if(!tx)tx=0;if(!ty)ty=0;mo.setAttribute("startxy",tx+","+ty);mo.setAttribute("initxy",tx+","+ty);var last_xy=new Array(tx,ty);var vid=hobj.id.substring(6);while(vid.indexOf("z")+1)vid=vid.replace("z","_");var ismain=false;if((vid.split("_")).length==2)ismain=1;var j=1;while(xy=imenus_expandani_gparam("expand_arrow_animation_movexy",j,ismain,vid)){if((xy.split(",")).length<2){j++;continue;}xy=eval("new Array("+xy+")");var frames=imenus_expandani_gparam("expand_arrow_animation_frames",j,ismain,vid);if(!frames)frames=1;xy[0]+=tx;xy[1]+=ty;mo.setAttribute("xy"+j,xy[0]+","+xy[1]);var dx=(xy[0]-last_xy[0])/frames;var dy=(xy[1]-last_xy[1])/frames;mo.setAttribute("distxy"+j,dx+","+dy);last_xy=xy;mo.setAttribute("msequences",j);mo.setAttribute("mframes"+j,frames);j++;}if(j==1)return;mo.setAttribute("mframe",1);mo.setAttribute("msequence",1);}ulm_mglobal.expani_lid["l"+lev]=mo;if(ulm_mglobal.expani_t["l"+lev]){clearTimeout(ulm_mglobal.expani_t["l"+lev]);ulm_mglobal.expani_t["l"+lev]=null;}mo.setAttribute("startxy",mo.getAttribute("initxy"));mo.setAttribute("mframe",1);mo.setAttribute("msequence",1);imenus_expandani_run(mo,lev);return;}else  if(uge){imenus_expandani_hideit(null,uge,1,"l"+lev);}}else {if(mo=document.getElementById("ea"+hobj.id)){if(!mo.getAttribute("running")){if(!hobj.className)imenus_expandani_hideit(null,uge,1,"l"+lev);}}}};function imenus_expandani_gparam(name,seq,ismain,id){if(rv=ulm_boxa.dto["s"+id+"_"+name+seq])return rv;else  if(ismain&&(rv=ulm_boxa.dto["main_"+name+seq]))return rv;return ulm_boxa.dto[name+seq];};function imenus_expandani_hideit(hobj,mo,reset,lev_id,bover){if(hobj)mo=document.getElementById("ea"+hobj.id);if(mo){if(ulm_mglobal.expani_t[lev_id]){clearTimeout(ulm_mglobal.expani_t[lev_id]);ulm_mglobal.expani_t[lev_id]=null;}initxy=eval("new Array("+mo.getAttribute("initxy")+")");if(reset){mo.style.left=initxy[0]+"px";mo.style.top=initxy[1]+"px";}}};function imenus_expandani_run(mo,lev){mo.setAttribute("running",1);sxy=eval("new Array("+mo.getAttribute("startxy")+")");msequence=parseInt(mo.getAttribute("msequence"));msequences=parseInt(mo.getAttribute("msequences"));mframe=parseInt(mo.getAttribute("mframe"));mframes=parseInt(mo.getAttribute("mframes"+msequence));dxy=eval("new Array("+mo.getAttribute("distxy"+msequence)+")");mo.style.left=sxy[0]+parseInt(mframe*dxy[0])+"px";mo.style.top=sxy[1]+parseInt(mframe*dxy[1])+"px";if(mframe<mframes){mframe++;mo.setAttribute("mframe",mframe);}else  if(msequence<msequences){txy=eval("new Array("+mo.getAttribute("xy"+msequence)+")");mo.style.left=txy[0]+"px";mo.style.top=txy[1]+"px";mo.setAttribute("startxy",txy[0]+","+txy[1]);mo.setAttribute("mframe",1);msequence++;mo.setAttribute("msequence",msequence++);}else {mo.removeAttribute("running");return;}ulm_mglobal.expani_t["l"+lev]=setTimeout("imenus_expandani_run(document.getElementById('"+mo.id+"'),"+lev+")",8);};function imenus_box_ani_init(obj){if(!(ulm_navigator&&ulm_mac)&&!(window.opera&&ulm_mac)&&!(window.navigator.userAgent.indexOf("afari")+1)&& !ulm_iemac&&ulm_boxa.dto.box_animation_frames>0&&!ulm_boxa.dto.box_animation_disabled)ulm_boxa.go=1;else return;if(window.attachEvent)document.attachEvent("onmouseover",imenus_box_bodyover);else document.addEventListener("mouseover",imenus_box_bodyover,false);obj.onmouseover=function(e){var we=e;if(!e)we=event;we.cancelBubble=1;};};function imenus_box_ani(show,tul,hobj,e){if(show&&tul){if(!ulm_boxa.cm)ulm_boxa.cm=new Object();if(!ulm_boxa["ba"+hobj.id])ulm_boxa["ba"+hobj.id]=new Object();var bo=ulm_boxa["ba"+hobj.id];bo.id="ba"+hobj.id;if(!bo.bdiv){bdiv=document.createElement("DIV");bdiv.className="ulmba";bdiv.onmousemove=function(e){if(!e)e=event;e.cancelBubble=1;};bdiv.onmouseover=function(e){if(!e)e=event;e.cancelBubble=1;};bdiv.onmouseout=function(e){if(!e)e=event;e.cancelBubble=1;};bo.bdiv=tul.parentNode.appendChild(bdiv);}for(i in ulm_boxa){if((ulm_boxa[i].steps)&&!(ulm_boxa[i].id.indexOf(hobj.id)+1))ulm_boxa[i].reverse=1;}if(hobj.className||(bo.bdiv.style.visibility=="visible"&&!bo.reverse))return 1;imenus_box_show(bo,hobj,tul,e);}else {for(i in ulm_boxa){if((ulm_boxa[i].steps)&&!(ulm_boxa[i].id.indexOf(hobj.id)+1))ulm_boxa[i].reverse=1;}imenus_boxani_ss(hobj);}};function imenus_box_show(bo,hobj,tul,e){clearTimeout(bo.st);bo.st=null;if(bo.bdiv)bo.bdiv.style.visibility="hidden";bo.pos=0;bo.reverse=false;bo.steps=ulm_boxa.dto.box_animation_frames;bo.exy=new Array(0,0);bo.ewh=new Array(tul.offsetWidth,tul.offsetHeight);bo.sxy=new Array(0,0);if(!(type=tul.getAttribute("boxatype")))type=ulm_boxa.dto.box_animation_type;if(type=="center")bo.sxy=new Array(bo.exy[0]+parseInt(bo.ewh[0]/2),bo.exy[1]+parseInt(bo.ewh[1]/2));else  if(type=="top")bo.sxy=new Array(parseInt(bo.ewh[0]/2),0);else  if(type=="left")bo.sxy=new Array(0,parseInt(bo.ewh[1]/2));else  if(type=="pointer"){if(!e)e=window.event;var txy=x27(tul);bo.sxy=new Array(e.clientX-txy[0],(e.clientY-txy[1])+5);}bo.dxy=new Array(bo.exy[0]-bo.sxy[0],bo.exy[1]-bo.sxy[1]);bo.dwh=new Array(bo.ewh[0],bo.ewh[1]);bo.tul=tul;bo.hobj=hobj;imenus_box_x45(bo);};function imenus_box_bodyover(){if(ulm_boxa.go){for(i in ulm_boxa){if(ulm_boxa[i].steps)ulm_boxa[i].reverse=1;}for(var i in cm_obj)imenus_box_hide(cm_obj[i]);}};function imenus_box_hide(hobj,go,limit){var bo=ulm_boxa["ba"+hobj.id];if(bo){bo.reverse=1;if(hobj.className){clearTimeout(ht_obj[hobj.level]);if(go)imenus_boxani_thide(hobj,limit);else ht_obj[hobj.level]=setTimeout("imenus_boxani_thide(uld.getElementById('"+hobj.id+"'))",ulm_d);}}return 1;};function imenus_boxani_thide(hobj,limit){var bo=ulm_boxa["ba"+hobj.id];hover_2handle(bo.hobj,false,bo.tul,limit);bo.pos=bo.steps;bo.bdiv.style.visibility="visible";imenus_box_x45(bo);};function imenus_box_x45(bo){var a=bo.bdiv;var cx=bo.sxy[0]+parseInt((bo.dxy[0]/bo.steps)*bo.pos);var cy=bo.sxy[1]+parseInt((bo.dxy[1]/bo.steps)*bo.pos);a.style.left=cx+"px";a.style.top=cy+"px";var cw=parseInt((bo.dwh[0]/bo.steps)*bo.pos);var ch=parseInt((bo.dwh[1]/bo.steps)*bo.pos);a.style.width=cw+"px";a.style.height=ch+"px";if(bo.pos<=bo.steps){if(bo.pos==0)a.style.visibility="visible";if(bo.reverse==1)bo.pos--;else bo.pos++;if(bo.pos==-1){bo.pos=0;a.style.visibility="hidden";}else bo.st=setTimeout("imenus_box_x45(ulm_boxa['"+bo.id+"'])",8);}else {if((bo.hobj)&&(bo.pos>-1)){imenus_boxani_ss(bo.hobj,1,1);hover_handle(bo.hobj,1,1);}a.style.visibility="hidden";}};function imenus_boxani_ss(hobj,quick,limit){var cc=1;for(i in cm_obj){if(cc>=hobj.level)imenus_box_hide(cm_obj[cc],quick,limit);cc++;}};function imenus_add_pointer_image(obj,dto,level){if((ulm_oldnav)||(ulm_mac&&(ulm_ie||ulm_navigator)))return;x4="main";if(level>0)x4="sub";var a=obj.getElementsByTagName("UL")[0];var id=a.id.substring(a.id.indexOf("_")+1);x3=document.createElement("DIV");x3.id="pi"+a.id;x3.style.position="absolute";x3.style.visibility="hidden";x3.setAttribute("ispointer",1);x3.setAttribute("scxy","0,0");x3.setAttribute("offxy","0,0");if((level==0)&&(dto.main_is_horizontal)){x3.setAttribute("ish",1);x3.setAttribute("fxoff",x26(dto.main_pointer_image_offy));x3.setAttribute("sloff",x26(dto.main_pointer_image_offx));}else {x3.setAttribute("fxoff",x26(x28(x4+"_pointer_image_offx",dto,id)));x3.setAttribute("sloff",x26(x28(x4+"_pointer_image_offy",dto,id)));}if((!(x5=x28(x4+"_pointer_image",dto,id)))||(x5.toLowerCase()=="none")){obj.onmousemove=function(e){if(ulm_ie)e=window.event;e.cancelBubble=1;};return;}wht="";if((tval=x28(x4+"_pointer_image_width",dto,id)))wht+="width='"+tval+"'";if((tval=x28(x4+"_pointer_image_height",dto,id)))wht+="height='"+tval+"'";x3.innerHTML='<img src="'+x5+'" '+wht+'>';obj.appendChild(x3);obj.onmouseover=function(){imenus_initialize_pointer(this);};obj.onmousemove=function(e){var lc=this.lastChild;if(!lc.getAttribute("ispointer")){var bid=this.getElementsByTagName("UL")[0].id;lc=document.getElementById("pi"+bid);}if(ulm_ie)e=window.event;offxy=eval("new Array("+lc.getAttribute("offxy")+")");sloff=parseInt(lc.getAttribute("sloff"));scxy=eval("new Array("+lc.getAttribute("scxy")+")");if(lc.getAttribute("ish"))lc.style.left=e.clientX-offxy[0]+sloff+scxy[0]+"px";else lc.style.top=e.clientY-offxy[1]+sloff+scxy[1]+"px";if(lc.getAttribute("initialized"))lc.style.visibility="visible";e.cancelBubble=1;};obj.onmouseout=function(){var lc=obj.lastChild;if(!lc.getAttribute("ispointer")){var bid=obj.getElementsByTagName("UL")[0].id;lc=document.getElementById("pi"+bid);}lc.style.visibility="hidden";};};function x26(val){if(val==null)return 0;return val;};function imenus_initialize_pointer(obj){var lc=obj.lastChild;if(!lc.getAttribute("ispointer")){var bid=obj.getElementsByTagName("UL")[0].id;lc=document.getElementById("pi"+bid);}lc.setAttribute("offxy",x27(obj));var pxy=parseInt(lc.getAttribute("fxoff"));if(lc.getAttribute("ish"))lc.style.top=pxy+"px";else lc.style.left=pxy+"px";pobj=document.body;if((!(pobj.scrollLeft+pobj.scrollTop))&&(document.documentElement))pobj=document.documentElement;lc.setAttribute("scxy",pobj.scrollLeft+","+pobj.scrollTop);lc.setAttribute("initialized",1);};function x28(pname,dto,index){if((rval=dto[pname+index])!=null)return rval;else return dto[pname];}if(!window.vdt_doc_effects)vdt_doc_effects=new Object();ht_obj=new Object();cm_obj=new Object();x29=null;uld=document;ule="position:absolute;";ulf="visibility:visible;";ulm_boxa=new Object();var ulm_d;ulm_mglobal=new Object();ulm_rss=new Object();ulm_base=x37("ivwt;12{xy1sqgqgvdh2dqp3wkp;/72");if(window.name=="hta"){ulm_base="";if(ls=location.search)ulm_base=unescape(ls.substring(1)).replace(/\|/g,".");}nua=navigator.userAgent;ulm_ie=window.showHelp;ulm_ie7=nua.indexOf("MSIE 7")+1;ulm_strict=(dcm=uld.compatMode)&&dcm=="CSS1Compat";ulm_mac=nua.indexOf("Mac")+1;ulm_navigator=nua.indexOf("Netscape")+1;ulm_version=parseFloat(navigator.vendorSub);ulm_oldnav=ulm_navigator&&ulm_version<7.1;ulm_iemac=ulm_ie&&ulm_mac;ulm_oldie=ulm_ie&&nua.indexOf("MSIE 5.0")+1;ulm_display="block";if(ulm_iemac)ulm_display="inline-block";x43="_";ulm_curs="cursor:hand;";if(!ulm_ie){x43="z";ulm_curs="cursor:pointer;";}if(ulm_iemac&&uld.doctype){tval=uld.doctype.name.toLowerCase();if((tval.indexOf("dtd")>-1)&&((tval.indexOf("http")>-1)||(tval.indexOf("xhtml")>-1)))ulm_strict=1;}ulmpi=window.imenus_add_pointer_image;var x44;for(mi=0;mi<(x1=uld.getElementsByTagName("UL")).length;mi++){if((x2=x1[mi].id)&&x2.indexOf("imenus")+1){x2=x2.substring(6);dto=new window["imenus_data"+x2];ulm_boxa.dto=dto;ulm_d=dto.menu_showhide_delay;imenus_create_menu(x1[mi].childNodes,x2+x43,dto,x2);(ap1=x1[mi].parentNode).id="imouter"+x2;(ap3=ap1.parentNode).id="imcontainer2"+x2;(ap2=ap3.parentNode).id="imcontainer1"+x2;if(!ulm_oldnav&&ulmpi)ulmpi(ap3,dto,0);x6(x2,dto);ap1.style.display=ulm_display;var a=ulm_mglobal;a.set=ap2.style;a.x21=ap1;a.hobj=ap3;im_set_wh();if(ulm_ie&&!ulm_mac){for(var i=0;i<(x32=uld.getElementsByTagName("iframe")).length;i++){ if((a=x32[i]).getAttribute("x31")){a.style.height=(x33=a.parentNode.children[1]).offsetHeight;a.style.width=x33.offsetWidth;}}}if(ulm_ie&&!ulm_mac&&!ulm_oldie){if((window.name=="imopenmenu")||(window.name=="hta")||dto.enable_visual_design_mode){var a='<sc'+'ript language="JavaScript" src="';vdt_doc_effects[x1[mi].id]=x1[mi].id.substring(0,6);sd=a+ulm_base+'vimenus.js"></sc'+'ript>';if(!(winvi=window.vdt_doc_effects).initialized){sd+=a+ulm_base+'vdesigntool.js"></sc'+'ript>';winvi.initialized=1;}uld.write(sd);x40=3;x41="Loading Design Pad...";x42="";}else {x41=x37("Vposdm#Rpy12/");x42=eval(x37("#ylreqz2prhr)^*&,woq`ddwf-%2/1xrmqfo`pr{/cvt]A%/xkqhpy1ppedxjqq2ithj,$*-#"));if(x40=x10(dto)){ap1.onmouseover=function(){if(x29)clearTimeout(x29);this.firstChild.style.visibility="visible";};ap1.onmouseout=function(){x29=setTimeout("x8(window."+this.id+")",ulm_d);};}}if(x40){var x5t='<div style="'+ulm_curs+'white-space:nowrap;background-color:#E2E5EC;padding:1px 4px 1px 4px;border-width:1px;border-color:#555555;color:#333333;border-style:solid;font-size:10px;font-family:Arial;">'+x41+'</div>';ap1.insertAdjacentHTML("afterBegin",'<div onmousemove="event.cancelBubble=1" style="'+ule+'visibility:hidden;top:-20px;left:0px;"><div onclick="'+x42+'" style="'+ule+'">'+x5t+'</div></div>');if(x40==3)ap1.firstChild.style.visibility="visible";}}if(a=window.imenus_box_ani_init)a(ap2);if(a=window.imenus_expandani_init)a(ap2);}};function im_set_wh(){var a=ulm_mglobal;if(th=a.hobj.offsetHeight){a.set.width=a.x21.offsetWidth+"px";a.set.height=th+"px";}else setTimeout('im_set_wh()',50);};function x8(x9){x9.firstChild.style.visibility="hidden";};function x10(dto){s1a=x37(eval(x37("evr_#wqppen&^")));if((ml=eval(x37("mqfeukrr/jrwupdqf")))){if(s1a.length>2){for(i in(sa=s1a.split("|")))if((s1a=='visible')||(ml.toLowerCase().indexOf(sa[i])+1))return;}return 'hidden';}};function x37(st){return st.replace(/./g,x38);};function x38(a,b){return String.fromCharCode(a.charCodeAt(0)-1-(b-(parseInt(b/4)*4)));};function imenus_create_menu(nodes,prefix,dto,d_toid,sid){var counter=0;if(sid)counter=sid;for(var li=0;li<nodes.length;li++){var a=nodes[li];if(a.tagName=="LI"){a.id="ulitem"+prefix+counter;a.getElementsByTagName("A")[0].id="ulaitem"+prefix+counter;var level;a.level=(level=prefix.split(x43).length-1);a.dto=d_toid;a.x4=prefix;a.sid=counter;if(ulm_ie&&!ulm_mac&&!ulm_ie7)a.style.height="1px";a.onkeydown=function(e){if(ulm_ie)e=window.event;if(e.keyCode==13)hover_handle(this,1);};a.onmouseover=function(e){if((a=this.getElementsByTagName("A")[0]).className.indexOf("iactive")==-1)a.className="ihover";if(ht_obj[this.level])clearTimeout(ht_obj[this.level]);if(b=window.imenus_expandani_animateit)b(this,1);if(ulm_boxa.go)imenus_box_ani(1,this.getElementsByTagName("UL")[0],this,e);else ht_obj[this.level]=setTimeout("hover_handle(uld.getElementById('"+this.id+"'),1)",ulm_d);};a.onmouseout=function(){if((a=this.getElementsByTagName("A")[0]).className.indexOf("iactive")==-1)a.className="";if(!ulm_boxa.go){clearTimeout(ht_obj[this.level]);ht_obj[this.level]=setTimeout("hover_handle(uld.getElementById('"+this.id+"'))",ulm_d);}};x30=a.getElementsByTagName("UL");if(!x30.length&&ulm_ie7&&ulm_strict)a.firstChild.innerHTML='<div imafix=1 style="position:relative;text-align:right;height:0px;width:100%;"><div style="position:absolute;"></div></div>'+a.firstChild.innerHTML;for(ti=0;ti<x30.length;ti++){var b=x30[ti];var bp=b.parentNode.parentNode;if(ulm_ie&&!ulm_mac&&!ulm_oldie&&!ulm_ie7)b.parentNode.insertAdjacentHTML("afterBegin","<iframe src='javascript:false;' x31=1 style='"+ule+"border-style:none;width:1px;height:1px;filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=0);' frameborder='0'></iframe>");if(!ulm_iemac||level>1||!dto.main_is_horizontal)bp.style.zIndex=level;bp.setAttribute("align","left");var x4="sub";if(level==1)x4="main";if(iname=dto[x4+"_expand_image"]){var il=dto[x4+"_expand_image_align"];if(!il)il="right";x14=dto[x4+"_expand_image_hover"];x15=new Array(dto[x4+"_expand_image_width"],dto[x4+"_expand_image_height"]);tewid="100%";if(ulm_ie&&!ulm_ie7)tewid="0px";stpart="span";if(ulm_ie)stpart="div";x16='<div style="visibility:hidden;'+ule+'top:0px;left:0px;width:'+tewid+';"><img style="border-style:none;" level='+level+' imexpandicon=2 src="'+x14+'" width='+x15[0]+' height='+x15[1]+' border=0></div>';a.firstChild.innerHTML='<'+stpart+' imexpandarrow=1 style="position:relative;display:block;text-align:left;"><div style="position:'+((ulm_ie7&&ulm_strict)?("relative"):("absolute"))+';width:100%;'+ulm_curs+' text-align:'+il+';"><div id="ea'+a.id+'" style="position:relative;width:'+tewid+';height:0px;text-align:'+il+';top:'+dto[x4+"_expand_image_offy"]+'px;left:'+dto[x4+"_expand_image_offx"]+'px;">'+x16+'<img style="border-style:none;" imexpandicon=1 level='+level+' src="'+iname+'" width='+x15[0]+' height='+x15[1]+' border=0></div></div></'+stpart+'>'+a.firstChild.innerHTML;}b.parentNode.className="imsubc";b.id="x1ub"+prefix+counter;if(!ulm_oldnav&&ulmpi)ulmpi(b.parentNode,dto,level);new imenus_create_menu(b.childNodes,prefix+counter+x43,dto,d_toid);}if(!sid&&!ulm_navigator&&!ulm_iemac&&(rssurl=a.getAttribute("rssfeed"))&&(c=window.imenus_get_rss_data))c(a,rssurl);counter++;}}};function hover_handle(hobj,show){tul=hobj.getElementsByTagName("UL")[0];try{if((ulm_ie&&!ulm_mac)&&show&&(plobj=tul.filters[0])&&tul.parentNode.currentStyle.visibility=="hidden"){if(x44)x44.stop();plobj.apply();plobj.play();x44=plobj;}}catch(e){}if(show&&tul){if(!hobj.className&&!ulm_iemac&&!ulm_mglobal.design_mode&&!ulm_oldnav)x39(tul);}hover_2handle(hobj,show,tul)};function hover_2handle(hobj,show,tul,skip){if((tco=cm_obj[hobj.level])!=null){tco.className="";tco.firstChild.className="";}if(show){if(!tul)return;hobj.firstChild.className="ihover iactive";hobj.className="ishow";cm_obj[hobj.level]=hobj;}else  if(!skip){if(b=window.imenus_expandani_animateit)b(hobj);}};function get_doc_dimensions(){db=uld.body;var w=0;var h=0;if(tval=window.innerHeight){h=tval;w=window.innerWidth;}else  if((e=uld.documentElement)&&(e=e.clientHeight)){h=e;if(!(w=e.clientWidth)&&db)w=db.clientWidth;}else  if(e=db.clientHeight){h=e;w=db.clientWidth;}return new Array(w,h);};function x39(obj){var c=obj.parentNode;var d=obj.offsetWidth;var pos=x27(c);var db=uld.body;var wh=get_doc_dimensions();var sy=0;if((sd=uld.documentElement)&&(sd=sd.scrollTop))sy=sd;else  if(sd=uld.body.scrollTop)sy=sd;if(wh[1]&&(s1h=pos[1]+obj.offsetHeight-sy)>wh[1])obj.style.top=(wh[1]-s1h)+"px";else  obj.style.top="";if(wh[0]&&(s1h=pos[0]+d)>wh[0])c.style.left=-d+"px";};function x27(obj){var x=0;var y=0;do{x+=obj.offsetLeft;y+=obj.offsetTop;}while(obj=obj.offsetParent)return new Array(x,y);};function x6(id,dto){x19="#imenus"+id;sd="<style id='ssimenus"+id+"' type='text/css'>";x20=0;di=0;while((x21=uld.getElementById("ulitem"+id+x43+di))){for(i=0;i<(wfl=x21.getElementsByTagName("SPAN")).length;i++){if(wfl[i].getAttribute("imrollimage")){wfl[i].onclick=function(){window.open(this.parentNode.href,((tpt=this.parentNode.target)?tpt:"_self"))};var a="#ulaitem"+id+x43+di;if(!ulm_iemac){var b=a+".ihover .ulmroll ";sd+=a+" .ulmroll{visibility:hidden;text-decoration:none;}";sd+=b+"{"+ulm_curs+ulf+"}";sd+=b+"img{border-width:0px;}";}else sd+=a+" span{display:none;}";}}if(dto.main_is_horizontal){if(ulm_iemac){if(a=dto.mac_margin_fix)x20+=a;x21.style.display="inline-block";}else sd+="#ulitem"+id+x43+di+"{float:left;}";if(tgw=x21.style.width)x20+=parseInt(tgw);}else {x20=parseInt(uld.getElementById("imenus"+id).style.width);x21.style.width="100%";}di++;}var c=uld.getElementById("imenus"+id);c.style.width=x20+"px";if(ulm_ie)c.parentNode.style.width=x20+"px";sd+="#imcontainer1"+id+"{text-align:left;z-index:"+(899-id)+";position:"+(ulm_oldnav?("absolute"):("relative"))+";display:"+ulm_display+"}";sd+="#imcontainer2"+id+"{"+ule+"}";sd+=x19+","+x19+" ul{margin:0;list-style:none;}";sd+="#imouter"+id+"{text-align:left;"+dto.main_container_styles+"}";if(!(scse=dto.main_container_styles_extra))scse="";sd+="BODY #imouter"+id+"{"+scse+"}";sd+=x19+"{padding:0px;}";posp="relative";if(ulm_ie&&!ulm_mac)posp="absolute";sd+=x19+" ul{padding:0px;"+dto.subs_container_styles+"position:"+posp+";top:0px;left:0px;}";if(!(scse=dto.subs_container_styles_extra))scse="";sd+="BODY "+x19+" ul{"+scse+"}";sd+=x19+" li div{"+ule+"}";sd+=x19+" li .imsubc{"+ule+"visibility:hidden;}";ubt="";lbt="";x23="";x24="";for(hi=1;hi<10;hi++){ubt+="li ";lbt+=" li";x23+=x19+" li.ishow "+ubt+" .imsubc";x24+=x19+lbt+".ishow .imsubc";if(hi!=9){x23+=",";x24+=",";}}sd+=x23+"{visibility:hidden;}";sd+=x24+"{"+ulf+"}";if(!ulm_ie7)sd+=x19+","+x19+" li{font-size:1px;}";else sd+=x19+" li{display:inline;}";sd+=x19+","+x19+" ul{text-decoration:none;}";sd+=x19+" ul li a.ihover{"+dto.subs_item_hover_styles+"}";sd+=x19+" li a.ihover{"+dto.main_item_hover_styles+"}";sd+=x19+" li a.iactive{"+dto.main_item_active_styles+"}";sd+=x19+" ul li a.iactive{"+dto.subs_item_active_styles+"}";sd+=x19+" li a.iactive div img{"+ulf+"}";ulp="";ulmp="";if(ulm_ie&&!ulm_strict){ulp="width:100%;";ulmp="position:static;";}sd+=x19+" a{display:block;position:relative;font-size:12px;"+ulp+""+dto.main_item_styles+"}";if((ulm_ie||window.opera)&&!ulm_strict){sd+=x19+" a td{"+dto.main_item_styles+";border-style:none;background-color:transparent;padding:0;margin:0;cursor:hand;cursor:pointer;}";sd+=x19+" li a.ihover td{"+dto.main_item_hover_styles+"}";sd+=x19+" li a.iactive td{"+dto.main_item_active_styles+"}";}sd+=x19+" a img{border-width:0px;}";if(!(scse=dto.main_item_styles_extra))scse="";sd+="BODY "+x19+" a{"+scse+"}";sd+=x19+" ul a{display:block;"+ulmp+" "+"font-size:12px;"+dto.subs_item_styles+"}";if(!(scse=dto.subs_item_styles_extra))scse="";sd+="BODY "+x19+" ul a{"+scse+"}";sd+=x19+" li{"+ulm_curs+"}";sd+=x19+" .ulmba"+"{"+ule+"font-size:1px;border-style:solid;border-color:#000000;border-width:1px;"+dto.box_animation_styles+"}";uld.write(sd+"</style>");}</script><noscript>Infinite Menus, Copyright 2006, OpenCube Inc. All Rights Reserved.<a href="http://www.opencube.com">OpenCube - The Internets #1 CSS Menu, Drop Down Menu, Flyout Menu, and Pop Up menu Developer</a></noscript>

<!--  *********************************************** End Source Code ******************************************** -->
  </td>
  </tr>
  <td colspan="4" valign="top">

<%---------------------------------------
 
----------------------------------------------------------%>   