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
String NameOfApplicant = request.getParameter("NameOfApplicant");
String WorkingAtCompany = request.getParameter("WorkingAtCompany");
String EmployeeID = request.getParameter("EmployeeID");
String RelationWithPatient = request.getParameter("RelationWithPatient");
String Natureofillness = request.getParameter("Natureofillness");
String DateOfAdmission=request.getParameter("DateOfAdmission");
/*String DateOfDischarge="0000-00-00";*/
String PeriodofStayinHospital = "1";
String strAmountClaimed=request.getParameter("AmountClaimed");
float AmountClaimed = Float.parseFloat(strAmountClaimed);
String Place=request.getParameter("Place");
String PolicyNumber=request.getParameter("PolicyNumber");
String ClaimNumber=request.getParameter("ClaimNumber");
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	
	
	String Query = "Insert into InsuranceMaster(NameOfPatient,NameOfApplicant,WorkingAtCompany,EmployeeID,RelationWithPatient,Natureofillness,DateOfAdmission,DateOfDischarge,PeriodofStayinHospital,AmountClaimed,Place,PolicyNumber,ClaimNumber) values(\'"+NameOfPatient+"\',\'"+NameOfApplicant+"\',\'"+WorkingAtCompany+"\',\'"+EmployeeID+"\',\'"+RelationWithPatient+"\',\'"+Natureofillness+"\',\'"+DateOfAdmission+"\', NULL ,\'"+PeriodofStayinHospital+"\',"+AmountClaimed+",\'"+Place+"\',\'"+PolicyNumber+"\',\'"+ClaimNumber+"\')";
	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	if(rowsAffected==1)
	{
		
		%>
			<H3 align="center">Details Updated Successfully </H3>
		<BR>
		<center>
			<A href="NewPatient0.jsp"> Add another </A>
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