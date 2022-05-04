<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
				 java.util.*,
				 jp.co.yobrain.util.*,
				 jp.co.yobrain.util.format.DataFormat,
				 jp.co.lastminute.common.HtmlpartMaker,
				 jp.co.lastminute.Hotel.PriceView,
				 jp.co.lastminute.Hotel.search.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %><%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%
	Form form = (Form)request.getAttribute( "Hotel.search.Form" );
	String xmlstring = form.getXmlstring();
	String pricestr = "";
	int plancouter = 0;
	DataFormat dataformat = null;
	String lmj_target_date = "agt_cd=LMJ&scatid=0&catid=4&act=Search&checkInDate=" + dataformat.getNowDate(3, true );
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
function nn4reload(){if( _bro == 2 ){location.reload();}}
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
	</center>
<!-- /�w�b�_frame -->

<!-- ���C�A�E�g -->
	<center>
	<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="760">
	<tr>
	<td VALIGN="TOP">
	<IMG SRC="/img/shim.gif" WIDTH="147" HEIGHT="1" alt=""><br>

<!-- �i�rframe -->
	<NOLAYER>
	<IFRAME SRC="/navi.html" NAME="" WIDTH="147" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="/navi.html" WIDTH="147" HEIGHT="680"></ILAYER>
<!-- /�i�rframe -->

	</td>

<!-- ���� -->
	<td>
	<IMG SRC="/img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /���� -->

	<td VALIGN="TOP" ALIGN="center">
	<IMG SRC="/img/shim.gif" WIDTH="458" HEIGHT="1" alt=""><br>

	<!-- �����z�e���E��� -->
        <TABLE cellSpacing=0 cellPadding=0 width=458 border=0>
          <TR> 
            <TD align=left width=67 rowspan="2" valign="middle" > <img src="/img/header_icon_ds.gif" width="67" height="65"> 
            </TD>
            <TD class="txt16b" valign="middle"> 
              <table border="0" cellspacing="0" cellpadding="0" width="391" align="center">
                <tr> 
                  <td valign="bottom" class="txt16b">�����z�e���E��ǁ@<span class="txt12">DOMESTIC�@HOTELS</span></td>
                </tr>
                <tr> 
                  <td height="5"><img src="/img/blk.gif" width="391" height="1"></td>
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

<!-- ���X�g -->
		<table WIDTH="458" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
		<td WIDTH="100%" colspan="4"><img SRC="/img/tab_dot.gif" WIDTH="100%" HEIGHT="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
						<td COLSPAN="2" BGCOLOR="#F3F0EA"><img SRC="/img/shim.gif" WIDTH="10" HEIGHT="12" ALT=""></td>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		<td WIDTH="8" BGCOLOR="#F3F0EA"><img SRC="/img/shim.gif" WIDTH="8" HEIGHT="8" VSPACE="1" ALT=""></td>
		<td WIDTH="448" BGCOLOR="#F3F0EA">
			<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="438">
			<tr>
			<td COLSPAN="2" VALIGN="TOP" align='right'>
<% if( form.getProductname().length() == 0 ){	%>
			<span CLASS="super14">
<% String searchParam = form.getScatid()+"&checkindate="+form.getCheckindate()
										+"&local_area_code="+form.getLocal_area_code()
										+"&state_cd="+form.getState_cd()
										+"&city_cd="+form.getCity_cd()
										+"&night="+form.getNight();
%>

			<%= HtmlpartMaker.getPagingString( "/lmj/Hotel/search.do", searchParam, form.getPages(), form.getTotalpages()) %>
			</span>
<%	}	%>
			</td>
			</tr>
			<tr>
			<td COLSPAN="2">
