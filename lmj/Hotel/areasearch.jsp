<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.common.HtmlpartMaker,
								 jp.co.lastminute.Hotel.PriceView,
								 jp.co.lastminute.Hotel.search.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%
	ParseFormat pf = null;
	Form form = (Form)request.getAttribute( "Hotel.search.Form" );
	String xmlstring = form.getXmlstring();
	jp.co.yobrain.util.DataFormat dataformat = null;
	String pricestr = "";
%>
<html>
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">

<SCRIPT language="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;
function nn4reload(){if( _bro == 2 ){location.reload();}}
//-->
</SCRIPT>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0"onResize="nn4reload();">

<!-- �w�b�_frame -->
	<center>
	<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER" HEIGHT="65" BACKGROUND="/img/head_e.jpg">
	<tr>
	<td VALIGN="TOP">
	<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="65">
		<tr>
			<td VALIGN="BOTTOM" BACKGROUND="" nowrap ROWSPAN="2">
			<a HREF="http://www.lastminute.co.jp/"><img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="3" BORDER="0"></a></td>
			<td ALIGN="RIGHT" VALIGN="TOP" BACKGROUND="" nowrap>
			</td>
		</tr>
		<tr>
			<td ALIGN="RIGHT" VALIGN="BOTTOM" BACKGROUND="" nowrap>
	    <table BORDER="0" CELLSPACING="0" CELLPADDING="0">
  	    <tr>
        	<td VALIGN="BOTTOM"><a HREF="http://www.uk.lastminute.com/"><img SRC="/img/eng.jpg" WIDTH="18" HEIGHT="11" BORDER="0" ALT="UK"></a></td>
          <td VALIGN="BOTTOM"><a HREF="http://www.nl.lastminute.com/"><img SRC="/img/f1.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="nederland"></a></td>
          <td VALIGN="BOTTOM"><a HREF="http://www.it.lastminute.com/"><img SRC="/img/f2.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="italia"></a></td>
          <td VALIGN="BOTTOM"><a HREF="http://www.se.lastminute.com/"><img SRC="/img/f3.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="sverige"></a></td>
          <td VALIGN="BOTTOM"><a HREF="http://www.es.lastminute.com/"><img SRC="/img/f4.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="espanol"></a></td>
          <td VALIGN="BOTTOM"><a HREF="http://www.de.lastminute.com/"><img SRC="/img/f5.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="deutschland"></a></td>
          <td VALIGN="BOTTOM"><a HREF="http://www.fr1.lastminute.com/"><img SRC="/img/f6.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="lafrance"></a></td>
          <td VALIGN="BOTTOM"><a HREF="http://www.za.lastminute.com/"><img SRC="/img/f7.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="south africa"></a></td>
          <td VALIGN="BOTTOM"><a HREF="http://www.au.lastminute.com/"><img SRC="/img/f8.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="australia"></a></td>
          <td VALIGN="BOTTOM"><a href="http://www.lastminute.com/lmn/pso/catalog/Category.jhtml?CATID=95062"><img src="/img/f9.gif" width="17" height="11" border="0" alt="belgium"></a></td>
          <td VALIGN="BOTTOM"><a href="http://www.nz.lastminute.com"><img src="/img/f10.gif" width="17" height="11" border="0" alt="new zealand"></a></td>
          <td><img SRC="/img/flag_jp.gif" WIDTH="37" HEIGHT="24" BORDER="0" ALT="japan"></td>
          <td><img SRC="/img/shim.gif" WIDTH="3" HEIGHT="20" ALT=""></td>
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
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760">
	<tr>
	<td VALIGN="TOP">
	<IMG SRC="/img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>

<!-- �i�rframe -->
	<NOLAYER>
	<IFRAME SRC="/lmj/navi.jhtml" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="/lmj/navi.jhtml" WIDTH="147" HEIGHT="680"></ILAYER>
<!-- /�i�rframe -->

	</td>

<!-- ���� -->
	<td>
	<IMG SRC="/img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /���� -->

	<td VALIGN="TOP" ALIGN="center">
	<IMG SRC="/img/shim.gif" WIDTH="458" HEIGHT="1" alt=""><br>


	<!-- �����z�e���E��� -->
        <TABLE cellSpacing=0 cellPadding=0 width=458 border=0>
          <TR> 
            <TD align=left width=67 rowspan="2" valign="middle" > <img src="/img/header_icon_ds.gif" width="67" height="65"> 
            </TD>
            <TD class="txt16b" valign="middle"> 
              <table border="0" cellspacing="0" cellpadding="0" width="391" align="center">
                <tr> 
                  <td valign="bottom" class="txt16b">�����z�e���E��ǁ@<span class="txt12">DOMESTIC�@HOTELS</span></td>
                </tr>
                <tr> 
                  <td height="5"><img src="/img/blk.gif" width="391" height="1"></td>
                </tr>
                <tr> 
                  <td class="b"> 
                    <div align="left"><b><img src="/img/pont2.gif" width="10" height="10"> 
                      <a href="/lmj/Hotel/top.do"> LMJ��������</a> <img src="/img/pont2.gif" width="10" height="10"> 
                      <a href="/lmj/Hotel/top.do#kensaku"> ���񂽂񌟍�</a> <img src="/img/pont2.gif" width="10" height="10">
                      <a href="/lmj/Hotel/from_postalArea.jsp"> �ړI�n���猟��</a></b></div></h3>
                  </td>
                </tr>
              </table>
            </TD>
          </TR>
          <TR > 
            <TD valign="top" height="7"> 
              
            </TD>
          </TR>
        </TABLE>
