
<script language="JavaScript" src="<%=BASEURL%>/images/calendario.js">
</script>
<style type="text/css">
<!--
#micalendario { font-family: Arial, Helvetica, sans-serif; font-size: 9px; font-weight: bold;  border-style: outset; border-top-width: thin; border-right-width: thin; border-bottom-width: thin; border-left-width: thin}
#micalendario .nombmes {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #0000CC; background-color: #CCCCCC; border-color: black black #0033FF; font-weight: bold; height: 5px; padding-top: 3px; line-height: 12px; border-style: ridge; border-top-width: 0px; border-right-width: 0px; border-bottom-width: thin; border-left-width: 0px}
#micalendario .nombdias {font-family: Arial, Helvetica, sans-serif; font-size: 9px; font-weight: bold;   color: #0000CC}
#micalendario .dianormal {  font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #000099; font-size: 9px}
#micalendario .diafiesta {  font-family: Arial, Helvetica, sans-serif; font-size: 9px; font-weight: bold; color: #FF0000}
#micalendario caption {  font-size: 12px; font-weight: bold; color: #3300CC; background: #FFFF99; line-height: 70%; padding-top: 4px; clip:    rect(   ); border-style: outset; border-top-width: thin; border-right-width: thin; border-bottom-width: thin; border-left-width: medium}
-->
</style>
<%----------
<form name="form1" method="post" action="" >

    <select name="lista" size="1" onChange="vermes(this.form.lista, this.form.anio.value)">
      <option value="1" selected>Enero</option>
      <option value="2">Febrero</option>
      <option value="3">Marzo</option>
      <option value="4">Abril</option>
      <option value="5">Mayo</option>
      <option value="6">Junio</option>
      <option value="7">Julio</option>
      <option value="8">Agosto</option>
      <option value="9">Septiembre</option>
      <option value="10">Octubre</option>
      <option value="11">Noviembre</option>
      <option value="12">Diciembre</option>
    </select>
  
  <input type="text" name="mes" size="2" value="10" maxlength="2"  onChange="vermestexto(this.form.mes.value, this.form.anio.value)">
  <input type="text" name="anio" value="2005" size="4" maxlength="4"  onChange="vermestexto(this.form.mes.value, this.form.anio.value)">
  
<%---------------
<SCRIPT language="JavaScript" type="text/javascript">

//hoy(this.form.lista, this.form.anio.value);
hoy(document.form1.lista, document.form1.anio);
function hoy(mesx,aniox)
{

var now   = new Date();
var day   = now.getDate();
var month = now.getMonth();
var year  = now.getYear();
alert(mesx[month].value);
 
//var anio1=eval("document.form1.anio");
//anio1.value=year;
vermes(mesx, aniox.value);
}
</script>

</form>
------%>

<%-------%>

<div id="micalendario" style="position:absolute; width:120px; height:auto; z-index:1;  overflow: visible"> 
</div>