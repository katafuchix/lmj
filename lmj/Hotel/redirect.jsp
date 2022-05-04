<%@ page contentType="text/html;charset=EUC-JP" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 jp.co.lastminute.Hotel.*" %>
<%
	HotelPopForm form = (HotelPopForm)request.getAttribute( "Hotel.HotelPopForm" );
	if( form == null ){
		form = new HotelPopForm();
	}
	String urlPath = form.getUrlPath();
	response.sendRedirect( urlPath );
%>