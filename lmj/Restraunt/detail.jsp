<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 java.text.*,
								 java.net.*,
								 jp.co.yobrain.util.*,
								 jp.co.lastminute.cart.*,
								 jp.co.lastminute.cart.model.*,
								 jp.co.lastminute.cart.user.*,
								 jp.co.lastminute.cart.util.MemberFormatForWeb,
								 jp.co.lastminute.Restraunt.*,
								 jp.co.lastminute.Restraunt.Property,
								 jp.co.lastminute.Restraunt.util.PagingUtil,
								 jp.co.lastminute.Restraunt.node.*,
								 jp.co.lastminute.Restraunt.allot.*,
								 jp.co.lastminute.Restraunt.detail.Form" %>
<%@ taglib uri="/WEB-INF/struts-html.tld"	prefix="html" %><%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<html lang="ja">
<head>
<html:html locale="true">
<title>lastminute.com - The first place to look at the last minute</title>
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">
<%
	int displayNum = Property.weekNum;
	String xmlstring = "";
	String detailXmlString = "";
	HashMap allotmentdata = null;
	//Vector allotVec = null;
	Vector allotVec = new Vector();
	Vector menuVec = null;
	Vector optionVec = null;
	int allotVec_size = 0;
	Form form = (Form)request.getAttribute( "Restraunt.detail.Form" );
	if( form != null ){
		xmlstring = form.getAllotXmlStr();
		detailXmlString = form.getDetailXmlStr();
		allotmentdata = form.getAllotmentdata();
		allotVec = (Vector)allotmentdata.get("allot");
		if( allotVec != null ){
			allotVec_size = allotVec.size();
		}
		menuVec = (Vector)allotmentdata.get("menu");
		optionVec = (Vector)allotmentdata.get("option");
	}
	AllotDate allotdate = new AllotDate( form.getCheckindate() );
	
	String serverUrl = "https://"+request.getServerName() + "/lmj/Restraunt/cartRegistration.do;jsessionid=" + session.getId();
	
	int menucounter = 0;
	int optioncounter = 0;
	
	//セッションの把握
	int order_no = 0;
	if( session.getAttribute( Constants.CartOrder ) != null ){
		order_no = ((Order)session.getAttribute( Constants.CartOrder )).getORDER_NO();
	}
	int user_id = 0;
	if( session.getAttribute( Constants.CartUser ) != null ){
		user_id = ((User)session.getAttribute( Constants.CartUser )).getUser().getUSER_ID();;
	}
	String w_url = "./detail.do?catid=91&restaurant=" + form.getRestaurant() ;
	//System.err.println( detailXmlString );

	String s_skuid = "";
	String s_seattype = "";
	String s_skuname = "";
	String s_daycol = "";
	
	//skuid の有無
	if (request.getParameter("skuid") != null) {
		s_skuid = request.getParameter("skuid");
		s_seattype = request.getParameter("seattype");
		s_daycol = request.getParameter("daycol");

	}


%>
<!--レストラン詳細のXMLパース-->
<c:set var="detailstr" ><%= detailXmlString %></c:set>
<xml:parse var="restdetail" xml="${detailstr}"></xml:parse>
<SCRIPT language="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;
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
	function notChangeDirect( target, number  ){
				document.forms[0].elements[ target ][ number ].blur();
				alert('値の変更はできません。');
		}
	function notChangeDirect( target ){
				document.forms[0].elements[ target ].blur();
				alert('値の変更はできません。');
		}
	//アプリケーションでＪＳを生成；//
