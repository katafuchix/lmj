<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld"	prefix="html" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html lang="ja">
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">

<SCRIPT language="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;
function nn4reload(){
if( _bro == 2 ){
location.reload();
}
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</SCRIPT>
<html:html locale="true">
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0"onResize="nn4reload();">

<!-- ヘッダframe -->
	<center>
	<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER" HEIGHT="45" BACKGROUND="/img/header_nn.gif">
	<tr>
	<td VALIGN="TOP">
		<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="45">
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
	<center>
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760">
	<tr>
	<td VALIGN="TOP">
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>

<!-- ナビframe -->
	<NOLAYER>
	<IFRAME SRC="/lmj/navi.jhtml?CATID=8" NAME="" WIDTH="147" HEIGHT="630" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="/lmj/navi.jhtml?CATID=8" WIDTH="147" HEIGHT="630"></ILAYER>
<!-- /ナビframe -->

	</td>

<!-- 調整 -->
	<td>
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整 -->

	<td VALIGN="TOP" align="right">
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>

<!-- チケット -->
		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td><img SRC="/img/tkt_img/header_icon_tc.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
		<td><h3>エンターテーメント・チケット<br>
		<img SRC="/img/tkt_img/blk.gif" WIDTH="531" HEIGHT="1" ALT=""><br>
		<font class="txtcategory">
		|<A HREF="">エンターテイメント</A>|
		|<A HREF="">東京湾クルース</A>|
		|<A HREF="">ヘリコプターナイトフライト</A>|
		|<A HREF="">ラストミニットチケット</A>|
</font>
		</h3></td>
		</tr>
		</table>
<!-- /チケット -->
<link rel="stylesheet" href="/basic.css" type="text/css">
<!-- お問い合わせフォーム -->

		<table WIDTH="598" BORDER="0" CELLPADDING="0" CELLSPACING="0">

		<tr>
			<td><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" alt=""></td>
			<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="43" HEIGHT="1" alt=""></td>
			<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="69" HEIGHT="1" alt=""></td>
			<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="208" HEIGHT="1" alt=""></td>
			<td><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" alt=""></td>
		</tr>
		</table>

		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		<td COLSPAN="3" BGCOLOR="#F3F0EA"><img SRC="/img/flights_img/shim.gif" WIDTH="10" HEIGHT="12" ALT=""></td>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		<td BGCOLOR="#F3F0EA" WIDTH="8"><img SRC="/img/flights_img/shim.gif" WIDTH="8" HEIGHT="1" ALT=""></td>

		<td BGCOLOR="#F3F0EA" WIDTH="578">
			<table BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="576">
			<tr>
			<td WIDTH="9"><img SRC="/img/flights_img/point_bule.gif" WIDTH="7" HEIGHT="7" ALT=""></td>
			<td CLASS="buleb" WIDTH="569"><span CLASS="b">システムが大変込合っています。</span></td>
			</tr>
			<tr BGCOLOR="#0066CC">
			<td HEIGHT="2" COLSPAN="2"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
			</tr>
			</table>


			<table WIDTH="578" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
<!-- /お問い合わせフォーム -->

			<table WIDTH="578" BORDER="0" CELLSPACING="0" CELLPADDING="2">
			<tr>
			<td width="30" VALIGN="TOP" CLASS="txt10" align="right">・</td>
			<td width="566" CLASS="txt10">システムが大変込合っています。しばらくしてからアクセスお願いします</td>
			</tr>
			</table>
			<br>
			<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="566">
			<tr>
			<td ALIGN="LEFT">
			<a HREF="javascript:history.back();"><img SRC="/img/flights_img/btt_back.gif" WIDTH="74" HEIGHT="23" alt="" border="0"></a>
			</td>
			<td ALIGN="RIGHT"> <input type="image" SRC="/img/btt_next.gif" WIDTH="74" HEIGHT="23" ALT="" BORDER="0">
			</td>
			</tr>
			</table>
			<br>
			</form>
<!-- /レイアウト -->
<br>

		</td>
		<td BGCOLOR="#F3F0EA" WIDTH="8"><img SRC="/img/flights_img/shim.gif" WIDTH="8" HEIGHT="1" ALT=""></td>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" COLSPAN="5"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		</table>

	</td>
	</tr>
	</table>
<!-- /レイアウト -->

<!-- コピーライトframe -->
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
<!-- /コピーライトframe -->

</center>
</BODY>
</html:html>

