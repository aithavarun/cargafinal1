<style type="text/css">
<!--
.style1 {color: #FFFFFF}
.style2 {color: #000066}
-->
</style>
<form  method="post" name="Agencias"
action="<%=CONTROLLER%>/Agencia/Pasword">
<input name="Idioma" id="Idioma" value="0" type= "hidden" >
<table border="0" cellpadding="0" cellspacing="0" width="156">
<!-- fwtable fwsrc="<%=BASEURL%>/images/Agencias.png" fwbase="Agencias.gif" fwstyle="Dreamweaver" fwdocid = "742835423" fwnested="0" -->
  <tr>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="13" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="137" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="19" height="1" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td rowspan="2"><img name="<%=BASEURL%>/images/Agencias_r1_c1" src="<%=BASEURL%>/images/Agencias_r1_c1.gif" width="13" height="212" border="0" alt=""></td>
   <td colspan="2"><img name="<%=BASEURL%>/images/Agencias_r1_c2" src="<%=BASEURL%>/images/Agencias_r1_c2.gif" width="156" height="12" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="12" border="0" alt=""></td>
  </tr>
  <tr>
   <td bgcolor="#003b6b"><table >
     <tr>
       <td width="144"><span class="style1">Usuario&nbsp;&nbsp;&nbsp;&nbsp;: </span></td>
     </tr>
     <tr>
       <td><input name= "Usuario" id="Usuario" type="text" class="entrada" size="15"></td>
     </tr>
     <tr>
       <td height="26"><span class="style1">Password : </span></td>
     </tr>
     <tr>
       <td><input name="Password" id= "Password" type="password" class="entrada" size="15" >            </tr>
     <tr>
       <td lign="center"><input a type="SUBMIT" name="Send"  value="Ingresar"  ></td>
     </tr>
     <tr> <td><font color="yellow"><%=model.getError()%></font></td>
     </tr>
   </table></td>
   <td><img name="<%=BASEURL%>/images/Agencias_r2_c3" src="<%=BASEURL%>/images/Agencias_r2_c3.gif" width="19" height="200" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="158" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/Agencias_r3_c1" src="<%=BASEURL%>/images/Agencias_r3_c1.gif" width="169" height="29" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="29" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="<%=BASEURL%>/images/Agencias_r4_c1" src="<%=BASEURL%>/images/Agencias_r4_c1.gif" width="169" height="9" border="0" alt=""></td>
   <td><img src="<%=BASEURL%>/images/spacer.gif" width="1" height="9" border="0" alt=""></td>
  </tr>
</table>

</form>

