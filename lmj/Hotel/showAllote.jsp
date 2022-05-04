<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.cart.*,
								 jp.co.lastminute.cart.model.*,
								 jp.co.lastminute.cart.user.*,
								 jp.co.lastminute.common.HtmlpartMaker,
								 jp.co.lastminute.Hotel.areas.*,
								 jp.co.lastminute.Hotel.detail.*,
								 jp.co.lastminute.Hotel.detail.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%
	Form form = (Form)request.getAttribute( "Hotel.detail.Form" );
	if( form == null ){
		form = new Form();
	}
	String er_comment = form.getViewErrorCopmment("\\n").trim();
	String returnxml = form.getReturnxml();
	String url = "https://" + request.getServerName()+ "/lmj/Hotel/cartRegistration.do;jsessionid="+session.getId();
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
<html>
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<meta name="keywords" content="lastminute">
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">
<SCRIPT language="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;
function nn4reload(){	if( _bro == 2 ){	location.reload();	}}
	var formDisabled = false;
	function submitForm() {
		if (formDisabled == true) {
			return false;
		}
		formDisabled = true;
		return true;
	}
	function goCartRegistration(){
		if (submitForm() == true) {
			document.orderForm.submit();
		}else {
			alert("You have to wait, please");
		}
	}
//-->
</SCRIPT>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<!-- ヘッダframe -->
	<center>
<!--
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" height="72">
	    <tr>
			<td valign="top">
<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER" HEIGHT="65" BACKGROUND="/img/head_e.jpg">
	<tr>
	<td VALIGN="TOP">

		<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="65">
		<tr><td VALIGN="BOTTOM" BACKGROUND="" nowrap ROWSPAN="2"><a HREF="http://www.lastminute.co.jp/"><img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="3" BORDER="0"></a></td>
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
			</td>
		</tr>
	</table>
--->
<!-- /ヘッダframe -->

<!-- レイアウト -->
<!-- 国内ホテル -->
<!--
<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td BACKGROUND="/img/header_icon_ds.gif" WIDTH="67" HEIGHT="65">
			</td>
			<td valign="bottom"><h3>国内ホテル・やど</br>
			<img SRC="/img/flights_img/blk.gif" WIDTH="531" HEIGHT="1" ALT=""><br>
			<font class="txtcategory">
			|<%= HtmlpartMaker.getLinkList( "/lmj/Hotel/top.do?act=", "index", "おすすめホテル・宿", form.getAct() ) %>|
			|<a href="/lmj/Hotel/from_postalArea.jsp">地図より</a>|
			|<%= HtmlpartMaker.getLinkList( "/lmj/Hotel/top.do?act=", "areas", "おすすめはここ", form.getAct() ) %>| </font>  
			</h3>
			</td>
		</tr>
</table>
-->
<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="650" ALIGN="CENTER">
	<tr>
	<td WIDTH="67" rowspan="2"><img SRC="/img/header_icon_ds.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
	<td WIDTH="214" valign="bottom"><h3>国内ホテル・やど</br>
	</td><td align="right" width="369" valign="bottom">
	<img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="1" BORDER="0"></td>
	</tr>
	<tr>
		<td colspan="2" HEIGHT="13">
	<img SRC="/img/blk.gif" WIDTH="573" HEIGHT="1" ALT=""><br>　
	</tr>
	</table>
<img SRC="/img/shim.gif" WIDTH="10" HEIGHT="5" ALT=""><br>


