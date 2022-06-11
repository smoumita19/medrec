<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Appointment Details.......
</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<body Class=SC>
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

 

String DoctorName = request.getParameter("DoctorName");
String DoctorID = request.getParameter("DoctorID");
/*String DoctorRate = request.getParameter("DoctorRate");*/
String Designation = request.getParameter("Designation");
String AppointmentGivento = request.getParameter("AppointmentGivento");
String PatientID = request.getParameter("PatientID");
String NameOfPatient = request.getParameter("NameOfPatient");
if(PatientID==null||NameOfPatient==null||AppointmentGivento.equals("Charity"))	
	{
		PatientID="0";
		NameOfPatient="NA";
	}
String NameOfCharity = request.getParameter("NameOfCharity");
if(NameOfCharity==null||AppointmentGivento.equals("Patient"))	
	{
		NameOfCharity="NA";
	}
String strDateOfAppointment=request.getParameter("DateOfAppointment");
Date DateOfAppointment= Date.valueOf(strDateOfAppointment);
String NoOfHours = request.getParameter("NoOfHours");
String Cost = request.getParameter("Cost");
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	/*****
		AppointmentGivento == "Patient"
			NameOfCharity="NA";
		AppointmentGivento == "Charity"
			PatientID="NA";
			NameOfPatient="NA";
	*****/
	
	String Query = "Insert into AppointmentsMaster (DoctorName,DoctorID,Designation,AppointmentGivento,PatientID,NameOfPatient,NameOfCharity,DateOfAppointment,NoOfHours,Cost) values(\'"+DoctorName+"\',\'"+DoctorID+"\',\'"+Designation+"\',\'"+AppointmentGivento+"\',\'"+PatientID+"\',\'"+NameOfPatient+"\',\'"+NameOfCharity+"\',\'"+DateOfAppointment+"\',"+NoOfHours+","+Cost+")";
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		
		%>
			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="AddAppointments0.jsp"> Add another </A>
		</center>
		<%
	}


}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>

</body>
</html>