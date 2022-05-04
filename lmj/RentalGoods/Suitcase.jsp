<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 java.text.*,
								 jp.co.yobrain.util.format.DataFormat,
								 jp.co.lastminute.cart.*,
								 jp.co.lastminute.cart.model.*,
								 jp.co.lastminute.cart.user.*,
								 jp.co.lastminute.RentalGoods.*,
								 jp.co.lastminute.RentalGoods.Property,
								 jp.co.lastminute.RentalGoods.allot.ProductRegistrationFrom" %>
<%

	ProductRegistrationFrom form = (ProductRegistrationFrom)request.getAttribute( "RentalGoods.allot.ProductRegistrationFrom" );
	if( form == null ){
		form = new ProductRegistrationFrom();
	}
	//セッションの把握
	int order_no = 0;
	if( session.getAttribute( Constants.CartOrder ) != null ){
		order_no = ((Order)session.getAttribute( Constants.CartOrder )).getORDER_NO();
	}
	int user_id = 0;
	if( session.getAttribute( Constants.CartUser ) != null ){
		user_id = ((User)session.getAttribute( Constants.CartUser )).getUser().getUSER_ID();;
	}

	String serverUrl = "https://"+request.getServerName() + "/lmj/RentalGoods/cartRegistration.do;jsessionid=" + session.getId();

	int type_ = 0;
	int viewlngth = 2;

	try{
		if( request.getParameter("type_") != null ){
			type_ = Integer.parseInt( request.getParameter("type_") );
			viewlngth = Property.Colors_[type_].length;
		}
	}catch(Exception ex){
		ex.printStackTrace();	
	}

	if( type_ > 2 ){
		type_ = 2;
	}

	String[] SizeArray = Property.Size_[ type_ ];
	int incdate = 2;
	int from_ = Property.From_[ type_ ];
	String tdayStr = "";
	String lastsale = DataFormat.getNowTimeDate("", "", "", "").substring(0, 12);
	String nowtextdate = lastsale.substring(0, 4);
	String salesdate = DataFormat.getNowDate(0, true);
	String title = Property.title_[ type_ ];
	String product_id = Property.product_id_[ type_ ];

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
function nn4reload()
{
if( _bro == 2 ){
location.reload();
}
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</SCRIPT>

<STYLE type="text/css">
<!--
.s2{
  font-size : 9px;
}
-->
</STYLE>
</head>

<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">

<!-- ヘッダframe -->
<center>
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="72">
		<tr>
			<td VALIGN="top"> <nolayer> <iframe SRC="/top.html" NAME="" WIDTH="760" HEIGHT="65" FRAMEBORDER="0" SCROLLING="NO">

				</iframe> </nolayer>
				<ilayer SRC="/top.html" WIDTH="760" HEIGHT="65"> </ilayer>
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
	<IMG SRC="/img/act_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><BR>
				<!-- ナビframe -->
	<NOLAYER>
	<IFRAME SRC="navi.html" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME> 
	</NOLAYER> 
				<ILAYER SRC="navi.html" WIDTH="147" HEIGHT="680"></ILAYER>
				<!-- /ナビframe -->
	</td>
			<!-- 調整 -->
			<td>
	<IMG SRC="/img/act_img/shim.gif" WIDTH="10" HEIGHT="1" alt=""><br>
	</td>
			<!-- /調整 -->
			<td VALIGN="TOP" align="right"> 
	<IMG SRC="/img/act_img/shim.gif" WIDTH="598" HEIGHT="1" alt=""><br>

				<!--旅行関連商品 -->
        <table cellSpacing=0 cellPadding=0 width=598 border=0>
          <tr> 
            <td align=left width=67 rowspan="2" valign="middle" > <img src="/img/travel_img/header_icon_tr.gif" width="67"> 
            </td>

            <td class="txt16b" valign="middle"> 
              <table border="0" cellspacing="0" cellpadding="0" width="531" align="center">
                <tr> 
                  <td class="txt16b">旅行関連商品　<span class="txt12">TRAVEL ASSISTANTS</span></td>
                </tr>
                <tr> 
                  <td height="5"><img src="/img/blk.gif" width="530" height="1"></td>
                </tr>
                <tr> 
                  <td class="b"> 
									 	<div align="left"><b>
										<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/travel/travel_mid_nr_1.html">成田空港の駐車場</a>　
										<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/travel/travel_mid_hn_1.html">羽田空港の駐車場</a>　
										<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/travel/travel_handy.html">携帯電話レンタル</a>　
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

				<table WIDTH="598" BORDER="0" CELLPADDING="0" CELLSPACING="0">
					<tr> 
						<td VALIGN="BOTTOM"><img SRC="/img/act_img/tab_on_06.gif" WIDTH=418 HEIGHT=1 ALT=""></td>
						<td VALIGN="BOTTOM"><img SRC="/img/act_img/tab_on_08.gif" WIDTH=186 HEIGHT=1 ALT=""></td>
					</tr>
				</table>
				<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr> 
						<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/act_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
						<td COLSPAN="3" BGCOLOR="#F3F0EA"><img SRC="/img/act_img/shim.gif" WIDTH="10" HEIGHT="12" ALT=""></td>
						<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/act_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
					</tr>
					<tr> 
						<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/act_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
						<td BGCOLOR="#F3F0EA" WIDTH="8"><img SRC="/img/act_img/shim.gif" WIDTH="8" HEIGHT="1" ALT=""></td>
						<td BGCOLOR="#F3F0EA" WIDTH="580" ALIGN="CENTER"> 

							<table WIDTH="580" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									
                  <td CLASS="super14"><%= title %></td>
								</tr>
							</table>

<SCRIPT language="javascript">
<!--
<%= Property.getJavascrip( type_ ) %>

var Price_s1 = new Array;
Price_s1 = <%= Property.priceOpStr_() %>;

var goodslengths = <%= Property.goodslengths %>;

function viewPricesStr( ){	
	document.forms[0].elements['viewPrice'].value = calsOrder();
	calcSending();

}

function calsOrder(){
	var pricetarget = new Number( 0 );
	var targetdate = new Number( document.forms[0].elements['rental_days'].selectedIndex ) ;
	var numberOf = new Number( document.forms[0].elements['numberOfgoods'].selectedIndex );
	if( document.forms[0].elements['size'].selectedIndex >= 0){
		pricetarget = PriceS[ document.forms[0].elements['size'].selectedIndex ][ targetdate ];
	}
	pricenum =  pricetarget * ( numberOf + 1 );
	for(var i=0; i<goodslengths; i++){
		pricenum = pricenum + Price_s1[ targetdate ] * document.forms[0].elements['sub_numberOfgoods'][i].selectedIndex;
	}
	pricenum = pricenum + 540 * document.forms[0].elements['sub_numberOfgoods'][goodslengths].selectedIndex;

	return pricenum;
}

function calcSending(){
	var unit = new Number( document.forms['0'].elements['numberOfgoods'].value );
	var sending = 1500;
	var sending_tax = 0;
	var sending_price = ((sending+sending_tax)*unit);
	var viewsending_price = new String( sending_price );
	document.forms['0'].elements['viewsending'].value= viewsending_price;

	return sending_price;

}

//入力値のエラー処理
//ダブルクリックの制御を、入力値の制御を行う
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
function checkForm(){
	if( calsOrder() <= 0 ){
		alert('個数・日付など、必要項目を選択してください。');
		return false;
	}
	if( reloadCheck() == true ){
		return true;
	}
	return false;
}
//-->
</SCRIPT>


	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="548">
		<form action='<%= serverUrl %>' method="get" onsubmit="return checkForm();">
		<tr>
    	<td COLSPAN="3"> 
      	<table WIDTH="524" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td VALIGN="TOP" colspan='3'>
							<span class='txt12'>
								<li>伸縮自在なハンドルバー装備で持ち運びがとってもラクラク。
								<li>4輪とも360度回転するキャスター装備。快適なフットワークで快適な旅を！
								<li>180度まで開くので、出し入れがとっても便利。鍵はセンターのダイヤルロックとサイドロックの二重で安心。
								<li>スーツケースベルト・ハンガー2本付きです。
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<table border="0" cellspacing="0" cellpadding="0" bgcolor="#999999" width='100%'>
							<input type="hidden" name='rtype' value='<%= type_ %>'/>
							<input type="hidden" name='userId' value='<%= user_id %>'/>
							<input type="hidden" name='connectionStyle'  value='5'/>
							<input type="hidden" name='productTypeCode'  value='201'/>
							<input type="hidden" name='guaranteeFlag'  value='1'/>
							<input type="hidden" name='orderNumber'  value='<%= order_no %>'/>
							<input type="hidden" name='throwtypeFlag'  value=''/>
							<input type="hidden" name='subOrderNumber' value='0'/>
							<input type="hidden" name='agentproductcode' value=''/>
							<input type="hidden" name='agtcode' value='TSCR'/>
							<input type="hidden" name='productioncode' value='<%= product_id %>'/>
							<input type="hidden" name='product_id' value='<%= product_id %>'/>
							<input type="hidden" name='price' value='0'>
							<input type="hidden" name='lastsale' value='<%=	lastsale %>'>
							<input type="hidden" name='endsale' value='<%=	lastsale %>'>
							<input type="hidden" name='salesdate' value='<%= salesdate %>'>
							<input type="hidden" name='etc' value=''>
							<input type="hidden" name='eta' value=''>
							<input type="hidden" name='tax' value=''>
							<input type="hidden" name='sending' value='0'>
							<input type="hidden" name='sending_tax' value='0'>
							<input type='hidden' name='title' value='<%= title %>'/>
							<tr>
							<td colspan='2'>
								<table border='0' cellspacing="1" cellpadding="1" width='100%'>
									<tr>
										<td colspan='2' bgcolor="#FFCC99">
											<b>ご出発日の1週間までにお申し込みください。</b>
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF" width='100'>・サイズ</td>
										<td colspan='1' bgcolor="#FFFFFF">
										<select name='size' onChange='javascript:viewPricesStr();'>
											<%= Property.getSizeCOmbo( type_ ) %>
										</select>
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF">・色</td>
										<td colspan='1' bgcolor="#FFFFFF">
										<select name='color'>
											<%= Property.getColorCOmbo( type_ ) %>
										</select>
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF">・個数</td>
										<td colspan='1' bgcolor="#FFFFFF">
										<select name='numberOfgoods' onChange='javascript:viewPricesStr();'>
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										</select>個
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF">・ご利用開始日</td>
										<td colspan='1' bgcolor='#FFFFFF' nowarp>
										<input type='text' name='from_year' size='5' maxlength='4' style="ime-mode:disabled;" value='<%= nowtextdate %>'/>年
										<select name='from_month'>
										<option value='01'>01</option>
										<option value='02'>02</option>
										<option value='03'>03</option>
										<option value='04'>04</option>
										<option value='05'>05</option>
										<option value='06'>06</option>
										<option value='07'>07</option>
										<option value='08'>08</option>
										<option value='09'>09</option>
										<option value='10'>10</option>
										<option value='11'>11</option>
										<option value='12'>12</option>
										</select>月
										<select name='from_day'>
										<option value='01'>01</option>
										<option value='02'>02</option>
										<option value='03'>03</option>
										<option value='04'>04</option>
										<option value='05'>05</option>
										<option value='06'>06</option>
										<option value='07'>07</option>
										<option value='08'>08</option>
										<option value='09'>09</option>
										<option value='10'>10</option>
										<option value='11'>11</option>
										<option value='12'>12</option>
										<option value='13'>13</option>
										<option value='14'>14</option>
										<option value='15'>15</option>
										<option value='16'>16</option>
										<option value='17'>17</option>
										<option value='18'>18</option>
										<option value='19'>19</option>
										<option value='20'>20</option>
										<option value='21'>21</option>
										<option value='22'>22</option>
										<option value='23'>23</option>
										<option value='24'>24</option>
										<option value='25'>25</option>
										<option value='26'>26</option>
										<option value='27'>27</option>
										<option value='28'>28</option>
										<option value='29'>29</option>
										<option value='30'>30</option>
										<option value='31'>31</option>
										</select>日
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF">・ご利用期間</td>
										<td colspan='1' bgcolor='#FFFFFF'>
										<select name='rental_days' onChange='javascript:viewPricesStr();'>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										<option value='6'>6</option>
										<option value='7'>7</option>
										<option value='8'>8</option>
										<option value='9'>9</option>
										<option value='10'>10</option>
										<option value='11'>11</option>
										<option value='12'>12</option>
										<option value='13'>13</option>
										<option value='14'>14</option>
										<option value='15'>15</option>
										<option value='16'>16</option>
										<option value='17'>17</option>
										<option value='18'>18</option>
										<option value='19'>19</option>
										<option value='20'>20</option>
										<option value='21'>21</option>
										<option value='22'>22</option>
										<option value='23'>23</option>
										<option value='24'>24</option>
										<option value='25'>25</option>
										<option value='26'>26</option>
										<option value='27'>27</option>
										<option value='28'>28</option>
										<option value='29'>29</option>
										<option value='30'>30</option>
										<option value='31'>31</option>
										<option value='32'>32</option>
										<option value='33'>33</option>
										<option value='34'>34</option>
										<option value='35'>35</option>
										<option value='36'>36</option>
										<option value='37'>37</option>
										<option value='38'>38</option>
										<option value='39'>39</option>
										<option value='40'>40</option>
										</select>日間
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF" colspan="2">
											ご利用開始日とは、荷造りや空港への発送等で実際にスーツケースを使い始める日のことを示します。
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF">・お届け時間帯</td>
										<td colspan='1' bgcolor='#FFFFFF' nowarp>
										<select name='sending_time' onChange='javascript:viewPricesStr();'>
										<option value="指定無し" selected>指定無し</option>
										<option value="9:00～12:00（午前）">9:00～12:00（午前）</option>
										<option value="13:00～18:00（午後）">12:00～18:00（午後）</option>
										<option value="18:00～20:00（夜間）">18:00～20:00（夜間）</option>
										</select>
										</td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF">・ご旅行先</td>
										<td colspan='1' bgcolor='#FFFFFF' nowarp>
										<select name='distionation' onChange='javascript:viewPricesStr();'>
										<option value="アジア・中国" selected>アジア・中国</option>
										<option value="ハワイ・グアム・サイパン">ハワイ・グアム・サイパン</option>
										<option value="アメリカ・カナダ・南米">アメリカ・カナダ・南米</option>
										<option value="オーストラリア・ニュージーランド">オーストラリア・ニュージーランド</option>
										<option value="ヨーロッパ・アフリカ">ヨーロッパ・アフリカ</option>
										<option value="その他">その他</option>
										</select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan='2'>
								<table border='0' cellspacing="1" cellpadding="1" width='100%'>
									<tr>
										<td colspan='2' bgcolor='#CCFFFF'>&nbsp;&nbsp;<b>オプション</b></td>
									</tr>
									<input type='hidden' name='sub_productions' value='ドライヤー1000Wタイプ　Cプラグ付'/>
									<input type='hidden' name='sub_prices' value=''/>
									<tr>
										<td bgcolor="#FFFFFF" colspan='1' width='250'>・ドライヤー1000Wタイプ　Cプラグ付</td>
										<td bgcolor="#FFFFFF" >
										<select name='sub_numberOfgoods' onChange='javascript:viewPricesStr();'>
										<option value='0'>0</option>
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										</select>個
										</td>
									</tr>
									<input type='hidden' name='sub_productions' value='ドライヤー コンパクト400Wタイプ　Cプラグ付'/>
									<input type='hidden' name='sub_prices' value=''/>
									<tr>
										<td bgcolor="#FFFFFF" colspan='1' nowrap>・ドライヤー コンパクト400Wタイプ　Cプラグ付</td>
										<td bgcolor="#FFFFFF">
										<select name='sub_numberOfgoods' onChange='javascript:viewPricesStr();'>
										<option value='0'>0</option>
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										</select>個
										</td>
									</tr>
									<input type='hidden' name='sub_productions' value='ドライヤー1000Wタイプ　Cプラグ付'/>
									<input type='hidden' name='sub_prices' value=''/>
									<tr>
										<td bgcolor="#FFFFFF" colspan='1'>・ドライヤー1000Wタイプ　Cプラグ付</td>
										<td bgcolor="#FFFFFF">
										<select name='sub_numberOfgoods' onChange='javascript:viewPricesStr();'>
										<option value='0'>0</option>
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										</select>個
										</td>
									</tr>
									<input type='hidden' name='sub_productions' value='ドライヤー　カールタイプ　Cプラグ付'/>
									<input type='hidden' name='sub_prices' value=''/>
									<tr>
										<td bgcolor="#FFFFFF" colspan='1'>・ドライヤー　カールタイプ　Cプラグ付</td>
										<td bgcolor="#FFFFFF">
										<select name='sub_numberOfgoods' onChange='javascript:viewPricesStr();'>
										<option value='0'>0</option>
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										</select>個
										</td>
									</tr>
									<input type='hidden' name='sub_productions' value='トラベルアイロン　 B-Cプラグ付'/>
									<input type='hidden' name='sub_prices' value=''/>
									<tr>
										<td bgcolor="#FFFFFF" colspan='1'>・トラベルアイロン　 B-Cプラグ付</td>
										<td bgcolor="#FFFFFF">
										<select name='sub_numberOfgoods' onChange='javascript:viewPricesStr();'>
										<option value='0'>0</option>
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										</select>個
										</td>
									</tr>
									<input type='hidden' name='sub_productions' value='トラベルポット　 B-Cプラグ付'/>
									<input type='hidden' name='sub_prices' value=''/>
									<tr>
										<td bgcolor="#FFFFFF" colspan='1'>・トラベルポット　 B-Cプラグ付</td>
										<td bgcolor="#FFFFFF">
										<select name='sub_numberOfgoods' onChange='javascript:viewPricesStr();'>
										<option value='0'>0</option>
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										</select>個
										</td>
									</tr>
									<tr>
										<td colspan='2' bgcolor='#CCCCCC'>
										<font color='red'>ドライヤー・アイロン・ポットレンタル料金（共通）</font>
										<table border="0" cellspacing="1" cellpadding="1" bgcolor="#999999" width='342'>
											<tr>
												<td class="txt12" align='center' bgcolor="#FFCCFF">～ 5日</td>
												<td class="txt12" align='center' bgcolor="#FFCCFF">～ 7日</td>
												<td class="txt12" align='center' bgcolor="#FFCCFF">～ 10日</td>
												<td class="txt12" align='center' bgcolor="#FFCCFF">～ 15日</td>
												<td class="txt12" align='center' bgcolor="#FFCCFF">～ 20日</td>
												<td class="txt12" align='center' bgcolor="#FFCCFF">～ 30日</td>
											</tr>
											<tr>
												<td class="txt12" align='right' bgcolor="#FFFFFF">1,080円</td>
												<td class="txt12" align='right' bgcolor="#FFFFFF">1,170円</td>
												<td class="txt12" align='right' bgcolor="#FFFFFF">1,350円</td>
												<td class="txt12" align='right' bgcolor="#FFFFFF">1,530円</td>
												<td class="txt12" align='right' bgcolor="#FFFFFF">1,800円</td>
												<td class="txt12" align='right' bgcolor="#FFFFFF">2,340円</td>
											</tr>
										</table>
										</td>
									</tr>
									<input type='hidden' name='sub_productions' value='海外アダプタープラグ'/>
									<input type='hidden' name='sub_prices' value='<%= Property.adapterprice %>'/>
									<tr>
										<td colspan='2' bgcolor='#FFFFFF'></td>
									</tr>
									<tr>
										<td bgcolor="#FFFFFF" colspan='1'>・海外アダプタープラグ<br/>&nbsp;<font class='txt12' color='red'>(料金：利用期間中　540円)</font></td>
										<td bgcolor="#FFFFFF">
										<select name='sub_numberOfgoods' onChange='javascript:viewPricesStr();'>
										<option value='0'>0</option>
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
										<option value='4'>4</option>
										<option value='5'>5</option>
										</select>個
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
        <td>&nbsp;&nbsp;</td>
        <td VALIGN="TOP" height="124" align='right' width='200'>
        	<table border="0" cellspacing="0" cellpadding="0" width='100%'>
          	<tr>
            	<td colspan='2' align='right'>
              	<input type="image" SRC="/img/btt_next.gif" WIDTH="70" HEIGHT="23" ALT="" BORDER="0" onClick='javascript:viewPricesStr();'>
               </td>
            </tr>
            <tr>
            	<td nowrap>合計金額（税別）</td>
              <td>\<input type='text' size='8' name='viewPrice' value='' disabled="disabled" class="textbox_white"/>-</td>
            </tr>
            <tr>
            	<td nowrap>送料（税別）</td>
              <td>\<input type='text' size='8' name='viewsending' value='' disabled="disabled" class="textbox_white"/>-</td>
            </tr>
            <tr>
            	<td colspan='2'>
              	<img SRC="/img/travel_img/<%= product_id.toLowerCase() %>.jpg" WIDTH="200" HEIGHT="200" border='1'>
              </td>
            </tr>
            <tr>
            	<td colspan='2' align='center'>
              	<table border=0 cellspacing="0" cellpadding="0" width='100%' bgcolor='#999999'>
									<tr>
										<td>
                			<table border=0 cellspacing="1" cellpadding="1" width='100%'  align='center'>
                      	<tr>
                        	<td class="txt12" colspan='2' align='center' bgcolor="#CCCCCC">サイズ</td>
                        	<td class="txt12" align='center' bgcolor="#CCCCCC">重さ</td>
                        </tr>
                        
												<%	for( int i=0; i<Property.Size_[ type_ ].length; i++ ){	%>
                        <tr>
                        	<td class="txt12" align='center' bgcolor="#FFCCFF"><%= Property.Size_[ type_ ][i] %></td>
                        	<td class="txt12" align='center' bgcolor="#FFFFFF"><%= Property.TableStrSize[ type_ ][i] %></td>
                        	<td class="txt12" align='center' bgcolor="#FFFFFF"><%= Property.TableStrWeight[ type_ ][i] %></td>
                        </tr>
                        <%	}	%>
                       
											</table>
                    </td>
									</tr>
								</table>
							</td>
						</tr>
						</tr>
            <tr>
            	<td colspan='2' align='center'>
              	<table border=0 cellspacing="0" cellpadding="0" width='100%' bgcolor='#999999'>
									<tr>
										<td>
                    	<table border=0 cellspacing="0" cellpadding="1" width='100%'  align='center'>
                      	<tr>
                        	<td bgcolor='#CCCCCC' align='center' colspan ='2'><b><font color='red'>ご注意</font></b></td>
                        </tr>
                        <tr>
                        	<td>
                        		<table border=0 cellspacing="0" cellpadding="0" width='100%'>
                        			<tr>
                        				<td valign='top' class='txt10' bgcolor='#FFFFFF'>・</td>
                        				<td class='txt12' bgcolor='#FFFFFF'>
																	<font color='red'>
                        						お届けはご利用開始日の3日前、回収はご帰宅日の翌日です。<br/>開始日から終了日までがレンタル期間となります。
																	</font>
																</td>
															</tr>
														</table>
                        	</td>
                        </tr> 
                        <tr>
                        	<td>
                        		<table border=0 cellspacing="0" cellpadding="0" width='100%'>
                        			<tr>
                        				<td valign='top' class='txt12' bgcolor='#FFFFFF'>・</td>
                        				<td class='txt12' bgcolor='#FFFFFF'>
																	<font color='red'>
																		地域によって夜間指定が出来ない場合もございます。回収の時間帯指定、及び日祝祭日の回収指定は出来ません。
																	</font>
																</td>
															</tr>
														</table>
                        	</td>
                        </tr>
                        <tr>
                        	<td>
                        		<table border=0 cellspacing="0" cellpadding="0" width='100%'>
                        			<tr>
                        				<td valign='top' class='txt12' bgcolor='#FFFFFF'>・</td>
                        				<td class='txt12' bgcolor='#FFFFFF'>
																	<font color='red'>
                        						海外アダプタープラグにつきましては、単品の貸し出しはいたしません。他の商品と組み合わせてご利用ください。
																	</font>
																</td>
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
					</td>
				</tr>
				</form>
			</table>
		</td>
	</tr>
	<tr>
		<td COLSPAN="3">
			<br/> <span class='txt12orgb'> インターネット限定特別料金</B></span>
			<!-- タリフ -->			
		  <table width="548" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
				<tr> 
			  	<td align='left'> 
						<table border="0" cellpadding="2" cellspacing="1" width="100%">
				  		<tbody> 
				  			<tr>
									<% for(int c=0; c<3; c++){	%>
										<td class="txt12" bgcolor="#CCCCCC" align="center">　</td>
									<%  for(int t=0; t< SizeArray.length; t++){	%>
										<td class="txt12" bgcolor="#CCCCFF" align="center"><%= SizeArray[ t ] %></td>
									<%	}
										} %>
								</tr>
									<% for(int d=0; d<13; d++){%>
								<tr>
									<%  for( int loop = 0; loop<3; loop++ ){
												int tday = incdate + (13*loop);
													if( tday<=40){	
														tdayStr = "" + tday + "日";	
													}else{	
														tdayStr = "";
													}
												%>
									<% if (tdayStr.length() > 0) { %>
										<td class="txt12" align='right' bgcolor="#FFCCFF">～ <%= tdayStr %></td>
									<% } else { %>
										<td class="txt12" align='right' bgcolor="#FFCCFF"> </td>
									<% } %>
									<%				for(int tt=0; tt< SizeArray.length; tt++){	%>
														<td class="txt12" align='right' bgcolor="FFFFFF" nowrap>
									<%					if( tdayStr.length() > 0 ){	%>
																<%= Property.getPrice(type_, from_+ tt, tday) %>円</td>
									<%					}	%>
									<%				}	
											}
											incdate++; %>
								</tr>
									<% }	%>
							</tbody> 
						</table>
					</td>
				</tr>
			</table>
			<!-- タリフ -->
		</td>
	</tr>
</table>
							<br>
							</td>
						<td BGCOLOR="#F3F0EA" WIDTH="8"><img SRC="/img/act_img/shim.gif" WIDTH="8" HEIGHT="1" ALT=""></td>
						<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/act_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
					</tr>
					<tr> 
						<td BGCOLOR="#666666" COLSPAN="5"><img SRC="/img/act_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
					</tr>
				</table>
				<!-- /商品 -->

	</td>
		</tr>
	</table>
	　
</center>
<!-- /レイアウト -->

<!-- コピーライトframe -->
	
<table BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER">
	<tr> 
	  <td>
		<center>
		<img SRC="/img/blk.gif" WIDTH="760" HEIGHT="1" VSPACE="5" ALT="">
		<table border="0" width="760" cellpadding="1" cellspacing="1">
			<tr>
				<td align="center">
					<span CLASS="txt12">Copyright &copy; 2002-2003 lastminute.com Japan Ltd. All rights reserved.<BR></span>
				</td>
			</tr>
		</table>
		</center>
		</td>
	</tr>
	
</table>
<!-- /コピーライトframe -->

<!-- Omnituer Section -->
<script language="JavaScript">
<!--
/* You may give each page an identifying name, server, and channel on
the next lines. */

var s_pageName="RENTAL_SUITECASE"
var s_server="www.lastminute.co.jp"
var s_channel="lmjDesign"
var s_pageType="INDEX"
var s_prop1="RENTAL_SUITECASE_<%= title %>"
var s_code=' '

//-->
</script>
<script language="JavaScript" src="http://www.lastminute.co.jp/lmj/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<!-- Omnituer Section -->

</body>
</html>
