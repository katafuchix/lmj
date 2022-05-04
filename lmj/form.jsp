<%@ page contentType="text/html; charset=Shift_JIS" %>
<%@ page language="java" import="java.util.*,
								javax.sql.*,
								javax.naming.*,
								jp.co.lastminute.*,
								org.apache.struts.action.Action,
								jp.co.yobrain.util.*,
								jp.co.yobrain.util.form.*,
								jp.co.yobrain.util.format.DataFormat,
								jp.co.lastminute.common.DateComboHelper,
								jp.co.lastminute.OTours.*" %>
<%
	RequestHundler handler = new RequestHundler();
	ServletContext servletContext = getServletContext();
	//DataSource Datasouce = (DataSource)servletContext.getAttribute( Action.DATA_SOURCE_KEY );
	handler.init( servletContext );
	//handler.setDss( Datasouce );
	handler.parseRequest( request );
	
	if( !handler.isError() ){
%><jsp:forward page="no_good.jsp" /><%
		return;
	}
	//////////
	String url = "https://"+ request.getServerName() + "/lmj/TravelcoAction.do;jsessionid=" + session.getId() ;

%>
<head>
<title>lastminute.com - The first place to look at the last minute</title>
<link REL="stylesheet" HREF="/basic.css" TYPE="TEXT/CSS">
<script LANGUAGE="javascript">
<!--
// _bro: 1=NN6+, 2=NN4, 3=IE, 4=Opera, 0=others
var _bro=(window.opera?4:(document.all?3:(document.getElementById?1:(document.layers?2:0))));
// _ie5: true=IE5+
var _ie5=(navigator.appName.indexOf('Microsoft Internet Explorer')>=0
&& document.getElementById)?true:false;
//--></script>
<script LANGUAGE="javascript">
<!--
function nn4reload()
{
if( _bro == 2 ){
location.reload();
}
}
//--></script>

<script LANGUAGE="javascript"><!--
	function IsMonthday(yyyy, mm){
		switch(mm)
		{
		case 2:
			if( (yyyy % 400 == 0) || (yyyy % 4 == 0 && yyyy % 100 != 0) ) {	return 29;	} else {	return 28;	}
		case 4:
			return 30;
		case 6:
			return 30;
		case 9:
			return 30;
		case 11:
			return 30;
		default:
			return 31;
		}
	}
	function getDiffrenceDateStr(from, to){
			if(parseInt(from) > parseInt(to))	return -1;
			var fy = parseInt(from.substring(0, 4));
			var fm = parseInt(from.substring(4, 6));
			var fd = parseInt(from.substring(6, 8));
			var ty = parseInt(to.substring(0, 4));
			var tm = parseInt(to.substring(4, 6));
			var td = parseInt(to.substring(6, 8));
			return getDiffrenceDate(fy, fm, fd, ty, tm, td);
	}
	function getDiffrenceDate(fy, fm, fd, ty, tm, td){
		alert(fy + "," +  fm + "," +  fd + "," + ty + "," + tm + "," + td);
		var reint = 0;
			if(ty - fy > 1){	return -1;
			}else if(ty - fy == 0){
				if(fm == tm){	reint = td - fd;	}else{
					for(var i = fm + 1; i < tm; i++){	reint += IsMonthday(fy, i);	}
					reint += IsMonthday(fy, fm) - fd + td;
				}
				return reint;
			}else{
				reint = IsMonthday(fy, fm) - fd;
				if(fm < 12){
					for(var i=fm+1; i <= 12; i++){	reint += IsMonthday(fy, i);	}
				}
				if(tm > 1){
					for(var i=1; i<tm-1; i++){	reint += IsMonthday(ty, i);	}
				}
				reint += td;
				return reint;
			}
	}
	function checkForm(){
		var jslastsales = 0;
		var error = "";
		var x = new Date;
		var jsyear = x.getYear();
		var jsmonth = x.getMonth() + 1;
		var jsday = x.getDate();
		var jsdate = parseInt( jsyear * 10000 + jsmonth * 100 + jsday );
		var njsyear = document.forms[0].elements["year"].value
		var njsmonth = document.forms[0].elements["month"].value
		var njsday = document.forms[0].elements["day"].value
		var njsdate = parseInt( njsyear + njsmonth + njsday );
		if( njsdate - jsdate - jslastsales < 1 ){
			error += "�E��]�o�����̓��͂��s�K�؂ł�\n";
		}
		var person = parseInt(document.forms[0].elements["adt_pax"].value);
		if( person < 1){
			error += "�E���s�l�����s�K�؂ł�\n";
		}else if(person > 8){
			error += "�E��x�̂��⍇���͍ő�8���l�ƂȂ�܂��B\n ��l�A�q���A�c���̍��v��8���l�ȉ��ł��⍇����������\n";
		}
		if( !document.forms[0].elements["order_mode"][0].checked && !document.forms[0].elements["order_mode"][1].checked ){
			error += "�E��ȏƉ�܂��͗\��\�����݂��I�΂�Ă��܂���\n";
		}
		if(error != ""){
			alert("�G���[\n\n"+error);
			return false;
		}else{
			return true;
		}
	}
