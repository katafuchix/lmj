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
	String localareacdStr = jsmaker.getAreaCombopart();
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
<!-- 調整 -->
	<td>
	<IMG SRC="/img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整 -->

	<td VALIGN="TOP" ALIGN="center">
	<IMG SRC="/img/shim.gif" WIDTH="458" HEIGHT="1" alt=""><br>

<!-- 国内ホテル・やど -->
<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td BACKGROUND="/img/header_icon_ds.gif" WIDTH="67" HEIGHT="65">
		</td>
		<td valign="bottom"><h3>国内ホテル・やど</br>
		<img SRC="/img/flights_img/blk.gif" WIDTH="391" HEIGHT="1" ALT=""><br>
		<font class="txtcategory">
		|<%= HtmlpartMaker.getLinkList( "/lmj/Hotel/top.do?act=", "index", "おすすめホテル・宿", form.getAct() ) %>|
		|<a href="/lmj/Hotel/from_postalArea.jsp">地図より</a>|
<!--		|<%= HtmlpartMaker.getLinkList( "/lmj/Hotel/top.do?act=", "areas", "おすすめはここ", form.getAct() ) %>| -->
</font>
		</h3>
		</td>
		</tr>
		</table>
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="pageamount" xml="${xmlstr}"></xml:parse>
<!-- /国内ホテル・やど -->
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

<table WIDTH="275" CELLPADDING="0" CELLSPACING="0" BORDER="0">

<xml:forEach select="$pageamount//products/topix/production" >


<tr>
<td WIDTH="45" VALIGN="TOP"><a HREF="./detail.do?agtcode=<xml:out select='product/agt_cd' />&supnbr=<xml:out select='product/supnbr' />&catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">
<img width="38" height="38" border="0" src="/img/hotel/<xml:out select='product/supnbr' />_0.gif"></a></td>
<td WIDTH="230">
	<span CLASS="txt10"><xml:out select='plan/scatid_catch_copy' /></span>
<br><a HREF="./detail.do?agtcode=<xml:out select='product/agt_cd' />&supnbr=<xml:out select='product/supnbr' />&catid=<xml:out select='plan/catid'/>">
<span CLASS="b"><xml:out select='product/name' /></a></span>
<br/>
<span CLASS="txt10orgb"><xml:out select='plan/scatid_description' /></span>
</td>
</tr>
<tr>
	<td align='right' colspan="2">
	<span CLASS="txt10purb"><a href="/lmj/Hotel/search.do?scatid=<xml:out select='plan/scatid' />">Others&gt;&gt;</a></span></td>
</tr>
<tr>
<td COLSPAN="2"><img ALT="" VSPACE="6" HEIGHT="1" WIDTH="269" SRC="/img/line269.gif"></td>
</tr>
</xml:forEach>


<tr>
<td COLSPAN="2"><img ALT="" HEIGHT="8" WIDTH="1" SRC="/img/shim.gif"></td>
</tr>
</table>
		</td>
		<td WIDTH="165" BGCOLOR="#F3F0EA" VALIGN="TOP">
		<a HREF="/cgi-bin/banner/bannerjump.cgi?cate=pbanner"><img SRC="/cgi-bin/banner/bannerout.cgi?cate=pbanner" WIDTH="157" BORDER="0" ALT=""></a></td>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" COLSPAN="5"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		</table>
<!-- /プラン -->
<%
	Areashandler areashandler = new Areashandler();
	areashandler.setServletContext( servletContext );
	areashandler.setRequest( request );
	String[] checkIn = areashandler.getHtmlverCheckin( "checkindate" );
	String[] optionsnum = {"1", "2", "3"};
%>
<!-- 検索 -->
<form name='AreaSelector' method='get' ACTION='/lmj/Hotel/search.do' onSubmit="return goSearch();">
		<table WIDTH="475" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
			<td WIDTH="47"><img SRC="/img/header_icon_is.gif" WIDTH="47" ALT=""></td>
			<td WIDTH="428"><b>インスタント・サーチ</b><br>
			<img SRC="/img/blk.gif" WIDTH="409" HEIGHT="1" ALT=""><br>
			<!--
			<img SRC="/img/header_txt_is_03.gif" WIDTH="121" HEIGHT="14" ALT="">
			-->
			<div align='right'>
[エリア]から<input type='checkbox' name='Searchtype' value='localarea' onClick="JavaScript:changeSelection( 0 );"/>&nbsp;
[都道府県]から<input type='checkbox' name='Searchtype' value='postalarea' onClick="JavaScript:changeSelection( 1 );"/>&nbsp;
[キーワード]から<input type='checkbox' name='Searchtype' value='productname' onClick="JavaScript:changeSelection( 2 );"/>&nbsp;
			&nbsp;&nbsp;&nbsp;</div>
			</td>
			</tr>
		</table>
		<TABLE WIDTH=475 BORDER=0 CELLPADDING=0 CELLSPACING=0>
			<TR>
				<TD ALIGN="left" WIDTH="47">
				<TD ALIGN="left" WIDTH="428">
		<!-- フォーム -->
		<table BORDER="0" CELLSPACING="0" CELLPADDING="2" ALIGN="keft" WIDTH="428">
      <INPUT TYPE='hidden' name='act' value='<%= form.getAct() %>'/>
      <input type='hidden' name='yyyy' value='0000'/>
			<input type='hidden' name='mm' />
			<input type='hidden' name='dd' />
			<input type='hidden' name='checkindate' value='<%= checkIn[0] %>' />
