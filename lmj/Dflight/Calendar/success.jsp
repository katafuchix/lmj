<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/x-rt.tld" prefix="xml_rt" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/fmt-rt.tld" prefix="fmt_rt" %>
<%@ page language="java" %><%@ page import="java.io.*" %><%@ page import="java.util.*" %><%@ page import="jp.co.lastminute.Dflight.Calendar.Form" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html>
<title>lastminute.com - The first place to look at the last minute</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">
<%
	Form form = (Form)request.getAttribute( "Dflight.Calendar.Form" );
	if( form == null){
		return;
	}
	String xmlstring = form.getXmlstring();
	jp.co.yobrain.util.DataFormat dataformat = null;
	String Depdate = request.getParameter("Depdate");
	int count = 3;
	String arraText = "";
	for(int i=0;i<count; i++){
		arraText += "'" + dataformat.AddToDate( Depdate , i ) + "'";
		if( i != count-1){	arraText += ",";	}
	}
%>
<c:set var="xmlstr" ><%= xmlstring %></c:set>
<xml:parse var="flights" xml="${xmlstr}"></xml:parse>

<script LANGUAGE="javascript">
<!--
var combocount = <%= count - 1 %>;
//日付の引き算をする
function conpareDate( tdepdate ){
	var depdatesArray = new Array;
	depdatesArray = [<%= arraText %>];
	for(var i=0; i<depdatesArray.length; i++){
		if( depdatesArray[i] == tdepdate ){
			return i;
		}
	}
	return combocount;
}
//便名,価格,出発地レターコード,出発地名, 目的地レターコード, 目的地名,出発日,出発時間コード
function putParentvalue( flightno, price, d_lettercode, d_cityname, a_lettercode, a_cityname, d_date, d_timecode, d_dime, agt, depchar, arvTime, seqNumber, lastsale, endsale, flight_name){
	var t_seq_num = new String( seqNumber );
	var price = new String( price );
	var t_flightno = new String( flightno );
	var t_d_lettercode = new String( d_lettercode );
	var t_d_cityname = new String( d_cityname );
	var t_a_lettercode = new String( a_lettercode );
	var t_a_cityname = new String( a_cityname );
	var t_d_date = new String( d_date );
	var t_date = new String( d_date );
	var t_d_timecode = new String( d_timecode );
	var t_d_dime = new String( d_dime );
	var t_arvTime = new String( arvTime );
	var Agt = new String( agt );
	var t_depchar = new String( depchar );
	var lday = t_date.substr(0, 4) + '/' + t_date.substr(4, 2) + '/' + t_date.substr(6, 2);
	var t_lastsale = new String( lastsale );
	var t_endsale = new String( endsale );
	var t_flight_name = new String( flight_name );
	opener.document.forms[0].elements['flightNo'][1].value = t_flightno;
	opener.document.forms[0].elements['agentproductcode'][1].value = t_flightno;
	opener.document.forms[0].elements['flightName'][1].value = t_flight_name;
	opener.document.forms[0].elements['agtcode'][1].value = Agt;
	opener.document.forms[0].elements['title'][1].value = t_flight_name;
	opener.document.forms[0].elements['productioncode'][1].value = t_flightno;
	opener.document.forms[0].elements['product_id'][1].value = t_seq_num;
	opener.document.forms[0].elements['from'][1].value = t_d_lettercode;
	opener.document.forms[0].elements['fromName'][1].value = t_d_cityname;
	opener.document.forms[0].elements['to'][1].value = t_a_lettercode;
	opener.document.forms[0].elements['toName'][1].value = t_a_cityname;
	opener.document.forms[0].elements['depdate'][1].value = t_d_date;
	opener.document.forms[0].elements['depTime'][1].value = t_d_dime;
	opener.document.forms[0].elements['depTimeCode'][1].value = t_d_timecode;
	opener.document.forms[0].elements['price'][1].value = price;
	opener.document.forms[0].elements['viewDepdate'][1].value = lday;
	opener.document.forms[0].elements['viewDepCityName'][1].value = d_cityname;
	opener.document.forms[0].elements['viewArvCityName'][1].value = a_cityname;
	opener.document.forms[0].elements['depTimeChar'][1].value = t_depchar;
	opener.document.forms[0].elements['arvTime'][1].value = t_arvTime;
	opener.document.forms[0].elements['lastsale'][1].value = t_lastsale;
	opener.document.forms[0].elements['endsale'][1].value = t_endsale;
	opener.document.forms[0].elements['salesdate'][1].value = "";
	//alert("入力しました");
  window.close();
	}