//--></script>
</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<!-- /�C�O�c�A�[ -->
<table WIDTH="650" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="center">
    <tr>
		<td WIDTH="67"><img SRC="/img/header_icon_ot.gif" WIDTH="67" HEIGHT="65" ALT=""></td>
		<td WIDTH="693"><img SRC="/img/header_txt_ot_01.gif" WIDTH="174" HEIGHT="20" ALT="�C�O�c�A�["><br>
			<img SRC="/img/blk.gif" WIDTH="583" HEIGHT="1" ALT=""><br>
			<img SRC="/img/header_txt_ot_03.gif" WIDTH="122" HEIGHT="14" ALT=""></td>
	</tr>
</table>
<!-- /�C�O�c�A�[ -->
<% if( !handler.isError() ){ %>
<table WIDTH="620" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="center">
	<tr>
	<td colspan="7" align="left"><font size=-1 color="#ff0000">
		�E��ȏƉ�܂��͗\��\�����݂��I�΂�Ă��܂���B
	</font></td>
	</tr>
</table>
<%	return;
	}	%>
<!-- /�C�O�c�A�[ -->
<table BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#666666" WIDTH="620" ALIGN="CENTER">
    <tr>
		<td>
			<table WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="0">
				<form action="<%= url %>" method="post" onsubmit="return checkForm();">
					<tr>
						<td BGCOLOR="#F3F0EA" ALIGN="CENTER"><br>
							<table BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="550">
								<tr>
									<td WIDTH="9"><img SRC="/img/point_bule.gif" WIDTH="7" HEIGHT="7" ALT=""></td>
									<td CLASS="buleb" WIDTH="538">���₢���킹�E���\������</td>
								</tr>
								<tr BGCOLOR="#0066CC">
									<td HEIGHT="2" COLSPAN="2"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
								</tr>
							</table>
							<br>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td CLASS="b">�c�A�[�R�[�h�@<%= handler.agt_prod_cd %></td>
								</tr>
							</table>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
								<tr>
									<td>
										<table BORDER="0" CELLSPACING="1" CELLPADDING="2" WIDTH="100%">
											<tr BGCOLOR="#FFFBE3">
												<td CLASS="txt14redb" BGCOLOR="#FFFBE3" COLSPAN="2">�c�A�[���F<%= handler.title %></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td>���\��̍ۂ̓p�X�|�[�g�̗L��������r�U�̎擾���K�v���ǂ����Ȃǂ��\�����m�F�������B<br>
									<SPAN class="b">���S�Ă̍��ڂ�K�����I���������B </SPAN></td>
								</tr>
							</table>
							<br>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
								<tr>
									<td>
										<table BORDER="0" CELLSPACING="1" CELLPADDING="2" WIDTH="100%">
											<tr bgcolor="#EEEEEE">
												<td COLSPAN="3">����]�̏o�������w�肵�Ă��������B</td>
											</tr>
											<tr>
												<td BGCOLOR="#F8F8F8" WIDTH="148">��]�o����</td>
												<td BGCOLOR="#FFFFFF" WIDTH="367">
													<TABLE border="0" cellspacing="0" cellpadding="0">
														<TR>
															<TD>
<select name="year" size="1">
<%= DateComboHelper.createYearCombo( handler.year ) %>
</select>
															</TD>
															<TD>�N</TD>
															<TD>
<select name="month" size="1">
<%= DateComboHelper.createMonthCombo( handler.month ) %>
</select>
															</TD>
															<TD>��</TD>
															<TD>
<select name="day" size="1">
<%= DateComboHelper.createDayCombo( handler.day ) %>
</select>
															</TD>
															<TD>��</TD>
														</TR>
													</TABLE>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
								<tr>
									<td>
										<table BORDER="0" CELLSPACING="1" CELLPADDING="2" WIDTH="100%">
											<tr bgcolor="#EEEEEE">
												<td COLSPAN="2">���s�Q���Ґl�������L���������B(�{�l���܂�)
<select name="adt_pax" size="1">
<%= DateComboHelper.getAdtpax( handler.adt_pax ) %>
</select>�l</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#999999">
								<tr>
									<td>
										<table BORDER="0" CELLSPACING="1" CELLPADDING="2" WIDTH="100%">
											<tr bgcolor="#EEEEEE">
												<td align="center">
<%= DateComboHelper.getChkBox( "order_mode", "1", handler.order_mode ) %>��ȏƉ�
<%= DateComboHelper.getChkBox( "order_mode", "2", handler.order_mode ) %>�\��\������
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<table WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td><a href="javascript:document.forms[0].reset()"><img src="/img/btt_reset.gif" width="74" height="23" border="0"></a></td>
									<td ALIGN="RIGHT"><input type=image name=submit src="/img/btt_next.gif" width="74" height="23" alt="" border="0"></td>
								</tr>
							</table>
							<br>
						</td>
					</tr>
				</form>
			</table>
			<!-- /�l���t�H�[�� -->
		</td>
	</tr>
</table>
<!-- /���C�A�E�g -->
<!-- �R�s�[���C�gframe -->
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER">
	<tr>
	<td><img SRC="/img/blk.gif" WIDTH="760" HEIGHT="1" VSPACE="5" ALT="">
    <table border="0" width="760" cellpadding="1" cellspacing="1">
	<tr>
	<td align="center">
	<span CLASS="txt12">
	Copyright (C) 2003 - 2003 lastminute.com Japan Ltd. All Rights Reserved.<BR>
	</span>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	</table>
<!-- /�R�s�[���C�gframe -->

</body>
</html:html>
