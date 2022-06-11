
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Doctors List</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txtVal2)
{

		//var txt = window.opener.document.forms(0).ReferedByDoctor;
		var txt = window.opener.document.forms[0].ReferedByDoctor;
		txt.value = txtVal;
		var txt2 = window.opener.document.forms[0].DoctorID;
		txt2.value = txtVal2;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h2 align=center>Doctors List</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="DoctorName";
String DoctorName,Designation,DoctorId;
int DoctorID;


System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "DoctorName":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM DoctorsMaster";

	System.out.println("--1--"+Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	System.out.println("Exception"+e);
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
    <th class=row_title><a class=title href="ListAvailableDoctors.jsp?orderby=DoctorName">DoctorName</a></th>
	<th class=row_title><a class=title href="ListAvailableDoctors.jsp?orderby=Designation">Designation</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	
	  DoctorName=rs.getString(1);
	  Designation=rs.getString(4);
	  DoctorId=rs.getString(2);
	  
	
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=DoctorName%>','<%=DoctorId%>')"><%=DoctorName%></a></td>
		<td><%=Designation%></td>

	<%
	}


	rs.close();
	
	
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=6>No Records found</th></tr>
		<input type=button value=close onclick="window.close()">

		</CENTER>
	<%

}

}
%>


</table>
</form>
</BODY>
</HTML>

