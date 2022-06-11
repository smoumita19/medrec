
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String DoctorName = request.getParameter("DoctorName");%>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Appointments Report</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);


//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<P align=right><a class=title onclick="printTable()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h1 align=Center> Appointments of Dr.<%=DoctorName%></h1>
<form name=cons>
<table width="20%" align=Left>

<%
/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
   
String orderby="AppointmentGivento";
String AppointmentGivento="",NameOfCharity="",NameOfPatient="";
int PatientID,NoOfHours;
Date DateOfAppointment;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "AppointmentGivento":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

String strStartDate = request.getParameter("Start");
String strEndDate =  request.getParameter("End");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM AppointmentsMaster where (DateOfAppointment between (\'"+strStartDate+"\') and (\'"+strEndDate+"\')) and DoctorName=\'"+DoctorName+"\'";

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
	<th class=row_title><a class=title href="AppointmentsReport01.jsp?orderby=AppointmentGivento">Appointment Given to</a></th>
	<th class=row_title><a class=title href="AppointmentsReport01.jsp?orderby=PatientID">PatientID</a></th>
	<th class=row_title><a class=title href="AppointmentsReport01.jsp?orderby=NameOfPatient">NameOfPatient</a></th>
	<th class=row_title><a class=title href="AppointmentsReport01.jsp?orderby=NameOfCharity">Name Of Charity</a></th>
	<th class=row_title><a class=title href="AppointmentsReport01.jsp?orderby=DateOfAppointment">Date Of Appointment</a></th>
	<th class=row_title><a class=title href="AppointmentsReport01.jsp?orderby=NoOfHours">No Of Hours</a></th>

<%

int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
 	  AppointmentGivento=rs.getString(5);
	  PatientID=rs.getInt(6);
	  NameOfPatient=rs.getString(7);
	  NameOfCharity=rs.getString(8);
	  DateOfAppointment=rs.getDate(9);   
 	  NoOfHours=rs.getInt(10);   
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%= AppointmentGivento%></td>
		<td align=center><%= PatientID%></td>
		<td align=center><%= NameOfPatient%></td>
		<td align=center><%= NameOfCharity%></td>
		<td align=center><%= DateOfAppointment%></td>
		<td align=center><%= NoOfHours%></td>

	<%
	}


	rs.close();
	if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=6>No Records found</th></tr>
		</CENTER>
	<%

}

}
%>



</table>
</form>
</BODY>
</HTML>

