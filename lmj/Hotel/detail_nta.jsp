<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.lastminute.Hotel.detail.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%
	Form form = (Form)request.getAttribute( "Hotel.detail.Form" );
	if( form == null ){
		form = new Form();
	}
	String er_comment = form.getViewErrorCopmment("\\n").trim();
	String xmlstring = form.getXmlstring();
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
var reload = 0;
function nn4reload(){if( _bro == 2 ){	location.reload();}}
function reloadCheck(){
	if( reload != 0 ){
		window.status = "�������ł��B���΂炭���҂��������B";
		return false;
	}else{
		reload = 1;
		return true;
	}
}
function hotelpop( next, name , hotel_id){
	notice = "./Popup.do?next=" + next+ "&hotel_id=" + hotel_id ;
	remoteWins = window.open("",name,"scrollbars=1,width=800,height=500");
	if (remoteWins != null) {
	    	remoteWins.location = notice;
	}
	remoteWins.focus();
}
function resetRelocad(){
	reload = 0;
}
function checkPlanForm(){
	if( !reloadCheck() ){
		alert( "�������ł��B���΂炭���҂��������B" );
		return false;
	}
}
function checkAllotForm(){
	if( !reloadCheck() ){
		alert( "�������ł��B���΂炭���҂��������B" );
		return false;
	}
	if( document.forms[1].elements[ 'checkindate' ] == null){
		alert( "����������ύX���Ă��������B" );
		return false;
	} 
	r_err = 0;
	if( document.forms[1].elements[ 'checkindate' ].length == null ){
		if( document.forms[1].elements[ 'checkindate' ].checked ){
			r_err++;
		}
	}else{
		var c_size= new Number();
		c_size = eval( document.forms[1].elements[ 'checkindate' ].length );
		for( var s=0; s<c_size; s++){
			if( document.forms[1].elements[ 'checkindate' ][ s ].checked ){
				r_err++;
			}
		}
	}
	if( r_err == 0){
		alert( "�h���������I�т��������B" );
		return false;
	}
	var minorder = new Number();
	minorder = document.forms[1].elements[ 'min' ].value;
	var maxorder = new Number();
	maxorder = document.forms[1].elements[ 'max' ].value;
	var counter = new Number();
	counter = 0;
	if( document.forms[1].elements[ 'numberOfAdults' ] != null ){
		counter += eval( document.forms[1].elements[ 'numberOfAdults' ].value );
	}
	if( document.forms[1].elements[ 'numberOfMales' ] != null ){
		counter += eval( document.forms[1].elements[ 'numberOfMales' ].value );
	}
	if( document.forms[1].elements[ 'numberOfFemales' ] != null ){
		counter += eval( document.forms[1].elements[ 'numberOfFemales' ].value );
	}
	if( document.forms[1].elements[ 'numberOfKids' ] != null ){
		counter += eval( document.forms[1].elements[ 'numberOfKids' ].value );
	}
	if( document.forms[1].elements[ 'numberOfYoji1' ] != null ){
		counter += eval( document.forms[1].elements[ 'numberOfYoji1' ].value );
	}
	if( counter < minorder ){
		alert( "�����ݒ肪�������܂���B�����������p�l���������͂��������B" );
		return false;
	}
	if( counter > maxorder ){
		alert( "�����ݒ肪�������܂���B�����������p�l���������͂��������B" );
		return false;
	}
	return true;
}

<%	if( er_comment.length() > 0 ){	%>alert( '<%= er_comment %>' );	<%	}	%>

//-->
</SCRIPT>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0"onResize="nn4reload();">
<!-- �w�b�_frame -->
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
<!-- /�w�b�_frame -->
<!-- ���C�A�E�g -->
<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760">
	<tr>
		<td VALIGN="TOP"><IMG SRC="/img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>
<!-- �i�rframe -->
		<NOLAYER>	<IFRAME SRC="/lmj/navi.jhtml" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
		</NOLAYER>
		<ILAYER SRC="/lmj/navi.jhtml" WIDTH="147" HEIGHT="680"></ILAYER>
<!-- /�i�rframe -->
		</td>
<!-- ���� -->
		<td><IMG SRC="/img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br></td>
