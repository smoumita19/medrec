
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
		// var txt = window.opener.document.forms(0).NameOfPatient;
		var txt = window.opener.document.forms[0].NameOfPatient;
		txt.value = txtVal;
		// var txt1 = window.opener.document.forms(0).Natureofillness;
		var txt1 = window.opener.document.forms[0].Natureofillness;
		txt1.value=txt1Val;
		// var txt2 = window.opener.document.forms(0).DateOfAdmission;
		var txt2 = window.opener.document.forms[0].DateOfAdmission;
		txt2.value=txt2Val;

		var txt3 = window.opener.document.forms[0].NameOfApplicant;
		txt3.value=txt3Val;
		
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
String NameOfPatient,Natureofillness,Sex,Occupation,MediAssist,ReferedByDoctor,NameOfApplicant;
int PatientID,Age,RoomID;
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
	String Query = "SELECT * FROM PatientsMaster Where AdmissionAs =\'InPatient\' and Insurance=\'No\'";

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
        <th class=row_title><a class=title href="ShowPatients.jsp?orderby=NameOfPatient">NameOfPatient</a></th>
	<th class=row_title><a class=title href="ShowPatients.jsp?orderby=Natureofillness">Natureofillness</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   NameOfPatient=rs.getString(1);
	   NameOfApplicant = rs.getString(1);
	   Natureofillness=rs.getString(7);
	   DateOfAdmission=rs.getDate(8);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=NameOfPatient%>','<%=Natureofillness%>','<%=DateOfAdmission%>','<%=NameOfApplicant%>')"><%=NameOfPatient%></a></td>
		<td><%=Natureofillness%></td>
		
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