//-->
</script>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0" onResize="nn4reload();">
<!-- レイアウト -->
	<center>
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="550">
	<tr>
	<td VALIGN="TOP" ALIGN="center">
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="458" HEIGHT="1" alt=""><br>
<!--  -->
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td><img SRC="/img/flights_img/header_icon_at.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
		<td valign="bottom"><h3>国内航空券</br>
		<img SRC="/img/flights_img/blk.gif" WIDTH="391" HEIGHT="1" ALT=""><br></h3></td>
		</tr>
		</table>
		<!--  -->
		<!-- アクティブ -->
		<table WIDTH="458" BORDER="0" CELLPADDING="0" CELLSPACING="0">

		<tr>
			<td><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" alt=""></td>
			<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="43" HEIGHT="1" alt=""></td>
			<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="69" HEIGHT="1" alt=""></td>
			<td BGCOLOR="#666666"><img SRC="/img/flights_img/shim.gif" WIDTH="68" HEIGHT="1" alt=""></td>
			<td><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" alt=""></td>
		</tr>
		</table>

		<!-- /アクティブ -->

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
				<tr>
				  <td CLASS="main" COLSPAN="2"><img SRC="/img/flights_img/line462.gif" WIDTH="440" HEIGHT="1" VSPACE="6" ALT=""></td>
				</tr>
				<!-- おすすめ -->
<tr><td>
<table border="0" cellspacing="0" WIDTH="100%">
<xml:forEach select="$flights//airport" >
	<tr>
		<td><font class="b"><xml:out select='departure/airportname' /> 発 - <xml:out select='arrival/airportname' /> 行</font>
		<c:set var="depairportname"><xml:out select='departure/airportname' /></c:set>
		<c:set var="arrairportname"><xml:out select='arrival/airportname' /></c:set>
			<table border="0" cellspacing="0" width="100%">
				<xml:forEach select='targetdates/targetdate' >
				<tr>
					<td width="70"><xml:out select='valuestr' /></td>
						<xml:forEach select='datetimes/datetime'>
							<td width="47">
							<xml:choose>
							<xml:when select='price' >
							<A HREF="javascript:putParentvalue( '<xml:out select='flightno' />', '<xml:out select='price' />', '<xml:out select='departture' />', '<xml:out select='../../../../departure/airportname' />',  '<xml:out select='arrival' />', '<xml:out select='../../../../arrival/airportname' />', '<xml:out select='../../value' />', '<xml:out select='flight_timecode' />', '<xml:out select='flight_time' />', '<xml:out select='agentCode' />', '<xml:out select='comment' />', '<xml:out select='arrival_time' />', '<xml:out select='allot_seq' />', '<xml:out select='lastsale' />', '<xml:out select='endsale' />', '<xml:out select='flight_name' />' );">
							<xml:out select='comment' />
							</a>
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
		</td>
	</tr>
</xml:forEach>
</table>
</tr></td>
				<tr>
				<td CLASS="main" COLSPAN="2"><img SRC="/img/flights_img/line462.gif" WIDTH="440" HEIGHT="1" VSPACE="6" ALT=""></td>
				</tr>

				  <td COLSPAN="2"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="8" alt=""></td>
				</tr>
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

	</tr>
	</table>
	<a href="javascript:window.close();"><img src="/img/profile_img/close_button.gif" width="58" height="18" border="0"></a></div>
	</center>
</body>


<!-- Omnituer Section -->
<%
String dep = request.getParameter("DepLetterCode");
String arr = request.getParameter("ArvLetterCode");
String s_prop1 = "";

if( dep.indexOf("FUK") >=0) {
	s_prop1 = "FUK";
}
if( arr.indexOf("FUK") >=0) {
	s_prop1 = "FUK";
}

if( dep.indexOf("KOJ") >=0) {
	s_prop1 = "KOJ";
}
if( arr.indexOf("KOJ") >=0) {
	s_prop1 = "KOJ";
}

if( dep.indexOf("AOJ") >=0) {
	s_prop1 = "AOJ";
}
if( arr.indexOf("AOJ") >=0) {
	s_prop1 = "AOJ";
}

if( dep.indexOf("TKS") >=0) {
	s_prop1 = "TKS";
}
if( arr.indexOf("TKS") >=0) {
	s_prop1 = "TKS";
}
%>

<script language="JavaScript">
<!--
/* You may give each page an identifying name, server, and channel on
the next lines. */

var s_pageName="DFLIGHT_ARR"
var s_server="www.lastminute.co.jp"
var s_channel="lmjDesign"
var s_pageType="DETAIL"
var s_prop1="<%= s_prop1 %>"
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





</html>
