<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.Dflight.top.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%	ParseFormat pf = null;	%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/Ahtml; charset=Shift_JIS">
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">

<script LANGUAGE="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;
//-->
</script>
<script LANGUAGE="javascript">
<!--
function nn4reload()
{
if( _bro == 2 ){
location.reload();
}
}
//予約までの流れをPOPUP
function showHowtoBuyDflight(){
		remoteWins = window.open("","HowtoByeDflight",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=500,alwaysRaised=1');
		if (remoteWins != null) {
		  remoteWins.location = "/help/dflight.html";
		}
		remoteWins.focus();
	}
//-->
</script>

</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0" onResize="nn4reload();">
<!-- ヘッダframe -->
	<center>
	<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER" HEIGHT="65" BACKGROUND="/img/head_e.jpg">
	<tr>
	<td VALIGN="TOP">
		<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="65">
		<tr>
			<td VALIGN="BOTTOM" BACKGROUND="" nowrap ROWSPAN="2">
			<a HREF="http://www.lastminute.co.jp/lmj/index.jsp">
			<img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="3" BORDER="0"></a></td>
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
					<td><a HREF="http://www.lastminute.co.jp/lmj/index.jsp"><img SRC="/img/flag_jp.gif" WIDTH="37" HEIGHT="24" BORDER="0" ALT="japan"></td>
					<td><img SRC="/img/shim.gif" WIDTH="3" HEIGHT="20" ALT=""></td>
				</tr>
			</table>
			</td>
		</tr>
		</table>
	</td>
	</tr>
	</table>
<!-- /ヘッダframe -->

<!-- レイアウト -->
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760">
	<tr>
	<td VALIGN="TOP">
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>

<!-- ナビframe -->
	<NOLAYER>
	<IFRAME SRC="/lmj/navi.jhtml?CATID=8" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="/lmj/navi.jhtml?CATID=8" WIDTH="147" HEIGHT="680"></ILAYER>
<!-- /ナビframe -->

	</td>

<!-- 調整 -->
	<td>
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整 -->

	<td VALIGN="TOP" ALIGN="center">
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="458" HEIGHT="1" alt="">
<!-- -->
<%
	String sub_header = "";
	String sub_title = "";
	String sub_title2 = "";
	String s_prop1 = "";

	if( request.getParameter("from") == null ){
			sub_header  = "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=KOJ\">羽田-鹿児島</A>|"
									+ "|羽田-福岡|"
									+ "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=AOJ\">羽田-青森</A>|"
									+ "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=TKS\">羽田-徳島</A>|";
			sub_title = "　＜参考＞大人普通運賃：30,000円　所要時間：約1時間45分";
			sub_title2 = "　＜参考＞大人普通運賃：30,000円　所要時間：約1時間30分";
			s_prop1 = "FUK";

	}else{
		String toStr = (String)request.getParameter("to");
		if( toStr.indexOf("KOJ") >= 0){
			sub_header  = "|羽田-鹿児島|"
								  + "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=FUK\">羽田-福岡</A>|"
								  + "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=AOJ\">羽田-青森</A>|"
								  + "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=TKS\">羽田-徳島</A>|";
			sub_title = "　＜参考＞大人普通運賃：29,400円　所要時間：約1時間40分";
			sub_title2 = "　＜参考＞大人普通運賃：29,400円　所要時間：約1時間40分";
			s_prop1 = "KOJ";

		}
		if( toStr.indexOf("FUK") >= 0){
			sub_header  = "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=KOJ\">羽田-鹿児島</A>|"
									+ "|羽田-福岡|"
									+ "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=AOJ\">羽田-青森</A>|"
									+ "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=TKS\">羽田-徳島</A>|";
			sub_title = "　＜参考＞大人普通運賃：30,000円　所要時間：約1時間45分";
			sub_title2 = "　＜参考＞大人普通運賃：30,000円　所要時間：約1時間30分";
			s_prop1 = "FUK";

		}
		if( toStr.indexOf("AOJ") >= 0){
			sub_header = "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=KOJ\">羽田-鹿児島</A>|"
								 + "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=FUK\">羽田-福岡</A>|"
								 + "|羽田-青森|"
								 + "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=TKS\">羽田-徳島</A>|";
			sub_title = "　＜参考＞大人普通運賃：22,850円　所要時間：約1時間15分";
			sub_title2 = "　＜参考＞大人普通運賃：22,850円　所要時間：約1時間15分";
			s_prop1 = "AOJ";

		}
		if( toStr.indexOf("TKS") >= 0){
			sub_header = "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=KOJ\">羽田-鹿児島</A>|"
								 + "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=FUK\">羽田-福岡</A>|"
								 + "|<A HREF=\"/lmj/Dflight/top.do?from=HND&to=AOJ\">羽田-青森</A>|"
								 + "|羽田-徳島";
			sub_title = "　＜参考＞大人普通運賃：22,800円　所要時間：約1時間10分";
			sub_title2 = "　＜参考＞大人普通運賃：22,800円　所要時間：約1時間10分";
			s_prop1 = "TKS";


		}
	}



%>
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td BACKGROUND="/img/flights_img/header_icon_at.gif" WIDTH="67" HEIGHT="65" valign="bottom" align='left'>
		<!--<font class="txtcategory">利用方法</font>--></a><br/></td>
		<td valign="bottom"><h3>国内航空券<br/>
		<img SRC="/img/flights_img/blk.gif" WIDTH="391" HEIGHT="1" ALT=""><br/>
		<font class="txtcategory"><font color='#000000'>路線を選択:</font>
		<%=	sub_header %>
		</font>
		</h3>
		</td>
		</tr>
		</table>
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td valign='top'><font class="txt12orgb">＜簡単＞</font>
		オンラインで購入できます。しかもチケットレス！<br/>
		<font class="txt12orgb">＜まぎわ＞</font>だからできるこの値段。3日前の19時00分まで受付ＯＫ！<br/>
		</td>
		<td valign='bottom' align='right'><font class="txtcategory">
		<a href="javascript:showHowtoBuyDflight();"><img src="/img/icon_howtouse.gif" border="0" alt="ご利用方法">ご利用方法</a>
<!--		<br/>
		<i><u>時間帯</u><br/>料金</i>
-->
		</td>
		</tr>
		</table>
		<!---->
<table WIDTH="458" BORDER="0" CELLPADDING="0" CELLSPACING="0">
		<tr>
			<td><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" alt=""></td>
			<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="43" HEIGHT="1" alt=""></td>
			<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="69" HEIGHT="1" alt=""></td>
			<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="68" HEIGHT="1" alt=""></td>
			<td><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" alt=""></td>
		</tr>
		</table>
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td COLSPAN="2" BGCOLOR="#F3F0EA"><img SRC="/img/flights_img/shim.gif" WIDTH="10" HEIGHT="10" ALT=""></td>
		<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="8" BGCOLOR="#F3F0EA"><img SRC="/img/flights_img/shim.gif" WIDTH="8" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="448" BGCOLOR="#F3F0EA">
			<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="440">
				<!-- おすすめ -->
<tr><td>
<table width=420 border="0">
<%
	Form form = (Form)request.getAttribute( "Dflight.top.Form" );
	String xmlstring = form.getXmlstring();
	jp.co.yobrain.util.DataFormat dataformat = null;
%>
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="flights" xml="${xmlstr}"></xml:parse>
<table border="0" cellspacing="0" width="100%">
<tr>
				<td CLASS="main" COLSPAN="2">
				<font class="txtcategory">
				上段：○時台とは？（例：8時台　8時00分～8時59分に出発する便が該当します）<br/>
下段：<I>料金（円）</I>を表示しています（航空保険特別料金300円を含みます）。
				<!-- ×時頃：×:30 ～　×+1:30の時間帯が、該当します。ex)8時頃 =　7:30～8:30
				--></font><br/>
				<img SRC="/img/flights_img/line462.gif" WIDTH="440" HEIGHT="1" VSPACE="6" ALT=""></td>
				</tr>

				  <td COLSPAN="2"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="8" alt=""></td>
				</tr>
