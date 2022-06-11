<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Patient Discharging Details.......
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
String strPatientID = request.getParameter("PatientID");
int PatientID=Integer.parseInt(strPatientID);
String strAge = request.getParameter("Age");
int Age=Integer.parseInt(strAge);
String Sex = request.getParameter("Sex");
String Occupation = request.getParameter("Occupation");
String Natureofillness = request.getParameter("Natureofillness");
String strDateOfAdmission=request.getParameter("DateOfAdmission");
Date DateOfAdmission= Date.valueOf(strDateOfAdmission);
String strDateOfDischarge=request.getParameter("DateOfDischarge");
String PeriodofStayinHospital = request.getParameter("PeriodofStayinHospital");
Date DateOfDischarge= Date.valueOf(strDateOfDischarge);
String strRoomID = request.getParameter("RoomID");
int RoomID=Integer.parseInt(strRoomID);
String ConsultantDoctor=request.getParameter("ConsultantDoctor");
String ReferedByDoctor=request.getParameter("ReferedByDoctor");
String Insurance=request.getParameter("Insurance");
float BillAmount=0;
/*doctor fees x No of hours + room rate x No of admission days */


try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();


	
	String Query = "Insert into DischargesMaster values(\'"+NameOfPatient+"\',"+PatientID+","+Age+",\'"+Sex+"\',\'"+Occupation+"\',\'"+Natureofillness+"\',\'"+DateOfAdmission+"\',\'"+DateOfDischarge+"\',"+RoomID+",\'"+ConsultantDoctor+"\',\'"+ReferedByDoctor+"\',\'"+Insurance+"\',"+BillAmount+")";
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		String Query1 = "Delete from PatientsMaster where PatientID="+PatientID;
		System.out.println(Query1);
	    int rowAffected=stmt.executeUpdate(Query1);		
	    System.out.println("Rows Affected = " + rowAffected);
	
			String Query2 = "Update RoomsMaster SET Status='Empty' where RoomID="+RoomID;
			System.out.println(Query2);
			int rowAffect=stmt.executeUpdate(Query2);		
			System.out.println("Rows Affected = " + rowAffect);
	       if(Insurance.equals("Yes")){
		     String Query3="Update Insurancemaster set DateOfDischarge=\'"+DateOfDischarge+"\' , PeriodofStayinHospital = '"+PeriodofStayinHospital+"' where NameOfPatient=\'"+NameOfPatient+"\'";
			 System.out.println(Query3);
			 int rows = stmt.executeUpdate(Query3);
		   }

		%><jsp:forward page="GenerateBill0.jsp">
				<jsp:param name="NameOfPatient" value="<%=NameOfPatient%>"/>
				<jsp:param name="PeriodofStayinHospital" value="<%=PeriodofStayinHospital%>"/>
				<jsp:param name="RoomID" value="<%=RoomID%>"/>
				<jsp:param name="ConsultantDoctor" value="<%=ConsultantDoctor%>"/>
				<jsp:param name="ReferedByDoctor" value="<%=ReferedByDoctor%>"/>
				<jsp:param name="Insurance" value="<%=Insurance%>"/>

			</jsp:forward>

			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="NewDischarges0.jsp"> Discharge another </A><br>
			
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