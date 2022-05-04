<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 java.text.*,
								 jp.co.lastminute.cart.*,
								 jp.co.lastminute.cart.model.*,
								 jp.co.lastminute.cart.user.*,
								 jp.co.lastminute.cart.util.MemberFormatForWeb,
								 jp.co.lastminute.Dflight.*,
								 jp.co.lastminute.Dflight.detail.Form" %>
<%@ taglib uri="/WEB-INF/struts-html.tld"	prefix="html" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html lang="ja">
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">
<%
	String xmlstring = "";
	jp.co.yobrain.util.DataFormat dataformat = null;

	Form form = (Form)request.getAttribute( "Dflight.detail.Form" );
	if( form != null ){
		xmlstring = form.getXmlstring();
	}
	String serverUrl = "https://"+request.getServerName() + "/lmj/Dflight/cartRegistration.do;jsessionid=" + session.getId();
%>
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
var reload = 0;
function reloadCheck(){
		if( reload != 0 ){
			window.status = "サーバーに問合せ中です。しばらくお待ち下さい。";
			return false;
		}else{
			reload = 1;
			return true;
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
//出発レターコード,帰着レターコード,出発日,出発時間コード,出発時間
function showSchedule( d_lettercode, r_lettercode, d_date, d_timecode, d_deptime, agt_cd ){
	var depdate = d_date;
	var deptime = d_deptime;
	var deptimecode = d_timecode;
	var deplettercode = d_lettercode;
	arvlettercode = r_lettercode;
	var pax = document.forms[0].elements['pax'].value;
	var add_day = document.forms[0].elements['add_day'].value ;
	Schedule = "/lmj/Dflight/Calendar.do?Depdate="+ depdate +"&DepTime="+ deptime +"&DepTimeCode="+ deptimecode +"&DepLetterCode="+ deplettercode + "&ArvLetterCode="+ arvlettercode +"&Pax="+pax+"&Add_day="+ add_day + "&agt_cd=" + agt_cd;
	remoteWins = window.open("","Schedule",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=450,alwaysRaised=1');
		   	if (remoteWins != null) {
		    	remoteWins.location = Schedule;
		  	}
		  	remoteWins.focus();
		}
function notChange( target, number  ){
			if( document.forms[0].elements[ target ][ number ].value.length != 0 ){
				document.forms[0].elements[ target ][ number ].blur();
				alert('値の変更はできません。');
			}
		}
//入力値のエラー処理
//ダブルクリックの制御を、入力値の制御を行う
function checkForm(){
			if( document.forms[0].elements['infant'].value > document.forms[0].elements['pax'].value ){
				alert('幼児人数は、大人より少なくお願いします。');
				return false;
			}
			document.forms[0].elements['adult'].value = document.forms[0].elements['pax'].value;
			if( reloadCheck() == true ){
				return true;
			}
			return false;
			}
//-->
</SCRIPT>
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="flights" xml="${xmlstr}"></xml:parse>
<c:set var="flight_no"><xml:out select="$flights//flight_no" /></c:set>
<c:set var="max_member"><xml:out select="$flights//max_member" /></c:set><c:set var="min_member"><xml:out select="$flights//min_member" /></c:set>
<c:set var="agt_cd"><xml:out select="$flights//agt_cd" /></c:set><c:set var="flight_no"><xml:out select="$flights//flight_no" /></c:set>
<c:set var="cabin_class"><xml:out select="$flights//cabin_class" /></c:set>
<c:set var="booking_class"><xml:out select="$flights//booking_class" /></c:set>
<%
	String flightno = (String)pageContext.getAttribute("flight_no");
	String max_member = (String)pageContext.getAttribute("max_member");
	String min_member = (String)pageContext.getAttribute("min_member");
	String agt_cd = (String)pageContext.getAttribute("agt_cd");
	String cabin_class = (String)pageContext.getAttribute("cabin_class");
	String booking_class = (String)pageContext.getAttribute("booking_class");
	String agentproductcode = agt_cd + "-" + flightno + "-" + booking_class + "-" + cabin_class;

	///////////////////////////////////////////////
	String add_day = request.getParameter("add_day");
	String flighttimecode = form.getFlighttimecode();
	String checkindate = form.getCheckindate();
	String checkintime = form.getCheckintime();
	String pax = request.getParameter("pax");
	String infant = request.getParameter("infant");
	/////////////////////////////////////////////////
	//セッションの把握
	int order_no = 0;
	if( session.getAttribute( Constants.CartOrder ) != null ){
		order_no = ((Order)session.getAttribute( Constants.CartOrder )).getORDER_NO();
	}
	int user_id = 0;
	if( session.getAttribute( Constants.CartUser ) != null ){
		user_id = ((User)session.getAttribute( Constants.CartUser )).getUser().getUSER_ID();;
	}
%>
<html:html locale="true">
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0"onResize="nn4reload();">

<!-- ヘッダframe -->
	<center>
	<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER" HEIGHT="65" BACKGROUND="/img/head_e.jpg">
	<tr>
	<td VALIGN="TOP">
		<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="65">
		<tr>
					<td VALIGN="BOTTOM" BACKGROUND="" nowrap ROWSPAN="2"><a HREF="http://www.lastminute.co.jp/lmj/index.jsp"><img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="3" BORDER="0"></a></td>
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
						<td VALIGN="BOTTOM"><a HREF="http://www.de.lastminute.com/"><img SRC="/img/f5.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="deutschland"></a></td>								<td VALIGN="BOTTOM"><a HREF="http://www.fr1.lastminute.com/"><img SRC="/img/f6.gif" WIDTH="18" HEIGHT="11" BORDER="0" ALT="lafrance"></a></td>
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

	<td VALIGN="TOP" align="right">
	<IMG SRC="/img/flights_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>

<!-- エアーチケット -->
		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td BACKGROUND="/img/flights_img/header_icon_at.gif" WIDTH="67" HEIGHT="65" valign="bottom">
		</td>
		<td WIDTH="531" valign="bottom"><h3>国内航空券</br>
		<img SRC="/img/flights_img/blk.gif" WIDTH="531" HEIGHT="1" ALT=""><br>
		<table cellspacing=0 cellpadding=0 align='right' width='530'>
	<tr bordercolor='#000000'>
		<td width='70' height='16' align='left' bgcolor='#FFFFFF' class='txtcategory'>
		</td>
		<td width='80' height='16' align='center' bgcolor='#996699' class='txt10'><font color='#FFFFFF'>商品を選択</font></td>
		<td><img src='/img/step_kokunai_top.gif' height='16'/></td>
		<td width='80' height='16' align='center' bgcolor='#FFCCFF' class='txt10'>ログイン</td>
		<td><img src='/img/step_kokunai_top.gif' height='16'/></td>
		<td width='80' height='16' align='center' bgcolor='#FFCCFF' class='txt10'>詳細入力</td>
		<td><img src='/img/step_kokunai_top.gif' height='16'/></td>
		<td width='80' height='16' align='center' bgcolor='#FFCCFF' class='txt10'>カード会計</td>
		<td><img src='/img/step_kokunai_top.gif' height='16'/></td>
		<td width='80' height='16' align='center' bgcolor='#FFCCFF' class='txt10'>確定</td>
	</tr>
</table></h3></td>
		</tr>
		</table>
		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr><td align='right'>
		<a href="javascript:showHowtoBuyDflight();"><img src="/img/icon_howtouse.gif" border="0" alt="ご利用方法">ご利用方法</a>
				</td></tr>
		</table>
<!-- /エアーチケット -->
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

		<td BGCOLOR="#F3F0EA" WIDTH="580">
			<form action="<%= serverUrl %>" method="get" onsubmit="return checkForm();">

			<%
				String strToday= dataformat.getNowDate(3,false);
				String depdate = strToday;
				pageContext.setAttribute("depdate", strToday);

			%>

			<%= depdate  %><xml:out select="$flights//date_target" />

			<xml:if select="$flights//date_target[(.='<%= strToday  %>')]">
				last_sales_times:<xml:out select="$flights//last_sales_times" /><br/>
			</xml:if>

			<table BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="580">
			<tr>
			<td WIDTH="9"><img SRC="/img/flights_img/point_bule.gif" WIDTH="7" HEIGHT="7" ALT=""></td>
			<td CLASS="buleb" WIDTH="568"><span CLASS="b">お申込み人数・便の選択</span></td>
			</tr>
			<tr BGCOLOR="#0066CC">
			<td HEIGHT="2" COLSPAN="2"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
			</tr>
			</table>

			<table WIDTH="580" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
			<tr>
			<td>

				<table BORDER=0 CELLSPACING=1 CELLPADDING=2 WIDTH="100%">
				<tr>
					<td BGCOLOR="#EEEEEE" align='center'><span CLASS="b">人数</span></td>
					<td BGCOLOR="#FFFFFF" >
					<%= MemberFormatForWeb.getSelectBox("pax", max_member, min_member, pax) %>
					人 / お子様
					<%= MemberFormatForWeb.getSelectBox("infant", max_member, "0", infant) %>
					(座席をご利用にならない3才未満のお子様)<span CLASS="red">※（注）</span>
					</td>
				</tr>
				<tr>
				<td BGCOLOR="#FFFFFF" align='center' NOWRAP>
				<span CLASS="b"><img src='/img/sm_plane_white.gif' width='23' height='23' alt='往路（行き）'/></span></td>
				<td BGCOLOR="#FFFFFF">

					<table BORDER=0 CELLSPACING=0 CELLPADDING=0>
					<tr>
					<td align="left"> 　出発日</td>
					<td align="left"> 出発地</td>
					<td align="left"> 到着地</td>
					<td align="left"> 出発時間</td>
					</tr>
					<tr>
					<td><input type="text" size="16" name="viewDepdate" value='<%= dataformat.FromStrToTime( form.getCheckindate() ) %>' onfocus="notChange('viewDepdate', '0');" disabled="disabled" class="textbox_white" /></td>
					<td><input type="text" size="10" name="viewDepCityName" value='<xml:out select="$flights//departturecity" />' onfocus="notChange('viewDepCityName', '0');" disabled="disabled" class="textbox_white" /></td>
					<td VALIGN="TOP"><input type="text" name="viewArvCityName" size="10" value='<xml:out select="$flights//arrivalcity" />' onfocus="notChange('viewArvCityName', '0');" disabled="disabled" class="textbox_white" /></td>
					<td VALIGN="TOP"><input type="text" name="depTimeChar" size="10" value='<xml:out select="$flights//target_hour_com" />' onfocus="notChange('depTimeChar', '0');" disabled="disabled" class="textbox_white" /></td>
					</tr>
					</table>

				</td>
				</tr>
				<tr>
				<td BGCOLOR="#FFFFFF" align='center' >
				<span  CLASS="b"><img src='/img/sm_plane_white_in.gif' width='23' height='23' alt='復路（帰り）'/></span></td>
				<td BGCOLOR="#FFFFFF">

					<table BORDER=0 CELLSPACING=0 CELLPADDING=0>
					<tr>
					<td>
					<input type="text" size="16" name="viewDepdate" value='' onfocus="notChange('viewDepdate', '1');" disabled="disabled" class="textbox_white" /></td>
					<td>
					<input type="text" size="10" name="viewDepCityName" value='' onfocus="notChange('viewDepCityName', '1');" disabled="disabled" class="textbox_white" />					</td>
					<td VALIGN="TOP">
					<input type="text" name="viewArvCityName" size="10" value='' onfocus="notChange('viewArvCityName', '1');" disabled="disabled" class="textbox_white" />					</td>
					<td VALIGN="TOP">
					<input type="text" name="depTimeChar" size="10" value='' onfocus="notChange('depTimeChar', '1');" disabled="disabled" class="textbox_white" />
</td>
<td><a href="JavaScript:showSchedule('<xml:out select="$flights//arrival" />','<xml:out select="$flights//departture" />','<%= checkindate %>', '<%= flighttimecode %>', '<%= checkintime %>', '<%= agt_cd %>' );">
<IMG src="/img/ouro.gif" border=0 WIDTH="87" HEIGHT="23" alt='帰りを選ぶ' /></a>&nbsp;
</td>
					</tr>
					<input type="hidden" name="add_day" value="0" />
					</table>

				</td>
				</tr>
				</table>
				<input type="hidden" name='adult' value=''>
				<input type="hidden" name='userId' value='<%= user_id %>'>
				<input type="hidden" name='connectionStyle'  value='0'>
				<input type="hidden" name='productTypeCode'  value='8'>
				<input type="hidden" name='guaranteeFlag'  value='1'>
				<input type="hidden" name='orderNumber'  value='<%= order_no %>'>
				<input type="hidden" name='throwtypeFlag'  value=''>
				<input type="hidden" name='subOrderNumber' value='0'>
				<input type="hidden" name='flightNo' value='<%= flightno %>'>
				<input type="hidden" name='agentproductcode' value='<%= flightno %>'>
				<input type="hidden" name='flightName' value='<xml:out select="$flights//product_name" />'>
				<input type="hidden" name='agtcode' value='<%= agt_cd %>'>
				<input type="hidden" name='title' value='<xml:out select="$flights//product_name" />'>
				<input type="hidden" name='productioncode' value='<xml:out select="$flights//jan_cd" />'>
				<input type="hidden" name='product_id' value='<xml:out select="$flights//allot_seq" />'>
				<input type="hidden" name='from' value='<xml:out select="$flights//departture" />'>
				<input type="hidden" name='fromName' value='<xml:out select="$flights//departturecity" />'>
				<input type="hidden" name='to' value='<xml:out select="$flights//arrival" />'>
				<input type="hidden" name='toName' value='<xml:out select="$flights//arrivalcity" />'>
				<input type="hidden" name='depdate' value='<xml:out select="$flights//date_target" />'>
				<input type="hidden" name='depTime' value='<xml:out select="$flights//target_hour" />'>
				<input type="hidden" name='depTimeCode' value='<%= flighttimecode %>'>
				<input type="hidden" name='price' value='<xml:out select="$flights//price_base" />'>
				<input type="hidden" name='arvTime' value='<xml:out select="$flights//arrival_time" />'>
				<input type="hidden" name='lastsale' value='<xml:out select="$flights//lastsale" />'>
				<input type="hidden" name='endsale' value='<xml:out select="$flights//endsale" />'>
				<input type="hidden" name='salesdate' value='<xml:out select="$flights//date_target" />'>
				<input type="hidden" name='etc' value=''>
				<input type="hidden" name='eta' value=''>
				<input type="hidden" name='tax' value=''>
				<input type="hidden" name='sending' value=''>
				<input type="hidden" name='sending_tax' value=''>
				<!---- Return ---->
				<input type="hidden" name='subOrderNumber' value='0'>
				<input type="hidden" name='flightNo' value=''>
				<input type="hidden" name='agentproductcode' value=''>
				<input type="hidden" name='flightName' value=''>
				<input type="hidden" name='agtcode' value=''>
				<input type="hidden" name='title' value=''>
				<input type="hidden" name='productioncode' value=''>
				<input type="hidden" name='product_id' value=''>
				<input type="hidden" name='from' value=''>
				<input type="hidden" name='fromName' value=''>
				<input type="hidden" name='to' value=''>
				<input type="hidden" name='toName' value=''>
				<input type="hidden" name='depdate' value=''>
				<input type="hidden" name='depTime' value=''>
				<input type="hidden" name='depTimeCode' value=''>
				<input type="hidden" name='price' value=''>
				<input type="hidden" name='arvTime' value''>
				<input type="hidden" name='lastsale' value=''>
				<input type="hidden" name='endsale' value=''>
				<input type="hidden" name='salesdate' value=''>
				<input type="hidden" name='etc' value=''>
				<input type="hidden" name='eta' value=''>
				<input type="hidden" name='tax' value=''>
				<input type="hidden" name='sending' value=''>
				<input type="hidden" name='sending_tax' value=''>
			</td>
			</tr>
			</table>
<!-- /お問い合わせフォーム -->

			<table WIDTH="580" BORDER="0" CELLSPACING="0" CELLPADDING="2">
			<tr>
			<td width="30" VALIGN="TOP" CLASS="txt10" align="right"><font color="red">（注）</font></td>
			<td width="550" CLASS="txt10"><font color="red">3才以上は、年令を問わず同一料金となり、座席の確保が必要となります。</font><br/>
			座席を使用しない3才未満のお子様は、大人1人につき1人のみ無償にてご利用可能です。<br/>
			なお、12才未満のお子様のみでのご利用はできません。</td>
			</tr>
			</table>
			<br>
			<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="580">
			<tr>
			<td ALIGN="LEFT">
			<a HREF="javascript:history.back();"><img SRC="/img/btt_modoru.gif" WIDTH="70" HEIGHT="23" alt="" border="0"></a>
			</td>
			<td ALIGN="RIGHT"> <input type="image" SRC="/img/btt_next.gif" WIDTH="70" HEIGHT="23" ALT="" BORDER="0">
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
<%	if( form.getAgtcode().equals("SKY") ){	%>


<table border="0" width="100%">
<tr>
<td>
<br/><b>＜取消料について＞<b/>
<table border="0" width="560" cellspacing="0" cellpadding="0">
<tr>
<td>　</td>
<td valign="top" width='60'><b>取消料：</b></td>
<td>
	<table border="0" width="100%">
		<tr>
			<td valign="top">購入日から搭乗予定便出発時刻まで</td><td align="left">お一人様1区間あたり\6,420（税込）</td></tr>
<tr>
			<td valign="top">搭乗予定便の出発時刻以降</td><td align="left">全額</td>
		</tr>
	</table>
	<br/>
</td>
</tr>
<!--<tr>
<td>　</td>
<td valign="top" colspan='2'><b>搭乗者・搭乗者数・便名のご変更：</b></td>
</tr>
<tr>
<td>　</td>
<td valign="top" colspan='2'>
ご案内する取消受付ページより取消の上、改めてご購入手続きをお願いいたします。<br/>
この場合は、上記取消料を申し受けます。<br/>
なお、搭乗予定便の出発時刻以降の取消の受付は出来ません。<br/>
</td>
</tr>-->
<tr>
<td>　</td>
<td valign="top" colspan='2'>ご利用前には必ず<a href="javascript:showHowtoBuyDflight();">「ご利用方法」</a>をお読み下さい。<br/><br/>
</td>
</tr>
</table>
</td>
</tr>
</table>
<%	}	%>
	</td>
	</tr>
	</table>
<!-- /レイアウト -->

<!-- コピーライトframe -->
	<center>
<img SRC="/img/blk.gif" WIDTH="760" HEIGHT="1" VSPACE="5" ALT="">
    <table border="0" width="760" cellpadding="1" cellspacing="1">
	<tr>
	<td align="center">
	<span CLASS="txt12">
	Copyright (C) 2002 lastminute.com Japan Ltd. All Rights Reserved.<BR>
	</span>
	</td>
	</tr>
	</table>
	</center>
<!-- /コピーライトframe -->

</center>
</BODY>

<!-- Omnituer Section -->

<% 	

String dep = request.getParameter("from");
String arr = request.getParameter("to");
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

var s_pageName="DFLIGHT_DEP"
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



</html:html>

