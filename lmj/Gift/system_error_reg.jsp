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
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" height="72">
	<tr>
	<td valign="top">
	<NOLAYER>
	<IFRAME SRC="/top.html" NAME="" WIDTH="760" HEIGHT="65" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="/top.html" WIDTH="760" HEIGHT="65"></ILAYER>
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

<!-- エアーチケット
		<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td><img SRC="/img/flights_img/header_icon_at.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
		<td WIDTH="531" valign="bottom"><h3>国内航空券</br>
		<img SRC="/img/flights_img/blk.gif" WIDTH="531" HEIGHT="1" ALT=""><br>
		<img SRC="/img/flights_img/header_txt_at_03.gif" WIDTH="57" HEIGHT="13" ALT=""></h3></td>
		</tr>
		</table>
 -->
        <table cellSpacing=0 cellPadding=0 width=598 border=0>
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
												<!--
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=index">LMJおすすめ</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=purpose">カテゴリー別</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<span class="orgb">プライス別</span>　
												<img src="/img/pont2.gif" width="10" height="10">　<span class="orgb">LMJおすすめ</span>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=purpose">カテゴリー別</A>　
												<img src="/img/pont2.gif" width="10" height="10">　<A HREF="/lmj/Gift/top.do?act=price">プライス別</A>
												-->
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
			<table BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="580">
			<tr>
			<td WIDTH="9"><img SRC="/img/flights_img/point_bule.gif" WIDTH="7" HEIGHT="7" ALT=""></td>
			<td CLASS="buleb" WIDTH="568"><span CLASS="b">システムが大変混み合っております。</span></td>
			</tr>
			<tr BGCOLOR="#0066CC">
			<td HEIGHT="2" COLSPAN="2"><img SRC="/img/flights_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
			</tr>
			</table>


			<table WIDTH="580" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
<!-- /お問い合わせフォーム -->

			<table WIDTH="580" BORDER="0" CELLSPACING="0" CELLPADDING="2">
			<tr>
			<td width="30" VALIGN="TOP" CLASS="txt10" align="right">・</td>
			<td width="550" CLASS="txt12">もしくは商品が売れ切れの場合がございます。<br/>
			前の画面にて、画面を更新のうえ数量をお確かめください。</td>
			</tr>
			</table>
			<br>
			<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="580">
			<tr>
			<td ALIGN="LEFT">
			<a HREF="javascript:history.back();"><img SRC="/img/flights_img/btt_back.gif" WIDTH="74" HEIGHT="23" alt="" border="0"></a>
			</td>
			<td ALIGN="RIGHT">
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
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER">
	<tr>
	<td>
	<NOLAYER>
	<IFRAME SRC="/copy.html" NAME="" WIDTH="770" HEIGHT="60" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="/copy.html" WIDTH="770" HEIGHT="60"></ILAYER>
	</td>
	</tr>
	</table>
<!-- /コピーライトframe -->

</center>
</BODY>
</html:html>

