
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
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val)
{
		// var txt = window.opener.document.forms(0).DoctorName;
		var txt = window.opener.document.forms[0].DoctorName;
		txt.value = txtVal;
		// var txt1 = window.opener.document.forms(0).DoctorID;
		var txt1 = window.opener.document.forms[0].DoctorID;
		txt1.value = txt1Val;
		// var txt2 = window.opener.document.forms(0).Designation;
		var txt2 = window.opener.document.forms[0].Designation;
		txt2.value=txt2Val;
		var txt3 = window.opener.document.forms[0].DoctorRate;
		txt3.value=txt3Val;

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
String DoctorName,Designation;
int DoctorID, DoctorRate;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "DoctorName":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	//String Query = "SELECT * FROM PatientsMaster Where AdmissionAs =\'"InPatient"\' order by "+orderby;
	String Query = "SELECT * FROM DoctorsMaster order by "+orderby;

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
    <th class=row_title><a class=title href="ShowDoctors.jsp?orderby=DoctorName">DoctorName</a></th>
	<th class=row_title><a class=title href="ShowDoctors.jsp?orderby=PatientID">DoctorID</a></th>
	<th class=row_title><a class=title href="ShowDoctors.jsp?orderby=Natureofillness">Designation</a></th>
	<th class=row_title><a class=title href="ShowDoctors.jsp?orderby=ChargesPerHour">DoctorRate</a></th>

<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   DoctorName=rs.getString(1);
 	   DoctorID=rs.getInt(2);
	   Designation=rs.getString(4);
	   DoctorRate=rs.getInt(9);
	  
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=DoctorName%>','<%=DoctorID%>','<%=Designation%>','<%=DoctorRate%>')"><%=DoctorName%></a></td>
		<td><%=DoctorID%></td>
		<td><%=Designation%></td>
		<td><%=DoctorRate%></td>
		
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