//////////////////////////////////
<% if( allotVec_size > 0 ){	%>
//コースID:日時:在庫数:最大数;最小数
var target_allots = new Array(<%= allotVec_size %>);
var target_times = new Array(<%= allotVec_size %>);
<% for(int i=0; i<allotVec_size; i++){
	AllotNode allotnode = (AllotNode)allotVec.get(i);
	HashMap allotment = allotnode.allotment;
	String allotid = "";
%>

var target_allots0<%= i %> = new Array(<%= displayNum %>);
var target_allots1<%= i %>  = new Array(<%= displayNum %>);
<% for(int j=0; j<displayNum; j++){
	Dayallot dayallot = new Dayallot();
	//最大・最小手配数の取得
	if( allotment.get(allotdate.getWeekDate(j)) != null){
		dayallot = (Dayallot)allotment.get(allotdate.getWeekDate(j));
	}
%>
var target_allot<%=(i*displayNum)+(j)%> = new Array;
target_allot<%= (i*displayNum)+(j) %>=['<%= dayallot.allotid %>','<%=allotdate.getWeekDate(j)%>','<%= dayallot.max %>','<%= dayallot.min %>','<%= Property.maxorder %>','<%=allotnode.reservetimestr %>','<%= dayallot.lastsale %>','<%= dayallot.endsale %>'];
var target_allot0<%=(i*displayNum)+(j)%> = new Array;
<%
	//予約時間文字列の取得
	StringTokenizer st = new StringTokenizer(allotnode.reservetimestr, ",");
	int k = 0;
	while (st.hasMoreTokens()) {
%> target_allot0<%= ((i*displayNum)+j) %>[<%= k %>]='<%= st.nextToken() %>';<%
		k++;
	}
%>
target_allots0<%=i%>[<%=j%>] = target_allot<%=(i*displayNum)+(j)%>;
target_allots1<%=i%>[<%=j%>] = target_allot0<%=(i*displayNum)+(j)%>;
<% } %>
target_allots[<%=i%>] = target_allots0<%=i%>;
target_times[<%=i%>] = target_allots1<%=i%>;
<% } %>
//////////////////////////////////
//メニューの取得
var cources = new Array(<%=menuVec.size()%>);
var cources_prices = new Array(<%=menuVec.size()%>);
var cources_taxs = new Array(<%=menuVec.size()%>);
var cources_from = new Array(<%=menuVec.size()%>);
var cources_to = new Array(<%=menuVec.size()%>);
<% for(int i=0; i<menuVec.size(); i++){%>
	cources[<%=i%>] = '<%=((MenuNode)menuVec.get(i)).name%>';
	cources_prices[<%=i%>] = '<%=((MenuNode)menuVec.get(i)).price%>';
	cources_taxs[<%=i%>] = '<%=((MenuNode)menuVec.get(i)).tax%>';
	cources_from[<%=i%>] = '<%=((MenuNode)menuVec.get(i)).from%>';
	cources_to[<%=i%>] = '<%=((MenuNode)menuVec.get(i)).to%>';
<% } %>
//オプションの取得
var options = new Array(<%=optionVec.size()%>);
var options_prices = new Array(<%=optionVec.size()%>);
var options_taxs = new Array(<%=optionVec.size()%>);
var options_from = new Array(<%=optionVec.size()%>);
var options_to = new Array(<%=optionVec.size()%>);
<%for(int i=0; i<optionVec.size(); i++){%>
options[<%=i %>] = '<%=((OptionNode)optionVec.get(i)).name %>';
options_prices[<%=i %>] = '<%=((OptionNode)optionVec.get(i)).price %>';
options_taxs[<%=i %>] = '<%=((OptionNode)optionVec.get(i)).tax %>';
/////////////////////////////////////
options_from[<%=i %>] = '<%=((OptionNode)optionVec.get(i)).from %>';
options_to[<%=i %>] = '<%=((OptionNode)optionVec.get(i)).to %>';
<%}%>
/////////////////////////////////////

//////////////////////////////////
function setTabletarget(nx, ny){
		otherFormInit();
		document.forms[0].elements['chkIndate'].value = target_allots[nx][ny][1];
		document.forms[0].elements['view_date'].value = target_allots[nx][ny][1].substring(0, 4)
																									+ "/" + target_allots[nx][ny][1].substring(4, 6) + "/"
																									+ target_allots[nx][ny][1].substring(6, 8) ;
		var maxorder = new Number();
		maxorder = <%= Property.maxorder %>;
		var temporder = new Number();
		temporder = target_allots[nx][ny][2];
		if( temporder >= maxorder ){
			temporder = maxorder;
		}
		document.forms[0].elements['view_allot'].value = temporder; //target_allots[nx][ny][2];
		document.forms[0].elements['min_allot'].value = target_allots[nx][ny][3];
		document.forms[0].elements['product_id'].value = target_allots[nx][ny][0];
		document.forms[0].elements['agentproductcode'].value = target_allots[nx][ny][0];
		document.forms[0].elements['lastsale'].value = target_allots[nx][ny][6];
		document.forms[0].elements['endsale'].value = target_allots[nx][ny][7];
		document.forms[0].elements['salesdate'].value = target_allots[nx][ny][1];
		makeSelectTimeBox( target_times[nx][ny] );
<% if(menuVec.size()>0){ %>
		mekeSelectCouseBox( temporder, target_allots[nx][ny][3], target_allots[nx][ny][4], target_allots[nx][ny][1], 0);
<% }
	if(optionVec.size()>0){%>
		mekeSelectOptionBox( target_allots[nx][ny][1] );
<% } %>
		//document.images.point001.src='/img/mark_003.gif';
		//document.images.point002.src='/img/mark_002.gif';
		//document.images.point003.src='/img/mark_001.gif';
		//document.images.point004.src='/img/mark_001.gif';
	}
	function makeSelectTimeBox( times ){
			document.forms['0'].elements['arivaltime'].options.length = 0;
			document.forms['0'].elements['arivaltime'].options[0] = new Option( '予約時間' );
			document.forms['0'].elements['arivaltime'].options[0].value = "";
			for(i=0; i<times.length; i++){
					document.forms['0'].elements['arivaltime'].options[i+1] = new Option( times[i].substr(0,2) +":" + times[i].substr(2,2) );
					document.forms['0'].elements['arivaltime'].options[i+1].value = times[i];
			}
			document.forms['0'].elements['arivaltime'].disabled="";
	}
	function chengeStatus(){
		if( document.forms['0'].elements['arivaltime'].options.value == "" ){
			alert('予約時間を選択ください');
		}else{
			//document.images.point002.src='/img/mark_003.gif';
			//document.images.point003.src='/img/mark_002.gif';
			//document.images.point004.src='/img/mark_002.gif';
		}
	}
function otherFormInit(){
	//フォーム内容を初期化
	document.forms['0'].elements['coursestotal'].value = "";
	document.forms['0'].elements['coursestax'].value = "";
	document.forms['0'].elements['optionstotal'].value = "";
	document.forms['0'].elements['optionstax'].value = "";
	document.forms['0'].elements['chkIndate'].value = "";
	document.forms['0'].elements['checkintime'].value = "";
	document.forms['0'].elements['alootnumber'].value = "";
	var courcess = new Array('cources', 'cources_price', 'cources_tax');
	paramInit( courcess, cources );
	var optionss = new Array('options', 'options_price', 'options_tax');
	if( options.length > 0 ){
		paramInit( optionss, options );
	}
}
function paramInit( paramnames, paramArray ){
	if( paramArray.length>1 ){
		for( j=0; j<paramArray.length; j++){
			for( k=0; k<paramnames.length; k++ ){
				document.forms['0'].elements[ paramnames[ k ] ][ j ].value = "";
			}
		}
	}else{
		for( k=0; k<paramnames.length; k++ ){
				document.forms['0'].elements[ paramnames[ k ] ].value = "";
		}
	}
}
function modifySelectCouseBox( tempostion ){
	callots = document.forms[0].elements['view_allot'].value;
	cmin = document.forms[0].elements['min_allot'].value;
	cmax = document.forms[0].elements['view_allot'].value;
	date_target = document.forms[0].elements['salesdate'].value;
	if( cources.length > 1 ){
		mekeSelectCouseBox( callots, cmin, cmax, date_target, tempostion );
	}
	calsCharge();
}
function mekeSelectCouseBox( callots, cmin, cmax ,date_target, tempostion ){
	var comboallot = new Number( callots ); //在庫
	var combomin = new Number( cmin ); //最小
	var combomax = new Number( cmax ); //最大
	var potion = new Number( tempostion );//temp
	var totalfig = new Number();

	totalfig = 0;

	var start = 1; 
	var ends = 0;
	var vartotal = "";


	//2003 oyamada mod
	if( tempostion != 0 ){
		for(s=0; s<tempostion; s++){
			vartotal = document.forms['0'].elements['cources_count'][s].value;
			//alert("vartotal="+s+";"+vartotal);
			if (vartotal.length > 0) {
				totalfig = totalfig + eval( document.forms['0'].elements['cources_count'][s].value );
			}

		}

		if( totalfig == 0 ){
			if( combomin > comboallot ){	start = 0;	}else{	start = combomin;	}
		}else{
			if( totalfig - combomin > 0 ){
				start = 1;
			}else if( combomin - totalfig > 0 ){
				start = combomin - totalfig;
			}
		}
	}

	if( comboallot <  combomax ){
		ends = comboallot;
	}else{
		ends = combomax;	
	}

	ends = ends - totalfig;
	
	if(cources.length>1){
		if( tempostion == 0 ) {
			SmallOptionMakeSeelct(start,ends,potion,cources,'cources_count',cources_from,cources_to,date_target,'---');
		}
	}else if(cources.length==1){
		SmallOptionMake(start,ends,document.forms['0'].elements['cources_count'],cources_from[0],cources_to[0],date_target,'人数');
	}

}

function mekeSelectOptionBox( date_target ){
	if(options.length>1){
		SmallOptionMakeSeelct('0','8','0',options,'options_count',options_from, options_to, date_target,'数量');
	}else if(options.length==1){
		SmallOptionMake('0','8',document.forms['0'].elements['options_count'],options_from[0],options_to[0],date_target, '数量' );
	}
}
function SmallOptionMakeSeelct(cstart,cends,cpotion,baseArray,comboname,combofromArray,combaotoArray,cdatatarget,comvalue){
	var pos = new Number( cpotion );
	for(j=pos; j<baseArray.length; j++){
			SmallOptionMake(cstart,cends,document.forms['0'].elements[ comboname ][j],combofromArray[j],combaotoArray[j],cdatatarget,comvalue);
	}
}
function SmallOptionMake(cstart,cends,combo, combofrom, combaoto, cdatatarget, comvalue ){
	var k = 0;
	var start = new Number( cstart );
	var ends = new Number( cends );
	combo.options.length = 0;
	if(( combofrom<= cdatatarget)&&( cdatatarget <= combaoto)){
		combo.options[k] = new Option( comvalue );
		combo.options[k].value = "";
		k++;
		for(jj=start; jj<=ends; jj++){
			combo.options[k] = new Option( jj );
			combo.options[k].value = jj;
			k++;
		}
	}else{
		combo.options[k] = new Option( '---' );
		combo.options[k].value = "0";
	}
	combo.disabled="";
}
function calsCharge(){
	reload = 0;
	var price_01 = 0;
	var price_02 = 0;
	var tax_01 = 0;
	var tax_02 = 0;
	var allmembers = 0;

	if(cources.length>1){
		for(var s=0; s<cources.length; s++){
				if( document.forms['0'].elements['cources_count'][s].value.length > 0 ){
					price_01 += cources_prices[s] * eval( document.forms['0'].elements['cources_count'][s].value );
					tax_01 += cources_taxs[s] * eval( document.forms['0'].elements['cources_count'][s].value );
					allmembers += eval( document.forms['0'].elements['cources_count'][s].value );
				}
		}
	}else if(cources.length==1){
				if( document.forms['0'].elements['cources_count'].value.length > 0 ){
					price_01 += cources_prices * eval( document.forms['0'].elements['cources_count'].value );
					tax_01 += cources_taxs * eval( document.forms['0'].elements['cources_count'].value );
					allmembers += eval( document.forms['0'].elements['cources_count'].value );
				}

	}
	if(options.length>1){
		for(var s=0; s<options.length; s++){
				if( document.forms['0'].elements['options_count'][s].value.length > 0 ){
					price_02 += options_prices[s]* eval( document.forms['0'].elements['options_count'][s].value );
					tax_02 += options_taxs[s]*eval( document.forms['0'].elements['options_count'][s].value );
				}
		}
	}else if(options.length==1){
				if( document.forms['0'].elements['options_count'].value.length > 0 ){
					price_02 += options_prices * eval( document.forms['0'].elements['options_count'].value );
					tax_02 += options_taxs*eval( document.forms['0'].elements['options_count'].value );
				}
	}
		document.forms['0'].elements['coursestotal'].value = price_01;
		document.forms['0'].elements['coursestax'].value = tax_01;
		document.forms['0'].elements['optionstotal'].value = price_02;
		document.forms['0'].elements['optionstax'].value = tax_02;
		document.forms['0'].elements['alltotal'].value = eval( price_01 ) + eval( price_02 );
		document.forms['0'].elements['alltax'].value = eval(tax_01) + eval( tax_02 );
		document.forms['0'].elements['allmembers'].value = allmembers;
	}
		//入力値のエラー処理
	//ダブルクリックの制御を、入力値の制御を行う
	function checkForm(){
		if( reloadCheck() == false ){
			return false;
		}
		var err_message = "";
		//日付ＯＫ
		if( document.forms['0'].elements['chkIndate'].value.length == 0 ){
			err_message += '日付が選択されていません\n';
		}
		//時間ＯＫ
		if( document.forms['0'].elements['arivaltime'].selectedIndex == 0 ){
			err_message += '時間が選択されていません\n';
		}
		//人数ＯＫ
		var counter = 0;
		if(cources.length>1){
			for(var s=0; s<cources.length; s++){
				if( document.forms['0'].elements['cources_count'][s].value.length > 0 ){
					counter +=  eval( document.forms['0'].elements['cources_count'][s].value );
					document.forms['0'].elements['cources'][s].value = cources[s];
					document.forms['0'].elements['cources_price'][s].value = cources_prices[s];
					document.forms['0'].elements['cources_tax'][s].value = cources_taxs[s];
				}
			}
		}else if(cources.length==1){
			if( document.forms['0'].elements['cources_count'].value.length > 0 ){
				counter +=  eval( document.forms['0'].elements['cources_count'].value );
				document.forms['0'].elements['cources'].value = cources;
				document.forms['0'].elements['cources_price'].value = cources_prices;
				document.forms['0'].elements['cources_tax'].value = cources_taxs;
			}
		}
		//メニューコース数をセット(リクエストから取得するため)
		document.forms['0'].elements['courcesNum'].value = cources.length;
		if( counter == 0 ){
			err_message += '人数/組数が選ばれていません\n';
		}
		if( counter <  document.forms['0'].elements['min_allot'].value ){
			err_message += '予約できる人数/組数に足りません\n';
		}
		if( counter >  document.forms['0'].elements['view_allot'].value ){
			err_message += '予約できる人数/組数を超えています\n';
		}
		if( err_message.length != 0){
			alert( err_message );
			reload = 0;
			return false;
		}
		//オプションのセット
		if(options.length>1){
			for(var s=0; s<options.length; s++){
				if( document.forms['0'].elements['options_count'][s].value.length > 0 ){
					document.forms['0'].elements['options'][s].value = options[s];
					document.forms['0'].elements['options_price'][s].value = options_prices[s];
					document.forms['0'].elements['options_tax'][s].value = options_taxs[s];
				}
			}
		}else if(options.length==1){
			if( document.forms['0'].elements['options_count'].value.length > 0 ){
				document.forms['0'].elements['options'].value = options;
				document.forms['0'].elements['options_price'].value = options_prices;
				document.forms['0'].elements['options_tax'].value = options_taxs;
			}
		}
		//メニューコース数をセット(リクエストから取得するため)
		document.forms['0'].elements['optionsNum'].value = options.length;
		calsCharge();
		//時間と人数の格納
		member_num = 0;
		if(cources.length>1){
			for(var s=0; s<cources.length; s++){
				idx = document.forms['0'].elements['cources_count'][s].selectedIndex;
				if(idx > 0){
					val = document.forms['0'].elements['cources_count'][s].options[idx].value;
					member_num += parseInt(val);
				}
			}
		}else if(cources.length==1){
			idx = document.forms['0'].elements['cources_count'].selectedIndex;
			if(idx > 0){
				val = document.forms['0'].elements['cources_count'].options[idx].value;
				member_num += parseInt(val);
			}
		}
		idx = document.forms['0'].elements['arivaltime'].selectedIndex;
		val = document.forms['0'].elements['arivaltime'].options[idx].value;
		document.forms['0'].elements['checkintime'].value = val;
		document.forms['0'].elements['alootnumber'].value = member_num;
	}
<%	}	%>
/* 詳細ページ */
var descurl = "/lmj/Restraunt/menu.do?restaurant=<xml:out select='$restdetail//restaurant' />&checkindate=<%= form.getCheckindate() %>";
var prop = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=480";
function newwin1(){
	MM_openBrWindow(descurl,"DETAIL",prop);
}
function newwin1detail( num ){
	var url = descurl + "#menu" + num;
	MM_openBrWindow(url,"DETAIL",prop);
}
/* 地図ページ */
function newwin2(){
	MM_openBrWindow( '/lmj/Restraunt/map.do?restaurant=<xml:out select="$restdetail//restaurant" />', 'MAP', "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=550");
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
	  window.open(theURL,winName,features);
}

