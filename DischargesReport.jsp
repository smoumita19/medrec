
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String strStartDate = request.getParameter("Start");%>
<%String strEndDate = request.getParameter("End");%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Discharges Report</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);


//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<P align=right><a class=title onclick="printTable()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h2 align=Center> Discharges Between <%=strStartDate%>and <%=strEndDate%></h2>
<form name=cons>
<table width="20%" align=Left>

<%
/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
   
String orderby="NameOfPatient";
String NameOfPatient,Sex,Occupation,Natureofillness;
String ConsultantDoctor,ReferedByDoctor,Insurance;
Date DateOfAdmission,DateOfDischarge;
int RoomID,PatientID,Age,TotalCharge;
float BillAmount;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "NameOfPatient":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

//String strStartDate = request.getParameter("Start");
//String strEndDate =  request.getParameter("End");

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	/*String Query = "SELECT * FROM DischargesMaster where (DateOfDischarge between (\'"+strStartDate+"\') and (\'"+strEndDate+"\'))";*/
	String Query = "SELECT d.NameOfPatient, d.PatientID, d.Age, d.Sex, d.Occupation, d.Natureofillness, d.DateOfAdmission, d.DateOfDischarge, d.ReferedByDoctor, d.Insurance, b.TotalCharge FROM `dischargesmaster` d INNER JOIN billingmaster b ON d.PatientID = b.PatientID where d.DateOfDischarge between (\'"+strStartDate+"\') and (\'"+strEndDate+"\')";


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
 

	<table width="100%" align=right class="printTable" id="printTable" border="1" cellpadding="1">

		<tr class=row_title>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=NameOfPatient">Name Of Patient</a></th>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=PatientID">Patient ID</a></th>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=Age">Age</a></th>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=Sex">Sex</a></th>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=Occupation">Occupation</a></th>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=Natureofillness">Nature of illness</a></th>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=DateOfAdmission">Date Of Admission</a></th>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=DateOfDischarge">Date Of Discharge</a></th>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=ConsultantDoctor">Consultant Doctor</a></th>
		<!-- <th class=row_title><a class=title href="ViewDischarges.jsp?orderby=ReferedByDoctor">Refered By Doctor</a></th> -->
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=Insurance">Insurance</a></th>
		<th class=row_title><a class=title href="ViewDischarges.jsp?orderby=BillAmount">Bill Amount</a></th>

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
		Natureofillness=rs.getString(6);
		DateOfAdmission=rs.getDate(7);
		DateOfDischarge=rs.getDate(8);
		ReferedByDoctor=rs.getString(9);
		Insurance=rs.getString(10);
		TotalCharge=rs.getInt(11);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center class="tblData"><%= NameOfPatient%></td>
		<td align=center class="tblData"><%= PatientID%></td>
		<td align=center class="tblData"><%= Age%></td>
		<td align=center class="tblData"><%= Sex%></td>
		<td align=center class="tblData"><%= Occupation%></td>
		<td align=center class="tblData"><%= Natureofillness%></td>
		<td align=center class="tblData"><%= DateOfAdmission%></td>
		<td align=center class="tblData"><%= DateOfDischarge%></td>

		<td align=center class="tblData"><%= ReferedByDoctor%></td>
		<td align=center class="tblData"><%= Insurance%></td>
		<td align=center class="tblData"><%= TotalCharge%></td>
	<%
	}


	rs.close();
	if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=11>No Records found</th></tr>
		</CENTER>
	<%

}

}
%>



</table>
</form>
</BODY>
</HTML>

