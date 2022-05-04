<%@ page contentType="text/html;charset=Shift_JIS" %>
<%@ page language="java" %>
<%@ page import="java.io.*,
								 java.util.*,
								 jp.co.yobrain.util.ParseFormat,
								 jp.co.lastminute.Hotel.CalenderModel" %>
<%
	ParseFormat pf = null;
	CalenderModel model = new CalenderModel();
	model = model.getRequest( request );

	String yyyy = model.yyyy;
	String mm = model.mm;
	String dd = model.dd;
	int yearmonth = model.yearmonth;
	int year = model.year;
	int month = model.month;

	int AfterDays = model.AfterDays;

	String displayFieldName = model.displayFieldName;
	int stopsaledays = model.stopsaledays;
	String order = model.order;;
	String formName = model.formName;

	//caclulate date
	Calendar now = Calendar.getInstance();
	int nowYear  = now.get(Calendar.YEAR);
	int nowMonth = now.get(Calendar.MONTH)+1;
	int nowDay   = now.get(Calendar.DATE);

	Calendar startDate = Calendar.getInstance();
	startDate.add(Calendar.DATE,stopsaledays);
	int startYear  = startDate.get(Calendar.YEAR);
	int startMonth = startDate.get(Calendar.MONTH)+1;

	Calendar endDate = Calendar.getInstance();
	endDate.add( Calendar.DATE,AfterDays + stopsaledays );
	int endYear  = endDate.get(Calendar.YEAR);
	int endMonth = endDate.get(Calendar.MONTH)+1;

	if( yearmonth == 0 ){
		year = startYear;
		month = startMonth;
	}
	Calendar callDate = Calendar.getInstance();
	callDate.set(year,month-1,1);
	int callYear  = callDate.get(Calendar.YEAR);
	int callMonth = callDate.get(Calendar.MONTH)+1;
%>
<html>
<head>
<title>カレンダー</title>
<meta http-equiv="Content-Type" content="text/html; charset=Shift-JIS">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma"content="no-cache">
<link rel="stylesheet" href="/basic.css" type="text/css">
<script language="javascript">
	function fnCALENDARSubmit()	{
		document.CALENDAR.submit();
	}
	function pushCalendar(d){
		y=<%= callYear %>;
		m=<%= callMonth %>;
		if( m < 10 ) m="0"+m;
		if( d < 10 ) d="0"+d;
//		opener.document.forms['<%=formName%>'].elements['<%= yyyy %>'].value=y;
		opener.document.forms['<%=formName%>'].elements['<%= mm %>'].value=m;
		opener.document.forms['<%=formName%>'].elements['<%= dd %>'].value=d;
		opener.document.forms['<%=formName%>'].elements['checkindate'].value=y + "" + m + "" + d;
		opener.document.forms['<%=formName%>'].elements['<%= displayFieldName %>'].value=y+"/"+m+"/"+d;
		//opener.document.forms['<%=formName%>'].elements['<%= displayFieldName %>'].size=20;
		window.close();
	}
</script>
</head>
<body bgcolor="#ffffff" onload="self.focus();">
<form name="CALENDAR" method="GET" action="Calendar.jsp">
	<table width="183" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="205" valign="top" align="center">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="33" width="10">&nbsp;</td>
					<td align="center" width="162">
<select name=yearmonth onChange="javascript:fnCALENDARSubmit(document.CALENDAR)">
<%

	for (int i=startYear; i <= endYear; i++ ){
		for (int j=1; j<=12; j++){
			if(startYear*100+startMonth <= i*100+j && endYear*100+endMonth >= i*100+j){
				%><option value="<%= i*100+j %>"<%=((i*100+j ==yearmonth)?" selected":"")%>><%= i %>年<%= pf.ZeroUP(j,2)%>月</option><%
			}
		}
	}
%>
						</select>
						<font face="serif" size="2"></font>
					</td>
					<td width="13">&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="top" align="center">

						<input type=hidden name=yyyy value=<%= yyyy %>>
						<input type=hidden name=mm value=<%= mm %>>
						<input type=hidden name=dd value=<%= dd %>>
						<input type=hidden name=AfterDays value=<%= AfterDays %>>
						<input type=hidden name=displayFieldName value=<%= displayFieldName %>>
						<input type=hidden name=order value=<%= order %>>
						<input type=hidden name=formName value=<%= formName %>>
						<input type=hidden name=yearmonth value=<%= yearmonth %>>
						<input type=hidden name=stopsaledays value=<%= stopsaledays %>>
						<center>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
						<td bgcolor="#7B7D7B">
						<table width="100%" border="0" cellspacing="1" cellpadding="1">
				<tr height="18" bgcolor="#EFEFEF">
				<td ALIGN="CENTER" width="22" CLASS="org">日</td>
				<td ALIGN="CENTER" width="22">月</td>
				<td ALIGN="CENTER" width="22">火</td>
				<td ALIGN="CENTER" width="22">水</td>
				<td ALIGN="CENTER" width="22">木</td>
				<td ALIGN="CENTER" width="22">金</td>
				<td ALIGN="CENTER" width="22" CLASS="bule">土</td>
				</tr>
<%
int monthLastDay = callDate.getActualMaximum(Calendar.DAY_OF_MONTH);
int week = (monthLastDay+callDate.get(Calendar.DAY_OF_WEEK)-2)/7+1;
for(int i=0;i<week*7;i++){
	int d = i+2-callDate.get(Calendar.DAY_OF_WEEK);
	String tdClass = "";
	if( nowYear == callYear && nowMonth == callMonth && nowDay == d ){
		tdClass = "b";
	}else if( i%7==0 ){
		tdClass = "orgb";
	}else if( i%7==6 ){
		tdClass = "bule";
	}
	Calendar thisDate = Calendar.getInstance();
	thisDate.set(callYear,callMonth-1,d);

%>
	<%= (i%7==0)?"<tr bgcolor=\"#FFFFFF\" height=\"22\">":"" %>
	<TD align="center" bgcolor="#FFFFFF" class="<%= tdClass %>">
<%
	if( d > 0 && d <= monthLastDay ){
		if( thisDate.getTimeInMillis() >= startDate.getTimeInMillis() && thisDate.getTimeInMillis() <= endDate.getTimeInMillis()){
			%><a href="javascript:pushCalendar(<%= d %>)"><%= d %></a><%
		}else{
			%><%= d %><%
		}
	}else{
		%>&nbsp;<%
	}
%>
	</TD>
	<%= (i%7==6)?"</tr>":"" %>

<%
}
%>

						</table>
						</td>
						</tr>
						</table>
						</center>
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>