//-->
</SCRIPT>
</head>


<% if (s_skuid.equals("")) { %>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<% } else { %>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0" onLoad="javascript:setTabletarget(<%= s_seattype %>,<%= s_daycol %>);">
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
									<td VALIGN="BOTTOM" BACKGROUND="" nowrap ROWSPAN="2"><a HREF="http://www.lastminute.co.jp/" target="_parent"><img SRC="/img/lm_logo.gif" WIDTH="214" HEIGHT="39" ALT="Lastminute" hspace="3" BORDER="0"></a></td>
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
</center>
<!-- /ヘッダframe -->



<!-- レイアウト -->
<center>
<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760">
	<tr>
		<td VALIGN="TOP" width="147">
			<IMG SRC="/img/res_img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><BR>
			
			<!-- ナビframe -->
			<NOLAYER>
				<IFRAME SRC="/navi.html" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
			</NOLAYER>
			<ILAYER SRC="/navi.html" WIDTH="147" HEIGHT="680"></ILAYER>
			<!-- /ナビframe -->
		</td>
		<!-- 調整 -->
		<td>
			<IMG SRC="/img/res_img/shim.gif" WIDTH="5" HEIGHT="1" alt=""><br>
		</td>
		<!-- /調整 -->
		<td VALIGN="TOP" align="right">
			<IMG SRC="/img/res_img/shim.gif" WIDTH="598" HEIGHT="1" alt=""><br>

			<!-- レストラン -->
			<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td align='right'>
						<a HREF="#" onClick="MM_openBrWindow('/res/res_tebiki.html','lmj','scrollbars=yes,width=500,height=380')"><img src="/img/icon_howtouse.gif" border="0" alt="ご利用方法">ご利用方法</a>
					</td>
				</tr>
			</table>
			
			<!-- タブ -->
			<table WIDTH="598" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td  align='right' WIDTH="598" VALIGN="BOTTOM"><img SRC="/img/res_img/tab_dot.gif" WIDTH=598 HEIGHT=1 ALT=""></td>
				</tr>
			</table>
			<!-- /タブ -->
			

			<% int intb = 0; %>
			<!-- 詳細 -->
			<table WIDTH="598" BORDER="<%= intb %>" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/res_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
					<td BGCOLOR="#F3F0EA" WIDTH="1"><img SRC="/img/res_img/shim.gif" WIDTH="8" HEIGHT="1" ALT=""></td>
					<td BGCOLOR="#F3F0EA" WIDTH="578">

						<table WIDTH="100%" BORDER="<%= intb %>" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>
									<span CLASS="super16">
										</br><xml:out select="$restdetail//restaurantname" />　<span class="super12"><xml:out select="$restdetail//restaurantnameeng" /></span>
									</span><br/>
								</td>
							</tr>
							</tr>
								<td align="right">
									</br><b>最寄駅</b>&nbsp;<xml:out select='$restdetail//station' /><br/>
								</td>
							</tr>
						</table>
						<table WIDTH="100%" BORDER="<%= intb %>" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td WIDTH="518">
									<br>
									<span class="txt12orgb">
									<xml:out select="$restdetail//special" /><br/>
									</span>
									<xml:out select="$restdetail//comment_title" /><br/>
								</td>
								<td align='center' valign='top' class='txt10'>
									</br>
									<a HREF="javascript:newwin2()"><img src='/img/map.gif' width='25' border='0' alt='[地図]'></a>
									<a HREF="javascript:newwin1()"><img src='/img/eat.gif' width='25' border='0' alt='[メニュー他]'></a>
								</td>
							</tr>
						</table>

<% if( allotVec_size > 0){	%>
		<!--Allotment詳細のXMLパース-->
		<c:set var="xmlstr" ><%= xmlstring %></c:set>
		<xml:parse var="restaurants" xml="${xmlstr}"></xml:parse>
<%	}	%>
						<table WIDTH="100%" BORDER="<%= intb %>" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td VALIGN="TOP" WIDTH="100%" ALIGN="CENTER" colspan='3'>
									<table width='100%' cellspacing='0' cellpadding='3' BORDER='0'> 
										<td align="top" valign="top">
											<img SRC="/image/Restraunt/<xml:out select="$restdetail//restaurant" />/OUT.jpg" WIDTH="186" height="136">
										</td>
										<td align="top" valign="top">
											<img SRC="/image/Restraunt/<xml:out select="$restdetail//restaurant" />/IN.jpg"  WIDTH="186" height="136">																																
										</td>
										<% if (xmlstring.length() > 0 ) { %>
										<td align="top" valign="top">
 											<img SRC="/image/Restraunt/<xml:out select="$restdetail//restaurant" />/IN2.jpg" WIDTH="186" height="136">
										</td>
										<% } %>
									</table>
								</td>
							</tr>

<% if( allotVec_size > 0){	%>
							<tr>
								<td VALIGN="TOP" ALIGN="CENTER" colspan='3'>
									<br/>
									<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">

										<% if (s_skuid.equals("")) { %>
										<tr>
											<td>
												<!-- 席　--->
												<table WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#999999">
													<tr bgcolor="#FFFFFF">
														<td colspan="11" height="16">
															<img src='/img/mark_002.gif' name='point001'>
															<font color="#DC143C">ご希望の日付の座席プランをクリックしてください</font>
														</td>
													</tr>
													<tr bgcolor="#EEEEEE">
														<td align='center' class='txt11' width='88'>座席タイプ</td>
														<xml:forEach select="$restaurants//titleday" >
															<td align="center" class='txt11'>
																<font color='#CC0066'><xml:out select="day" /><br/>(<xml:out select="dayweek" />)</font>
															</td>
														</xml:forEach>
													</tr>
													
													<% int j = 0; %>	

													<xml:forEach select="$restaurants//skuinfo" >

													<c:set var="skuid"><xml:out select="skuid" /></c:set>
													<tr bgcolor="#FFFFFF">
														<td align='center' class='txt11' width='49'>
															<br/><xml:out select='skuname' /><br/><br/>
														</td>

														<% int n = 0; %>	
														<xml:forEach select="allotinfo//allotment" >

														<c:set var="max"><xml:out select="ordernum/maxorder" /></c:set>
														<td align="center" class="txt12">
															<c:choose>
																<c:when test="${max == '-'}">--</c:when>
																<c:otherwise>
																	<a href="/lmj/Restraunt/detail.do?catid=91&restaurant=<xml:out select="$restdetail//restaurant" />&checkindate=<%= form.getCheckindate() %>&skuid=<c:out value="${skuid}" />&seattype=<%= j %>&daycol=<%= n %>">
																		<xml:out select="ordernum/minorder" />～<xml:out select="ordernum/maxorder" />名
																	</a>
																</c:otherwise>
															</c:choose>
														</td>
														
														<% n=n+1; %>

														</xml:forEach>
													</tr>

													<% j=j+1; %>

												</xml:forEach>
												</table>

												<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#F3F0EA">
													<tr>
														<td align='left'><%=	PagingUtil.getWeekStr( w_url, form.getCheckindate() )[0] %></td>
														<td align='right'><%=	PagingUtil.getWeekStr( w_url, form.getCheckindate() )[1] %></td>
													</tr>
												</table>
											<!--　席 -->
											</td>
										</tr>
										<% } %>
									</table>
								</tr>
<%	} %>
								<tr>
									<td VALIGN="TOP">
										<table WIDTH="100%" BORDER="<%= intb %>" CELLSPACING="0" CELLPADDING="0">
											<tr>
												<td CLASS="b">

												<% if( allotVec_size > 0){	%>

													<% if (s_skuid.equals("")) { %>
													<% } else { %>
													<form action="<%= serverUrl %>" method="get" onsubmit="return checkForm();">
													<table WIDTH="578" BORDER="0" CELLSPACING="0" CELLPADDING="0">
														<tr>
															<td COLSPAN="3" >
																<table WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#999999">
																	<tr bgcolor="#FFFFFF">
																		<td width='75%' colspan="2" height="16">
																			<img src='/img/mark_002.gif' name='point001'>
																			<font color="#DC143C"">ご予約時間・ご予約コース・オプションのご利用人数をお選びの上、「次へ」をクリックしてください</font>
																		</td>
																	</tr>
																	<tr bgcolor="#FFFFFF">
																		<td width='75%'>&nbsp;ご予約日</td>
																		<td align="right">
																			<input type='text' name='view_date' value='' size='14' disabled="disabled" class="textbox_white"/>
																		</td>
																	</tr>
																	<!--
																	<tr bgcolor="#FFFFFF">
																		<td width='75%' height="22">&nbsp;座席タイプ</td>
																		<td align="right">
																			<%= s_skuname %>
																		</td>
																	</tr>
																	-->
																	<tr bgcolor="#FFFFFF">
																		<td>&nbsp;ご予約時間</td>
																		<td align="right">
																			<select name="arivaltime" onChange="javascript:chengeStatus();">
																				<option value=''>予約時間</option>
																			</select>
																		</td>
																	</tr>

																	<tr bgcolor="#FFFFFF">
																		<td>&nbsp;ご利用可能人数</td>
																		<td align="right">
																			<input type='text' name='min_allot' value='' size='2' disabled="disabled" class="textbox_white"/> - 
																			<input type='text' name='view_allot' value='' size='3' disabled="disabled" class="textbox_white"/>名様</td>
																		</td>
																	</tr>

																	<tr bgcolor="#FFFFFF">
																		<td bgcolor="#EEEEEE" colspan="2" height="22">&nbsp;ご予約コース</td>
																	</tr>


																	<xml:forEach select="$restaurants//menu">
																	<% menucounter++; %>
																	<tr bgcolor="#FFFFFF">
																		<td align="left">　
																			<a HREF="javascript:newwin1detail('<xml:out select="id" />')"><xml:out select="name" /></a>
																			<div align=right>
																				(<xml:out select="pricestr" />円/
																				<xml:choose>
																					<xml:when select="taxstr[(.='0')]">税込</xml:when>
																					<xml:otherwise><xml:out select="taxstr" />円</xml:otherwise></xml:choose>)
																			</div>
																		</td>
																		<td align="right">
																			<select NAME="cources_count" onChange="javascript:modifySelectCouseBox('<%= menucounter %>');" disabled="disabled">
																			<option value=''>---</option>
																			</select>名
																		</td>
																	</tr>
																	</xml:forEach>

																	<tr>
																		<td bgcolor='#FFFFCC'>&nbsp;ご利用人数</td>
																		<td bgcolor='#FFFFFF' align='right'>
																			<INPUT TYPE=TEXT NAME="allmembers" size='3' value="" disabled="disabled" class="textbox_white">人
																		</td>
																	</tr>
																	<tr>
																		<td bgcolor='#FFFFCC'>&nbsp;コース合計(税)</td>
																		<td bgcolor='#FFFFFF' align='right'>
																		<INPUT TYPE=TEXT NAME="coursestotal" size='6' value=""  disabled="disabled" class="textbox_white">
																		(<INPUT TYPE=TEXT NAME="coursestax" size='4' value="" disabled="disabled" class="textbox_white">)円
																		</td>
																	</tr>


																	<xml:forEach select="$restaurants//option">
																		<% optioncounter++; %>
																	</xml:forEach>
																	
																	<% if (optioncounter>0) { %>
																		<tr bgcolor="#FFFFFF">
																			<td bgcolor="#EEEEEE">&nbsp;<img src='/img/mark_001.gif' name='point004'>&nbsp;オプション</td>
																			<td></td>
																		</tr>

																		<xml:forEach select="$restaurants//option">
																		<% optioncounter++; %>
																		<tr bgcolor="#ffffff">
																			<td align="left">　
																				<a HREF="javascript:newwin1detail('<xml:out select="id" />')"><xml:out select="name" /></a>
																				<div align=right>
																					(<xml:out select="pricestr" />円/
																					<xml:choose>
																						<xml:when select="taxstr[(.='0')]">税込</xml:when>
																						<xml:otherwise><xml:out select="taxstr" />円</xml:otherwise>
																					</xml:choose>)
																				</div>
																			</td>
																			<td align="right">
																				<select NAME="options_count" onChange="javascript:calsCharge();" disabled="disabled">
																				<option value=''>数量</option>
																				</select>
																			</td>
																		</tr>
																		</xml:forEach>

																		<tr>
																			<td bgcolor='#FFFFCC'>&nbsp;オプション合計(税)</td>
																			<td bgcolor='#FFFFFF' align='right'>
																				<INPUT TYPE=TEXT NAME="optionstotal" size='6' value="" disabled="disabled" class="textbox_white">
																				(<INPUT TYPE=TEXT NAME="optionstax" size='4' value="" disabled="disabled" class="textbox_white">)円
																			</td>
																		</tr>
																	<% } else {%>
																		<!--<img src='/img/mark_001.gif' name='point004'>-->
																		<INPUT TYPE=hidden NAME="optionstotal" value="">
																		<INPUT TYPE=hidden NAME="optionstax" value="">
																	<% } %>



																	<tr>
																		<td bgcolor='#FFFFCC' class='b'>&nbsp;総合計(税)</td>
																		<td bgcolor='#FFFFFF' align='right'>
																			<INPUT TYPE=TEXT NAME="alltotal" size='6' value="" disabled="disabled" class="textbox_white">
																		(<INPUT TYPE=TEXT NAME="alltax" size='4' value="" disabled="disabled" class="textbox_white">)円
																		</td>
																	</tr>
																</table>
															</td>
														</tr>

														<tr>
															<td COLSPAN="3" bgcolor='#F3F0EA' align="right" valign="middle">
																<INPUT TYPE=hidden NAME="chkIndate" value=""/>
																<INPUT TYPE=hidden NAME="checkintime" value=""/>
																<INPUT TYPE=hidden NAME="alootnumber" value=""/>
																<input type="hidden" name='orderNumber'  value='<%= order_no %>'/>
																<input type="hidden" name='userId' value='<%= user_id %>'/>
																<input type='hidden' name='product_id' value=''/>
																<input type='hidden' name='agentproductcode' value=''/>
																<input type='hidden' name='etc' value=''/>
																<input type='hidden' name='eta' value=''/>
																<input type="hidden" name='connectionStyle' value='0'/>
																<input type='hidden' name='lastsale' value=''/>
																<input type='hidden' name='endsale' value=''/>
																
																<xml:forEach select="$restaurants//menu">
																	<INPUT TYPE=hidden NAME="cources" value=""/>
																	<INPUT TYPE=hidden NAME="cources_price" value=""/>
																	<INPUT TYPE=hidden NAME="cources_tax" value=""/>
																</xml:forEach>
																		
																<xml:forEach select="$restaurants//option">
																	<INPUT TYPE=hidden NAME="options" value=""/>
																	<INPUT TYPE=hidden NAME="options_price" value=""/>
																	<INPUT TYPE=hidden NAME="options_tax" value=""/>
																</xml:forEach>
																		
																<c:set var="today"><%= allotdate.getWeekDate(0)%></c:set>
																<input type=hidden NAME='subOrderNumber' value='0'/>
																<INPUT TYPE=hidden NAME='productTypeCode' value='91'/>
																<input type=hidden NAME="pax" value="1">
																<input type=hidden NAME="salesdate" value=''/>
																<input type=hidden NAME="agtcode" value="<xml:out select="$restdetail//restaurant" />"/>
																<input type=hidden NAME="title" value="<xml:out select="$restdetail//restaurantname" /> "/>

																<input type="hidden" name="restaurant" value="<xml:out select="$restdetail//restaurant" />">
																<input type="hidden" name="restaurantname" value="<xml:out select="$restdetail//restaurantname" />">
																<input type="hidden" name="courcesNum" value="">
																<input type="hidden" name="optionsNum" value="">
																<input type="hidden" name="cxlstr" value="<xml:out select="$restdetail//cansell_comm" escapeXml="false" />">
																
																<input type='image' SRC="/img/btt_next.gif" WIDTH="74" HEIGHT="23" BORDER="0">
															</td>
														</tr>
														</form>
													</table>
													<BR>
													<% } %>
<%	}	else { %>

													<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
														<tr>
															<td COLSPAN="3" class="super14">
																<br/>申し訳ございません。プランの設定がございません。<br/><br/>
															</td>
														</tr>
													</table>
												<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
													<tr>
														<td align='left'><%=	PagingUtil.getWeekStr( w_url, form.getCheckindate() )[0] %></td>
														<td align='right'><%=	PagingUtil.getWeekStr( w_url, form.getCheckindate() )[1] %></td>
													</tr>
												</table>

<% } %>

<% if( allotVec_size != 0){	%>
			 										<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
														<tr>
															<td VALIGN="TOP">
																<table BORDER="0" CELLSPACING="1" CELLPADDING="3" WIDTH="100%">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='85'>取消料<br/></td>
																		<td BGCOLOR="#FFFFFF">
																			<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																				<tr>
																					<td><xml:out select="$restdetail//cansell_comm" escapeXml="false" /></td>
																				</tr>
																			</table>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
													<br/>
<%	}	%>
														
			 										<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
														<tr>
															<td VALIGN="TOP">
																<table BORDER="0" CELLSPACING="1" CELLPADDING="3" WIDTH="100%">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='85'>住所<br/></td>
																		<td BGCOLOR="#FFFFFF"><xml:out select="$restdetail//address" escapeXml="false" />
																		</td>
																	</tr>

																	<xml:if select="$restdetail//openedtime[not(.='')] ">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='85'>営業時間<br/></td>
																		<td BGCOLOR="#FFFFFF"><xml:out select="$restdetail//openedtime" escapeXml="false" />
																		</td>
																	</tr>
																	</xml:if>

																	<xml:if select="$restdetail//closed[not(.='')] ">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='85'>定休日<br/></td>
																		<td BGCOLOR="#FFFFFF"><xml:out select="$restdetail//closed" escapeXml="false" /></td>
																	</tr>
																	</xml:if>

																	<xml:if select="$restdetail//card_comm[not(.='')] ">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="txt10b" VALIGN="TOP" width='85'>現地にてご利用<BR/>いただける<BR/>クレジットカード<br/></td>
																		<td BGCOLOR="#FFFFFF"><xml:out select="$restdetail//card_comm" /></td>
																	</tr>
																	</xml:if>

																	<xml:if select="$restdetail//parking[not(.='')] ">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" HEIGHT="21" VALIGN="TOP" width='85'>駐車場<br/></td>
																		<td BGCOLOR="#FFFFFF" HEIGHT="21"><xml:out select="$restdetail//parking" escapeXml="false" /></td>
																	</tr>
																	</xml:if>

																	<xml:if select="$restdetail//table_num[not(.='')] ">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='85'>座席数<br/></td>
																		<td BGCOLOR="#FFFFFF"><xml:out select="$restdetail//table_num" escapeXml="false"/></td>
																	</tr>
																	</xml:if>

																	<xml:if select="$restdetail//non_smoke[not(.='')] ">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='85'>禁煙席<br/></td>
																		<td BGCOLOR="#FFFFFF"><xml:out select="$restdetail//non_smoke" escapeXml="false"/></td>
																	</tr>
																	</xml:if>

																	<xml:if select="$restdetail//vip[not(.='')] ">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='85'>個室<br/></td>
																		<td BGCOLOR="#FFFFFF"><xml:out select="$restdetail//vip" escapeXml="false"/></td>
																	</tr>
																	</xml:if>

																</table>
															</td>
														</tr>
													</table>

													<br>

													<xml:if select="$restdetail//excellentpiece[not(.='')] ">
													<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
														<tr>
															<td>
																<table BORDER="0" CELLSPACING="1" CELLPADDING="3" WIDTH="100%">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" WIDTH="85"><font CLASS="text8">メニュー例<br/>
																		</font></td>
																		<td BGCOLOR="#FFFFFF" VALIGN="TOP"><font COLOR="#000000" CLASS="text8">
																		<xml:out select="$restdetail//excellentpiece" escapeXml="false"  />
																		</font></td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
													</xml:if>

													<br>
<% if( allotVec_size == 0){	%>
			 										<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
														<tr>
															<td VALIGN="TOP">
																<table BORDER="0" CELLSPACING="1" CELLPADDING="3" WIDTH="100%">
																	<tr>
																		<td BGCOLOR="#EEEEEE" CLASS="b" VALIGN="TOP" width='85'>取消料<br/></td>
																		<td BGCOLOR="#FFFFFF">
																			<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
																				<tr>
																					<td><xml:out select="$restdetail//cansell_comm" escapeXml="false" /></td>
																				</tr>
																			</table>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
													<br/>
<%	}	%>

												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td BGCOLOR="#F3F0EA" WIDTH="1"><img SRC="/img/res_img/shim.gif" WIDTH="8" HEIGHT="1" ALT=""></td>
						<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/res_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
					</tr>
					<tr>
						<td BGCOLOR="#666666" COLSPAN="5"><img SRC="/img/res_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
					</tr>
				</table>
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

var s_pageName="RESTRAUNT_DETAIL"
var s_server="www.lastminute.co.jp"
var s_channel="RESTRAUNT"
var s_pageType=""
var s_prop1="RESTRAUNT_DETAIL_<xml:out select='$restdetail//restaurantname' />"
var s_code=' '

//-->
</script>
<script language="JavaScript" src="http://www.lastminute.co.jp/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<!-- Omnituer Section -->


</body>
</html:html>