<!-- /���� -->
		<td VALIGN="TOP" ALIGN="center"><IMG SRC="/img/shim.gif" WIDTH="456" HEIGHT="1" alt=""><br>

	<!-- �����z�e���E��� -->
        <TABLE cellSpacing=0 cellPadding=0 width=598 border=0>
          <TR> 
            <TD align=left width=67 rowspan="2" valign="middle" > <img src="/img/header_icon_ds.gif" width="67" height="65"> 
            </TD>
            <TD class="txt16b" valign="middle"> 
              <table border="0" cellspacing="0" cellpadding="0" width="391" align="left">
                <tr> 
                  <td valign="bottom" class="txt16b">�����z�e���E��ǁ@<span class="txt12">DOMESTIC�@HOTELS</span></td>
                </tr>
                <tr> 
                  <td height="5"><img src="/img/blk.gif" width="521" height="1"></td>
                </tr>
                <tr> 
                  <td class="b"> 
                    <div align="left"><b><img src="/img/pont2.gif" width="10" height="10"> 
                      <a href="/lmj/Hotel/top.do"> LMJ��������</a> <img src="/img/pont2.gif" width="10" height="10"> 
                      <a href="/lmj/Hotel/top.do#kensaku"> ���񂽂񌟍�</a> <img src="/img/pont2.gif" width="10" height="10">
                      <a href="/lmj/Hotel/from_postalArea.jsp"> �ړI�n���猟��</a></b></div></h3>
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
<!-- /�����z�e���E��� -->
<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="ROWSET" xml="${xmlstr}"></xml:parse>
<!-- /�����z�e���E��� -->
<table WIDTH='583' BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<tr>
		<td VALIGN="BOTTOM" width='45'><img SRC="/img/tkt_img/tab_on_06.gif" WIDTH='45' HEIGHT=1 ALT=""></td>
		<td VALIGN="BOTTOM" width='538'><img SRC="/img/tkt_img/tab_dot.gif" WIDTH='538' HEIGHT=1 ALT=""></td>
	</tr>
</table>

<!-- �v���� -->
<table WIDTH="583" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td COLSPAN="2" BGCOLOR="#F3F0EA"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="8" ALT=""></td>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
	</tr>
	<tr>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="1" BGCOLOR="#F3F0EA"><img SRC="/img/shim.gif" WIDTH="8" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="581" BGCOLOR="#F3F0EA">
<%
	String SelectionStr = form.getSelectionStr();
	String Productaltpxml = form.getProductaltpxml();
	String getHootStr = form.getFormHooter();
