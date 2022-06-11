
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>PatientsList</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val,txt4Val,txt5Val,txt6Val,txt7Val,txt8Val,txt9Val)
{
		var txt = window.opener.document.forms(0).NameOfPatient;
		txt.value = txtVal;
		var txt2 = window.opener.document.forms(0).NameofApplicant;
		txt2.value=txt2Val;
		var txt5 = window.opener.document.forms(0).RelationWithPatient;
		txt5.value=txt5Val;
		var txt5 = window.opener.document.forms(0).Natureofillness;
		txt5.value=txt5Val;
		var txt6 = window.opener.document.forms(0).DateOfAdmission;
		txt6.value=txt6Val;
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
String NameOfPatient,Natureofillness,Sex,Occupation,MediAssist,ReferedByDoctor;
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
	String Query = "SELECT * FROM PatientsMaster Where AdmissionAs =\'InPatient\'";

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
	<th class=row_title><a class=title href="ShowPatients.jsp?orderby=PatientID">PatientID</a></th>
	<th class=row_title><a class=title href="ShowPatients.jsp?orderby=Natureofillness">Natureofillness</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   NameOfPatient=rs.getString(1);
	   PatientID=rs.getInt(2);
	   Age=rs.getInt(3);
	   Sex=rs.getString(4);
	   Occupation=rs.getString(5);
	   Natureofillness=rs.getString(7);
	   DateOfAdmission=rs.getDate(8);
	   MediAssist=rs.getString(10);
	   ReferedByDoctor=rs.getString(13);
	   RoomID=rs.getInt(14);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=NameOfPatient%>','<%=PatientID%>','<%=Age%>','<%=Sex%>','<%=Occupation%>','<%=Natureofillness%>','<%=DateOfAdmission%>','<%=MediAssist%>','<%=RoomID%>','<%=ReferedByDoctor%>')"><%=NameOfPatient%></a></td>
		<td><%=PatientID%></td>
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

