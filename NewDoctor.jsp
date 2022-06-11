<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Doctor Details.......
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
Statement pstmt=null;
/*PreparedStatement pstmt=null;*/
ResultSet rs=null;

 

String DoctorName = request.getParameter("DoctorName");
String strDateOfJoin=request.getParameter("DateOfJoin");
Date DateOfJoin= Date.valueOf(strDateOfJoin);
String Designation = request.getParameter("Designation");
String PhoneNumber = request.getParameter("PhoneNumber");
String strExperience = request.getParameter("Experience");
int Experience=Integer.parseInt(strExperience);
String HolidayinWeek = request.getParameter("HolidayinWeek");
String WorkingHours = request.getParameter("WorkingHours");
String strChargesPerHour=request.getParameter("ChargesPerHour");
float ChargesPerHour = Float.parseFloat(strChargesPerHour);
int id=10;

try
{

	/*Getting the connection variable from session*/

	

	con=(Connection)session.getAttribute("connection");
	//pstmt = con.prepareStatement("insert into DoctorsMaster values(?,?,?,?,?,?,?,?)");
	pstmt =  con.createStatement();

    /*System.out.println("prashanth");
    System.out.println(con);
     System.out.println(DoctorName);
    pstmt.setString(1,DoctorName);
    pstmt.setInt(2,id);
    pstmt.setString(3,strDateOfJoin);
    pstmt.setString(4,Designation);
    pstmt.setString(5,PhoneNumber);
    pstmt.setInt(6,Experience);
    pstmt.setString(7,HolidayinWeek);
     pstmt.setString(8,WorkingHours);
     pstmt.setFloat(9,ChargesPerHour);
	int i=pstmt.executeUpdate();
	System.out.println("prashanth....");*/
	
	String Query = "Insert into DoctorsMaster(DoctorName,DateOfJoin,Designation,PhoneNumber,Experience,HolidayinWeek,WorkingHours,ChargesPerHour) values(\'"+DoctorName+"\',\'"+DateOfJoin+"\',\'"+Designation+"\',\'"+PhoneNumber+"\',"+Experience+",\'"+HolidayinWeek+"\',\'"+WorkingHours+"\',"+ChargesPerHour+")";
	System.out.println(Query);
	int rowsAffected=pstmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		
		%>
			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="NewDoctor0.jsp"> Add another </A>
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