<!-- �ړ� -->
	<table WIDTH="438" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<%
	 if((form.getLocal_area_code().equals("120001") || form.getCity_cd().equals("949"))
	 &&( form.getPages().equals("0") && !form.getScatid().equals("4126"))) {
%>
		<tr><td valign="top" colspan="2"><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td></tr>
		<tr>
			<td valign="top" width="77">
				<a href="/lmj/hotel/showDetail.do?sup_id=DH12000200&<%= lmj_target_date %>&product_id=DH12000200-351">
				<img src="/img/hotel/DH12000200_0.gif" height="48" width="72" border="0"></a>
			</td>
			<td valign="top" width="361">
				<span CLASS="txt14b">
						<a href="/lmj/hotel/showDetail.do?sup_id=DH12000200&<%= lmj_target_date %>&product_id=DH12000200-383">�q���g�������x�C</a></span>
					<br/>
					<span class="txt12">�s�S����킸��30���B�J�������ӂ�郊�]�[�g���ڂ̑O�ɂ�����܂��B<br/>�����f�B�Y�j�[���]�[�g�̃I�t�B�V�����z�e���ł���q���g�������x�C�B�p�[�N���̑�����͓����f�B�Y�j�[�����h�Ɠ����f�B�Y�j�[�V�[�A�C���̑�����́A�����p�Ƃ��̌������ɍL���門�V�O��]�ނ��Ƃ��ł��܂��B</span>
					<br/><span class="txt10">�Z��:��t���Y���s���l1-8</span>
					<br/><br/>
					<table border='0' width=100% cellspacing='0' cellpadding='0'>
							<tr>
								<td><span class="txt11">
								<!--<a href="/lmj/hotel/showDetail.do?sup_id=DH12000200&<%= lmj_target_date %>&product_id=DH12000200-351">LMJ�������@���|���A�b�v�O���|�h�X�y�V�����v���� �H���Ȃ�</a></span><br/>-->
								<font color="#FF009C">LMJ�������@�q���g�����|���P�����H�t��</font></span><br/>
								<b>2�l1��  15,400�~����@3�l1��  13,200�~����@4�l1��  12,100�~����</b>
								</td>
							</tr>
					</table><br/>
			</td>
		</tr>
		<tr>
			<td>�@</td>
			<!--<td class="txt12">
				���̂ق��̂������߃v������<a href="/lmj/hotel/showDetail.do?sup_id=DH12000200&<%= lmj_target_date %>&product_id=DH12000200-351">������</a>����
			</td>-->
		</tr>
<%
	}
	 if((form.getLocal_area_code().equals("140002999") || form.getCity_cd().equals("1067999"))
	 &&( form.getPages().equals("0") && !form.getScatid().equals("4126"))) {
%>
		<tr><td valign="top" colspan="2"><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td></tr>
		<tr>
			<td valign="top" width="77">
				<a href="/lmj/hotel/showDetail.do?sup_id=DH14000220&<%= lmj_target_date %>&product_id=DH14000220-360">
				<img src="/img/hotel/DH14000220_0.gif" height="48" width="72" border="0"></a>
			</td>
			<td valign="top" width="361">
				<span CLASS="txt14b">
						<a href="/lmj/hotel/showDetail.do?sup_id=DH14000220&<%= lmj_target_date %>&product_id=DH14000220-360">���l�G�N�Z���z�e�����}</a></span>
					<br/>
					<span class="txt12">JR���l�w�������k��1���A�����w���JR30���ƌ�ʂɕ֗��ł��B</span>
					<br/><span class="txt10">�Z��:�_�ސ쌧���l�s�����K1-1-12</span>
					<br/><br/>
					<table border='0' width=100% cellspacing='0' cellpadding='0'>
							<tr>
								<td><span class="txt11">
								<a href="/lmj/hotel/showDetail.do?sup_id=DH14000220&<%= lmj_target_date %>&product_id=DH14000220-360">lastminute,com �X�y�V�����i�c�C���j �H���Ȃ�</a></span><br/>
								<b>2�l���p  6,000�~ </b>
								</td>
							</tr>
							<tr>
								<td><span class="txt11">
								<a href="/lmj/hotel/showDetail.do?sup_id=DH14000220&<%= lmj_target_date %>&product_id=DH14000220-361">lastminute.com �X�y�V�����i�c�C���{���H�t�j ���H����</a></span><br/>
								<b>2�l���p  7,500�~ </b>
								</td>
							</tr>
							<tr>
								<td><span class="txt11">
								<a href="/lmj/hotel/showDetail.do?sup_id=DH14000220&<%= lmj_target_date %>&product_id=DH14000220-362">lastminute,com �X�y�V�����i�_�u���j �H���Ȃ�</a></span><br/>
								<b>2�l���p  6,000�~ </b>
								</td>
							</tr>							
							<tr>
								<td><span class="txt11">
								<a href="/lmj/hotel/showDetail.do?sup_id=DH14000220&<%= lmj_target_date %>&product_id=DH14000220-363">lastminute,com �X�y�V�����i�_�u��+���H�t�j ���H����</a></span><br/>
								<b>2�l���p  7,500�~ </b>
								</td>
							</tr>
					</table><br/>
			</td>
		</tr>
		<tr>
			<td>�@</td>
			<td class="txt12">
				���̂ق��̂������߃v������<a href="/lmj/hotel/showDetail.do?sup_id=DH14000220&<%= lmj_target_date %>&product_id=DH14000220-360">������</a>����
			</td>
		</tr>
<%
	}
	 if((form.getLocal_area_code().equals("270005") || form.getCity_cd().equals("2016"))
	 &&( form.getPages().equals("0") && !form.getScatid().equals("4126"))) {
%>
		<tr>
			<td valign="top" colspan="2"><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td>
		</tr>
		<tr>
			<td valign="top" width="77">
				<a href="/lmj/hotel/showDetail.do?sup_id=DH27000100&<%= lmj_target_date %>&product_id=DH27000100-202%09">
				<img src="/img/hotel/DH27000100_0.gif" height="48" width="72" border="0"></a>
			</td>
			<td valign="top" width="361">
				<span CLASS="txt14b">
						<a href="/lmj/hotel/showDetail.do?sup_id=DH27000100&<%= lmj_target_date %>&product_id=DH27000100-143">�z�e�����q�֐���`</a></span>
					<br/>
					<span class="txt12">�֐����ۋ�`�����B��̃z�e���ł���A�����̃t���C�g���x���̓����ȂǁA�C�O�E�������s�̑O�㔑�ɂƂ��Ă��֗��ň��S�ł��B�֋󂩂烆�j�o�[�T���X�^�W�I�W���p���܂ŁA���s�o�X�Ŗ�40���ł��B��`�̕��͋C���ԋ߂ɖ��킢�Ȃ���A��������肨���났���������܂��B</span>
					<br/><span class="txt10">�Z��:���{�򍲖�s��B��`�k�P�Ԓn�i�֐����ۋ�`���j</span>
					<br/><br/>
					<table border='0' width=100% cellspacing='0' cellpadding='0'>
							<tr>
								<td><span class="txt11">
								<!--<a href="/lmj/hotel/showDetail.do?sup_id=DH27000100&<%= lmj_target_date %>&product_id=DH27000100-143">LMJ�X�y�V�����v���� �X�^���_�[�h�V���O��</a></span><br/>-->
								<font color="#FF009C">LMJ�X�y�V�����v���� �X�^���_�[�h�V���O��</font></span><br/>
								<b>1��1���@13,200�~����</b>
								</td>
							</tr>

							<tr>
								<td><span class="txt11">
								<!--<a href="/lmj/hotel/showDetail.do?sup_id=DH27000100&<%= lmj_target_date %>&product_id=DH27000100-180">LMJ�X�y�V�����v���� �X�^���_�[�h�c�C��</a></span><br/>-->
								<font color="#FF009C">LMJ�X�y�V�����v���� �X�^���_�[�h�c�C��</font></span><br/>
								<b>2��1���@8,250�~����</b>
								</td>
							</tr>

							<tr>
								<td><span class="txt11">
								<!--<a href="/lmj/hotel/showDetail.do?sup_id=DH27000100&<%= lmj_target_date %>&product_id=DH27000100-201">LMJ�X�y�V�����v���� �g���v��</a></span><br/>-->
								<font color="#FF009C">LMJ�X�y�V�����v���� �g���v��</font></span><br/>								
								<b>3��1���@5,900�~����</b>
								</td>
							</tr>

					</table>
					<br/>
			</td>
		</tr>
<%
	}
	if ((form.getLocal_area_code().equals("260003") || form.getCity_cd().equals("1931"))  
	&& ( form.getPages().equals("0") && !form.getScatid().equals("4126")) ) {
%>
		<tr>
			<td valign="top" colspan="2"><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td>
		</tr>
		<tr>
			<td valign="top" width="77">
				<a href="/lmj/hotel/showDetail.do?sup_id=DH26000140&<%= lmj_target_date %>&product_id=DH26000140-243%09">
				<img src="/img/hotel/DH26000140_0.gif" height="48" width="72" border="0"></a>
			</td>
			<td valign="top" width="361">
				<span CLASS="txt14b">
						<a href="/lmj/hotel/showDetail.do?sup_id=DH26000140&<%= lmj_target_date %>&product_id=DH26000140-243%09">���[�K���C�����z�e�����s</a></span>
					<br/>
					<span class="txt12">���j�Ɠ`���̌Ós�E���s�w����k��7���Ƃ����D���n�Ɉʒu���Ă���z�e���B�ؖڂ̂₳�����A���i�̂���C���e���A�����Ă��������Ȃ����ĂȂ��ł��߂������������܂��B
�q���͂��q�l���������Ƃ����났����������悤�A���K������Ԃɍl���Ă��܂��B</span>
					<br/><span class="txt10">�Z��:���s�s�����擌�x��ʉ����H�����������P</span>
					<br/><br/>
					<table border='0' width=100% cellspacing='0' cellpadding='0'>
							<tr>
								<td><span class="txt11">
								<!--<a href="/lmj/hotel/showDetail.do?sup_id=DH26000140&<%= lmj_target_date %>&product_id=DH26000140-243%09">LMJ�X�y�V�����v�����@�X�^���_�[�h�V���O�� �H���Ȃ�</a></span><br/>-->
								<font color="#FF009C">LMJ�X�y�V�����v�����@�X�^���_�[�h�V���O�� �H���Ȃ�</font></span><br/>
								<b>1�l���p  8,000�~����</b>
								</td>
							</tr>

							<tr>
								<td><span class="txt11">
								<!--<a href="/lmj/hotel/showDetail.do?sup_id=DH26000140&<%= lmj_target_date %>&product_id=DH26000140-243%09">LMJ�X�y�V�����v���� �X�^���_�[�h�c�C�� �H���Ȃ�</a></span><br/>-->
								<font color="#FF009C">LMJ�X�y�V�����v���� �X�^���_�[�h�c�C�� �H���Ȃ�</font></span><br/>
								<b>2�l���p  6,500�~����</b>
								</td>
							</tr>


					</table>
					<br/>
			</td>
		</tr>

<%
	}
	if ( (form.getLocal_area_code().equals("130001") || form.getCity_cd().equals("1004")) 
	&& ( form.getPages().equals("0") && !form.getScatid().equals("4126"))) {
%>
		<tr>
			<td valign="top" colspan="2"><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td>
		</tr>
		<tr>
			<td valign="top" width="77">
				<a href="/lmj/hotel/showDetail.do?sup_id=DH13000160&<%= lmj_target_date %>&product_id=DH13000160-300">
				<img src="/img/hotel/DH13000160_0.gif" height="48" width="72" border="0"></a>
			</td>
			<td valign="top" width="361">
				<span CLASS="txt14b">
						<a href="/lmj/hotel/showDetail.do?sup_id=DH13000160&<%= lmj_target_date %>&product_id=DH13000160-260">���C�����p�[�N�z�e��</a></span>
					<br/>
					<span class="txt12">�S�̂������������ĂȂ�����ɐS�|���A���E�̃G�O�[�N�e�B�u�̕��X�A���s�҂̕��X�ɑ�ꋉ�̐S�n�悳�ƍ����@�\�A���K�ȃT-�r�X�����񋟂��������܂��B</span>
					<br/><br/>
					<table border='0' width=100% cellspacing='0' cellpadding='0'>
							<tr>
								<td><span class="txt11">
								<!--<a href="/lmj/hotel/showDetail.do?sup_id=DH13000160&<%= lmj_target_date %>&product_id=DH13000160-260">LMJ�X�y�V�����v���� REASONABLE�@�V���O���@���H����</a></span><br/>-->
								<font color="#FF009C">LMJ�X�y�V�����v���� REASONABLE�@�V���O���@���H����</font></span><br/>
								<b>1��1��  18,700�~ </b>
								</td>
							</tr>

							<tr>
								<td><span class="txt11">
								<!--<a href="/lmj/hotel/showDetail.do?sup_id=DH13000160&<%= lmj_target_date %>&product_id=DH13000160-261">LMJ�X�y�V�����v���� REASONABLE�@�c�C���@���H����</a></span><br/>-->
								<font color="#FF009C">LMJ�X�y�V�����v���� REASONABLE�@�c�C���@���H����</font></span><br/>
								<b>2��1��  11,000�~ </b>
								</td>
							</tr>

					</table>
					<br/>
			</td>
		</tr>


<%
	}
%>

		<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="LIST_VIEW" xml="${xmlstr}"></xml:parse>
		<xml:forEach select="$LIST_VIEW//LISTS/SLIST" >

		<tr>
			<td valign="top" colspan="2"><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td>
		</tr>
		<tr>
			<td valign="top" width="77">
				<a href="./detail.do?catid=4&supnbr=<xml:out select='SUPNBR' />&agtcode=<xml:out select='AGT_CD' />">

				<xml:choose>
				<xml:when select="PROMISEURI[not(.='')]">
					<img src="http://www.yadoplaza.com/photo/<xml:out select='PROMISEURI' />" height="48" width="72" border="0">
				</xml:when>
				<xml:otherwise>
					<img src="/img/hotel/<xml:out select='SUPNBR' />_0.gif" height="48" width="72" border="0"></a>
				</xml:otherwise>
				</xml:choose>

				</a>
			</td>
			<td valign="top" width="361">
				<span CLASS="txt14b">

						<a href="./detail.do?catid=4&supnbr=<xml:out select='SUPNBR' />&agtcode=<xml:out select='AGT_CD' />&checkindate=<%= form.getCheckindate() %>"><xml:out select='JPNNAM' /></a></span>

					<br/>
					<span class="txt12"><xml:out select='CATCH_COPY' escapeXml='false' /></span>
					<br/><span class="txt10">�Z��:<xml:out select='SUPAD2' /></span>
					<br/><br/>
					<table border='0' width=100% cellspacing='0' cellpadding='0'>

					<%	plancouter = 0;	%>
					<xml:forEach select="PLISTS/PLIST" >
						<%	if( plancouter < 3 ){	%>
							<xml:if select="PRICESTRHTM[not(.='')]" >
							<tr>
								<td><span class="txt11">
								<a href="./detail.do?catid=4&supnbr=<xml:out select='SUPNBR' />&agtcode=<xml:out select='AGT_CD' />&product_id=<xml:out select='PRODUCT_ID' />&checkindate=<%= form.getCheckindate() %>"><xml:out select='COPY' /></a></span><br/>
								<b><xml:out select='PRICESTRHTM' escapeXml='false' /></b>
								</td>
							</tr>
							<%	plancouter++;	%>
							</xml:if>
						<%	}	%>
					</xml:forEach>
					</table>
					<br/>
			</td>
		</tr>
		<% if (plancouter > 2) {%>
		<tr>
			<td>�@</td>
			<td class="txt12">
				���̂ق��̂������߃v������<a href="./detail.do?catid=4&supnbr=<xml:out select='SUPNBR' />&agtcode=<xml:out select='AGT_CD' />&checkindate=<%= form.getCheckindate() %>">������</a>����
			</td>
		</tr>
		<% } %>
		<!--
		<tr>
			<td>�@</td>
			<td class="txt10">
				�Z��:<xml:out select='SUPAD2' />
			</td>
		</tr>
		-->
	</tr>
</xml:forEach>
</table>

<!-- /�ړ� -->
			</td>
			</tr>
			<tr>
			<td COLSPAN="2" HEIGHT="20" VALIGN="TOP">

<!-- �ړ� -->
	<table WIDTH="438" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td valign="top" colspan="2"><img alt="" vspace="6" height="1" width="438" src="/img/line560.gif"></td>
				</tr>

				<tr>
			<td COLSPAN="2" VALIGN="TOP" align='right'>
<% if( form.getProductname().length() == 0 ){	%>
			<span CLASS="super14">
<% String searchParam = form.getScatid()
											+"&checkindate="+form.getCheckindate()
											+"&local_area_code="+form.getLocal_area_code()
											+"&state_cd="+form.getState_cd()
											+"&city_cd="+form.getCity_cd()
											+"&night="+form.getNight();
%>
			<%= HtmlpartMaker.getPagingString( "/lmj/Hotel/search.do", searchParam, form.getPages(), form.getTotalpages() ) %>
			</span><br/>
<%	}	%>
			</td>
				</tr>
				</table>
<!-- /�ړ� -->

			</td>
			</tr>
			</table>

		</td>
		<td BGCOLOR="#666666"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
		</tr>
		<tr>
		<td BGCOLOR="#666666" COLSPAN="4"><img SRC="/img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
		</tr>
		</table>
<!-- /���X�g -->

	</td>

<!-- ���� -->
	<td>
	<IMG SRC="/img/shim.gif" WIDTH="15" HEIGHT="1" alt=""><br>
	</td>
<!-- /���� -->

	<td VALIGN="TOP">
	<IMG SRC="/img/shim.gif" WIDTH="125" HEIGHT="1" alt=""><br>

<!-- �A�hframe -->
<!-- 030912 SystemDown
	<NOLAYER><IFRAME SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" NAME="" WIDTH="125" HEIGHT="680" FRAMEBORDER="0" SCROLLING="NO"></IFRAME>
	</NOLAYER>
	<ILAYER SRC="http://www.lastminute.co.jp/cgi-bin/banner/bannerout.cgi?cate=sbanner" WIDTH="125" HEIGHT="680"></ILAYER>
-->
<A HREF="http://ads.lmj.valueclick.jp/redirect?host=hs0000797&size=125x600&b=indexpage&v=0" TARGET="_top"><IMG BORDER="0" WIDTH="125" HEIGHT="600" ALT="Click here to visit our sponsor"
SRC="http://ads.lmj.valueclick.jp/cycle?host=hs0000797&size=125x600&b=indexpage&noscript=1"></A>
<!-- modify end -->
<!-- /�A�hframe -->

	</td>
	</tr>
	</table>
	</center>
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

var s_pageName="DHOTEL_LIST"
var s_server="www.lastminute.co.jp"
var s_channel="DHOTEL"
var s_pageType=""
var s_prop1="DHOTEL_LIST"
var s_code=' '

//-->
</script>
<script language="JavaScript" src="http://www.lastminute.co.jp/s_code.js"></script>
<noscript><img src="http://lastminute.112.2O7.net/b/ss/lastminute/1/F.4-XeLvs" height="1" width="1" border="0" /></noscript>
<!-- Omnituer Section -->

</body>
</html>
