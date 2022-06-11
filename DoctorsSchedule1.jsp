
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String DoctorName = request.getParameter("DoctorName");%>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Doctors Schedule</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);


//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<P align=right><a class=title onclick="printTable()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h2 align=Center> Schedule of Dr.<%=DoctorName%></h2>
<form name=cons>
<table width="20%" align=Left>

<%
/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
   
String orderby="DoctorName";
String Designation="";
String HolidayinWeek="",WorkingHours="";
int DoctorID;
float ChargesPerHour;
int NoOfHours,Experience;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "DoctorName":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

DoctorName=((String)request.getParameter("DoctorName")==null) ? "":(String)request.getParameter("DoctorName");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM DoctorsMaster Where DoctorName=\'"+DoctorName+"\'";


	System.out.println("--1--"+Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>


<%
if(rs!=null)
{
//System.out.println("Resultset is not null");

%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->
 

	<table width="100%" align=right class="printTable" id="printTable" border="1" cellpadding="1">

	<tr class=row_title>
	<th class=row_title><a class=title href="DoctorsSchedule1.jsp?orderby=DoctorID">DoctorID</a></th>
	<th class=row_title><a class=title href="DoctorsSchedule1.jsp?orderby=Designation">Designation</a></th>
	<th class=row_title><a class=title href="DoctorsSchedule1.jsp?orderby=WorkingHours">No of Working Hours</a></th>
	<th class=row_title><a class=title href="DoctorsSchedule1.jsp?orderby=HolidayinWeek">Holiday in Week</a></th>
	<th class=row_title><a class=title href="DoctorsSchedule1.jsp?orderby=ChargesPerHour">Charges Per Hour</a></th>
<%

int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	 
	  DoctorID=rs.getInt(2);
	  Designation=rs.getString(4);
	  WorkingHours=rs.getString(8);   
 	  HolidayinWeek=rs.getString(7);   
      ChargesPerHour=rs.getFloat(9);   
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%= DoctorID%></td>
		<td align=center><%= Designation%></td>
		<td align=center><%= WorkingHours%></td>
		<td align=center><%= HolidayinWeek%></td>
		<td align=center><%= ChargesPerHour%></td>
		
	<%
	}


	rs.close();
}
else
{
	/*To write to the server if the resultset is null*/
	//System.out.println("Result set is null\n");
	%>
		<CENTER>
		<B>No Records found............<B><BR>
		<A href="Report.jsp"> Back </A>
		</CENTER>
	<%

}


%>


</table>
</form>
</BODY>
</HTML>

