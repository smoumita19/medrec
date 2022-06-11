
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String ReferedByDoctor = request.getParameter("ReferedByDoctor");%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Doctors Details</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txt1Val)
{
		
		var txt1 = window.opener.document.forms[0].DoctorFee;
		txt1.value=txt1Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h2 align=center>Doctors Details</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<% 

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String DoctorName,Designation;
System.out.println("--1---");
int DoctorID;
float DoctorFee,ChargesPerHour;
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM doctorsmaster where DoctorName=\'"+ReferedByDoctor+"\'";
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

	<table class=notebook align=center>
	<tr class=row_title>
	<th class=row_title><a class=title href="ShowDoctorDetails.jsp?orderby=DoctorName">DoctorName</a></th>
    <th class=row_title><a class=title href="ShowDoctorDetails.jsp?orderby=DateOfDelivery">Designation</a></th>
	<th class=row_title><a class=title href="ShowDoctorDetails.jsp?orderby=FairChargesType">ChargesPerHour</a></th>
	
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   DoctorName=rs.getString(1);
	   Designation=rs.getString(4);
	   ChargesPerHour=rs.getFloat(9);
	  
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=ChargesPerHour%>')"><%=DoctorName%></a></td>
		<td><%=Designation%></td>
		<td><%=ChargesPerHour%></td>
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

