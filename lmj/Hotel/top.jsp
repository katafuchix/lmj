<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.common.HtmlpartMaker,
								 jp.co.lastminute.Hotel.areas.*,
								 jp.co.lastminute.Hotel.localarea.*,
								 jp.co.lastminute.Hotel.top.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%
	ServletContext servletContext = getServletContext();
	Form form = null;
	if( request.getAttribute( "Hotel.top.Form" ) != null ){
		form = (Form)request.getAttribute( "Hotel.top.Form" );
	}else{
		form = new Form();
	}
	String xmlstring = form.getXmlstring();

	int AfterDays = 30;

	//ローカルエリア用コンボ
	LocalAreaJsmaker jsmaker = new LocalAreaJsmaker( servletContext );
	String jsString = jsmaker.getAllElement();

	//HTMLで保持することにします
	//String localareacdStr = jsmaker.getAreaCombopart();

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
//-->
</SCRIPT>
<SCRIPT language="javascript">
<!--
var reload = 0;

function nn4reload() {
	if( _bro == 2 ){
		location.reload();
	}
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}


//-->
</SCRIPT>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0" onload="selectChange();" onResize="nn4reload();">

<!-- ヘッダframe -->
	<center>
	<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER" HEIGHT="65" BACKGROUND="/img/head_e.jpg">
	<tr>
	<td VALIGN="TOP">
	<table WIDTH="760" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="65">
		<tr>
			<td VALIGN="BOTTOM" BACKGROUND="" nowrap ROWSPAN="2">
			<a HREF="http://www.lastminute.co.jp/"><img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="3" BORDER="0"></a></td>
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
<!-- /ヘッダframe -->

<!-- レイアウト -->
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760">
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

	<td VALIGN="TOP" ALIGN="center">
	<IMG SRC="/img/shim.gif" WIDTH="458" HEIGHT="1" alt=""><br>

	<!-- 国内ホテル・やど -->
        <TABLE cellSpacing=0 cellPadding=0 width=458 border=0>
          <TR> 
            <TD align=left width=67 rowspan="2" valign="middle" > <img src="/img/header_icon_ds.gif" width="67" height="65"> 
            </TD>
            <TD class="txt16b" valign="middle"> 
              <table border="0" cellspacing="0" cellpadding="0" width="391" align="center">
                <tr> 
                  <td valign="bottom" class="txt16b">国内ホテル・やど　<span class="txt12">DOMESTIC　HOTELS</span></td>
                </tr>
                <tr> 
                  <td height="5"><img src="/img/blk.gif" width="391" height="1"></td>
                </tr>
                <tr> 
                  <td class="b"> 
                    <div align="left"><b><img src="/img/pont2.gif" width="10" height="10"> 
                      <span class="orgb"> LMJおすすめ</span> <img src="/img/pont2.gif" width="10" height="10"> 
                      <a href="#kensaku"> かんたん検索</a> <img src="/img/pont2.gif" width="10" height="10">
                      <a href="/lmj/Hotel/from_postalArea.jsp"> 目的地から検索</a></b></div></h3>
                  </td>
                </tr>
                <tr> 
                  <td class="b">＜サーバーメンテナンスのお知らせ＞<br/>
									下記の時間帯、サーバーのメンテナンスを行います。<br/>
									この間国内ホテル・やど予約の一部の商品検索・予約ができなくなります。<br/>
									ご迷惑をおかけいたしますが、あらかじめご了承下さい。<br/>
									◆日時：10月18日（土）02:00～06:00（予定）<br/>
									◆関連ページ：日本旅行提供のホテル・旅館ページ <br/>
                  </td>
                </tr>

              </table>
            </TD>
          </TR>
          <TR > 
            <TD valign="top" height="7"> 
            </TD>
          </TR>
        </TABLE>
<!-- /国内ホテル・やど -->
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="pageamount" xml="${xmlstr}"></xml:parse>
<table WIDTH=458 BORDER=0 CELLPADDING=0 CELLSPACING=0>
<tr>
<td VALIGN="BOTTOM" width='45'><img SRC="/img/tkt_img/tab_on_06.gif" WIDTH='45' HEIGHT=1 ALT=""></td>
<td VALIGN="BOTTOM" width='413'><img SRC="/img/tkt_img/tab_dot.gif" WIDTH='413' HEIGHT=1 ALT=""></td>
</tr>
</table>

<!-- プラン -->
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td COLSPAN="3" BGCOLOR="#F3F0EA"><img SRC="/img/shim.gif" WIDTH="10" HEIGHT="8" ALT=""></td>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="8" BGCOLOR="#F3F0EA"><img SRC="/img/shim.gif" WIDTH="8" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="283" BGCOLOR="#F3F0EA">