<%	if ( returnxml.length() > 0 ){	%>

<% //System.err.println(returnxml); %>

<c:set var="xmlstr" ><%= returnxml %></c:set><xml:parse var="ALTCHKOUT" xml="${xmlstr}"></xml:parse>
<table BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#666666" WIDTH="620" ALIGN="CENTER">
	<tr>
	    <td>
	    <table WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="0">
				<form NAME="orderForm" METHOD="get" ACTION="<%= url %>" onSubmit="JavaScript:return submitForm();">
				<!--product_id:--><input type="hidden" name="product_id" value='<%= form.getProduct_id()	%>'/><!--<br/>-->
				<!--productCode:--><input type="hidden" name="productCode" value='<%= form.getProduct_id()	%>'/><!--<br/>-->
				<!--meal_cd:--><input type="hidden" name="meal_cd" value='<%= form.getMeal_cd()	%>'/><!--<br/>-->
				<!--roomtype_cd:--><input type="hidden" name="roomtype_cd" value='<%= form.getRoomtype_cd()	%>'/><!--<br/>-->
				<!--agentCode:--><input type="hidden" name="agtcode" value='<%= form.getAgtcode() %>'/><!--<br/>-->
				<!--hotel_id:--><input type="hidden" name="supnbr" value='<%= form.getSupnbr() %>'/><!--<br/>-->
				<!--checkInDate:--><input type="hidden" name="checkInDate" value='<%= form.getCheckindate() %>'/><!--<br/>-->
				<!--numberOfRooms:--><input type="hidden" name="numberOfRooms" value='<%= form.getNumberOfRooms() %>'/><!--<br/>-->
				<!--numberOfAdults:--><input type="hidden" name="numberOfAdults" value='<%= form.getNumberOfAdults() %>'/><!--<br/>-->
				<!--numberOfFemale:--><input type="hidden" name="numberOfFemales" value='<%= form.getNumberOfFemales() %>'/><!--<br/>-->
				<!--numberOfMale:--><input type="hidden" name="numberOfMales" value='<%= form.getNumberOfMales() %>'/><!--<br/>-->
				<!--numberOfKids:--><input type="hidden" name="numberOfKids" value='<%= form.getNumberOfKids() %>'/><!--<br/>-->
				<!--numberOfYoji1:--><input type="hidden" name="numberOfYoji1" value='<%= form.getNumberOfYoji1() %>'/><!--<br/>-->
				<!--numberOfInfant:--><input type="hidden" name="numberOfYoji2" value='<%= form.getNumberOfYoji2() %>'/><!--<br/>-->
				<!--checkInMonth: --><input type="hidden" name='checkInMonth' value='<%= form.getCheckInMonth() %>'/><!--<br/>-->
				<!--checkInDay: --><input type="hidden" name='checkInDay' value='<%= form.getCheckInDay() %>'/><!--<br/>-->
				<!--nights: --><input type="hidden" name="night" value='<%= form.getNight() %>'/><!--<br/>-->
				<!--title: --><input type='hidden' name='title' value='<xml:out select="$ALTCHKOUT//NAME"/>'/><!--<br/> -->
				<!--pax: --><input type='hidden' name='pax' value='1'/><!--<br/>-->
				<input type="hidden" name='salesdate' value='<%= form.getCheckindate() %>'>
				<input type="hidden" name='last_day' value='<%= form.getLast_day() %>'>
				<input type="hidden" name='connectionStyle'  value='0'>
				<input type="hidden" name='productTypeCode'  value='4'>
				<input type="hidden" name='guaranteeFlag'  value='1'>
				<input type="hidden" name='orderNumber'  value='<%= order_no %>'>
				<input type="hidden" name='throwtypeFlag'  value=''>
				<input type="hidden" name='subOrderNumber' value='0'>
				<input type="hidden" name='etc' value=''>
				<input type="hidden" name='eta' value=''>
				<input type="hidden" name='tax' value=''>
				<input type="hidden" name='sending' value=''>
				<input type="hidden" name='sending_tax' value=''>
				<input type="hidden" name='eta' value=''>
				<!--reTokki--><input type="hidden" name='reTokki' value='<xml:out select='$ALTCHKOUT//TOTAL' escapeXml='false'/>'><!--<br/>-->
				<!--user_id--><input type="hidden" name='userId' value='<%= user_id %>'><!--<br/>-->
				<!--price:--><input type="hidden" name='price' value='<xml:out select='$ALTCHKOUT//PRICE'/>'>
					<tr>
						<td BGCOLOR="#F3F0EA" ALIGN="CENTER">
							<br/>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td class="txt14navyb" colspan='3' align='left' align='right'><img src="/img/hotel/point_navy.gif" width="7" height="7" alt="">　空室情報確認</td>
								</tr>
								<tr bgcolor="#41629a">
									<td height="2" colspan="4"><img src="/img/hotel/shim.gif" width="1" height="1" alt=""></td>
								</tr>
								<tr>
									<td colspan='2'><br/>
									<a HREF="javascript:history.back();">
									<img SRC="/img/hotel/btt_back.gif" WIDTH="74" HEIGHT="23" ALT="戻る" BORDER="0"></a>
									</td>
									<td ALIGN="RIGHT" colspan='2'><br/>
									<input type="image" SRC="/img/hotel/btt_next.gif" WIDTH="74" HEIGHT="23" NAME="SUBMIT" BORDER="0" ALT="予約する"></A>
									</td>
								</tr>
							</table>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
								<tr>
									<td>
                  	<table width="100%" border="0" cellspacing="1" cellpadding="2">
                    	<tr>
                      	<td bgcolor="#FFFFFF" colspan="2"><span class="b">ご予約内容</span></td>
											</tr>
											<!-- フォームから -->
                      <tr>
                      	<td bgcolor="#F8F8F8" width="105" CLASS="b">宿泊日</td>
												<td bgcolor="#FFFFFF" width="382"><%= form.getCheckIndateStr() %>から <%= form.getNight() %>泊</td>
											</tr>
											<!-- フォームから -->
                      <tr>
                      	<td bgcolor="#F8F8F8" width="105" CLASS="b">宿泊先	部屋タイプ</td>
												<td bgcolor="#FFFFFF"><xml:out select='$ALTCHKOUT//NAME'/>	
												<xml:out select='$ALTCHKOUT//DISCRIPTION/CONTENT[1]'/>	
												<xml:out select='$ALTCHKOUT//DISCRIPTION/CONTENT[2]'/>
												</td>
											</tr>
											<% if( form.getNumberOfRooms().length() > 0 ){	%>
                      <tr>
                      	<td bgcolor="#F8F8F8" width="105" CLASS="b">部屋数</td>
												<td bgcolor="#FFFFFF"><%= form.getNumberOfRooms() %> 室</td>
											</tr>
											<%	}	%>
											<%	if( form.getMailStr().length() > 0 ){	%>
                      <tr>
                      	<td bgcolor="#F8F8F8" width="105" CLASS="b">食事条件</td>
												<td bgcolor="#FFFFFF"><%= form.getMailStr() %></td>
											</tr>
											<%	}	%>
                      <tr>
                      	<td bgcolor="#F8F8F8" width="105" CLASS="b">人数</td>
												<td bgcolor="#FFFFFF"><xml:out select='$ALTCHKOUT//PEOPLE'/>
												<xml:out select='$ALTCHKOUT//DISCRIPTION/CONTENT[4]'/></td>
											</tr>
                      <tr>
                      	<td bgcolor="#F8F8F8" width="105" CLASS="b">宿泊料金内訳
												</td>
												<td bgcolor="#FFFFFF"><xml:out select='$ALTCHKOUT//TOTAL' escapeXml='false'/>
												<xml:out select='$ALTCHKOUT//DISCRIPTION/CONTENT[3]'/>
												<%	if( form.getAgtcode().equals("KNT")  ){	%>
													<br/>※サービス料込み
												<%	}	%>
												</td>
											</tr>
                      <tr>
                      	<td bgcolor="#F8F8F8" width="105" CLASS="b">ご注意</td>
												<td bgcolor="#FFFFFF"><xml:out select='$ALTCHKOUT//TOKUSYOKU'/>
												<xml:out select='$ALTCHKOUT//DISCRIPTION/CONTENT[5]' escapeXml='false' /></td>
											</tr>
           					</table>
									</td>
								</tr>
							</table>
							<br>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
								<tr>
									<td>
                  <table WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="2">
                  	<tr>
                    	<td BGCOLOR="#FFFFFF"><span CLASS="b">ご案内</span></td>
										</tr>
										<tr>
                    	<td BGCOLOR="#FFFFFF" WIDTH="100%">
											<% if(form.getAgtcode().equals("ALM")){ %>
											<span CLASS="b">必ずご確認ください</span><br>
											上記取消料は、諸税込・サービス料込の購入金額に対して申し受けます。<br>
											このご案内に記載の無い事項は<a href='#'>当社手配旅行約款</a>によります。<br><br>
											<span CLASS="b">手配旅行契約の解除と取消料</span><br>
											手配旅行契約を解除した場合、その時点において上記（「ご注意」欄）に定める取消料を											クレジットカード決済により申し受けます。
											<% } else {%>
											<span CLASS="b">必ずご確認ください</span><br>
											<xml:out select='$ALTCHKOUT//COUTION/CLEAR'  escapeXml='false'/><br><br>
											<span CLASS="b">予約の取消と取消料</span><br>
											<xml:out select='$ALTCHKOUT//COUTION/ROLE'  escapeXml='false'/>
											<% } %>
											<br><br>
											</td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							<br/>
						</td>
					</tr>
				</form>
			</table>
		</td>
	</tr>

</table>
<%	}	%>
<br/>
<!-- /レイアウト -->
<!-- コピーライトframe -->
<table BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER">
	<tr>
	    <td>
<img SRC="/img/blk.gif" WIDTH="620" HEIGHT="1" VSPACE="5" ALT="">
<table border="0" width="620" cellpadding="1" cellspacing="1">
<tr>
<td align="center">
<span CLASS="txt12">	Copyright &copy; 2002-2003 lastminute.com Japan Ltd. All rights reserved.<BR>	</span>
</td>
</tr>
</table>
		</td>
	</tr>
</table>
<!-- /コピーライトframe -->
</body>
</html>


