<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 java.text.*,
								 jp.co.lastminute.Restraunt.*,
								 jp.co.lastminute.common.HtmlpartMaker,
								 jp.co.lastminute.Restraunt.search.Form" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html lang="ja">
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">

<%
	String xmlstring = "";
	String searchParameter = "";
	int maxData = 0;
	int totalDataNum = 0;
	int totalPage = 0;
	String current_page = "1";
	jp.co.yobrain.util.DataFormat dataformat = null;
	Form form = (Form)request.getAttribute( "Restraunt.search.Form" );
	if( form == null ){
		form = new Form();
	}
	xmlstring = form.getListXmlStr();
	maxData = form.getMaxData();
	totalDataNum = form.getTotalDataNum();
	totalPage = form.getTotalPage();
	current_page = form.getPages();
	//this.getPages()
%>
<c:set var="xmlstr" ><%= xmlstring %></c:set>
<xml:parse var="restaurants" xml="${xmlstr}"></xml:parse>
<SCRIPT language="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;
//-->
</SCRIPT>
<SCRIPT language="javascript">
<!--
function nn4reload()
{
if( _bro == 2 ){
location.reload();
}
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
					<td VALIGN="BOTTOM" BACKGROUND="" nowrap ROWSPAN="2"><a HREF="http://www.lastminute.co.jp/" target="_parent"><img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="3" BORDER="0"></a></td>
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
          <td VALIGN="BOTTOM"><a href="http://www.lastminute.com/lmn/pso/catalog/Category.jhtml?CATID=95062">
          <img src="img/f9.gif" width="17" height="11" border="0" alt="belgium"></a></td>
          <td VALIGN="BOTTOM"><a href="http://www.nz.lastminute.com"><img src="img/f10.gif" width="17" height="11" border="0" alt="new zealand"></a></td>
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
	<IMG SRC="/img/res_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>
	<!-- ナビframe -->
	<NOLAYER>
	<IFRAME SRC="/lmj/navi.jhtml" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
				<ILAYER SRC="/lmj/navi.jhtml" WIDTH="147" HEIGHT="680"></ILAYER>
	<!-- /ナビframe -->
			</td>
			<!-- 調整 -->
			<td>
	<IMG SRC="/img/res_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
			<!-- /調整 -->
			<td VALIGN="TOP" ALIGN="center">
	<IMG SRC="/img/res_img/shim.gif" WIDTH="458" HEIGHT="1" alt=""><br>

				<!-- レストラン -->
				<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td><img SRC="/img/res_img/header_icon_rt.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
						<td valign='bottom'><br/><h3>レストラン<br>
		<img SRC="/img/res_img/blk.gif" WIDTH="391" HEIGHT="1" ALT=""><br/>
		<font class="txtcategory">
		|<a href='./search.do?catid=91&cookingType=1'>和食</a>|
		|<a href='./search.do?catid=91&cookingType=2'>洋食</a>|
		|<a href='./search.do?catid=91&cookingType=3'>中華</a>|
		|<a href='./search.do?catid=91&cookingType=21'>イタリアン</a>|
		|<a href='./search.do?catid=91&cookingType=22'>フレンチ</a>|
		|<a href='./search.do?catid=91&cookingType=4'>アジア･焼肉</a>|
		|<a href='./search.do?catid=91&cookingType=11'>すし</a>|
		|<a href='./search.do?catid=91&cookingType=23'>カフェ</a>|
		</font></h3></td>
					</tr>
				</table>
				<!-- レストラン -->
				<!-- タブ -->
				<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td WIDTH="168" VALIGN="BOTTOM"><img SRC="/img/res_img/tab_on_06.gif" WIDTH=168 HEIGHT=1 ALT=""></td>
						<td WIDTH="290" VALIGN="BOTTOM"><img SRC="/img/res_img/tab_dot.gif" WIDTH=290 HEIGHT=1 ALT=""></td>
					</tr>
				</table>
				<!-- /タブ -->
				<!-- リスト -->
				<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td BGCOLOR="#666666"><img SRC="/img/res_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
						<td COLSPAN="2" BGCOLOR="#F3F0EA"><img SRC="/img/res_img/shim.gif" WIDTH="10" HEIGHT="12" ALT=""></td>
						<td BGCOLOR="#666666"><img SRC="/img/res_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
					</tr>
					<tr>
						<td BGCOLOR="#666666"><img SRC="/img/res_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
						<td WIDTH="8" BGCOLOR="#F3F0EA"><img SRC="/img/res_img/shim.gif" WIDTH="8" HEIGHT="8" VSPACE="1" ALT=""></td>
						<td WIDTH="448" BGCOLOR="#F3F0EA">

							<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="438">
								<tr>
									<td VALIGN="TOP">
			<span CLASS="super14"><xml:out select='$restaurants//SEARCH_CONDITION/SCATID/SCATIDNAME' /></span><br>
			<br>
			</td>
								</tr>
								<tr>
									<td>

	<!-- 移動 -->
<% String searchParam = form.getScatid()
											+"&checkindate="+form.getCheckindate()
											+"&state_cd="+form.getState_cd()
											+"&cookingType="+form.getCookingType()
											+"&local_area_code="+form.getLocal_area_code()
											+"&scatid="+form.getScatid();
%>
	<table WIDTH="438" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td WIDTH="10"></td>
			<td ALIGN="RIGHT" WIDTH="428">
			<span CLASS="super14">
			<%= HtmlpartMaker.getPagingString( "/lmj/Hotel/search.do", searchParam, form.getPages(), form.getTotalpages() ) %>
			</span></td>
		</tr>
	</table>
	<!-- /移動 -->

			</td>
								</tr>
<!---------- data in --------------->

<!-------------- generated code start --------------->
<tr>
<td VALIGN="TOP"><img SRC="/img/res_img/line560.gif" WIDTH="438" HEIGHT="1" VSPACE="6" ALT=""></td>
</tr>
<xml:forEach select="$restaurants//tenpoinfo" >
	<tr>
		<td VALIGN="TOP">
			<span CLASS="b">[<xml:out select='basicinfo/cookingname' />]
			<a HREF="/lmj/Restraunt/detail.do?restaurant=<xml:out select='basicinfo/restaurant' />&checkindate=<%= form.getCheckindate() %>"><xml:out select='basicinfo/restaurantname' /></a>
			<br>・<xml:out select='basicinfo/comment_title' /></span><br>
		</td>
	</tr>

	<tr>
		<td>
<table bgcolor="#FFFFFF" width="100%" cellspacing="0" cellpadding="0">
<tr>
	<td bgcolor="#F3F0EA" align="center" width='40'>
	<img SRC="<xml:out select='basicinfo/imageuri' />" width="38" height="38"></td>
		<td bgcolor="#F3F0EA">
アクセス：<xml:out select='basicinfo/access_pnt' />  <br>
営業時間：<xml:out select='basicinfo/openedtime' />  <br>
予算：<xml:out select='basicinfo/budgetexsample' />	<br>
		</td>
	</tr>
</table>
</td>
<tr>
<td>
<table bgcolor="#666666" width="100%" cellspacing="1" cellpadding="1">
	<tr bgcolor="#FFFFFF">
		<td></td>
		<xml:forEach select="title//titleday" >
			<td class='txt10' align='center'><font color='#ff9900'>
			<xml:out select="day" />(<xml:out select="dayweek" />)</font>
			</td>
		</xml:forEach>
	</tr>
<xml:forEach select="sku//skuinfo" >
	<tr bgcolor="#FFFFFF">
		<td class='txt10' width='115'><xml:out select='skuname' /><br/>
		<font color='red'>(<xml:out select='viewmin' />～<xml:out select='viewmax' />)</font></td>
		<xml:forEach select="allotinfo//allotment" >
			<td align="center" width='45'>
			<xml:out select="ordernum/vorder" />
			</td>
		</xml:forEach>
	</tr>
</xml:forEach>
</table>
</td>
</tr>

<tr>
<td VALIGN="TOP"><img SRC="/img/res_img/line560.gif" WIDTH="438" HEIGHT="1" VSPACE="6" ALT=""></td>
</tr>
</xml:forEach>
<!-------------- generated code end --------------->
	<tr>
		<td HEIGHT="20" VALIGN="TOP">
		<!-- 移動 -->
		<table WIDTH="438" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td WIDTH="219"><a HREF="/lmj/Restraunt/top.do"><img src='/img/b_back.gif' width=56 height=20 border=0></a></td>
				<td ALIGN="RIGHT" WIDTH="219"><span CLASS="b"></td>
			</tr>
		</table>
		<!-- /移動 -->
		</td>
	</tr>
	</table>
	</td>
		<td BGCOLOR="#666666"><img SRC="/img/res_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
	</tr>
	<tr>
		<td BGCOLOR="#666666" COLSPAN="4"><img SRC="/img/res_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
	</tr>
	</table>
	<!-- /リスト -->
	</td>
			<!-- 調整 -->
			<td>
	<IMG SRC="/img/res_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
			<!-- /調整 -->
			<td VALIGN="TOP"><IMG SRC="/img/res_img/shim.gif" WIDTH="125" HEIGHT="1" alt=""><br>
			<!-- アドframe -->
	<NOLAYER>
	<IFRAME SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" NAME="" WIDTH="125" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" WIDTH="125" HEIGHT="680"></ILAYER>
				<!-- /アドframe -->
	</td>
		</tr>
	</table>
</center>
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

</body>
</html>

