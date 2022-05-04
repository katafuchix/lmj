<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.Amusement.top.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%
	Form form = null;
	if( request.getAttribute( "Amusement.top.Form" ) == null ){
		form = new Form();
	}else{
		form = (Form)request.getAttribute( "Amusement.top.Form" );
	}
	String xmlstring = form.getXmlstring();
	String detailxml = form.getDetailxml();
	System.err.println( "detailxml;\n" + xmlstring );
	String[] amuseWeeks = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
	int weekcounter = 0;
%>
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
function showHowtoBuyAmuse(){
		remoteWins = window.open("","HowtoByeDflight",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=500,alwaysRaised=1');
		if (remoteWins != null) {
		  remoteWins.location = "/help/Amusement.html";
		}
		remoteWins.focus();
	}
//-->
</script>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0" onResize="nn4reload();">
<c:set var="detailxmlstr" ><%= detailxml %></c:set><xml:parse var="pageamount" xml="${detailxmlstr}"></xml:parse>
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
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td BACKGROUND="/img/tkt_img/header_icon_tc.gif" WIDTH="67" HEIGHT="65" valign="bottom" align='left'>
		<!--<font class="txtcategory">利用方法</font>--></a><br/></td>
		<td valign="bottom"><h3>アミューズメント<br/>
		<img SRC="/img/flights_img/blk.gif" WIDTH="391" HEIGHT="1" ALT=""><br/>
		<font class="txtcategory"><font color='#000000'></font>
		</font>
		</h3>
		</td>
		</tr>
		</table>
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td valign='top' width='380'><font class="txt12b"><xml:out select='$pageamount//product_sub_title'/></font>
		<br/>
		<font class="txt12orgb"><xml:out select='$pageamount//product_name'/></font><br/>
		<xml:out select='$pageamount//catchcopy'/><br/>
		</td>
		<td valign='bottom' align='right' width='78'><font class="txtcategory">
		<a href="javascript:showHowtoBuyAmuse();"><img src="/img/icon_howtouse.gif" border="0" alt="ご利用方法">ご利用方法</a>
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
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="amusement" xml="${xmlstr}"></xml:parse>
<tr><td>
<table width=420 border="0">
<table border="0" cellspacing="0" width="100%">
	<tr>
		<td CLASS="main" COLSPAN="2">
		<font class="txtcategory">下記の日程でのご予約ができます。</font></td>
	</tr>
	<tr>
		<td COLSPAN="2">
<table border='0' cellspacing='0' width='434'>
<tr><td bgcolor='#999999' align='center'>
<table border='0' cellspacing='1' width='433'>
	<tr>
	<% 
		for(int i=0; i<7; i++){	%>
<%	if( i == 0 ){	%><td width='62' align='center' bgcolor='#FFFFCC'>
<%	}else if( i == 6 ){	%><td width='62' align='center' bgcolor='#FFFFCC'>
<%	}else{	%><td width='62' align='center' bgcolor='#FFCCCC'><% }	%><%= amuseWeeks[i] %></td>
	<%	}	%>
	</tr>
<xml:forEach select="$amusement//weekly" >
	<tr>
		<xml:forEach select='dayamuse'>
		<%	if( weekcounter%7 == 0 )	{	%>
		<td width='62' align='center' bgcolor='#FFFFCC'>
		<%	}else if( weekcounter%7 == 6 )	{	%>
		<td width='62' align='center' bgcolor='#FFFFCC'>
		<%	}else{	%><td width='62' align='center' bgcolor='#FFFFFF'><%	}	%>
		&nbsp;<b><xml:out select='amuse/allotdateStr' /></b><br/>
		<span CLASS="txt10">
		<xml:forEach select="amuse" >
		<a href="./detail.do?product_id=<xml:out select='product_seq' />&from=<xml:out select='allotdate' />&allottime=<xml:out select='allottime' />&agt_prod_cd=<%= form.getAgt_prod_cd() %>"><xml:out select='timename' /></a><br/>
		</xml:forEach>
		</span>
		</td>
		<%	weekcounter++;	%>
		</xml:forEach>
	</tr>
</xml:forEach>
</table>
</td></tr></table>
<pre><xml:out select='$pageamount//attention'/></pre></td>
	</tr>
	<tr>
		<td COLSPAN="2"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="8" alt="">
		</td>
	</tr>
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

<!-- Omnituer Section -->


</body>
</html>