<% int loop = 0;	%>
<xml:forEach select="$flights//airport" ><%	loop++;	%>
	<tr>
		<td><font class="b"><xml:out select='departure/airportname' /> 発 - <xml:out select='arrival/airportname' /> 行</font>
<%	if( loop == 1 ){
			%><%=	sub_title %><%
		}else{
			%><%=	sub_title2 %><%
		}	%>

		<c:set var="depairportname"><xml:out select='departure/airportname' /></c:set><c:set var="arrairportname"><xml:out select='arrival/airportname' /></c:set>
			<table border="0" cellspacing="0" width="446">
				<xml:forEach select='targetdates/targetdate' >
				<tr>
					<td width="70" align="right"><xml:out select='valuestr' /></td>
						<xml:forEach select='datetimes/datetime'>
							<td width="47" align="center">
							<xml:choose>
							<xml:when select='price' >
							<A HREF="/lmj/Dflight/detail.do?checkindate=<xml:out select='../../value' />&checkintime=<xml:out select='flight_time' />&flighttimecode=<xml:out select='flight_timecode' />&from=<xml:out select='departture' />&fromname=<c:out value='${depairportname}' />&to=<xml:out select='arrival' />&toname=<c:out value='${arrairportname}' />&flightclass=<xml:out select='flightclass' />&bookingclass=<xml:out select='bookingclass' />&agtcode=<xml:out select='agentCode' />&allot_number=<xml:out select='allot_number' />&maxnumber=<xml:out select='max_member' />&minnumber=<xml:out select='min_member' />&price=<xml:out select='price' />&childprice=<xml:out select='childprice' />&infantprice=<xml:out select='infantprice' />&normalprice=<xml:out select='normalprice' />&allotment=<xml:out select='allot_seq' />&checkintime=<xml:out select='deputure_time' />&arrival_time=<xml:out select='arrival_time' />&productioncode=<xml:out select='jan_cd' />&product_id=<xml:out select='allot_seq' />&agtcode=<xml:out select='agentCode' />">
							<xml:out select='comment' />
							</A>
							<br/><i><xml:out select='pricestr' /></i>
							</xml:when>
							<xml:otherwise>
							&nbsp;&nbsp;
							</xml:otherwise>
							</xml:choose>
							</td>
						</xml:forEach>
				</tr>
				</xml:forEach>
			</table>
			<br/>
		</td>
	</tr>
