<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.Gift.top.Form" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%@ taglib uri="/WEB-INF/x.tld" prefix="xml" %>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>

<%
	ParseFormat pf = null;
	Form form = (Form)request.getAttribute( "Gift.top.Form" );
	String xmlstring = form.getXmlstring();
	jp.co.yobrain.util.DataFormat dataformat = null;
%>

<c:set var="xmlstr" ><%= xmlstring %></c:set><xml:parse var="pageamount" xml="${xmlstr}"></xml:parse>

<table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="438">
	<tr>
		<td BGCOLOR="#F3F0EA" WIDTH="440" colspan='2'>
			<span CLASS="super14">ギフト　カテゴリー<!--<xml:out select='$pageamount//title' />--></span><BR><BR>
		</td>
	</tr>
  <tr>
  	<td COLSPAN="0" VALIGN="TOP">
			<table CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="434">
				<tr>

					<%	int i=0; %>
					<xml:forEach select="$pageamount//products/topix/production" >
				
						<td VALIGN="TOP" WIDTH='150' height='160'>
							<table BGCOLOR="#999999" CELLPADDING="1" CELLSPACING="0" BORDER="0" WIDTH="100%">
								<tr>
									<td>
										<table CELLPADDING="4" CELLSPACING="0" BORDER="0" WIDTH="100%"  height='160'>
											<tr>
												<td ALIGN="CENTER" BGCOLOR="#FFFFFF">
													<a HREF="./detail.do?catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">
													<img SRC="/img/gift/<xml:out select='product/prod_id'/>-3.gif" WIDTH="130" HEIGHT="75" ALT="<xml:out select='product/name' />" border="0"></a>
												</td>
											</tr>
											<tr>
												<td BGCOLOR="#FFFFFF">
													<a HREF="./detail.do?catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">
													<span CLASS="txt12b"><xml:out select='product/name' /></span></a>
													<br>
													<span CLASS="txt12"><xml:out select='product/copy/comment' /> </span>
												</td>
											</tr>
											<tr>
												<td CLASS="txt12b" ALIGN="RIGHT" BGCOLOR="#FFFFFF">
													<xml:out select='product/copy/pricestr' /> 円
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<% if (i != 2) { %>
							<td><img alt="" height="1" width="3" src="/img/shim.gif"></td>
						<% } %>
						<%	i++;	%>
				</xml:forEach>
	
			</tr>
		</table>
	</td>
 </tr>
 
 <tr>
  <td colspan=2>
  	<img alt="" height="10" width="5" src="/img/shim.gif"><br>
  			<table cellpadding="1" cellspacing="0" border="0" width="434">

				<% i=0; %>

				<xml:forEach select="$pageamount//products/list/production" >

				<xml:if select="plan/scatid!=0">

					<% if( i%2 == 0 ){	%>
						<%	if( i != 0 ){	%>
							<td colspan="5"><img alt="" vspace="6" height="1" width="430" src="/img/line462.gif"></td>
						<%	}	%>
							<tr>
					<%	}else{	%>
							<td><img alt="" height="1" width="2" src="/img/shim.gif"></td>
					<%	}	%>

					<td valign="top" width="35" >
						<a href="search.do?scatid=<xml:out select='plan/scatid' />">
						<img src="/img/gift/<xml:out select='plan/scatid' />_scatid.gif" width="38" height="38" border="0"></a>
					</td>
					<td width="265">
						<a HREF="search.do?scatid=<xml:out select='plan/scatid' />" CLASS="txt12b"><xml:out select='plan/title'/></a><br>
						<span CLASS="txt12"><xml:out select='plan/scatid_description'/></span></td>

					<% if( i%2 == 1 ){	%>
						</tr>
					<%	}	%>
					<%	i++;	%>
				</xml:if>

				</xml:forEach>
				
				<%	if( i%2 == 1 ){	%>
					<td colspna='3'></td>
				</tr>
				<%	}	%>
				<td colspan="5"><br></td>
			</table>
  </td>
 </tr>
</table>

</td>
<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
</tr>
<tr>
<td BGCOLOR="#666666" COLSPAN="4"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
</tr>
</table>