<!--
      <tr>
      	<td colspan='5' align='left' valign='top'>
[エリア]から<input type='checkbox' name='Searchtype' value='localarea' onClick="JavaScript:changeSelection( 0 );"/>&nbsp;
[都道府県]から<input type='checkbox' name='Searchtype' value='postalarea' onClick="JavaScript:changeSelection( 1 );"/>&nbsp;
[施設名]から<input type='checkbox' name='Searchtype' value='productname' onClick="JavaScript:changeSelection( 2 );"/>&nbsp;
      	</td>
      </tr>
-->
      <tr>
       	<td colspan='5'><img SRC="/img/line269.gif" WIDTH="409" HEIGHT="1" ALT=""></td>
     	</tr>
      <tr>
        <td width="98" align="left" valign="top" colspan='1'>
        	<span class="b">エリア：</span>
        </td>
      	<td width="142" align="left" valign="top" colspan='1'>
        	<span CLASS="b">都道府県：</span>
        </td>
        <td width="108" align="right" valign="top" colspan='2'>
        	<span class="b">チェックイン日：</span>
        </td>
        <td width="80" align="left" valign="top">
			  	<span CLASS="b">宿泊数：</span>
			  </td>
      </tr>
      <tr>
      	<td colspan='1' valign="top">
		     	<select name='local_area_cd' onChange="selectChange();">
		     	<%= localareacdStr %>
		     	</select>
		     </td>
      	<td align="left" colspan='1' valign="top">
      		<select name='state_cd'>
      		<option value=''>------</option>
      		<%=	areashandler.getHtmlverState() %>
      		</select>
      	</td>
      	<td colspan='1' align="right" valign="top">
			  	<input type="text" size='12' name='checkindate_dis' value='<%= checkIn[1] %>' readonly>:
			  </td>
			  <td align="right" valign="top" width='38'>
<a href="JavaScript:getCalendar();"><IMG src="/img/calendar.gif" border=0 WIDTH="35" HEIGHT="20" ALIGN="ABSBOTTOM" alt='カレンダーから選択' /></a>
			  </td>
   			<td align="center" valign="top">
      		<select name='night'>
      		<%=	areashandler.getHtmlverVar( optionsnum, "night" ) %>
      		</select>
      	</td>
		  </tr>
		  <tr>
		  	<td colspan='5'valign="top">
		  	<select name='local_area_code'></select>
		  	</td>
		  </tr>
     <tr>
       	<td colspan='5'><img SRC="/img/blk.gif" WIDTH="409" HEIGHT="1" ALT=""></td>
     </tr>
     </tr>
     <tr>
     		<td colspan='1' align='left'>
       	<a href="./top.do?act=<%= form.getAct() %>?state_cd=?city_cd">
        <img SRC="/img/btt_clear.gif" WIDTH="74" HEIGHT="23" BORDER="0">
        </a>
        </td>
        <td colspan='1'><span CLASS="b">施設名</span>(3文字以上)</td>
        <td colspan='1'><input type='text' size='15' maxlength='12' name='productname'/></td>
        <td  colspan='2' ALIGN="center">
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

<!-- 調整 -->
	<td>
	<IMG SRC="/img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /調整 -->

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
		document.forms["AreaSelector"].elements["local_area_code"].options[0] = new Option("------");
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
	//リロードの確認
	function goSearch()	{
		var radios = document.forms[0].Searchtype;
		if( radios[2].checked ){
			size = eval( document.forms[0].elements['productname'].value.length );
			if( size < 3){
				alert("施設名は、2文字以上でお願いします");
				return false;
			}
		}else if( radios[0].checked ){
			document.forms[0].elements['productname'].value = "";
			//alert( document.forms[0].elements['local_area_code'].value );
			if( document.forms[0].elements['local_area_code'].value  < 100){
				alert("都道府県で検索して下さい");
				return false;
			}
		}else{
			document.forms[0].elements['productname'].value = "";
			
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
			document.forms[0].elements['productname'].value = "";
			document.forms[0].elements['productname'].disabled = "";
		}else if( num == '1'){
			document.forms[0].elements['state_cd'].disabled = "";
			document.forms[0].elements['local_area_cd'].disabled = "disabled";
			document.forms[0].elements['local_area_code'].disabled = "disabled";
			document.forms[0].elements['local_area_code'].length = 0;
			document.forms[0].elements['productname'].value = "";
			document.forms[0].elements['productname'].disabled = "disabled";
			reSetLocalAreaCombo();
		}else if( num == '2'){
			document.forms[0].elements['state_cd'].selectedIndex = 0;
			document.forms[0].elements['state_cd'].disabled = "disabled";
			document.forms[0].elements['productname'].disabled = "";
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
	changeSelection( 0 );
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
</body>
</html>
