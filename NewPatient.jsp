<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Patient Details.......
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
String NameOfPatient = request.getParameter("NameOfPatient");
String strAge = request.getParameter("Age");
int Age=Integer.parseInt(strAge);
String Sex = request.getParameter("Sex");
String Occupation = request.getParameter("Occupation");
String ContactNumbers = request.getParameter("ContactNumbers");
String Natureofillness = request.getParameter("Natureofillness");
String strDateOfAdmission=request.getParameter("DateOfAdmission");
Date DateOfAdmission= Date.valueOf(strDateOfAdmission);
String AdmissionAs = request.getParameter("AdmissionAs");
String Insurance = request.getParameter("Insurance");
String GaurdianName=request.getParameter("GaurdianName");
String RelationWithPatient=request.getParameter("RelationWithPatient");
String ReferedByDoctor=request.getParameter("ReferedByDoctor");
String strDoctorID = request.getParameter("DoctorID");
int DoctorID = Integer.parseInt(strDoctorID);
String strRoomID = request.getParameter("RoomID");
int RoomID=Integer.parseInt(strRoomID);


try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	
	
	String Query = "Insert into PatientsMaster(NameOfPatient,Age,Sex,Occupation,ContactNumbers,Natureofillness,DateOfAdmission,AdmissionAs,Insurance,GaurdianName,RelationWithPatient,ReferedByDoctor,RoomID, DoctorID) values(\'"+NameOfPatient+"\',"+Age+",\'"+Sex+"\',\'"+Occupation+"\',\'"+ContactNumbers+"\',\'"+Natureofillness+"\',\'"+DateOfAdmission+"\',\'"+AdmissionAs+"\',\'"+Insurance+"\',\'"+GaurdianName+"\',\'"+RelationWithPatient+"\',\'"+ReferedByDoctor+"\',"+RoomID+","+DoctorID+")";
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{		
			String Query0 = "Insert into InPatientMaster (NameOfPatient,Natureofillness,DateOfAdmission,ReferedByDoctor,RoomID, DoctorID ) values (\'"+NameOfPatient+"\', \'"+Natureofillness+"\',\'"+DateOfAdmission+"\',\'"+ReferedByDoctor+"\',\'"+RoomID+"\',\'"+DoctorID+"\')";
			System.out.println(Query0);
			int rowseffect=stmt.executeUpdate(Query0);	
		
			if(RoomID!=0)	
		{
			
			String Query1 = "Update RoomsMaster SET Status='Reserved' where RoomID="+RoomID;
			System.out.println(Query1);
			int rowAffected=stmt.executeUpdate(Query1);		
			System.out.println("Rows Affected = " + rowAffected);
	        }
		if(Insurance.equals("Yes"))
			{
			//System.out.println("hai");
		%>
			<jsp:forward page="Insurance0.jsp">
				<jsp:param name="NameOfPatient" value="<%=NameOfPatient%>"/>
				<jsp:param name="DateOfAdmission" value="<%=DateOfAdmission%>"/>
				<jsp:param name="RelationWithPatient" value="<%=RelationWithPatient%>"/>
				<jsp:param name="NameOfApplicant" value="<%=GaurdianName%>"/>
				<jsp:param name="Natureofillness" value="<%=Natureofillness%>"/>

			</jsp:forward>
		<%
	        }
	else{

		%>
			<H1 align="center">Details Updated Successfully! </H1>
		<BR>
		<center>
			<A href="NewPatient0.jsp" style="color: rgb(55 145 229);"> ADD ANOTHER PATIENT </A>
		</center>
		<%
	   }
	}	
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>

</body>
</html>