<table WIDTH="275" CELLPADDING="2" CELLSPACING="0" BORDER="0">

	<% int couter = 0;	%>
	<xml:forEach select="$pageamount//products/topix/production" >
		<%	if( couter < 4 ){	%>
		<tr>
			<td WIDTH="45" VALIGN="TOP">
				<a HREF="./detail.do?agtcode=<xml:out select='product/agt_cd' />&supnbr=<xml:out select='product/supnbr' />&catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">
				<img height="38" width="52" border="0" src="/img/hotel/<xml:out select='product/supnbr' />_0.gif"></a>
			</td>
			<td WIDTH="230">
				<span CLASS="txt12b"><xml:out select='plan/scatid_catch_copy' /></span><br>
				<a HREF="./detail.do?agtcode=<xml:out select='product/agt_cd' />&supnbr=<xml:out select='product/supnbr' />&catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">				
				<span CLASS="txt12b"><xml:out select='product/name' /></a></span>
				<br/>
				<span CLASS="txt10"><xml:out select='plan/scatid_description' /></span>
			</td>
		</tr>
		<tr>
			<td align='right' colspan="2">
				<span CLASS="txt12">
				<xml:out select='plan/scatid_catch_copy' />は
				<B><a href="/lmj/Hotel/search.do?scatid=<xml:out select='plan/scatid' />">こちら</a></B>から</span>
			</td>
		</tr>
		<tr>
			<td COLSPAN="2">
				<img ALT="" VSPACE="6" HEIGHT="1" WIDTH="269" SRC="/img/line269.gif">
			</td>
		</tr>
		<% couter++;	%>
		<% } %>
	</xml:forEach>

<tr>
<td COLSPAN="2"><img ALT="" HEIGHT="8" WIDTH="1" SRC="/img/shim.gif"></td>
</tr>
</table>
		</td>


		<!--　スカイスクレーパー&バナー-->
<!-- 030912 SystemDown, So I ajust Please rewite when System was recover
		<td WIDTH="165" BGCOLOR="#F3F0EA" VALIGN="TOP">
		<a HREF="/cgi-bin/banner/bannerjump.cgi?cate=pbanner"><img SRC="/cgi-bin/banner/bannerout.cgi?cate=pbanner" WIDTH="157" BORDER="0" ALT=""></a>
</td>
-->
<td WIDTH="165" BGCOLOR="#F3F0EA" VALIGN="TOP">
<a HREF="/tokusyu/yado2/index.html">
<img SRC="/tokusyu/yado2/img/banner.gif" WIDTH="157" BORDER="0" ALT=""></a>
<br/> <br/>
<!--<a href="http://www.lastminute.co.jp/newsletter/1008/hilton.html"><img src="/hotel/tokyobay.gif" width="157" height="50" border="0"></a>-->
</td>
<!-- modify end -->
		<!--　/スカイスクレーパー&バナー-->


		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" COLSPAN="5"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</table>

<%
	Areashandler areashandler = new Areashandler();
	areashandler.setServletContext( servletContext );
	areashandler.setRequest( request );
	String[] checkIn = areashandler.getHtmlverCheckin( "checkindate" );
	String[] optionsnum = {"1", "2", "3"};
