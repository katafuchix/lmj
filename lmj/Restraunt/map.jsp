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
								 jp.co.lastminute.Restraunt.map.Form" %>
<%@ taglib uri="/WEB-INF/struts-html.tld"	prefix="html" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
<%
	String detailXmlStr = "";
	String restaurant = "";
	String restaurantName = "";
	Form form = (Form)request.getAttribute( "Restraunt.map.Form" );
	if( form != null ){
		detailXmlStr = form.getDetailXmlStr();
	}
%>
<HTML>
<HEAD>
<TITLE>お店までの地図</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=EUC-JP">
<LINK HREF="/basic.css" REL="stylesheet" TYPE="text/css">

<!--レストラン詳細のXMLパース-->
<c:set var="detailstr" ><%= detailXmlStr %></c:set>
<xml:parse var="restdetail" xml="${detailstr}"></xml:parse>
</HEAD>
<BODY LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0" TEXT="#000000" BGCOLOR="#F7F3E7" LINK="#CC3300" align='center'>
	
	<center>
	<TABLE WIDTH="520" BORDER="0" CELLSPACING="0" CELLPADDING="0" align='center'>
  <TR>
	<TD WIDTH="520" BGCOLOR="#F3F0EA" CLASS="super14"><!--店名-->
	<BR/><xml:out select="$restdetail//restaurantname" />（<xml:out select="$restdetail//restaurantnameeng" />）<BR/>
	</TD>
  </TR>
  <TR>
	<TD WIDTH="520"><SPAN CLASS="text10"><BR/><FONT COLOR="#CC3300"><B>■お店までの地図</B></FONT></SPAN><BR/>
	<SPAN CLASS="text9s"><xml:out select="$restdetail//aboutmap" escapeXml="false" /><br/><br/>
	  </SPAN><IMG SRC="/image/Restraunt/<xml:out select="$restdetail//restaurant" />/REST_MAP.jpg" VSPACE="3">
	</TD>
  </TR>
  <TD VALIGN="TOP" WIDTH="520">
	  <TABLE WIDTH="550" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<TR ALIGN="RIGHT">
		  <TD><BR>
			<A HREF="javascript:window.close()"><img SRC="/img/res_img/close_button.gif" WIDTH="58" HEIGHT="18" BORDER="0"></A></TD>
		</TR>
	  </TABLE>
	</TD>
  </TR>
	</TABLE>
	</center>
</BODY>
</HTML>