%>
<!--- �{�� --->
<table CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="100%">
	<tr>
		<td><span CLASS="super14"><xml:out select='$ROWSET//ROWSET/ROW/JPNNAM'/></span></td>
	</tr>
	<tr>
		<td><span CLASS="b">�Z���F</span>
		<xml:out select='$ROWSET//ROWSET/ROW/SUPAD1' escapeXml="false" />
		<xml:out select='$ROWSET//ROWSET/ROW/SUPAD2' escapeXml="false" />
		<xml:out select='$ROWSET//ROWSET/ROW/SUPAD3' escapeXml="false" /></td>
	</tr>
	<tr>
		<td><span CLASS="b">�d�b�F</span><xml:out select='$ROWSET//ROWSET/ROW/SUPTEL' /></td>
	</tr>
	<tr>
		<td><span CLASS="b">FAX�F</span><xml:out select='$ROWSET//ROWSET/ROW/SUPFAX' /><br/>
</td>
	</tr>
</table>
<!-- ���C�A�E�g�{�́@-->
<table  CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="565">
	<tr>
		<td valign="TOP" width="182" align="CENTER">
		<xml:choose>
		<xml:when select="$ROWSET//ROWSET/ROW/IMGFRN[not(.='')] ">
			<img width="150" alt="" border="0" src="http://www.yadoplaza.com/photo<xml:out select='$ROWSET//ROWSET/ROW/IMGFRN'/>"><BR/><BR/>
		</xml:when>
		<xml:otherwise>
			<img width="150" alt="" border="0" src="/img/hotel/<xml:out select='$ROWSET//ROWSET/ROW/SUPNBR' />_0.gif">
		</xml:otherwise>
		</xml:choose>

		<xml:if select="$ROWSET//ROWSET/ROW/IMGLOB[not(.='')] ">
			<img width="150" alt="" border="0" src="http://www.yadoplaza.com/photo<xml:out select='$ROWSET//ROWSET/ROW/IMGLOB'/>"><BR/>
		</xml:if>
		</td>

		<td valign="TOP" align="RIGHT" width="383">

<!-- �|�C���g ���O�@-->
<table CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="377">
	<tr>
		<td BGCOLOR="#666666">
<!-- �|�C���g -->
<table WIDTH="100%" CELLPADDING="3" CELLSPACING="1" BORDER="0" bgcolor="#999999">
	<tr BGCOLOR="#FFFFFF">
		<td CLASS="txt12"><span CLASS="b">���̃z�e���̃|�C���g</span><br/>
		<xml:out select='$ROWSET//ROWSET/ROW/JPNTXT/OTHER/TOKKI' escapeXml="false" /><br/></td>
	</tr>
	<tr BGCOLOR="#FFFFFF">
		<form action='./detail.do' method='get' onsubmit="return checkPlanForm();">
		<input type='hidden' name='agtcode' value='<%= form.getAgtcode() %>'/>
		<input type='hidden' name='supnbr' value='<%= form.getSupnbr() %>'/>
		<input type='hidden' name='catid' value='4'/>
		<input type='hidden' name='checkindate' value='<%= form.getCheckindate() %>'/>

		<td CLASS="txt12b"><span CLASS="b">���h���v���������I�т̂����u�����E�󎺁v�{�^���������Ă�������</span><br/>
			<select name='product_id' onChange="javascript:resetRelocad();">
			<%= SelectionStr %>
			</select><br/>
		</td>
	</tr>
	<tr BGCOLOR="#FFFFFF">
		<td align='right'>
			<input type='image' src='/img/btt_charge.gif' border='0'/>
		</td>
	</tr>
</form>
</table>
</td>
</tr>
</table>
<br/>
<!-- ���� -->
<!-- ���X�g -->
<!-- �t�H�[���@-->
<table CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="377">
	<tr>
		<td BGCOLOR="#666666">
<%	if(( form.isAllotechekflg() )&&( Productaltpxml.length() == 0)){ %>
<table border=0 width='100%' bgcolor='#999999' cellpadding="0" cellspacing="1">
	<tr>
		<td bgcolor='#ffffff' align='center' class='b'><br/>
		<img src='/img/icon_stop.gif' border='0'>���݁A�I�����ꂽ�v�����́A������ɂȂ��܂���B<br/>
		�ēx�A���I�т�������
		<br/><br/>
		</td>
	</tr>
</table>
<%	}else if( Productaltpxml.length() > 0){	%>
<table WIDTH="100%" CELLPADDING="3" CELLSPACING="1" BORDER="0" bgcolor="#999999">
	<form action='./checkAllote.do' method='get' onsubmit="return checkAllotForm();">
	<input type='hidden' name='agtcode' value='<%= form.getAgtcode()	%>'/>
	<input type='hidden' name='product_id' value='<%= form.getProduct_id() %>'/>
	<input type='hidden' name='meal_cd' value='<%= form.getMeal_cd() %>'/>
	<input type='hidden' name='supnbr' value='<%= form.getSupnbr()	%>'/>
	<input type='hidden' name='roomtype_cd' value='<%= form.getRoomtype_cd()	%>'/>
	
	<tr bgcolor="#FFFFFF">
		<td span="txt12">
			<span CLASS="b">�����p�����̂��ē�</span><br/>
			����]�̂��h���J�n�������W�I�{�^���őI�����ĉ��L�ɐl��������͂��āu�\�񂷂�v�{�^�����N���b�N���Ă��������B
			���ۂ̂����p�l���ŋ󎺏Ɖ�����Ē����A�Ɖ�ʉ�ʂɂċ󎺁E���������m�F�������B <br/>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td align='center'>
			<table WIDTH="100%" CELLPADDING="0" CELLSPACING="1" BORDER="0" bgcolor="#999999">
				<td align='center'>
					<%= Productaltpxml %>
				</td>
			</table>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td align='center'>
			<table border='0' width='100%' cellpadding='0' cellspacing='0'>
				<tr>
					<td align='left' bgcolor='#FFFFFF' width='95'>
						<%=	form.getTagSelector( "�����O�̏T��", form.getBeforeWeekTag())	%>
					</td>
					<td align='right' bgcolor='#FFFFFF'>
						<%=	form.getTagSelector( "���̏T�ց���", form.getNextWeekTag())	%>
					</td>
				<tr>
			</table>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td align='center'>
			<%=	getHootStr %>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td>
			<table border='0' width='100%' cellpadding='0' cellspacing='0'>
				<tr>
					<td bgcolor='#FFFFFF' class="txt10">
						�ꕔ��������̂����p�l���������͂��������B<br/>
						�܂��A1��6���l�ȏ�ł������p������ꍇ������܂��B<br/>
						���q���`����l�ɏ��������H���E�Q�����]����邨�q�l�i���w�Z���w�N�܂Łj<br/>
						���q���a�����q�l�����E�Q�����]����邨�q�l�i�c�t���ȏ�A���w�Z��w�N�܂Łj<br/><br/>
					</td>
				</tr>
				<tr>
					<td align='right' bgcolor='#FFFFFF'>
						<input type='image' src='/img/btt_yoyakusuru.gif' border='0'/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td BGCOLOR="#FFFFFF">
			<span CLASS="txt12">
									�{�ݏ��F���{���s<br/>
									���x�����͏h���{�݂ɒ��ڂ��肢�������܂��B<br/>
			</span>
		</td>
	</tr>
		<!-- �����t�H�[�� -->
	</form>
</table>
<%	}	%>
<!-- �t�H�[���@-->
		</td>
	</tr>
</table>
<!-- �|�C���g ���O�@-->
<br>
<!-- �z�e���C���t�HOUT -->
<table BGCOLOR="#999999" CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="377">
	<tr>
		<td>
<table WIDTH="100%" CELLPADDING="3" CELLSPACING="1" BORDER="0">
	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE" WIDTH="100">�`�F�b�N�C��</td>
		<td BGCOLOR="#FFFFFF" WIDTH="88"><xml:out select='$ROWSET//ROWSET/ROW/CHECKINXML/CHECKINTIME/EARLY'/>
		<xml:out select='$ROWSET//ROWSET/ROW/CHECKINXML/CHECKIN'/></td>
		<td CLASS="b" BGCOLOR="#EEEEEE" WIDTH="100">�`�F�b�N�A�E�g</td>
		<td BGCOLOR="#FFFFFF" WIDTH="89"><xml:out select='$ROWSET//ROWSET/ROW/CHECKINXML/CHECKOUT'/></td>
	</tr>

	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">���q����</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF"><xml:out select='$ROWSET//ROWSET/ROW/HTLRMS'/>��</td>
		<xml:if select="$ROWSET//ROWSET/ROW/HTLNP[not(.='')] ">
		<td BGCOLOR="#FFFFFF">
		<xml:out select='$ROWSET//ROWSET/ROW/HTLNP' />��
		</td>
	</xml:if>
	</tr>

	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">�J�ƔN</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF"><xml:out select='$ROWSET//ROWSET/ROW/HTLEST'/>�N</td>
	</tr>

	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">�����N</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF">
		<xml:out select='$ROWSET//ROWSET/ROW/HTLRNV'/>�N
		</td>
	</tr>

	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">��ʋ@��</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF">
			�Ŋ��w�F<xml:out select='$ROWSET//ROWSET/ROW/NERSTN' escapeXml="false" /><br>

			�A�N�Z�X�F<xml:out select='$ROWSET//ROWSET/ROW/TRAFICXML' escapeXml="false" /><br>

			�������H�F<xml:out select='$ROWSET//ROWSET/ROW/HIGHWAY'  escapeXml="false" /><br>

			���̑���ʋ@�ցF<xml:out select='$ROWSET//ROWSET/ROW/OTHWAY' escapeXml="false" />

		</td>
	</tr>
	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">���ԏ�</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF">
			<xml:if select="$ROWSET//ROWSET/ROW/BUILDXML/PARKING_OF_ONE_NIGHT[not(.='')]" >
				���ԏ�P��������̗����F<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/PARKING_OF_ONE_NIGHT'/><br/>
			</xml:if>
			<xml:if select="$ROWSET//ROWSET/ROW/BUILDXML/TYPE_OF_PARKING[not(.='')]" >			
				���ԏ�̌`�ԁF<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/TYPE_OF_PARKING'/><br/>
			</xml:if>
		</td>
	</tr>
	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">�ٓ��T�[�r�X</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF">
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/CLEANING'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/COPY'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/SILVER'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/FAX'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/RELAX'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/ROOMSERVICE'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/LATECHECKIN'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/LATECHECKOUT'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/FOREIGN'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/CITYMAP'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/WHEELCHAIR'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/SIGNLANG'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/HOMEDERIVERRY'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/MORNING_NEWSPAPER'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/GUIDEDOG'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/SHATLE'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/EVENING_PAPER'/>
		</td>
	</tr>
	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">�ٓ��ݔ�</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF">
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/BUSINESS_CENTER'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/BUSINESS_ROOM'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/PARTY_HALL'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/RESTAURANT'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/EXHIBITION_HALL'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/WEDDING'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/SHOP'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/TEAHOUSE'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/CAFE'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/CONVSHOP'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/DRUG_STORE'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/TENNIS'/> 
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/GOLF'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/OPEN_AIR_SPRING'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/KASIKIRI_OPEN_AIR_SPRING'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/KASIKIRI_BATH'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/SAUNA'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/BATHROOM'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/ARCADE'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/GAMECORNER'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/SUPPER'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/KARAOKE_SALON'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/KARAOKE'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/VENDING_MACHINE'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/ICE_MACHIN'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/PLAYGROUND'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/NIGHTCLUB'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/BAR'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/BAR_LOUNGE'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/DANCE'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/GYM'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/FITTNESS'/>
				<xml:out select='$ROWSET//ROWSET/ROW/BUILDXML/OTHER'/>
		</td>
	</tr>
	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">�N���W�b�g�J�[�h��</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF">
<xml:if select="$ROWSET//ROWSET/ROW/CARD1[not(.='0')]">
	VISA�J�[�h<br/>
</xml:if>
<xml:if select="$ROWSET//ROWSET/ROW/CARD2='1'">
	�}�X�^�[�J�[�h<br/>
</xml:if>
<xml:if select="$ROWSET//ROWSET/ROW/CARD3='1'">
	�A���b�N�X�J�[�h<br/>
</xml:if>
<xml:if select="$ROWSET//ROWSET/ROW/CARD4='1'">
	�_�C�i�[�Y�J�[�h<br/>
</xml:if>
<xml:if select="$ROWSET//ROWSET/ROW/CARRD5='1'">
	JCB�J�[�h<br/>
</xml:if>
<xml:if select="$ROWSET//ROWSET/ROW/CARRD6[not(.='0')]">
	<xml:out select='$ROWSET//ROWSET/ROW/CARDNM'/><br/></xml:if>
<xml:if select="$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/DVCARD[not(.='')]">
	<xml:out select='$ROWSET//ROWSET/ROW/SERVICEXML/SERVICE/DVCARD'/><br/>
</xml:if>
	</td>
	</tr>

	<xml:if select="$ROWSET//ROWSET/ROW/FRINGE2[not(.='')]" >
	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">���ӏ��</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF"><xml:out select='$ROWSET//ROWSET/ROW/FRINGE2' escapeXml="false" /></td>
	</tr>
	</xml:if>
	<xml:if select="$ROWSET//ROWSET/ROW/FRINGE1[not(.='')]" >
	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">���ӊό����</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF"><xml:out select='$ROWSET//ROWSET/ROW/FRINGE1' escapeXml="false" /></td>
	</tr>
	</xml:if>
	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">�n�}</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF">
		<span CLASS="b">
		<a href="javascript:hotelpop('map1','map1','<xml:out select='$ROWSET//ROWSET/ROW/SUPNBR' />' );">�ڍ�</a>
		</span></td>
	</tr>

<xml:if select="$ROWSET//ROWSET/ROW/BATH1[not(.='')]">
	<tr>
		<td CLASS="b" BGCOLOR="#EEEEEE">�����C</td>
		<td COLSPAN="3" BGCOLOR="#FFFFFF">
		<a href="javascript:hotelpop('bath','bath','<xml:out select='$ROWSET//ROWSET/ROW/SUPNBR'/>' );">�ڍ�</a>
		</td>
	</tr>
</xml:if>
</table>

			<!-- �z�e���C���t�H -->
		</td>
	</tr>
</table>
<!-- �z�e���C���t�HOUT -->
		</td>
	</tr>
</table>
<br/>
<!-- ���C�A�E�g�{�́@-->
		</td>
		<td WIDTH="1" BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
	</tr>
	<tr>
		<td BGCOLOR="#666666" COLSPAN="4"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
	</tr>
</table>
	<br>
<!-- /�v���� -->
	</td>
	</tr>
</table>

	</center>
<!-- /���C�A�E�g -->

<!-- �R�s�[���C�gframe -->
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
<!-- /�R�s�[���C�gframe -->

<!-- Omnituer Section -->
<script language="JavaScript">
<!--
/* You may give each page an identifying name, server, and channel on
the next lines. */

var s_pageName="DHOTEL_DETAIL"
var s_server="www.lastminute.co.jp"
var s_channel="DHOTEL"
var s_pageType=""
var s_prop1="DHOTEL_DETAIL_NTA_<xml:out select='$ROWSET//ROWSET/ROW/JPNNAM'/>"
var s_code=' '

//-->
</script>
<script language="JavaScript" src="http://www.lastminute.co.jp/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<!-- Omnituer Section -->

</body>
</html>