%>
		<br/><a name="kensaku"></a>
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
       <TR> 
       	<TD width="32" > 
        	<div align="left"><img src="/img/header_icon_is.gif" width="28" height="28"> 
          </div>
        </TD>
        <TD width="426">
				 <span class="txt14b">かんたん検索</span>　<span class="b">INSTANT　SEARCH</span> 
        </TD>
       </TR>
       <TR bgcolor="#F3F0EA"> 
       	<TD colspan="2" height="3"><img width="3" height="1"></TD>
       </TR>
		</table>
		<br/>
		<TABLE WIDTH=458 BORDER=0 CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
			<TR bgcolor="#FFFFFF">
				<TD ALIGN="center" WIDTH="458">
					<form name='AreaSelector' method='get' ACTION='/lmj/Hotel/search.do' onSubmit='return goSearch();'>
					<table BORDER="0" CELLSPACING="0" CELLPADDING="2" WIDTH="100%" ALIGN="center">
						<INPUT TYPE='hidden' name='Searchtype' value='localarea'/>
			      <INPUT TYPE='hidden' name='act' value='<%= form.getAct() %>'/>
			      <input type='hidden' name='yyyy' value='0000'/>
						<input type='hidden' name='mm' />
						<input type='hidden' name='dd' />
						<input type='hidden' name='checkindate' value='<%= checkIn[0] %>' />
						<input type='hidden' name='night' value='1' />

			  	  <tr>
			       	<td colspan='3'><span class="b">　1.エリアとチェックイン日で検索</span></td>
				    </tr>
			      <tr>
			        <td width="94" align="right" valign="top" colspan='1'>
			        	エリア：
			        </td>
			      	<td colspan='1' width="64" valign="top">
					     	<select name='local_area_cd' onChange="selectChange();">
									<option value=0>北海道・東北</option>
									<option value=1 selected>関東</option>
									<option value=2>上信越・北陸</option>
									<option value=3>東海</option>
									<option value=4>関西</option>
									<option value=5>中国</option>
									<option value=6>九州・沖縄</option>
						     	<!-- localareacdStr -->
					     	</select>
							</td>
			        <td align="left" valign="top" colspan='1'>
						  	<select name='local_area_code' size='10'></select>
			        </td>
						</tr>
						<tr>
			        <td width="94" align="right" colspan='1'>
			        	チェックイン日：
			        </td>
			      	<td colspan='2' valign="top">
						  	<input type="text" size='12' name='checkindate_dis' value='<%= checkIn[1] %>' readonly>　
								<a href="JavaScript:getCalendar();"><IMG src="/img/calendar.gif" border=0 WIDTH="35" HEIGHT="20" ALIGN="ABSBOTTOM" alt='カレンダーから選択' /></a>
							</td>
						</tr>
			  	  <tr>
			       	<td colspan='3' align="right">
								<INPUT TYPE="image" SRC="/img/search.gif" WIDTH="74" HEIGHT="23" BORDER="0">
							</td>
				    </tr>
					</form>
					</table>
				</td>
			</tr>
			<TR bgcolor="#FFFFFF">
				<TD ALIGN="center" WIDTH="458">
					<form name='PrefSelector' method='get' ACTION='/lmj/Hotel/search.do'>
					<table BORDER="0" CELLSPACING="0" CELLPADDING="2" WIDTH="100%">
						<INPUT TYPE='hidden' name='Searchtype' value='postalarea'/>
			      <INPUT TYPE='hidden' name='act' value='<%= form.getAct() %>'/>
			      <input type='hidden' name='yyyy' value='0000'/>
						<input type='hidden' name='mm' />
						<input type='hidden' name='dd' />
						<input type='hidden' name='checkindate' value='<%= checkIn[0] %>' />
						<input type='hidden' name='night' value='1' />

				  	  <tr>
				       	<td colspan='3'><span class="b">　2.都道府県･市町村区で検索</span></td>
					    </tr>
							<tr>
				        <td width="94" align="right" colspan='1'>
				        	都道府県：
				        </td>
				      	<td colspan='2' valign="top">
				      		<select name='state_cd'>
				      		<%=	areashandler.getHtmlverState() %>
				      		</select>
								</td>
							</tr>
				  	  <tr>
				       	<td colspan='3' align="right">
									<INPUT TYPE="image" SRC="/img/search.gif" WIDTH="74" HEIGHT="23" BORDER="0">
								</td>
					    </tr>
						</table>
    <!-- フォーム -->
				</td>
			</tr>
		</table>
</form>
<!-- /検索 -->
	</td>

	<td VALIGN="TOP">
	<IMG SRC="/img/shim.gif" WIDTH="125" HEIGHT="1" alt=""><br>

<!-- アドframe -->
<A HREF="http://ads.lmj.valueclick.jp/redirect?host=hs0000797&size=125x600&b=indexpage&v=0" TARGET="_top"><IMG BORDER="0" WIDTH="125" HEIGHT="600" ALT="Click here to visit our sponsor"
SRC="http://ads.lmj.valueclick.jp/cycle?host=hs0000797&size=125x600&b=indexpage&noscript=1"></A>
<!-- /アドframe -->

	</td>
	</tr>
	</table>
<%

%>
	</center>
