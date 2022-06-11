
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>ConsolidatedReport</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txt1Val,txt2Val)
{
		
		// var txt1 = window.opener.document.forms(0).PatientID;
		var txt1 = window.opener.document.forms[0].PatientID;

		txt1.value = txt1Val;
		// var txt2 = window.opener.document.forms(0).NameOfPatient;
		var txt2 = window.opener.document.forms[0].NameOfPatient;

		txt2.value = txt2Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h2 align=center>InPatients List</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="NameOfPatient";
String PatientID,NameOfPatient,Natureofillness;
Date DateOfAdmission;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "NameOfPatient":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	//String Query = "SELECT * FROM PatientsMaster Where AdmissionAs =\'"InPatient"\' order by "+orderby;
	String Query = "SELECT * FROM PatientsMaster Where AdmissionAs =\'InPatient\' order by "+orderby;
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
	<th class=row_title><a class=title href="ListPatients.jsp?orderby=PatientID">PatientID</a></th>
	        <th class=row_title><a class=title href="ListPatients.jsp?orderby=NameOfPatient">NameOfPatient</a></th>

	<th class=row_title><a class=title href="ListPatients.jsp?orderby=Natureofillness">Natureofillness</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   NameOfPatient=rs.getString(1);
	   PatientID=rs.getString(2);
	   Natureofillness=rs.getString(7);

	  
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=PatientID%>','<%=NameOfPatient%>')"><%=PatientID%></a></td>
		<td><%=NameOfPatient%></td>
		<td><%=Natureofillness%></td>
		
	<%
	}


	rs.close();
	
}
else
{
	/*To write to the server if the resultset is null*/
	//System.out.println("Result set is null\n");
	%>
		<CENTER>
		<B>No Records found............<B><BR>
		<input type=button value=close onclick="window.close()">
		</CENTER>
	<%

}


%>


</table>
</form>
</BODY>
</HTML>

