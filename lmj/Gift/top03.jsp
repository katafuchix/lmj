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
			<span CLASS="super14">ギフト　プライス<!--<xml:out select='$pageamount//title' />--></span><BR><BR>
		</td>
	</tr>
  <tr>
		<td COLSPAN="2" VALIGN="TOP">
			<table CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="434">
				<tr>

					<% int i=0; %>
					<xml:forEach select="$pageamount//products/topix/production" >

						<td VALIGN="TOP" WIDTH='150' height='160'>
							<table BGCOLOR="#999999" CELLPADDING="1" CELLSPACING="0" BORDER="0" WIDTH="100%">
								<tr>
									<td>
										<table CELLPADDING="4" CELLSPACING="0" BORDER="0" WIDTH="100%" height="180">

											<tr>
												<td ALIGN="CENTER" BGCOLOR="#FFFFFF">
													<a HREF="./detail.do?catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">
													<img SRC="/img/gift/<xml:out select='product/prod_id'/>-3.gif" WIDTH="130" HEIGHT="75" ALT="<xml:out select='product/name' />" border="0"></a>
												</td>
											</tr>
											<tr>
												<td BGCOLOR="#FFFFFF"><a HREF="./detail.do?catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">
													<span CLASS="txt12b"><xml:out select='product/name' /></span></a><br>
													<span CLASS="txt12"><xml:out select='product/copy/comment' /> </span>
												</td>
											</tr>
											<tr>
												<td CLASS="txt12b" ALIGN="RIGHT" BGCOLOR="#FFFFFF"><xml:out select='product/copy/pricestr' /> 円
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
		<td colspan="2"><br></td>
	</tr>

	
	<xml:forEach select="$pageamount//products/list/production" >
		<tr>
			<td colspan="2"><img ALT="" VSPACE="6" HEIGHT="1" WIDTH="440" SRC="/img/line462.gif"></td>
		</tr>
		<tr>
			<td WIDTH="39" VALIGN="TOP" height="40">
				<a HREF="./detail.do?catid=<xml:out select='plan/catid'/>&product_id=<xml:out select='product/prod_id'/>">
				<img src="/img/gift/<xml:out select='product/prod_id' />-2.gif" width="70" height="38" hspace="3" alt="" border="0">
				</a>
			</td>
			<td WIDTH="399" height="40">

						<a HREF="search.do?scatid=<xml:out select='plan/scatid' />" CLASS="txt12b"><xml:out select='plan/title'/></a><br>
						<span CLASS="txt12"><xml:out select='plan/scatid_description'/></span>

			</td>
		</tr>

	</xml:forEach>
	
	<td COLSPAN="2"></td>
	<td COLSPAN="2" width="1">　</td>
</table>

</td>
<td BGCOLOR="#666666" WIDTH="1"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" VSPACE="1" ALT=""></td>
</tr>
<tr>
<td BGCOLOR="#666666" COLSPAN="4"><img SRC="/img/tkt_img/shim.gif" WIDTH="1" HEIGHT="1" ALT=""></td>
</tr>
</table>