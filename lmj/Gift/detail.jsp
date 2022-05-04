<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.*,
								 jp.co.lastminute.cart.Constants,
								 jp.co.lastminute.cart.model.Order,
								 jp.co.lastminute.ContextProperty,
								 jp.co.lastminute.common.HtmlpartMaker,
								 jp.co.lastminute.Gift.detail.Form" %>

<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>

<%

	ParseFormat pf = null;
	int type_cd = 93;
	int intL = 0;

	String serverUrl = "https://"+request.getServerName() + "/lmj/Gift/cartRegistration.do;jsessionid=" + session.getId();

	Form form = (Form)request.getAttribute( "Gift.detail.Form" );
	String xmlstring = form.getXmlstring();
	String allotmentxml = form.getAllotmentxml();
	jp.co.yobrain.util.DataFormat dataformat = null;

	int user_id = 0;
	int order_no = 0;
	if( session.getAttribute( Constants.CartOrder ) != null ){
		Order order = (Order)session.getAttribute( Constants.CartOrder );
		user_id	 = order.getUSER_ID();
		order_no = order.getORDER_NO();
	}

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

function checkForm(){
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

function calcSending( sending, sending_tax, pax){
	var unit = new Number( document.forms['0'].elements['sending_calc_unit'].value );
	var sending_price = ((((unit*pax)-((unit*pax)%100))/100)+1)*(sending+sending_tax);
	var viewsending_price = new String( sending_price );
	document.forms['0'].elements['viewsending'].value= viewsending_price.substring(0, viewsending_price.length-3)
																								 + "," + viewsending_price.substring((viewsending_price.length-3), viewsending_price.length);
	return sending_price;

}

function calcOrder( ){

	var salesflg = new Number( document.forms['0'].elements['salesflg'].value );

	if (salesflg == 1) {
		var pax = new Number( document.forms['0'].elements['pax'].value );
		var price = new Number( document.forms['0'].elements['price'].value );
		var tax = new Number( document.forms['0'].elements['tax'].value );
		var viewprice = new String( pax*( price + tax ));
		document.forms['0'].elements['viewprices'].value= viewprice.substring(0, viewprice.length-3)
				+ "," + viewprice.substring((viewprice.length-3), viewprice.length);
	}
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
	  window.open(theURL,winName,features);
}

var faceer1 = "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=300,height=200,left=0,top=0,alwaysRaised=1";

var faceer2 = "toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=800,height=600,left=0,top=0,alwaysRaised=1";

function showPopupOuter( callurl ) {
	var Target = "POPUCD";
	var Word = "WORD";
	var cal = "http://" + callurl ;
	faceer = faceer2;

	if( callurl.indexOf("lastminute", 0 ) >= 0 ){
		//faceer = faceer1;
	}
  remoteWins = window.open("","outer",faceer)
  if (remoteWins != null) {
   	remoteWins.location = cal;
  }
  remoteWins.focus();
}
//-->
</SCRIPT>
</head>


<% if (allotmentxml != "") { %>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0"onResize="nn4reload();" onload="calcOrder();">
<% } else { %>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0"onResize="nn4reload();">
<% } %>
	
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
	<table BORDER="<%= intL %>" CELLSPACING="0" CELLPADDING="0" WIDTH="760">
		<tr>
			<td VALIGN="TOP">
				<IMG SRC="/img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>
				<!-- ナビframe -->
				<NOLAYER>
				<IFRAME SRC="/lmj/navi.jhtml" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
				</NOLAYER>
				<ILAYER SRC="/lmj/navi.jhtml" WIDTH="147" HEIGHT="680"></ILAYER>
				<!-- /ナビframe -->
			</td>

			<!-- 調整 -->
			<td>
				<IMG SRC="/img/shim.gif" WIDTH="10" HEIGHT="1" alt=""><br>
			</td>
			<!-- /調整 -->

			<td VALIGN="TOP" ALIGN="left">
				<IMG SRC="/img/shim.gif" WIDTH="10" HEIGHT="1" alt=""><br>
        <table cellSpacing=0 cellPadding=0 width=458 border=0>
          <tr> 
            <td align=left width=67 rowspan="2" valign="middle" > <img src="/img/header_icon_gf.gif" width="67"> 
            </td>

            <td class="txt16b" valign="middle"> 
              <table border="0" cellspacing="0" cellpadding="0" width="531" align="center">
                <tr> 
                  <td class="txt16b">ギフト　<span class="txt12">LMJ　Selections</span></td>
                </tr>
                <tr> 
                  <td height="5"><img src="/img/blk.gif" width="531" height="1"></td>
                </tr>
                <tr> 
                  <td class="b"> 
                    <div align="left"><b>
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=index">LMJおすすめ</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=purpose">カテゴリー別</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=price">プライス別</A>　
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

					<table WIDTH="598" BORDER="<%= intL %>" CELLSPACING="0" CELLPADDING="0">
						<tr>
							<td align='right'>
								<!--<a HREF="#" onClick="MM_openBrWindow('/Gift/res_wind.html','lmj','scrollbars=yes,width=500,height=380')"><img src="/img/icon_howtouse.gif" border="0" alt="ご利用方法">ご利用方法</a>-->
							</td>
						</tr>
					</table>

					<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="pageamount" xml="${xmlstr}"></xml:parse>

					<!-- 商品 -->
					<table WIDTH="598" BORDER="<%= intL %>" CELLSPACING="0" CELLPADDING="0" bgcolor="#FFFFFF">

						<tr>
							<td COLSPAN="5" BGCOLOR="#666666"><img ALT="" HEIGHT="1" WIDTH="1" SRC="/img/shim.gif"></td>
						</tr>

						<tr>
							<td WIDTH="1" BGCOLOR="#666666"><img ALT="" HEIGHT="1" WIDTH="1" SRC="/img/shim.gif"></td>
							<td WIDTH="8" BGCOLOR="#F3F0EA"><img ALT="" HEIGHT="1" WIDTH="8" SRC="/img/shim.gif"></td>
							<td ALIGN="CENTER" WIDTH="580" BGCOLOR="#F3F0EA">
								<table CELLPADDING="3" CELLSPACING="0" border="<%= intL %>" WIDTH="580">
									<tr>
										<td COLSPAN="2" VALIGN="TOP" align='left'><br/><br/>
										<span CLASS='txt12orgb'><xml:out select='$pageamount//product_sub_title'/></span>
										<span CLASS="super14"><xml:out select='$pageamount//product_name'/></span>　
						        <span CLASS='txt12brnb'><xml:out select='$pageamount//price_catch'/></span>
										</td>
					       	</tr>

								<% if (allotmentxml != "") { %>
								<c:set var="allotxml" ><%= allotmentxml %></c:set><xml:parse var="production" xml="${allotxml}"></xml:parse>
								<form action="<%= serverUrl %>" method="get" onsubmit="return checkForm();">

								<%	int etacount=0;	%>
								<xml:forEach select='$production//orders/option' ><%	etacount++;	%></xml:forEach>

								<%	if( etacount > 0 ){	%>
						      <tr>
										<td colspan=' 2'VALIGN="TOP" align='right'>
										<span CLASS="txt14b"><xml:out select='$production//price_str'/> 円　</span>
										<span CLASS="txt12b">(消費税込み)</span></td>
									</tr>
								<% } %>
								</table>

								<%	if( etacount > 0 ){	%>
								<table width="580" cellpadding="0" cellspacing="1" border="<%= intL %>" BGCOLOR="#F3F0EA">
									<tr>
										<td>
											<table border="0" width='580' cellspacing="0" cellpadding="0">
												<tr>
													<input type='hidden' name='salesflg' value='1' />

													<input type="hidden" name='orderNumber' value='<%= order_no %>'><br/>
													<input type="hidden" name='subOrderNumber' value='0'><br/>
													<input type="hidden" name='userId' value='<%= user_id %>'>
													<input type='hidden' name='connectionStyle' value='0' />
													<input type='hidden' name='agtcode' value='<xml:out select='$production//agt_cd'/>' />
													<input type='hidden' name='productTypeCode' value='<%= type_cd %>' />
													<input type='hidden' name='product_id' value='<xml:out select='$production//product_id'/>'/>
													<input type='hidden' name='title' value='<xml:out select='$production//product_name'/>' />
													<input type='hidden' name='sending_calc_unit' value='<xml:out select='$production//sending_calc_unit'/>' />
													<input type='hidden' name='tax' value='0'/>
													<input type='hidden' name='price' value='<xml:out select='$production//price'/>'/>
													<input type='hidden' name='sending' value='<xml:out select='$production//sending'/>' />
													<input type='hidden' name='sending_tax' value='0' />

													<td colspan="1" align="right" width="500">
															数量:
															<select name='pax' onChange="calcOrder();">
																<xml:forEach select='$production//orders/option' >
																	<option value='<xml:out select='value'/>'/><xml:out select='value'/>
																</xml:forEach>
															</select>　
															税込合計金額:
														<input type='text' name='viewprices' size='8' disabled="disabled" class="textbox_white">円
													</td>
													<td rowspan="2" align="right" valign="middle">
														<input type="image" src="/img/btt_buy.gif" width="74" height="23" border="0" alt="カートへ">
													</td>
												</tr>

												<tr>
													<td align="right" width="500">
														<% etacount=0;	%>
																<xml:forEach select='$production//sendingday/option' ><%	etacount++;	%></xml:forEach>
														<%	if(etacount > 2 ){	%>
															配送希望日:
															<select name='sendingday'>
																	<xml:forEach select='$production//sendingday/option' >
																		<option value='<xml:out select='value'/>'/><xml:out select='value'/>
																	</xml:forEach>
															</select>
														<% } else {%>
															<input type='hidden' name='sendingday' value='指定なし'>
														<%	}	%>

														<% etacount=0;	%>
																<xml:forEach select='$production//sendingtime/option' ><%	etacount++;	%></xml:forEach>
														<%	if(etacount > 2 ){	%>
															配送希望時間:
																<select name='sendingtime'>
																	<xml:forEach select='$production//sendingtime/option' >
																		<option value='<xml:out select='value'/>'/><xml:out select='value'/>
																	</xml:forEach>
																</select>
														<% } else { %>
															<input type='hidden' name='sendingtime' value='指定なし'>
														<%	}	%>

														<% etacount=0;	%>
															<xml:forEach select='$production//options/option' ><%	etacount++;	%></xml:forEach>
														<%	if(etacount > 0 ){	%>
															オプション:
																<select name='eta'>
																	<xml:forEach select='$production//options/option' >
																		<option value='<xml:out select='value'/>'/><xml:out select='value'/>
																	</xml:forEach>
																</select>　
														<%	}	%>
															<xml:if select="$production//etc_flg[not(.='')] ">
																	<xml:out select='$pageamount//textvalue'/>:
																	<input type='text' name='etc' size='40' maxlength='60' />
														</xml:if>
													</td>
											</tr>
										</td>
									</tr>
								</table>

								<% } else { %>
								<table width="580" cellpadding="0" cellspacing="1" border="<%= intL %>" BGCOLOR="#F3F0EA">
									<tr>
										<td>
											<table border="<%= intL %>" width='580' cellspacing="0" cellpadding="0">
												<tr>
													<td class="super14" align="right">
											申し訳ございません。品切れとなりました。
											<!--準備中です。しばらくお待ちください。-->
											<input type='hidden' name='salesflg' value='0' />

											</tr>
										</td>
									</tr>
								</table>
								<%	}	%>
								<%	}	else { %>
								<table width="580" cellpadding="0" cellspacing="1" border="<%= intL %>" BGCOLOR="#F3F0EA">
									<tr>
										<td>
											<table border="<%= intL %>" width='580' cellspacing="0" cellpadding="0">
												<tr>
													<td class="super14" align="right">
											申し訳ございません。品切れとなりました。
											<!--準備中です。しばらくお待ちください。-->
											<input type='hidden' name='salesflg' value='0' />

											</tr>
										</td>
									</tr>
								</table>
								<%	}	%>
								</form>

								<table WIDTH="580" BGCOLOR="#999999" CELLPADDING="0" CELLSPACING="0" BORDER="0">
									<tr>
										<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">
											<img src='/img/gift/<xml:out select='$pageamount//jan_cd'/>-4.gif' width="200" border="0"><br>
										</td>
										<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">
											<td WIDTH="1" BGCOLOR="#EEEEEE"><img ALT="" HEIGHT="1" WIDTH="5" SRC="/img/shim.gif"></td>
										</td>
										<td>
											<table WIDTH="375" BGCOLOR="#999999" CELLPADDING="3" CELLSPACING="1" BORDER="0">

												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP"><span CLASS="txt14b" >
												  <xml:out select='$pageamount//catchcopy' escapeXml="false"/></span>
													</td>
												</tr>

							          <xml:if select="$pageamount//body[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP"><span CLASS="b" >ご案内</span><br>
												  <xml:out select='$pageamount//body' escapeXml="false"/>

													<xml:if select="$pageamount//linkedurl[not(.='')] ">
												  <br/><br/>
													<A href="javascript:showPopupOuter('<xml:out select="$pageamount//linkedurl"/>');">
														<xml:out select="$pageamount//linkedurlvalue"/>
													</A>
													</xml:if>

													</td>
												</tr>
												</xml:if>

							          <xml:if select="$pageamount//specword[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP"><span CLASS="b" >製品仕様</span><br>
												  <xml:out select='$pageamount//specword' escapeXml="false"/></td>
												</tr>
												</xml:if>
												
												<xml:if select="$pageamount//moreinfo[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP">
														<span CLASS="b" >ご注意事項</span><br>
												  	<xml:out select='$pageamount//moreinfo' escapeXml="false"/>
													</td>
												</tr>
												</xml:if>

												<xml:if select="$pageamount//c_coment[not(.='')] ">
												<tr>
													<td BGCOLOR="#FFFFFF" VALIGN="TOP">
														<!--<span CLASS="b" >サプライヤー情報</span><br><br>-->
												  	<xml:out select='$pageamount//c_coment' escapeXml="false"/>
													</td>
												</tr>
												</xml:if>

											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<!-- /商品説明 -->
				
					<br>
				
					</td>
					<td WIDTH="8" BGCOLOR="#F3F0EA"><img ALT="" HEIGHT="1" WIDTH="8" SRC="/img/shim.gif"></td>
					<td WIDTH="1" BGCOLOR="#666666"><img ALT="" HEIGHT="1" WIDTH="1" SRC="/img/shim.gif"></td>
				</tr>
				<tr>
					<td COLSPAN="5" BGCOLOR="#666666"><img ALT="" HEIGHT="1" WIDTH="1" SRC="/img/shim.gif"></td>
				</tr>
				</table>
			</td>
		</tr>
	</table>

</center>
<!-- コピーライトframe -->
<div align="center">
<table BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr> 
		<td>

		<nolayer><iframe SRC="http://www.lastminute.co.jp/copy.html" NAME="" WIDTH="770" HEIGHT="60" FRAMEBORDER="0" SCROLLING="NO"></iframe> 
		</nolayer>
		<ilayer SRC="http://www.lastminute.co.jp/copy.html" WIDTH="770" HEIGHT="60"></ilayer>
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

var s_pageName="GIFT_DETAIL"
var s_server="www.lastminute.co.jp"
var s_channel="GIFT"
var s_pageType=""
var s_prop1="GIFT_DETAIL_<xml:out select='$pageamount//product_name'/>"
var s_code=' '

//-->
</script>
<script language="JavaScript" src="http://www.lastminute.co.jp/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<!-- Omnituer Section -->

</body>
</html>
