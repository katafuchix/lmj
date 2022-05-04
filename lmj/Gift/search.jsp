<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.common.HtmlpartMaker,
								 jp.co.lastminute.Gift.search.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>

<%
	ParseFormat pf = null;
	Form form = (Form)request.getAttribute( "Gift.search.Form" );
	String xmlstring = form.getXmlstring();
	jp.co.yobrain.util.DataFormat dataformat = null;
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


<!-- ヘッダframe -->
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
					<td ALIGN="RIGHT" VALIGN="TOP" BACKGROUND="" nowrap>　

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
<!-- /ヘッダframe -->

<!-- レイアウト -->
	<center>
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760">
	<tr>
	<td VALIGN="TOP">
	<IMG SRC="/img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>

<!-- ナビframe -->
	<NOLAYER>
	<IFRAME SRC="/navi.html" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="/navi.html" WIDTH="147" HEIGHT="680"></ILAYER>
<!-- /ナビframe -->

	</td>

<!-- 調整 -->
	<td>
	<IMG SRC="/img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整 -->

	<td VALIGN="TOP" ALIGN="center">
	<IMG SRC="/img/shim.gif" WIDTH="458" HEIGHT="1" alt=""><br>

<!-- ギフト -->
<!--
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td><img SRC="/img/header_icon_gf.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
		<td><h3>ギフト<br>
		<img SRC="/img/tkt_img/blk.gif" WIDTH="391" HEIGHT="1" ALT=""><br>
		<font class="txtcategory">
		|<A HREF="/lmj/Gift/top.do?act=index">LMJおすすめ</A>|
		|<A HREF="/lmj/Gift/top.do?act=price">価格で</A>|
		|<A HREF="/lmj/Gift/top.do?act=purpose">目的で</A>|
</font>
		</h3></td>
		</tr>
		</table>
-->
        <table cellSpacing=0 cellPadding=0 width=458 border=0>
          <tr> 
            <td align=left width=67 rowspan="2" valign="middle" > <img src="/img/header_icon_gf.gif" width="67"> 
            </td>

            <td class="txt16b" valign="middle"> 
              <table border="0" cellspacing="0" cellpadding="0" width="391" align="center">
                <tr> 
                  <td class="txt16b">ギフト　<span class="txt12">LMJ　Selections</span></td>
                </tr>
                <tr> 
                  <td height="5"><img src="/img/blk.gif" width="391" height="1"></td>
                </tr>
                <tr> 
                  <td class="b"> 
                    <div align="left"><b>

												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=index">LMJおすすめ</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=purpose">カテゴリー別</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=price">プライス別</A>　
												<!--
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=index">LMJおすすめ</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=purpose">カテゴリー別</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<span class="orgb">プライス別</span>　
												<img src="/img/pont2.gif" width="10" height="10">　<span class="orgb">LMJおすすめ</span>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=purpose">カテゴリー別</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=price">プライス別</A>
												-->
										</b></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td valign="top">
              <div align="right"><b> </b></div>
            </td>
          </tr>

        </table>
<!-- /ギフト -->

<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="LIST_VIEW" xml="${xmlstr}"></xml:parse>

<!-- リスト -->
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
			<td VALIGN="TOP" align='left'>
				<span CLASS="super14">
					<xml:out select='$LIST_VIEW//SEARCH_CONDITION/SCATID/NAME' />
				</span><br/>
					<xml:out select='$LIST_VIEW//SEARCH_CONDITION/SCATID/DESCRIPTION' />
			</td>
			<td VALIGN="TOP" align='right'>
				<span CLASS="super14">
					<%= HtmlpartMaker.getPagingString( "/lmj/Gift/search.do", form.getScatid(), form.getPages(), form.getTotalpages() ) %>
				</span>
			</td>
			</tr>
			<tr>
			<td COLSPAN="2">

<!-- 移動 -->
				<table WIDTH="438" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<xml:forEach select="$LIST_VIEW//LISTS/LIST" >
						<tr>
							<td valign="top" colspan="2"><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td>
						</tr>

						<tr>
							<td valign="top" width="77">
								<a href="./detail.do?catid=93&product_id=<xml:out select='SUMIMG' />">
								<img src="/img/gift/<xml:out select='SUMIMG' />-3.gif" height="75" width="130" border="0"></a>
							</td>
							<td valign="top">
								<table width="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
									<tr>
										<td width="8">
										</td>
										<td>
											<a href="./detail.do?catid=93&product_id=<xml:out select='SUMIMG' />" class="txt14b"><xml:out select='TYPE/NAME' /></a>
										　<br/>
											<span class="txt12"><xml:out select='COPY' /></span>
										　<br/>
											<span class="txt12b"><xml:out select='PRICESTR' />円</span>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</xml:forEach>
					<tr>
						<td valign="top" colspan="2"><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td>
					</tr>
				</table>
<!-- /移動 -->

			</td>
			</tr>

			<tr>
			<td COLSPAN="2" HEIGHT="20" VALIGN="TOP">

<!-- 移動 -->
				<table WIDTH="438" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td COLSPAN="2" VALIGN="TOP" align='right'>
								<span CLASS="super14">
								<%= HtmlpartMaker.getPagingString( "/lmj/Gift/search.do", form.getScatid(), form.getPages(), form.getTotalpages() ) %>
								</span>
								</td>
				</td>
				</tr>
				</table>
<!-- /移動 -->

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
<!-- /リスト -->

	</td>

<!-- 調整 -->
	<td>
	<IMG SRC="/img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整 -->

	<td VALIGN="TOP">
	<IMG SRC="/img/shim.gif" WIDTH="125" HEIGHT="1" alt=""><br>

<!-- アドframe -->
<!--
	<NOLAYER><IFRAME SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" NAME="" WIDTH="125" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" WIDTH="125" HEIGHT="680"></ILAYER>
-->
<A HREF="http://ads.lmj.valueclick.jp/redirect?host=hs0000796&size=125x600&b=indexpage&v=0" target="_blank">
    <IMG BORDER="0" WIDTH="125" HEIGHT="600" ALT="Click here to visit our sponsor" SRC="http://ads.lmj.valueclick.jp/cycle?host=hs0000796&size=125x600&b=indexpage&noscript=1">
</A>
<!-- /アドframe -->

	</td>
	</tr>
	</table>
	</center>

<!-- コピーライトframe -->
<div align="center">
<table BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr> 
		<td>
			<center>	
			<img SRC="/img/blk.gif" WIDTH="760" HEIGHT="1" VSPACE="5" ALT="">     
			<table border="0" width="760" cellpadding="1" cellspacing="1">	
			<tr>	
				<td align="center">	<span CLASS="txt12">	Copyright &copy; 2002-2003 lastminute.com Japan Ltd. All rights reserved.<BR>	</span>	</td>	
			</tr>
			</table>
		</center>
		</td>
	</tr>
</table>
</div>
<!-- /コピーライトframe -->

<!-- Omnituer Section -->
<script language="JavaScript">
<!--
/* You may give each page an identifying name, server, and channel on
the next lines. */

var s_pageName="GIFT_LIST"
var s_server="www.lastminute.co.jp"
var s_channel="GIFT"
var s_pageType=""
var s_prop1="GIFT_LIST_<xml:out select='$LIST_VIEW//SEARCH_CONDITION/SCATID/NAME' />"
var s_code=' '

//-->
</script>
<script language="JavaScript" src="http://www.lastminute.co.jp/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<!-- Omnituer Section -->

</body>
</html>