<!-- /レイアウト -->
<!-- 検索用ＪＳ　-->
<script language="JavaScript">
<!--
	function SelectBox(name,code,parent){
		this.name = name;
		this.code = code;
		this.parent = parent;
	}
	var sel = new Array();
	var cat = new Array();
	///コンボの生成
	function selectChange() {
		document.forms["AreaSelector"].elements["local_area_code"].options.length = 0;
		document.forms["AreaSelector"].elements["local_area_code"].options.length=0;
		var target = document.forms["AreaSelector"].elements["local_area_cd"].value;
		var seltarget = "";
		var numcount = 0;
		for(jj=0; jj<cat.length;jj++){			
			if( cat[jj].parent == target ){
				seltarget = cat[jj].code;
				document.forms["AreaSelector"].elements["local_area_code"].options[numcount] 
					= new Option(cat[jj].name);
				document.forms["AreaSelector"].elements["local_area_code"].options[numcount].value 
					= seltarget;
				numcount++;
				for(i=0;i<sel.length;i++){
					if( sel[i].parent == seltarget){
						document.forms["AreaSelector"].elements["local_area_code"].options[numcount] 
							= new Option(sel[i].name);
						document.forms["AreaSelector"].elements["local_area_code"].options[numcount].value 
							= sel[i].code;
						numcount++;
					}
				}
			}
		}
	}
	function reSetLocalAreaCombo(){
		document.forms["AreaSelector"].elements["local_area_code"].options.length = 0;
		document.forms["AreaSelector"].elements["local_area_code"].options[0] = new Option("-----しばらくお待ちください-----");
		document.forms["AreaSelector"].elements["local_area_code"].options[0].value = "";
	}
	function reloadCheck(){
		if( reload != 0 ){
			window.status = "検索中です。しばらくお待ち下さい。";
			return false;
		}else{
			reload = 1;
			return true;
		}
	}

	function goSearch()	{

		//alert( document.forms[0].elements['local_area_code'].value );
		if( document.forms[0].elements['local_area_code'].value < 100){
			alert("エリアをお選びください");
			return false;
		}
		return reloadCheck();
	}

	//カレンダーのＵＰ
	function getCalendar(){
		var cal = "Calendar.jsp?yyyy=yyyy&mm=mm&dd=dd&displayFieldName=checkindate_dis&order=0&formName=AreaSelector&AfterDays=<%= AfterDays %>&yearmonth=&stopsaledays=0";
		var winobject = window.open("","cal","width=200,height=215,scrollbars=no,resizable=no,menubar=no,status=no,toolbar=no,location=no,directories=no");
		if (winobject != null) {
		    	winobject.location = cal;
		  	}
		winobject.focus();
	}
	function changeSelection( num ){
		if( num == '0'){
			document.forms[0].elements['state_cd'].selectedIndex = 0;
			document.forms[0].elements['state_cd'].disabled = "disabled";
			document.forms[0].elements['local_area_cd'].disabled = "";
			document.forms[0].elements['local_area_code'].disabled = "";
			//document.forms[0].elements['productname'].value = "";
			//document.forms[0].elements['productname'].disabled = "";
		}else if( num == '1'){
			document.forms[0].elements['state_cd'].disabled = "";
			document.forms[0].elements['local_area_cd'].disabled = "disabled";
			document.forms[0].elements['local_area_code'].disabled = "disabled";
			document.forms[0].elements['local_area_code'].length = 0;
			//document.forms[0].elements['productname'].value = "";
			//document.forms[0].elements['productname'].disabled = "disabled";
			reSetLocalAreaCombo();
		}else if( num == '2'){
			document.forms[0].elements['state_cd'].selectedIndex = 0;
			document.forms[0].elements['state_cd'].disabled = "disabled";
			//document.forms[0].elements['productname'].disabled = "";
			document.forms[0].elements['local_area_cd'].disabled = "disabled";
			document.forms[0].elements['local_area_code'].disabled = "disabled";
			document.forms[0].elements['local_area_code'].length = 0;
			reSetLocalAreaCombo();
		}
		radioDef( num );
	}
	function radioDef( nums ){
		var radios = document.forms[0].Searchtype;
		for( var i=0; i<radios.length; i++ ){
			if( i == nums ){
				radios[ i ].checked = true;
			}else{
				radios[ i ].checked = false;
			}
		}
	}
	reSetLocalAreaCombo();
	//changeSelection( 0 );
<%= jsString %>
//-->
</script>
<!-- 検索用ＪＳ　-->
<!-- コピーライトframe -->
	<center>
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
	</center>
<!-- /コピーライトframe -->



<!-- Omnituer Section -->
<script language="JavaScript">
<!--
/* You may give each page an identifying name, server, and channel on
the next lines. */

var s_pageName="DHOTEL_INDEX"
var s_server="www.lastminute.co.jp"
var s_channel="DHOTEL"
var s_pageType=""
var s_prop1="DHOTEL_INDEX_TOP"
var s_code=' '

//-->
</script>
<script language="JavaScript" src="http://www.lastminute.co.jp/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<!-- Omnituer Section -->

</body>
</html>
