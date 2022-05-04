<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.Entertainment.top.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%	ParseFormat pf = null;	%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/Ahtml; charset=Shift_JIS">
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">
<SCRIPT language="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;
function nn4reload(){
if( _bro == 2 ){location.reload();}}
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

  <table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760" height="710">
    <tr>
	  <td VALIGN="TOP" height="715"> <IMG SRC="/img/tkt_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>
<!-- ナビframe -->
	<NOLAYER>
	<IFRAME SRC="/lmj/navi.jhtml" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="/lmj/navi.jhtml" WIDTH="147" HEIGHT="680"></ILAYER>
<!-- /ナビframe -->
	</td>
<!-- 調整6010006 -->
	  <td height="715"> <IMG SRC="/img/tkt_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整6010006 -->

	  <td VALIGN="TOP" ALIGN="center" height="715" > <IMG SRC="/img/tkt_img/shim.gif" WIDTH="458" HEIGHT="1" alt=""><br>

<!-- チケット -->
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td><img SRC="/img/tkt_img/header_icon_tc.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
		<td><h3>エンターテーメント・チケット<br>
		<img SRC="/img/tkt_img/blk.gif" WIDTH="391" HEIGHT="1" ALT=""><br>
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

		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td WIDTH="45" VALIGN="BOTTOM"><img SRC="/img/tkt_img/tab_on_06.gif" WIDTH=45 HEIGHT=1 ALT=""></td>
		    <td WIDTH="123" VALIGN="BOTTOM"><img SRC="/img/tkt_img/tab_dot.gif" WIDTH=123 HEIGHT=1 ALT=""></td>
		<td WIDTH="290" VALIGN="BOTTOM"><img SRC="/img/tkt_img/tab_dot.gif" WIDTH=290 HEIGHT=1 ALT=""></td>
		</tr>
		</table>

		<table BORDER="0" CELLSPACING="0" CELLPADDING="0">
          <tr>
		<td BGCOLOR="#666666"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td COLSPAN="2" BGCOLOR="#F3F0EA"><img SRC="/img/tkt_img/shim.gif" WIDTH="10" HEIGHT="8" ALT="">
		</td>
		<td BGCOLOR="#666666"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="8" BGCOLOR="#F3F0EA"><img SRC="/img/tkt_img/shim.gif" WIDTH="8" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="448" BGCOLOR="#F3F0EA">

<%
	Form form = (Form)request.getAttribute( "Entertainment.top.Form" );
	String xmlstring = form.getXmlstring();
	jp.co.yobrain.util.DataFormat dataformat = null;
%>
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="pageamount" xml="${xmlstr}"></xml:parse>
			  <table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="438">
			  				<tr>
									<td BGCOLOR="#F3F0EA" WIDTH="440" colspan='2'>
									<span CLASS="super14"><xml:out select='$pageamount//title' /></span>
									</td>
								</tr>
                <tr>
                	<td COLSPAN="2" VALIGN="TOP">
<table CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="434">
	<tr>
<xml:forEach select="$pageamount//products/topix/production" >
		<td VALIGN="TOP" WIDTH='150' height='160'>
		<table BGCOLOR="#999999" CELLPADDING="1" CELLSPACING="0" BORDER="0" WIDTH="100%">
			<tr>
				<td>
				<table CELLPADDING="4" CELLSPACING="0" BORDER="0" WIDTH="100%"  height='160'>
				<tr>
					<td ALIGN="CENTER" BGCOLOR="#FFFFFF"><a HREF="./detail.do?catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">

					<img SRC="/img/gift/<xml:out select='product/prod_id'/>-3.gif" WIDTH="130" HEIGHT="75" ALT="<xml:out select='product/name' />" border="0"></a></td>
				</tr>
				<tr>
					<td BGCOLOR="#FFFFFF"><a HREF="./detail.do?catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">
					<span CLASS="b"><xml:out select='product/name' /></span></a>
					<br>
					<span CLASS="txt10"><xml:out select='plan/scatid_description' /> </span></td>
				</tr>
				<tr>
					<td CLASS="txt10b" ALIGN="RIGHT" BGCOLOR="#FFFFFF"><xml:out select='product/copy/pricestr' /> 円
					</td>
				</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
</xml:forEach>
	</tr>
</table>

                	</td>
                </tr>
<xml:forEach select="$pageamount//products/list/production" >
                <tr>
                	<td colspan="2"><br/></td>
                </tr>
                <tr>
                  <td WIDTH="39" VALIGN="TOP" height="40">
                  <img src="/img/scatid_img/<xml:out select='plan/scatid' />.gif" width="32" height="32" hspace="3" alt=""></td>
                  <td WIDTH="399" height="40">
                  <a HREF="./detail.do?catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">
                  <span CLASS="b"><xml:out select='product/name' /></span></a><br>
                    <span class="txt10b"><xml:out select='product/copy/pricestr' /></span><br>
                    <span class="txt10"><xml:out select='product/copy/comment' /></span></td>
                </tr>
</xml:forEach>
                  <td COLSPAN="2"></td>
                  <td COLSPAN="2" width="1">　</td>
              </table>

		</td>
		<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" COLSPAN="4"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		</table>
		<br>

	</td>
<!-- 調整 -->
	  <td height="715"> <IMG SRC="/img/tkt_img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整 -->

	  <td VALIGN="TOP" height="715"> <IMG SRC="/img/tkt_img/shim.gif" WIDTH="125" HEIGHT="1" alt=""><br>
<!-- アドframe -->
	<NOLAYER><IFRAME SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" NAME="" WIDTH="125" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	    <ILAYER SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" WIDTH="125" HEIGHT="680" left="-8" top="2"></ILAYER>
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
