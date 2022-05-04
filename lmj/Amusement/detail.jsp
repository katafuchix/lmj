<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.lastminute.*,
								 jp.co.lastminute.cart.Constants,
								 jp.co.lastminute.cart.model.Order,
								 jp.co.lastminute.Amusement.detail.*" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%
	int type_cd = Constants.Amuse;
	String serverUrl = "https://"+request.getServerName() + "/lmj/Amusement/cartRegistration.do;jsessionid=" + session.getId();
	//
	Form form = null;
	if( request.getAttribute( "Amusement.detail.Form" ) == null ){
		form = new Form();
	}else{
		form = (Form)request.getAttribute( "Amusement.detail.Form" );
	}
	String xmlstring = form.getXmlstring();
	String allotmentxml = form.getAllotementxml();

	int user_id = 0;
	int order_no = 0;
	if( session.getAttribute( Constants.CartOrder ) != null ){
		Order order = (Order)session.getAttribute( Constants.CartOrder );
		user_id	 = order.getUSER_ID();
		order_no = order.getORDER_NO();
	}
	int counter = 0;
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
		remoteWins = window.open("","HowtoByeAmusement",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=550,height=500,alwaysRaised=1');
		if (remoteWins != null) {
		  remoteWins.location = "/help/Amusement.html";
		}
		remoteWins.focus();
	}
var reload = 0;
function reloadCheck(){
		if( reload != 0 ){	window.status = "サーバーに問合せ中です。しばらくお待ち下さい。";
			return false;
		}else{	reload = 1; return true;	}
}
//-->
</SCRIPT>
</head>
	<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">

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
		<td><h3>アミューズメント<br>
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
		</table>
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
		  	</td>
			</tr>
			<tr>
				<td align="left"><xml:out select='$pageamount//catchcopy'/></td>
			</tr>
			</table>
<input type='hidden' name='viewsending' size='6' disabled="disabled" class="textbox_white">
<input type="hidden" name='orderNumber' value='<%= order_no %>'>
<input type='hidden' name='subOrderNumber' value='0'>
<input type="hidden" name='userId' value='<%= user_id %>'>
<input type="hidden" name='agt_prod_cd' value='<%= form.getAgt_prod_cd() %>'>
<input type='hidden' name='agtcode' value='<xml:out select='$pageamount//agt_cd'/>' />
<input type='hidden' name='productTypeCode' value='<%= type_cd %>' />
<input type='hidden' name='title' value='<xml:out select='$pageamount//product_name'/>' />
<input type='hidden' name='connectionStyle' value='0' />
<input type='hidden' name='pax' value='1' />
<input type='hidden' name='lastsale' />
<input type='hidden' name='endsale' />
<input type='hidden' name='mapinfo' value='<xml:out select="$pageamount//play_place"/>
<xml:out select="$pageamount//pointofaccess"/>'/>
<input type='hidden' name='mapurlinfo' value='<xml:out select="$pageamount//accesspoint_url" />' />
<%	if( allotmentxml.length() > 0 ){	%>
			<table WIDTH="548" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td width='90' valign='top' rowspan='1'>
				<a href="javascript:history.back()">
				<img SRC="/img/tkt_img/btt_back.gif" WIDTH="74" HEIGHT="23" BORDER="0" alt=""></a>
				</td>
<td ALIGN="LEFT" valign='top' colspan='1'>
<!------->
<%=	allotmentxml %>
<!------->
			</td>
			<td ALIGN="RIGHT" valign='top'>
			<input type="image" src="/img/btt_buy.gif" width="74" height="23" border="0" alt="申し込む">
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
<img src='/<%= ContextProperty._Amuse_image_Dir %><xml:out select="$pageamount//product_seq" />-4.gif' width='200'/>
				</td>
				<td BGCOLOR="#F3F0EA" width='8'>&nbsp;&nbsp;
				</td>
				<td valign='top' BGCOLOR="#999999" width='320'>
<!-- チケット詳細 -->
					<table BORDER="0" CELLSPACING="1" CELLPADDING="3" width='100%'>
<%	if( allotmentxml.length() > 0 ){	%>
						<tr>
              <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='70'>ポイント</td>
              <td BGCOLOR="#FFFFFF"><xml:out select="$pageamount//price_catch" />
            </tr>
<%	}else{	%>
						<tr>
							<td BGCOLOR="#FFFFFF" CLASS="b" VALIGN="TOP" colspan='2'>
							<font color='red'>申し訳ありません。売切れです</font></td>
						</tr>
<%	}	%>
            <tr>
              <td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP">会場<br/><br/>
<xml:if select="$pageamount//accesspoint_url[not(.='')] ">
<a href="<xml:out select='$pageamount//accesspoint_url' />" target='_blank'><img src='/img/map.gif' width='25' border='0' alt='[地図]'/></a></xml:if>
              </td>
<td BGCOLOR="#FFFFFF"><pre><xml:out select='$pageamount//play_place'/>
<xml:out select='$pageamount//pointofaccess'/></pre></td>
            </tr>
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
							<td BGCOLOR="#FFFFFF" colspan='2'>
							<a href="<xml:out select='$pageamount//linkedurl'/>" target='_blank'>詳細情報はこちらです。</a>
							</td>
						</tr>
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
<xml:if select="$pageamount//attention[not(.='')] ">
<br/>
<table WIDTH='420' BORDER='0' CELLSPACING='0' CELLPADDING='0' align='right'>
	<tr>
		<td bgcolor='#FFFFFF' width='100%'><pre><xml:out select='$pageamount//attention'/></pre>
		</td>
	</tr>
</table>
</xml:if>
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
</body>
</html>
