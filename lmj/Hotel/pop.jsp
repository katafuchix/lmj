<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 jp.co.lastminute.Hotel.*" %>
<%
	HotelPopForm form = (HotelPopForm)request.getAttribute( "Hotel.HotelPopForm" );
	if( form == null ){
		form = new HotelPopForm();
	}
	String urlPath = form.getUrlPath();
%>
<HTML>
<HEAD>
<TITLE>lastminute.com</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=EUC-JP">
<LINK href="/css/portal.css" rel=stylesheet type="text/css">
</HEAD>
<BODY bgcolor="#FFFFFF" marginheight="0" topmargin="0" leftmargin="0" marginwidth="0">

<CENTER>
<TABLE BORDER='0'>
<TR> 
<TD> 
<TABLE BORDER=0 WIDTH=100% CELLSPACING=0 CELLPADDING='0'>
<TR BGCOLOR='#CEF1FF'> 
<TD ALIGN='center'><IMG SRC='/img/space.gif' WIDTH=1 HEIGHT=25></TD>
<TD ALIGN='center'><STRONG><FONT COLOR='#000000'>地　図</FONT></STRONG><BR>
</TD>
<TD ALIGN='center'><IMG SRC='/img/space.gif' WIDTH=1 HEIGHT=25></TD>
</TR>
<TR> 
<TD ALIGN='left' BGCOLOR='#7D7D7D' COLSPAN='3'><IMG src='/img/space.gif' WIDTH=1 HEIGHT=1></TD>
</TR>
</TABLE>
</TD>
</TR>
<TR>
<TD NOWRAP>
<TABLE BORDER='0' CELLSPACING='9' CELLPADDING='0'>
<TR align='center'>
<TD NOWRAP>
<TABLE BORDER='1' CELLSPACING='2' CELLPADDING='0' >
	<TR><TD ALIGN='center'><IMG SRC='<%= urlPath %>' ></TD>
	</TR>
</TABLE>
</TD>
</TR>
</TABLE>
</TD>
</TR>
</TABLE>
<BR>
<FORM method='post'>
<DIV align='center'> 
<INPUT TYPE='button' value='　　CLOSE　　' onClick='window.close()'/>
</DIV>
</FORM>
</CENTER>
      <HR>
      <CENTER>
        <TABLE width=400 cellpadding=5 cellspacing=0>
          <TR>
            <TD bgcolor="#FFFFFF" align="center"> <FONT color="#666666"> Copyright
              (C) 2000-2001 NIPPON TRAVEL AGENCY CO.,LTD. All right reserved.</FONT><BR>
            </TD>
          </TR>
        </TABLE>
      </CENTER>
    </TD>
  </TR>
</TABLE>
<BR>
</BODY>
</HTML>