<!-- /�����z�e���E��� -->

<!-- ���X�g -->
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td WIDTH="100%" colspan="4"><img SRC="/img/tab_dot.gif" WIDTH="100%" HEIGHT="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
						<td COLSPAN="2" BGCOLOR="#F3F0EA"><img SRC="/img/shim.gif" WIDTH="10" HEIGHT="12" ALT=""></td>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="8" BGCOLOR="#F3F0EA"><img SRC="/img/shim.gif" WIDTH="8" HEIGHT="8" VSPACE="1" ALT=""></td>
		<td WIDTH="448" BGCOLOR="#F3F0EA">
			<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="438">
			<tr>
			<td COLSPAN="2" VALIGN="TOP" align='right'>
			<span CLASS="super14">
			<%= HtmlpartMaker.getPagingString( "/lmj/Hotel/search.do", form.getScatid(), form.getPages(), form.getTotalpages() ) %>
			</span>
			</td>
			</tr>
			<tr>
				<td COLSPAN="2">
<!-- �ړ� -->
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="LIST_VIEW" xml="${xmlstr}"></xml:parse>
				<table WIDTH="438" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td valign='top' colspan='2'>
						<span CLASS="super14"><xml:out select='$LIST_VIEW//SEARCH_CONDITION/SCATID/SCATIDNAME' /></span>
						</td>
					</tr>
					<tr>
						<td valign='top' colspan='2'><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td>
					</tr>
<xml:forEach select="$LIST_VIEW//LISTS/STATES/STATE" >
					<tr>
						<td valign="top" colspan="1" width='108'><xml:out select='STATE_NAME' /></td>
						<td valign="top" width='330'>
<xml:forEach select="CITYS/CITY" >
<a href="/lmj/Hotel/search.do?scatid=<xml:out select='SCATID' />&state_cd=<xml:out select='STATE_CD' />&city_cd=<xml:out select='CITY_CD' />&checkindate=<%= form.getCheckindate() %>&night=<%= form.getNight() %>"><xml:out select='CITYNAME' /></a>&nbsp;
</xml:forEach><br/><br/>
						</td>
					</tr>
</xml:forEach>
					<tr>
						<td valign='top' colspan='2'><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td>
					</tr>
					</table>
<!-- /�ړ� -->
				</td>
			</tr>
			<tr>
			<td COLSPAN="2" HEIGHT="20" VALIGN="TOP">

<!-- �ړ� -->
				<table WIDTH="438" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>

					<td WIDTH="219">
					</td>
					<td ALIGN="RIGHT" WIDTH="219">
					</td>
				</tr>
				</table>
<!-- /�ړ� -->

			</td>
			</tr>
			</table>

		</td>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" COLSPAN="4"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		</table>
<!-- /���X�g -->

	</td>

<!-- ���� -->
	<td>
	<IMG SRC="/img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /���� -->

	<td VALIGN="TOP">
	<IMG SRC="/img/shim.gif" WIDTH="125" HEIGHT="1" alt=""><br>

<!-- �A�hframe -->
<!-- 030919 SystemDown
	<NOLAYER><IFRAME SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" NAME="" WIDTH="125" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" WIDTH="125" HEIGHT="680"></ILAYER>
-->
<A HREF="http://ads.lmj.valueclick.jp/redirect?host=hs0000797&size=125x600&b=indexpage&v=0" TARGET="_top"><IMG BORDER="0" WIDTH="125" HEIGHT="600" ALT="Click here to visit our sponsor"
SRC="http://ads.lmj.valueclick.jp/cycle?host=hs0000797&size=125x600&b=indexpage&noscript=1"></A>
<!-- modify end -->

<!-- /�A�hframe -->

	</td>
	</tr>
	</table>
	</center>
<%
	//String scatid = "";
	//if( request.getParameter("scatid") != null ) scatid = request.getParameter("scatid");
	//String copyurl = "/lmj/copy.jsp?s_pageName=GIFT_DETAIL_JSP&s_server=www.lastminute.co.jp&s_channel=CosyDesign&s_pageType=Detail&s_prop1=" + scatid;
	String copyurl = "/copy.html";
%>
<!-- �R�s�[���C�gframe -->
	<center>
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
	</center>
<!-- /�R�s�[���C�gframe -->

</body>
</html>
