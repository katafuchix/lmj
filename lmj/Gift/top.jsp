<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.Gift.top.Form" %>
<%
	Form form = (Form)request.getAttribute( "Gift.top.Form" );
	
	String pageType = "TOP";
	int type_flg = 0;
	if( form.getAct().equals("purpose") ){
		type_flg = 1;
		pageType = "CATEGORY";
	}else if( form.getAct().equals("price") ){
		type_flg = 2;
		pageType = "PRICE";
	}
%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/Ahtml; charset=Shift_JIS">
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">
<SCRIPT language="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;
function nn4reload(){
if( _bro == 2 ){location.reload();}}
//-->
</SCRIPT>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">

<!-- �w�b�_frame -->
	<center>

	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" height="72">
	<tr>
	<td valign="top">
	<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER" HEIGHT="65" BACKGROUND="/img/head_e.jpg">
	<tr>
	<td VALIGN="TOP">
	
		<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="65">
		<tr>
					<td VALIGN="BOTTOM" BACKGROUND="" nowrap ROWSPAN="2"><a HREF="http://www.lastminute.co.jp/lmj/index.jsp" target="_parent"><img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="3" BORDER="0"></a></td>
					<td ALIGN="RIGHT" VALIGN="TOP" BACKGROUND="" nowrap>�@

			</td>
		</tr>
		<tr>
					<td ALIGN="RIGHT" VALIGN="BOTTOM" BACKGROUND="" nowrap>
	
						<table BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
			    				<td VALIGN="BOTTOM"><a HREF="http://www.uk.lastminute.com/" TARGET="_parent"><img SRC="/img/eng.jpg" WIDTH="18" HEIGHT="11" BORDER="0" ALT="UK"></a></td>
								<td VALIGN="BOTTOM"><a HREF="http://www.nl.lastminute.com/" TARGET="_parent"><img SRC="/img/f1.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="nederland"></a></td>
								<td VALIGN="BOTTOM"><a HREF="http://www.it.lastminute.com/" TARGET="_parent"><img SRC="/img/f2.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="italia"></a></td>
								<td VALIGN="BOTTOM"><a HREF="http://www.se.lastminute.com/" TARGET="_parent"><img SRC="/img/f3.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="sverige"></a></td>
								<td VALIGN="BOTTOM"><a HREF="http://www.es.lastminute.com/" TARGET="_parent"><img SRC="/img/f4.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="espanol"></a></td>
								<td VALIGN="BOTTOM"><a HREF="http://www.de.lastminute.com/" TARGET="_parent"><img SRC="/img/f5.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="deutschland"></a></td>
								<td VALIGN="BOTTOM"><a HREF="http://www.fr1.lastminute.com/" TARGET="_parent"><img SRC="/img/f6.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="lafrance"></a></td>
								<td VALIGN="BOTTOM"><a HREF="http://www.za.lastminute.com/" TARGET="_parent"><img SRC="/img/f7.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="south africa"></a></td>
								<td VALIGN="BOTTOM"><a HREF="http://www.au.lastminute.com/" TARGET="_parent"><img SRC="/img/f8.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="australia"></a></td>
								<td><a HREF="http://www.lastminute.co.jp/lmj/index.jsp" TARGET="_parent"><img SRC="/img/flag_jp.gif" WIDTH="37" HEIGHT="24" BORDER="0" ALT="japan"></td>
								<td><img SRC="/img/shim.gif" WIDTH="3" HEIGHT="20" ALT=""></td>
							</tr>
						</table>
					</td>
		</tr>
		</table>

	</td>
	</tr>
	</table>
	</td>
	</tr>

	</table>
	</center>
<!-- /�w�b�_frame -->

<!-- ���C�A�E�g -->
	<center>

  <table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760" height="710">
    <tr>
	  <td VALIGN="TOP" height="715"> <IMG SRC="/img/tkt_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>
<!-- �i�rframe -->
	<NOLAYER>
	<IFRAME SRC="/navi.html" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="/navi.html" WIDTH="147" HEIGHT="680"></ILAYER>
<!-- /�i�rframe -->
	</td>
<!-- ���� -->
	  <td height="715"> <IMG SRC="/img/tkt_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /���� -->

	  <td VALIGN="TOP" ALIGN="center" height="715" > <IMG SRC="/img/tkt_img/shim.gif" WIDTH="458" HEIGHT="1" alt=""><br>

