<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>
	Adding new Room Details.......
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

/*String RoomID = request.getParameter("RoomID");*/
String Category = request.getParameter("Category");
/*String NoOfBeds = request.getParameter("NoOfBeds");*/
String strChargesPerDay=request.getParameter("ChargesPerDay");
float ChargesPerDay = Float.parseFloat(strChargesPerDay);
String VisitorsAllowed=request.getParameter("VisitorsAllowed");
String VisitingHours=request.getParameter("VisitingHours");


try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	
	
	/*String Query = "Insert into RoomsMaster values(\'"+RoomID+"\',\'"+Category+"\',"+ChargesPerDay+",\'"+VisitorsAllowed+"\',\'"+VisitingHours+"\',\'Empty\')";*/
	String Query = "Insert into RoomsMaster (Category, ChargesPerDay, VisitorsAllowed, VisitingHours, Status) values (\'"+Category+"\',"+ChargesPerDay+",\'"+VisitorsAllowed+"\',\'"+VisitingHours+"\',\'Empty\')";

	System.out.println(Query);
	int rowsAffected=stmt.executeUpdate(Query);		
	System.out.println("Rows Affected = " + rowsAffected);
	//If data is updated then an entry is added to Activity log 
	if(rowsAffected==1)
	{
		
		%>
			<H1 align="center">Details Updated Successfully!</H1>
		<BR>
		<center>
			<A href="NewRoom0.jsp" style="color: rgb(55 145 229);"> ADD ANOTHER ROOM </A>
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