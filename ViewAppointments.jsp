
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Appointments List</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);


//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth==3){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>
<P align=right><a class=title onclick="printTable()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h1 align=Center>Appointments List</h1>
<form name=cons>
<table width="20%" align=Left>

<%
/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
   
String orderby="AppointmentID";
String DoctorName,Designation,AppointmentGivento,NameOfPatient,NameOfCharity;
String HolidayinWeek,WorkingHours;
int DoctorID,PatientID,AppointmentID;
Date DateOfAppointment;
float ChargesPerHour;
int NoOfHours,Experience;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "AppointmentID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM AppointmentsMaster order by "+orderby;


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
    <th class=row_title><a class=title href="ViewAppointments.jsp?orderby=AppointmentID">Appointment ID</a></th>
	<th class=row_title><a class=title href="ViewAppointments.jsp?orderby=DoctorName">Doctor Name</a></th>
	<th class=row_title><a class=title href="ViewAppointments.jsp?orderby=DoctorID">Doctor ID</a></th>
	<th class=row_title><a class=title href="ViewAppointments.jsp?orderby=Designation">Designation</a></th>
	<th class=row_title><a class=title href="ViewAppointments.jsp?orderby=AppointmentGivento">Appointment Given to</a></th>
	<th class=row_title><a class=title href="ViewAppointments.jsp?orderby=PatientID">Patient ID</a></th>
	<th class=row_title><a class=title href="ViewAppointments.jsp?orderby=NameOfPatient">Name Of Patient</a></th>
	<th class=row_title><a class=title href="ViewAppointments.jsp?orderby=NameOfCharity">Name Of Charity</a></th>
	<th class=row_title><a class=title href="ViewAppointments.jsp?orderby=DateOfAppointment">Date Of Appointment</a></th>
	<th class=row_title><a class=title href="ViewAppointments.jsp?orderby=NoOfHours">No Of Hours</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  AppointmentID=rs.getInt(1);
	  DoctorName=rs.getString(2);
	  DoctorID=rs.getInt(3);
	  Designation=rs.getString(4);
	  AppointmentGivento=rs.getString(5);
	  PatientID=rs.getInt(6);
	  NameOfPatient=rs.getString(7);
	  NameOfCharity=rs.getString(8);
	  DateOfAppointment=rs.getDate(9);
	  NoOfHours=rs.getInt(10);
          
 	  
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center class="tblData"><%= AppointmentID%></td>
		<td align=center class="tblData"><%= DoctorName%></td>
		<td align=center class="tblData"><%= DoctorID%></td>
		<td align=center class="tblData"><%= Designation%></td>
		<td align=center class="tblData"><%= AppointmentGivento%></td>
		<td align=center class="tblData"><%= PatientID%></td>
		<td align=center class="tblData"><%= NameOfPatient%></td>
		<td align=center class="tblData"><%= NameOfCharity%></td>
		<td align=center class="tblData"><%= DateOfAppointment%></td>
		<td align=center class="tblData"><%= NoOfHours%></td>
		
	<%
	}


	rs.close();

if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=10>No Records found</th></tr>

		</CENTER>
	<%

}

}
%>


</table>
</form>
</BODY>
</HTML>
<%
  }
  %>