<!-- �M�t�g -->

        <table cellSpacing=0 cellPadding=0 width=458 border=0>
          <tr> 
            <td align=left width=67 rowspan="2" valign="middle" > <img src="/img/header_icon_gf.gif" width="67"> 
            </td>

            <td class="txt16b" valign="middle"> 
              <table border="0" cellspacing="0" cellpadding="0" width="391" align="center">
                <tr> 
                  <td class="txt16b">�M�t�g�@<span class="txt12">LMJ�@Selections</span></td>
                </tr>
                <tr> 
                  <td height="5"><img src="/img/blk.gif" width="391" height="1"></td>
                </tr>
                <tr> 
                  <td class="b"> 
                    <div align="left"><b>
											<% 	if( type_flg == 0 ){	%>
												<img src="/img/pont2.gif" width="10" height="10">�@<span class="orgb">LMJ��������</span>�@
												<img src="/img/pont2.gif" width="10" height="10">�@<A HREF="/lmj/Gift/top.do?act=purpose">�J�e�S���[��</A>�@
												<img src="/img/pont2.gif" width="10" height="10">�@<A HREF="/lmj/Gift/top.do?act=price">�v���C�X��</A>�@
											<% 	}else if( type_flg == 1 ){	%>
												<img src="/img/pont2.gif" width="10" height="10">�@<A HREF="/lmj/Gift/top.do?act=index">LMJ��������</A>�@
												<img src="/img/pont2.gif" width="10" height="10">�@<span class="orgb">�J�e�S���[��</span>�@
												<img src="/img/pont2.gif" width="10" height="10">�@<A HREF="/lmj/Gift/top.do?act=price">�v���C�X��</A>�@
											<%	}else{	%>
												<img src="/img/pont2.gif" width="10" height="10">�@<A HREF="/lmj/Gift/top.do?act=index">LMJ��������</A>�@
												<img src="/img/pont2.gif" width="10" height="10">�@<A HREF="/lmj/Gift/top.do?act=purpose">�J�e�S���[��</A>�@
												<img src="/img/pont2.gif" width="10" height="10">�@<span class="orgb">�v���C�X��</span>�@
											<%	}	%>
										</b></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr > 
            <td valign="top">
              <div align="right"><b> </b></div>
            </td>
          </tr>

        </table>
<!-- /�M�t�g -->

		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td WIDTH="45" VALIGN="BOTTOM"><img SRC="/img/tkt_img/tab_on_06.gif" WIDTH=45 HEIGHT=1 ALT=""></td>
		    <td WIDTH="123" VALIGN="BOTTOM"><img SRC="/img/tkt_img/tab_dot.gif" WIDTH=123 HEIGHT=1 ALT=""></td>
		<td WIDTH="290" VALIGN="BOTTOM"><img SRC="/img/tkt_img/tab_dot.gif" WIDTH=290 HEIGHT=1 ALT=""></td>
		</tr>
		</table>

		<table BORDER="0" CELLSPACING="0" CELLPADDING="0">
          <tr>
		<td BGCOLOR="#666666"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td COLSPAN="2" BGCOLOR="#F3F0EA"><img SRC="/img/tkt_img/shim.gif" WIDTH="10" HEIGHT="8" ALT="">
		</td>
		<td BGCOLOR="#666666"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="8" BGCOLOR="#F3F0EA"><img SRC="/img/tkt_img/shim.gif" WIDTH="8" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="448" BGCOLOR="#F3F0EA">

<% if( type_flg == 0 ){	%>
<jsp:include page="top01.jsp" />
<%	}else if( type_flg == 1 ){	%>
<jsp:include page="top02.jsp" />
<%	}else{	%>
<jsp:include page="top03.jsp" />
<%	}	%>
		<br>

	</td>
<!-- ���� -->
	  <td height="715"> <IMG SRC="/img/tkt_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /���� -->

	  <td VALIGN="TOP" height="715"> <IMG SRC="/img/tkt_img/shim.gif" WIDTH="125" HEIGHT="1" alt=""><br>
			<!-- �A�hframe -->
			<% if( form.getAct().equals("purpose") ){	%>
				<A HREF="http://ads.lmj.valueclick.jp/redirect?host=hs0000946&size=125x600&t=std&b=indexpage&v=0" TARGET="_blank"><IMG BORDER="0" WIDTH="125" HEIGHT="600" ALT="Click here to visit our sponsor"
				SRC="http://ads.lmj.valueclick.jp/cycle?host=hs0000946&size=125x600&t=std&b=indexpage&noscript=1"></A>
				</NOSCRIPT>
			<%	}else if( form.getAct().equals("price") ){	%>
				<A HREF="http://ads.lmj.valueclick.jp/redirect?host=hs0000947&size=125x600&t=std&b=indexpage&v=0" TARGET="_top"><IMG BORDER="0" WIDTH="125" HEIGHT="600" ALT="Click here to visit our sponsor"
				SRC="http://ads.lmj.valueclick.jp/cycle?host=hs0000947&size=125x600&t=std&b=indexpage&noscript=1"></A>
			<%	}else{	%>
				<A HREF="http://ads.lmj.valueclick.jp/redirect?host=hs0000796&size=125x600&b=indexpage&v=0" TARGET="_top">
				<IMG BORDER="0" WIDTH="125" HEIGHT="600" ALT="Click here to visit our sponsor" SRC="http://ads.lmj.valueclick.jp/cycle?host=hs0000796&size=125x600&b=indexpage&noscript=1"></A>
			<%	}	%>
			<!-- /�A�hframe -->
	</td>
	</tr>
	</table>
	</center>
<!-- �R�s�[���C�gframe -->
<center>
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0">
	    <tr>
			<td align='center'>
	<img SRC="/img/blk.gif" WIDTH="760" HEIGHT="1" VSPACE="5" ALT="">
    <table border="0" width="760" cellpadding="1" cellspacing="1">
	<tr>
	<td align="center">
	<span CLASS="txt12">
	Copyright &copy; 2002-2003 lastminute.com Japan Ltd. All rights reserved.<BR>
	</span>
	</td>
	</tr>
	</table>
			</td>
		</tr>
	</table>
</center>
<!-- /�R�s�[���C�gframe -->


<!-- Omnituer Section -->
<script language="JavaScript">
<!--
/* You may give each page an identifying name, server, and channel on
the next lines. */

var s_pageName="GIFT_INDEX"
var s_server="www.lastminute.co.jp"
var s_channel="GIFT"
var s_pageType=""
var s_prop1="GIFT_INDEX_<%= pageType %>"
var s_code=' '

//-->
</script>
<script language="JavaScript" src="http://www.lastminute.co.jp/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<!-- Omnituer Section -->

</body>
</html>
