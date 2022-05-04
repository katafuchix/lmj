<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
				 java.util.*,
				 jp.co.yobrain.util.*,
				 jp.co.lastminute.*,
				 jp.co.lastminute.cart.Constants,
				 jp.co.lastminute.cart.model.Order,
				 jp.co.yobrain.util.ParseFormat,
				 jp.co.lastminute.Entertainment.detail.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%
	int type_cd = 99; //Property.product_type_cd;
	String serverUrl = "https://"+request.getServerName() + "/lmj/Entertainment/cartRegistration.do;jsessionid=" + session.getId();
	//
	Form form = (Form)request.getAttribute( "Entertainment.detail.Form" );
	String xmlstring = form.getXmlstring();
	String allotmentxml = form.getAllotmentxml();

	//System.err.println( xmlstring );

	int user_id = 0;
	int order_no = 0;
	if( session.getAttribute( Constants.CartOrder ) != null ){
		Order order = (Order)session.getAttribute( Constants.CartOrder );
		user_id	 = order.getUSER_ID();
		order_no = order.getORDER_NO();
	}
	int counter = 0;
	String mapinfo = "";
%>
<html>
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<meta name="keywords" content="">
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">
<SCRIPT language="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;

function nn4reload(){if( _bro == 2 ){location.reload();}}