</xml:forEach>
</table>
	</tr>
	</td>
			</table>

		</td>
		<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" COLSPAN="4"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		</table>
<!-- /プラン -->
<!---- Comment --->
<table border="0" width="100%">
<tr><td><b>注）</b></td></tr>
<tr><td>1)</td><td>ご購入は、クレジットカードでのみ承ります。</td></tr>
<tr><td>2)</td><td>便名・出発時刻等は、クレジットカード決済の前に決定し、画面に表示致します。</td></tr>
<tr><td>3)</td><td>本サービスをご利用の場合は、航空会社のマイレージサービスの対象外です。</td></tr>
<tr><td>4)</td><td>ご購入後の便名及び搭乗者の変更はできません。<br/></td></tr>
<tr><td>5)</td><td>取消（減員も含む）には、規定の取消料を申し受けます。<br/></td></tr>
</table>
<!---- Comment --->
	</td>
<!-- 調整 -->
	<td>
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整 -->

	<td VALIGN="TOP">
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="125" HEIGHT="1" alt=""><br>
	<!-- アドframe -->
<A HREF="http://ads.lmj.valueclick.jp/redirect?host=hs0000561&size=125x600&b=indexpage&v=0" TARGET="_top"><IMG BORDER="0" WIDTH="125" HEIGHT="600" ALT="" SRC="http://ads.lmj.valueclick.jp/cycle?host=hs0000561&size=125x600&b=indexpage&noscript=1"></A>
<!-- /アドframe -->
	</td>
	</tr>
	</table>
	</center>
<!-- /レイアウト -->
<!-- コピーライトframe -->
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
<!-- /コピーライトframe -->



<!-- Omnituer Section -->
<script language="JavaScript">
<!--
/* You may give each page an identifying name, server, and channel on
the next lines. */

var s_pageName="DFLIGHT_TOP"
var s_server="www.lastminute.co.jp"
var s_channel="DFLIGHT"
var s_pageType=""
var s_prop1="DFLIGHT_TOP_<%= s_prop1 %>"
var s_code=' '

//-->
</script>

<% int port = request.getServerPort(); %>
<% if( port == 80 ){ %>
<script language="JavaScript" src="/lmj/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<% } else { %>
<script language="JavaScript" src="/lmj/s_code_ssl.js"></script>
<noscript><img src="https://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript></noscript>
<% } %>


<!-- Omnituer Section -->


</body>
</html>
