<html>
<head>
<title>::: Reservaciones Aerogal :::</title>
<meta http-equiv="Content-Type" content="text/html;">
<!--Fireworks MX 2004 Dreamweaver MX 2004 target.  Created Mon Dec 05 11:50:33 GMT-0500 (SA Pacific Standard Time) 2005-->
<script language="JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_nbGroup(event, grpName) { //v6.0
var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])?args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) { img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr) for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}

function MM_preloadImages() { //v3.0
 var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
   var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
   if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function mmLoadMenus() {
  if (window.mm_menu_1125181223_0) return;
  window.mm_menu_1125181223_0 = new Menu("root",91,18,"Verdana, Arial, Helvetica, sans-serif",12,"#ffffff","#ffffff","#990000","#000066","center","middle",3,0,1000,-5,7,true,true,false,0,true,true);
  mm_menu_1125181223_0.addMenuItem("Aviones","location='Aviones-'");
  mm_menu_1125181223_0.addMenuItem("Ciudades","location='Ciudades-'");
  mm_menu_1125181223_0.addMenuItem("Itinerarios","location='Itinerarios-'");
  mm_menu_1125181223_0.addMenuItem("Tarifas","location='Tarifas-'");
  mm_menu_1125181223_0.addMenuItem("Vuelos","location='Vuelos-'");
  mm_menu_1125181223_0.addMenuItem("StockBoletos","location='StokBoletos-'");
  mm_menu_1125181223_0.addMenuItem("Proveedores","location='Proveedores-'");
  mm_menu_1125181223_0.addMenuItem("Clientes","location='AvionesAction'");
   mm_menu_1125181223_0.bgImageUp="<%=BASEURL%>/images/Sistema/mmmenu5_91x18_up.gif";
   mm_menu_1125181223_0.bgImageOver="<%=BASEURL%>/images/Sistema/mmmenu5_91x18_over.gif";
   mm_menu_1125181223_0.hideOnMouseOut=true;
   mm_menu_1125181223_0.bgColor='#ffffff';
  window.mm_menu_1125184928_1 = new Menu("root",101,18,"Verdana, Arial, Helvetica, sans-serif",12,"#ffffff","#ffffff","#990000","#000066","center","middle",3,0,1000,-5,7,true,true,false,0,true,true);
  mm_menu_1125184928_1.addMenuItem("Reservaciones","location='Reservaciones-'");
  mm_menu_1125184928_1.addMenuItem("Sep.&nbsp;Espacios","location='Espacios-'");
  mm_menu_1125184928_1.addMenuItem("Ch.&nbsp;Coorp.","location='Chequeras-'");
  mm_menu_1125184928_1.addMenuItem("Anular&nbsp;Boletos","location='Anular-'");
  mm_menu_1125184928_1.addMenuItem("Black&nbsp;List","location='Black-'");
  mm_menu_1125184928_1.addMenuItem("Waiting&nbsp;list","location='Waiting-'");
   mm_menu_1125184928_1.bgImageUp="<%=BASEURL%>/images/Sistema/mmmenu4_101x18_up.gif";
   mm_menu_1125184928_1.bgImageOver="<%=BASEURL%>/images/Sistema/mmmenu4_101x18_over.gif";
   mm_menu_1125184928_1.hideOnMouseOut=true;
   mm_menu_1125184928_1.bgColor='#ffffff';
  window.mm_menu_1128100131_2 = new Menu("root",128,18,"Verdana, Arial, Helvetica, sans-serif",12,"#ffffff","#ffffff","#990000","#000066","center","middle",3,0,1000,-5,7,true,true,false,0,true,true);
  mm_menu_1128100131_2.addMenuItem("Reporte&nbsp;de&nbsp;Ventas","location='RVentas-'");
  mm_menu_1128100131_2.addMenuItem("Estadisticas","location='RStadisticas-'");
   mm_menu_1128100131_2.bgImageUp="<%=BASEURL%>/images/Sistema/mmmenu3_128x18_up.gif";
   mm_menu_1128100131_2.bgImageOver="<%=BASEURL%>/images/Sistema/mmmenu3_128x18_over.gif";
   mm_menu_1128100131_2.hideOnMouseOut=true;
   mm_menu_1128100131_2.bgColor='#ffffff';
  window.mm_menu_1128100244_3 = new Menu("root",107,18,"Verdana, Arial, Helvetica, sans-serif",12,"#ffffff","#ffffff","#990000","#000066","center","middle",3,0,1000,-5,7,true,true,false,0,true,true);
  mm_menu_1128100244_3.addMenuItem("Activar&nbsp;Vuelo","location='Activar-'");
  mm_menu_1128100244_3.addMenuItem("ChequearVuelo","location='Chequear-'");
   mm_menu_1128100244_3.bgImageUp="<%=BASEURL%>/images/Sistema/mmmenu2_107x18_up.gif";
   mm_menu_1128100244_3.bgImageOver="<%=BASEURL%>/images/Sistema/mmmenu2_107x18_over.gif";
   mm_menu_1128100244_3.hideOnMouseOut=true;
   mm_menu_1128100244_3.bgColor='#ffffff';
  window.mm_menu_1128100354_4 = new Menu("root",72,18,"Verdana, Arial, Helvetica, sans-serif",12,"#ffffff","#ffffff","#990000","#000066","center","middle",3,0,1000,-5,7,true,true,false,0,true,true);
  mm_menu_1128100354_4.addMenuItem("Grupos","location='Grupos-'");
  mm_menu_1128100354_4.addMenuItem("Usuarios","location='Usuarios-'");
  mm_menu_1128100354_4.addMenuItem("Password","location='Password-'");
   mm_menu_1128100354_4.bgImageUp="<%=BASEURL%>/images/Sistema/mmmenu1_72x18_up.gif";
   mm_menu_1128100354_4.bgImageOver="<%=BASEURL%>/images/Sistema/mmmenu1_72x18_over.gif";
   mm_menu_1128100354_4.hideOnMouseOut=true;
   mm_menu_1128100354_4.bgColor='#ffffff';

  mm_menu_1128100354_4.writeMenus();
} // mmLoadMenus()

//-->
</script>
<script language="JavaScript1.2" src="<%=BASEURL%>/images/Sistema/mm_menu.js"></script>
<link href="<%=BASEURL%>/images/Sistema/Level2_Verdana_Forms.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#000066"  onLoad="MM_preloadImages('<%=BASEURL%>/images/Sistema/Sistema_r4_c10_f2.gif','<%=BASEURL%>/images/Sistema/Sistema_r4_c10_f4.gif','<%=BASEURL%>/images/Sistema/Sistema_r4_c10_f3.gif','<%=BASEURL%>/images/Sistema/Sistema_r8_c2_f2.gif','<%=BASEURL%>/images/Sistema/Sistema_r8_c2_f4.gif','<%=BASEURL%>/images/Sistema/Sistema_r8_c2_f3.gif','<%=BASEURL%>/images/Sistema/Sistema_r8_c2.gif')">
<script language="JavaScript1.2">mmLoadMenus();</script>
<table border="0" cellpadding="0"  align="center" cellspacing="0" width="780" bgcolor="ffffff">
<!-- fwtable fwsrc="<%=BASEURL%>/images/Sistema/Sistema.png" fwbase="Sistema.gif" fwstyle="Dreamweaver" fwdocid = "195267267" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="13" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="144" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="8" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="140" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="5" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="142" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="6" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="24" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="104" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="15" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="144" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="35" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td rowspan="6" colspan="6"><img name="<%=BASEURL%>/images/Sistema/Sistema_r1_c1" src="<%=BASEURL%>/images/Sistema/Sistema_r1_c1.gif" width="452" height="138" border="0" alt=""></td>
   <td colspan="6"><img name="<%=BASEURL%>/images/Sistema/Sistema_r1_c7" src="<%=BASEURL%>/images/Sistema/Sistema_r1_c7.gif" width="328" height="37" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="37" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="6" colspan="2"><img name="<%=BASEURL%>/images/Sistema/Sistema_r2_c7" src="<%=BASEURL%>/images/Sistema/Sistema_r2_c7.gif" width="30" height="106" border="0" alt=""></td>
   <td colspan="3" align="center" valign="bottom" bgcolor="#000066"><form name="form1" method="post" action="">
     <p>
       <input name="buscar" type="text" class="small">
     </p>
   </form></td>
   <td rowspan="4"><img name="<%=BASEURL%>/images/Sistema/Sistema_r2_c12" src="<%=BASEURL%>/images/Sistema/Sistema_r2_c12.gif" width="35" height="83" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="41" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/Sistema/Sistema_r3_c9" src="<%=BASEURL%>/images/Sistema/Sistema_r3_c9.gif" width="263" height="5" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="5" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="4"><img name="<%=BASEURL%>/images/Sistema/Sistema_r4_c9" src="<%=BASEURL%>/images/Sistema/Sistema_r4_c9.gif" width="104" height="60" border="0" alt=""></td>
   <td colspan="2"><a href="#" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','<%=BASEURL%>/images/Sistema/Sistema_r4_c10','<%=BASEURL%>/images/Sistema/Sistema_r4_c10_f2.gif','<%=BASEURL%>/images/Sistema/Sistema_r4_c10_f4.gif',1);" onClick="MM_nbGroup('down','navbar1','Sistema_r4_c10','<%=BASEURL%>/images/Sistema/Sistema_r4_c10_f3.gif',1);"><img name="<%=BASEURL%>/images/Sistema/Sistema_r4_c10" src="<%=BASEURL%>/images/Sistema/Sistema_r4_c10.gif" width="159" height="29" border="0" alt=""></a></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="29" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="3" colspan="2"><img name="<%=BASEURL%>/images/Sistema/Sistema_r5_c10" src="<%=BASEURL%>/images/Sistema/Sistema_r5_c10.gif" width="159" height="31" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="8" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="4"><img name="<%=BASEURL%>/images/Sistema/Sistema_r6_c12" src="<%=BASEURL%>/images/Sistema/Sistema_r6_c12.gif" width="35" height="77" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="18" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="6"><img name="<%=BASEURL%>/images/Sistema/Sistema_r7_c1" src="<%=BASEURL%>/images/Sistema/Sistema_r7_c1.gif" width="452" height="5" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="5" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="<%=BASEURL%>/images/Sistema/Sistema_r8_c1" src="<%=BASEURL%>/images/Sistema/Sistema_r8_c1.gif" width="13" height="54" border="0" alt=""></td>
   <td><a href="#" onMouseOut="MM_nbGroup('out');MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_1125181223_0,-1,31,null,'<%=BASEURL%>/images/Sistema/Sistema_r8_c2');MM_nbGroup('over','<%=BASEURL%>/images/Sistema/Sistema_r8_c2','<%=BASEURL%>/images/Sistema/Sistema_r8_c2_f2.gif','<%=BASEURL%>/images/Sistema/Sistema_r8_c2_f4.gif',1);" onClick="MM_nbGroup('down','navbar1','<%=BASEURL%>/images/Sistema/Sistema_r8_c2','<%=BASEURL%>/images/Sistema/Sistema_r8_c2_f3.gif',1);"><img name="<%=BASEURL%>/images/Sistema/Sistema_r8_c2" src="<%=BASEURL%>/images/Sistema/Sistema_r8_c2_f3.gif" width="144" height="30" border="0" alt=""onLoad="MM_nbGroup('init','navbar1', '<%=BASEURL%>/images/Sistema/Sistema_r8_c2','<%=BASEURL%>/images/Sistema/Sistema_r8_c2.gif',1)"></a></td>
   <td rowspan="2"><img name="<%=BASEURL%>/images/Sistema/Sistema_r8_c3" src="<%=BASEURL%>/images/Sistema/Sistema_r8_c3.gif" width="8" height="54" border="0" alt=""></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_1125184928_1,-34,33,null,'<%=BASEURL%>/images/Sistema/Sistema_r8_c4');"><img name="<%=BASEURL%>/images/Sistema/Sistema_r8_c4" src="<%=BASEURL%>/images/Sistema/Sistema_r8_c4.gif" width="140" height="30" border="0" alt=""></a></td>
   <td rowspan="2"><img name="<%=BASEURL%>/images/Sistema/Sistema_r8_c5" src="<%=BASEURL%>/images/Sistema/Sistema_r8_c5.gif" width="5" height="54" border="0" alt=""></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_1128100131_2,2,34,null,'<%=BASEURL%>/images/Sistema/Sistema_r8_c6');"><img name="<%=BASEURL%>/images/Sistema/Sistema_r8_c6" src="<%=BASEURL%>/images/Sistema/Sistema_r8_c6.gif" width="142" height="30" border="0" alt=""></a></td>
   <td rowspan="2"><img name="<%=BASEURL%>/images/Sistema/Sistema_r8_c7" src="<%=BASEURL%>/images/Sistema/Sistema_r8_c7.gif" width="6" height="54" border="0" alt=""></td>
   <td colspan="3"><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_1128100244_3,1,35,null,'<%=BASEURL%>/images/Sistema/Sistema_r8_c8');"><img name="<%=BASEURL%>/images/Sistema/Sistema_r8_c8" src="<%=BASEURL%>/images/Sistema/Sistema_r8_c8.gif" width="143" height="30" border="0" alt=""></a></td>
   <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_1128100354_4,-86,35,null,'<%=BASEURL%>/images/Sistema/Sistema_r8_c11');"><img name="<%=BASEURL%>/images/Sistema/Sistema_r8_c11" src="<%=BASEURL%>/images/Sistema/Sistema_r8_c11.gif" width="144" height="30" border="0" alt=""></a></td>
   <td><img src="<%=BASEURL%>/images/Sistema/spacer.gif" width="1" height="30" border="0" alt=""></td>
  </tr>
  <tr>
   <td><img name="<%=BASEURL%>/images/Sistema/Sistema_r9_c2" src="<%=BASEURL%>/images/Sistema/Sistema_r9_c2.gif" width="144" height="24" border="0" alt=""></td>
   <td><img name="<%=BASEURL%>/images/Sistema/Sistema_r9_c4" src="<%=BASEURL%>/images/Sistema/Sistema_r9_c4.gif" width="140" height="24" border="0" alt=""></td>
   <td><img name="<%=BASEURL%>/images/Sistema/Sistema_r9_c6" src="<%=BASEURL%>/images/Sistema/Sistema_r9_c6.gif" width="142" height="24" border="0" alt=""></td>
   <td colspan="4"><img name="<%=BASEURL%>/images/Sistema/Sistema_r9_c8" src="<%=BASEURL%>/images/Sistema/Sistema_r9_c8.gif" width="287" height="24" border="0" alt=""></td>
   <td><img src="spacer.gif" width="1" height="24" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="<%=BASEURL%>/images/Sistema/Sistema_r10_c1" src="<%=BASEURL%>/images/Sistema/Sistema_r10_c1.gif" width="13" height="303" border="0" alt=""></td>
   <td colspan="10" valign="top">
   