function showHowtoBuyTicket(){
		remoteWins = window.open("","HowtoByeTicket",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=500,alwaysRaised=1');
		if (remoteWins != null) {
		  remoteWins.location = "/help/tickets.html";
		}
		remoteWins.focus();
	}
function checkForm(){
	//選択されているかの判断
	if( document.forms[0].elements['product_id'].value.length == 0 ){
			alert('チケットをお選びください');
			return false;
	}
	//数量のカウントを行う
	if( document.forms[0].elements['viewprices'].value.length == 0 ){
		alert('数量又はチケットをお選びください');
		return false;
	}
	if( document.forms[0].elements['viewprices'].value.length == 0 ){
		alert('数量又はチケットをお選びください');
		return false;
	}
	if( document.forms[0].elements['pax'].selectedIndex == 0){
		alert('数量をお選びください');
		return false;
	}
	if( reloadCheck() ){
		return true;
	}
	return false;
}
var reload = 0;
function reloadCheck(){
		if( reload != 0 ){	window.status = "サーバーに問合せ中です。しばらくお待ち下さい。";
			return false;
		}else{	reload = 1; return true;	}
}
//product_id,salesdate,times,price,tax,sending,sending_tax,calc,min,max,agt_cd,sku_name,lastsale,endsale
function setOrder( product_id,salesdate,times,price,tax,sending,sending_tax,calc,min,max,agt_cd,sku_name,lastsale,endsale,postion ){
	document.forms[0].elements['viewprices'].value = "";
	document.forms[0].elements['sku_name'].value = sku_name;
	document.forms[0].elements['agtcode'].value = agt_cd;
	document.forms[0].elements['product_id'].value = product_id;
	document.forms[0].elements['salesdate'].value = salesdate;
	document.forms[0].elements['times'].value = times;
	document.forms[0].elements['lastsale'].value = lastsale;
	document.forms[0].elements['endsale'].value = endsale;
	document.forms[0].elements['price'].value = price;
	document.forms[0].elements['tax'].value = tax;
	document.forms[0].elements['sending'].value = sending;
	if( sending != 0 ){
		document.forms[0].elements['viewsendingStr'].value = '(送料:' + sending + ')';
	}
	document.forms[0].elements['sending_tax'].value = sending_tax;
	document.forms[0].elements['sending_calc_unit'].value = calc;
	makeCombo( min, max );
	setViewprice( price, tax );
	document.forms[0].elements['PostionSelect'].selectedIndex = postion;
	document.forms[0].elements['pax'].disabled="";
}
function ClearForm(){
	document.forms[0].elements['viewprices'].value = "";
	document.forms[0].elements['sku_name'].value = "";
	document.forms[0].elements['agtcode'].value = "";
	document.forms[0].elements['product_id'].value = "";
	document.forms[0].elements['salesdate'].value = "";
	document.forms[0].elements['times'].value = "";
	document.forms[0].elements['lastsale'].value = "";
	document.forms[0].elements['endsale'].value = "";
	document.forms[0].elements['price'].value = "";
	document.forms[0].elements['tax'].value = "";
	document.forms[0].elements['sending'].value = "";
	document.forms[0].elements['sending_tax'].value = "";
	document.forms[0].elements['sending_calc_unit'].value = "";
}
function makeCombo( min, max ){
	var combolength = new Number( max  -min  );
	document.forms['0'].elements["pax"].options.length=0;
	document.forms['0'].elements['pax'].options[0] = new Option( '--' );
	document.forms['0'].elements['pax'].options[0].value = "";
	for(var k = 0; k<=combolength; k++){
		num = min++;
		document.forms['0'].elements['pax'].options[k+1] = new Option( num );
		document.forms['0'].elements['pax'].options[k+1].value = eval( num );
	}
}

function setViewprice( price, tax ){
	var p01= new Number( price );
	var p02= new Number( tax );
	//var p03= new Number( sending );
	//var p04= new Number( sending_tax );
	var p00= new Number( p01 + p02 );
	var numprice = new String( p00 );
	document.forms['0'].elements['viewprice'].value= numprice.substring(0, numprice.length-3)
																								 + "," + numprice.substring((numprice.length-3), numprice.length);
}

function calcSending( sending, sending_tax, pax){
	var unit = new Number( document.forms['0'].elements['sending_calc_unit'].value );
	var sending_price = ((((unit*pax)-((unit*pax)%100))/100)+1)*(sending+sending_tax);
	var viewsending_price = new String( sending_price );
	document.forms['0'].elements['viewsending'].value= viewsending_price.substring(0, viewsending_price.length-3)
																								 + "," + viewsending_price.substring((viewsending_price.length-3), viewsending_price.length);
	return sending_price;

}
function calcOrder( ){
	var pax = new Number( document.forms['0'].elements['pax'].value );
	var price = new Number( document.forms['0'].elements['price'].value );
	var tax = new Number( document.forms['0'].elements['tax'].value );
	var sending = new Number( document.forms['0'].elements['sending'].value );
	var sending_tax = new Number( document.forms['0'].elements['sending_tax'].value );
	var sending_price = new Number( calcSending( sending, sending_tax, pax ) );
	//var viewprice = new String( pax*( price + tax ) + sending_price );
	var viewprice = new String( pax*( price + tax ) );
	document.forms['0'].elements['viewprices'].value= viewprice.substring(0, viewprice.length-3)
																								 + "," + viewprice.substring((viewprice.length-3), viewprice.length);
}
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
			<td VALIGN="BOTTOM" BACKGROUND="" nowrap ROWSPAN="2">
			<a HREF="http://www.lastminute.co.jp/"><img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="3" BORDER="0"></a></td>
			<td ALIGN="RIGHT" VALIGN="TOP" BACKGROUND="" nowrap></td>
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
          <td VALIGN="BOTTOM"><a href="http://www.lastminute.com/lmn/pso/catalog/Category.jhtml?CATID=95062">
          <img src="/img/f9.gif" width="17" height="11" border="0" alt="belgium"></a></td>
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
	<IMG SRC="/img/tkt_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><BR>
<!-- ナビframe -->
	<NOLAYER>
	<IFRAME SRC="/lmj/navi.jhtml" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	    <ILAYER SRC="/lmj/navi.jhtml" WIDTH="147" HEIGHT="680"></ILAYER>
<!-- /ナビframe -->
	</td>
<!-- 調整 -->
	<td>
	<IMG SRC="/img/tkt_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整 -->
	<td VALIGN="TOP" align="right">
	<IMG SRC="/img/tkt_img/shim.gif" WIDTH="598" HEIGHT="1" alt=""><br>

<!-- チケット -->
		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td><img SRC="/img/tkt_img/header_icon_tc.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
		<td class="txt16b">エンターテーメント<br>
		<img SRC="/img/tkt_img/blk.gif" WIDTH="531" HEIGHT="1" ALT=""><br>
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
</table>
		</td>
		</tr>
		</table>
<!--
		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td><img SRC="/img/tkt_img/header_icon_tc.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
		<td><h3>エンターテーメント<br>
		<img SRC="/img/tkt_img/blk.gif" WIDTH="531" HEIGHT="1" ALT=""><br>
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
</table>
		</h3></td>
		</tr>
		</table>-->
<!-- /チケット -->
		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr><td align='right'>
		<a href="javascript:showHowtoBuyTicket();"><img src="/img/icon_howtouse.gif" border="0" alt="ご利用方法">ご利用方法</a>
				</td></tr>
		</table>
<!-- タブ -->
		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td WIDTH="45" VALIGN="BOTTOM"><img SRC="/img/tkt_img/tab_on_06.gif" WIDTH=45 HEIGHT=1 ALT=""></td>
		<td WIDTH="553" VALIGN="BOTTOM"><img SRC="/img/tkt_img/tab_dot.gif" WIDTH=553 HEIGHT=1 ALT=""></td>
		</tr>
		</table>
<!-- /タブ -->
<!-- 商品 -->
		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<form action="<%= serverUrl %>" method="get" onsubmit="return checkForm();">
		<tr>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		<td COLSPAN="3" BGCOLOR="#F3F0EA"><img SRC="/img/tkt_img/shim.gif" WIDTH="10" HEIGHT="12" ALT=""></td>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		<td BGCOLOR="#F3F0EA" WIDTH="8"><img SRC="/img/tkt_img/shim.gif" WIDTH="8" HEIGHT="1" ALT=""></td>
		<td BGCOLOR="#F3F0EA" WIDTH="580" ALIGN="CENTER">
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="pageamount" xml="${xmlstr}"></xml:parse>
			<table WIDTH="580" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td align="left" CLASS='txt12b'><xml:out select='$pageamount//product_sub_title'/></td>
			</tr>
			<tr>
		  	<td CLASS="super14"><xml:out select='$pageamount//product_name'/>
		  	<xml:if select="$pageamount//event_names[not(.='')] ">
		  	(<xml:out select='$pageamount//event_names'/>)
		  	</xml:if>
		  	</td>
			</tr>
			<tr>
				<td align="left"><xml:out select='$pageamount//catchcopy'/></td>
			</tr>
			</table>
			<br>
<%	if( allotmentxml.length() > 0 ){	%>
<c:set var="allotxml" ><%= allotmentxml %></c:set><xml:parse var="production" xml="${allotxml}"></xml:parse>
			<table WIDTH="548" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td width='150' valign='top' rowspan='2'>
				<a href="javascript:history.back()">
				<img SRC="/img/tkt_img/btt_back.gif" WIDTH="74" HEIGHT="23" BORDER="0" alt=""></a>
				</td>

<SCRIPT language="javascript">
<!--
	function chegeCalc(){
		//クリアメソッド追加
		ClearForm();
		var postion = document.forms['0'].elements['PostionSelect'].selectedIndex;
		var splitString = new String( document.forms['0'].elements['PostionSelect'].value );
		var ANa = new String;
		ANa = splitString.split( "-*-",14 );
		setOrder(ANa[0],ANa[1],ANa[2],ANa[3],ANa[4],ANa[5],ANa[6],ANa[7],ANa[8],ANa[9],ANa[10],ANa[11],ANa[12],ANa[13], postion );
	}
//-->
</SCRIPT><td ALIGN="LEFT" valign='middle' colspan='7'>
				<select name='PostionSelect' onChange="javascript:chegeCalc();">
				<option>-----------商品をお選びください----------</option>
<xml:forEach select='$production//skus/sku' >
	<xml:forEach select='allots/allot' >
		<option value='<xml:out select='allot_seq' />-*-<xml:out select='allotdate' />-*-<xml:out select='allottime' />-*-<xml:out select='price' />-*-<xml:out select='tax' />-*-<xml:out select='sending' />-*-<xml:out select='sending_tax' />-*-<xml:out select='sending_calc_unit' />-*-1-*-<xml:out select='maxorder' />-*-<xml:out select='agt_cd' />-*-<xml:out select='sku_name' />-*-<xml:out select='salesto' />-*-<xml:out select='salesto' />'><xml:out select='allotdatestr' /><xml:out select='allottimeStr'/><xml:out select='sku_name' />:&nbsp;&nbsp;<xml:out select='pricestr' />円</option>
	</xml:forEach>
</xml:forEach>
				</select>
				</td>
				<td ALIGN="RIGHT" valign='top'>
				<input type="image" src="/img/btt_buy.gif" width="74" height="23" border="0" alt="申し込む">
				</td>
				</tr>
<input type='hidden' name='viewsending' size='6' disabled="disabled" class="textbox_white">
<input type="hidden" name='orderNumber' value='<%= order_no %>'>
<input type="hidden" name='subOrderNumber' value='0'>
<input type="hidden" name='userId' value='<%= user_id %>'>
<input type='hidden' name='sku_name' /><br/>
<input type='hidden' name='agtcode' value='<xml:out select='$production//agt_cd'/>' />
<input type='hidden' name='productTypeCode' value='<%= type_cd %>' />
<input type='hidden' name='product_id' />
<input type='hidden' name='title' value='<xml:out select='$pageamount//product_name'/>' />
<input type='hidden' name='connectionStyle' value='0' />
<input type='hidden' name='salesdate' />
<input type='hidden' name='times' />
<input type='hidden' name='lastsale' />
<input type='hidden' name='endsale' />
<input type='hidden' name='price' />
<input type='hidden' name='tax' />
<input type='hidden' name='sending' />
<input type='hidden' name='sending_tax' />
<input type='hidden' name='sending_calc_unit' />
<input type='hidden' name='mapinfo' value='<xml:out select="$pageamount//play_place"/>　
<xml:out select="$pageamount//pointofaccess"/>'/>
<input type='hidden' name='mapurlinfo' value='<xml:out select="$pageamount//accesspoint_url" />' />
<input type='hidden' name='detailinfo' value='<xml:out select="$pageamount//linkedurl" />' />
				<tr>
				<td ALIGN="RIGHT" valign='middle' width='100'> 単価:</td>
				<td ALIGN="RIGHT" valign='middle' width='20'></td>
				<td ALIGN="LEFT" valign='middle'>
				<input type='text' name='viewprice' size='8' disabled="disabled" class="textbox_white">円
				</td>
				<td ALIGN="LEFT" valign='middle' width='20'> x </td>
				<td ALIGN="CENTER" valign='middle'>
<select name='pax' onChange="calcOrder();" disabled="disabled">
	<option>---</option>
</select>枚
				</td>
				<td ALIGN="RIGHT" valign='middle' width='40'> 計:</td>
				<td ALIGN="LEFT" valign='middle'>
				<input type='text' name='viewprices' size='8' disabled="disabled" class="textbox_white">円
				</td>
				<td ALIGN="LEFT" valign='middle'>
				<input type='text' name='viewsendingStr' disabled="disabled" class="textbox_white">
				</td>
				</tr>
			</table>
<%	}	%>
			<table WIDTH="548" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
			<td>
				<table BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
				<td valign='top' BGCOLOR="#F3F0EA" width='220'>
<img src='/<%= ContextProperty._ticket_image_Dir %><xml:out select='$pageamount//product_seq'/>-4.gif' width='200'/>
				</td>
				<td BGCOLOR="#F3F0EA" width='8'>&nbsp;&nbsp;
				</td>
				<td valign='top' BGCOLOR="#999999" width='320'>
<!-- チケット詳細 -->
					<table BORDER="0" CELLSPACING="1" CELLPADDING="3" width='100%'>
<%	if( allotmentxml.length() > 0 ){	%>
						<tr>
              <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='90'>ポイント</td>
              <td BGCOLOR="#FFFFFF"><xml:out select='$pageamount//price_catch'/>
            </tr>
            <tr>
              <td BGCOLOR="#FFFFFF" colspan='2'>
<xml:forEach select='$production//skus/sku' >
	<xml:forEach select='allots/allot' ><%	counter++;	%>
<a href="javascript:setOrder('<xml:out select='allot_seq' />','<xml:out select='allotdate' />','<xml:out select='allottime' />',
'<xml:out select='price' />','<xml:out select='tax' />','<xml:out select='sending' />','<xml:out select='sending_tax' />','<xml:out select='sending_calc_unit' />','1','<xml:out select='maxorder' />','<xml:out select='agt_cd' />','<xml:out select='sku_name' />','<xml:out select='salesto' />','<xml:out select='salesto' />', '<%= counter %>');"><xml:out select='allotdatestr' /><xml:out select='allottimeStr'/><xml:out select='sku_name' />:&nbsp;&nbsp;<xml:out select='pricestr' />円</a>
<br/>
	</xml:forEach>
</xml:forEach>
             	</td>
            </tr>
<%	}else{	%>
						<tr>
							<td BGCOLOR="#FFFFFF" CLASS="b" VALIGN="TOP" colspan='2'>
							<font color='red'>申し訳ありません。売切れです</font></td>
						</tr>
<%	}	%>
<xml:choose>
<xml:when select="$pageamount//play_place[not(.='')] ">
            <tr>
              <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">会場<br/><br/>
