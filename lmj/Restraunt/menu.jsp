<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 java.text.*,
								 jp.co.yobrain.util.*,
								 jp.co.lastminute.cart.*,
								 jp.co.lastminute.cart.model.*,
								 jp.co.lastminute.cart.user.*,
								 jp.co.lastminute.cart.util.MemberFormatForWeb,
								 jp.co.lastminute.Restraunt.*,
								 jp.co.lastminute.Restraunt.node.*,
								 jp.co.lastminute.Restraunt.allot.*,
								 jp.co.lastminute.Restraunt.model.Form" %>
<%@ taglib uri="/WEB-INF/struts-html.tld"	prefix="html" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%
	String menuXmlStr = "";
	String detailXmlStr = "";
	String restaurant = "";
	String restaurantName = "";
	Form form = (Form)request.getAttribute( "Restraunt.model.Form" );
	if( form != null ){
		menuXmlStr = form.getMenuWindowXmlStr();
		detailXmlStr = form.getDetailXmlStr();
	}
//System.err.println("detailXmlStr="+detailXmlStr);
//System.err.println("menuXmlStr="+menuXmlStr);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>詳細情報</TITLE>
		<META content="text/html; charset=Shift_JIS" http-equiv=Content-Type>
		<LINK href="/basic.css" rel=stylesheet type=text/css>
		<META content="MSHTML 5.00.2614.3500" name=GENERATOR>

<!--レストラン詳細のXMLパース-->
<c:set var="detailstr" ><%= detailXmlStr %></c:set>
<xml:parse var="restdetail" xml="${detailstr}"></xml:parse>

<STYLE TYPE="text/css">
.pre { white-space:pre;}
</STYLE>

<SCRIPT language="javascript">
<!--

function MM_openBrWindow(theURL,winName,features) { //v2.0
	  window.open(theURL,winName,features);
}

/* 地図ページ */
function newwin2(){
	MM_openBrWindow( '/lmj/Restraunt/map.do?restaurant=<xml:out select="$restdetail//restaurant" />', 'MAP', "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=550");
}

//-->
</SCRIPT>
</HEAD>

<body BGCOLOR="#F3F0EA" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0" align=center>

<TABLE border=0 cellPadding=0 cellSpacing=0 width=560>
	<TBODY>
	<TR>
		<TD width=40>　 </TD>
		<TD vAlign=top width=520 CLASS="super14">
			<!--店名--><br>
			<xml:out select="$restdetail//restaurantname" escapeXml="false" />
　		（<xml:out select="$restdetail//restaurantnameeng" escapeXml="false" />） 詳細情報
			<br><br>
		</TD>
	</TR>
</TBODY>
</TABLE>



<!--各コンテンツは下記をコピーして編集-->
<body BGCOLOR="#FFFFFF" TEXT="#000000" LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0" align=center>

<TABLE border=0 cellPadding=0 cellSpacing=0 width=560>
	<TBODY>
	<TR>
		<TD width=40>　 </TD>
		<TD vAlign=top width=520>
            <SPAN class=text9s><xml:out select="$restdetail//mood" escapeXml="false" /><br>
            </SPAN></p>
					</TD>
	</TR>
	</TBODY>
</TABLE>

<!--メニュー詳細のXMLパース-->
<% if (menuXmlStr != "") { %>
<c:set var="menustr" ><%= menuXmlStr %></c:set>
<xml:parse var="restmenu" xml="${menustr}"></xml:parse>

			<TABLE border=0 cellPadding=0 cellSpacing=0 width=560>
				<TBODY>
				<TR>
					<TD width=40>　 </TD>
					<TD vAlign=top width=520>

						<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
						<TBODY>
							<TR>
						  	<TD>
									<FONT class=text11 color=#cc3300><A name=5></A><B>■コースのご紹介</B></FONT>
									
									<c:set var="ii">0</c:set>
									<xml:forEach select="$restmenu//menu">

									<A name="menu<xml:out select='id' />"></A>
									<br/>
									<table border=0 border=0 cellPadding=0 cellSpacing=0 width=100%>

									  	<td width='192' valign='top'>
												<xml:if select="imguri[(.='1')] ">
												<IMG align=left src="/image/Restraunt/<xml:out select="$restdetail//restaurant" escapeXml="false" />/C_<xml:out select='id' />.jpg" width=186 height=136><br/>
												</xml:if>
											</td>

											<td valign='top'><FONT class=text11 color=#164916>
												<B>■<xml:out select="name" escapeXml="false" />■</B></FONT><BR>
									      <SPAN class=text9s><xml:out select="c_comment"  escapeXml="false" /></span><BR clear=left>
											</td>
									   </tr>
									</table>
									
									<c:set var="ii"><c:out value="${ii+1}" /></c:set>
									</xml:forEach>

									<br>
									<% int intCnt = 0; %>
									<xml:forEach select="$restmenu//option">
										<% intCnt++; %>
									</xml:forEach>
									
									
									<% if (intCnt>0) {%>
									<FONT class=text11 color=#cc3300><B><A name=6></A>■オプションメニュー</B></FONT>
									
									<c:set var="jj">0</c:set>
									<xml:forEach select="$restmenu//option">

									<A name="menu<xml:out select='id' />"></A>
									<br/>
									<table border=0 border=0 cellPadding=0 cellSpacing=0 width=100%>
										<tr>

											<td width='192' valign='top'>
												<xml:if select="imguri[(.='1')] ">
												<IMG align=left src="/image/Restraunt/<xml:out select="$restdetail//restaurant" escapeXml="false" />/O_<xml:out select='id' />.jpg" width=186 height=136><br/>
												</xml:if>
											</td>

											<td valign='top'><FONT class=text11 color=#164916>
												<B>■<xml:out select="name"  escapeXml="false" />■</B></FONT><BR>
									      <SPAN class=text9s><xml:out select="c_comment" escapeXml="false" /></span><BR clear=left>
									    </td>
									   </tr>
									</table>

									<c:set var="jj"><c:out value="${jj+1}" /></c:set>
									</xml:forEach>
									<% } %>
								
								</TD>
							</TR>

						</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
			</TABLE>
			<% } %>
		</TR>
	</TBODY>
</TABLE>
</BODY>
</HTML>