<xml:if select="$pageamount//accesspoint_url[not(.='')] ">
<a href="<xml:out select='$pageamount//accesspoint_url' />" target='_blank'><img src='/img/map.gif' width='25' border='0' alt='[地図]'/></a></xml:if>
              </td>
<td BGCOLOR="#FFFFFF"><pre><xml:out select='$pageamount//play_place'/>
<xml:out select='$pageamount//pointofaccess'/></pre></td>
            </tr>
</xml:when>
<xml:otherwise>
<xml:if select="$pageamount//pointofaccess[not(.='')] ">
            <tr>
              <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">会場<br/><br/>
<xml:if select="$pageamount//accesspoint_url[not(.='')] ">
<a href="<xml:out select='$pageamount//accesspoint_url' />" target='_blank'><img src='/img/map.gif' width='25' border='0' alt='[地図]'/></a></xml:if>
              </td>
<td BGCOLOR="#FFFFFF"><pre><xml:out select='$pageamount//play_place'/>
<xml:out select='$pageamount//pointofaccess'/></pre></td>
            </tr>
</xml:if>
</xml:otherwise>
</xml:choose>
<xml:if select="$pageamount//actors[not(.='')] ">
            <tr>
							<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">出演者</td>
							<td BGCOLOR="#FFFFFF"><xml:out select='$pageamount//actors'/></td>
						</tr>
</xml:if>
<xml:if select="$pageamount//produce[not(.='')] ">
						<tr>
							<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">主催</td>
							<td BGCOLOR="#FFFFFF"><xml:out select='$pageamount//produce'/></td>
							</td>
						</tr>
</xml:if>
            <tr>
							<td BGCOLOR="#FFFFFF" valign="top" colspan="2">
							<pre><xml:out select='$pageamount//description'/></pre>
							</td>
						</tr>
<xml:if select="$pageamount//linkedurl[not(.='')] ">
						<tr>
							<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">連絡先・<br/>リンク先</td>
							<td BGCOLOR="#FFFFFF">
							<a href="<xml:out select='$pageamount//linkedurl' />" target='_blank'><xml:out select='$pageamount//opening'/></a>
							</td>
</xml:if>
           </table>
<!-- /チケット詳細 -->

				</td>
				</tr>
				</table>

			</td>
			</tr>
			</table>
		</td>
		<td BGCOLOR="#F3F0EA" WIDTH="8"><img SRC="/img/tkt_img/shim.gif" WIDTH="8" HEIGHT="1" ALT=""></td>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" COLSPAN="5"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
</form>
	</table>
<!-- /商品 -->

	</td>
	</tr>
	</table>
	</center>
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

<!-- Omnituer Section -->
<script language="JavaScript">
<!--
/* You may give each page an identifying name, server, and channel on
the next lines. */

var s_pageName="ENTERTAINMENT_DETAIL"
var s_server="www.lastminute.co.jp"
var s_channel="ENTERTAINMENT"
var s_pageType=""
var s_prop1="ENTERTAINMENT_DETAIL_<xml:out select='$pageamount//product_name'/>"
var s_code=' '

//-->
</script>
<script language="JavaScript" src="http://www.lastminute.co.jp/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<!-- Omnituer Section -->


</body>
</html>
