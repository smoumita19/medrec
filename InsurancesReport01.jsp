
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String strStartDate = request.getParameter("Start");%>
<%String strEndDate = request.getParameter("End");%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Insurances Report</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);


//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h2 align=Center> Insurances Between <%=strStartDate%>and <%=strEndDate%></h2>
<form name=cons>
<table width="20%" align=Left>

<%
/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
   
String orderby="NameOfPatient";
String NameOfPatient="",Natureofillness="",ReferedByDoctor="",RelationWithPatient="";
String NameOfApplicant="",Place="",PolicyNumber="",ClaimNumber="",WorkingAtCompany="";
int RoomID;
float AmountClaimed;
Date DateOfAdmission;
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
	String Query = "SELECT * FROM InsuranceMaster where (DateOfAdmission between (\'"+strStartDate+"\') and (\'"+strEndDate+"\')) ";

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
	<th class=row_title><a class=title href="InsurancesReport01.jsp?orderby=NameOfPatient">Name Of Patient</a></th>
	<th class=row_title><a class=title href="InsurancesReport01.jsp?orderby=NameOfApplicant">Name Of Applicant</a></th>
    <th class=row_title><a class=title href="InsurancesReport01.jsp?orderby=WorkingAtCompany">Working At Company</a></th>
	<th class=row_title><a class=title href="InsurancesReport01.jsp?orderby=RelationWithPatient">Relation With Patient</a></th>
	<th class=row_title><a class=title href="InsurancesReport01.jsp?orderby=Natureofillness">Nature of illness</a></th>
	<th class=row_title><a class=title href="InsurancesReport01.jsp?orderby=AmountClaimed">Amount Claimed</a></th>
	<th class=row_title><a class=title href="InsurancesReport01.jsp?orderby=Place">Place</a></th>
	<th class=row_title><a class=title href="InsurancesReport01.jsp?orderby=PolicyNumber">Policy Number</a></th>
	<th class=row_title><a class=title href="InsurancesReport01.jsp?orderby=ClaimNumber">Claim Number</a></th>
<%

int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
 	  NameOfPatient=rs.getString(2);
	  NameOfApplicant=rs.getString(3);
	  WorkingAtCompany=rs.getString(4);
	  RelationWithPatient=rs.getString(6);
	  Natureofillness=rs.getString(7);
	  AmountClaimed=rs.getFloat(11);
	  Place=rs.getString(12);
 	  PolicyNumber=rs.getString(13); 
	  ClaimNumber=rs.getString(14);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%= NameOfPatient%></td>
		<td align=center><%= NameOfApplicant%></td>
		<td align=center><%= WorkingAtCompany%></td>
		<td align=center><%= RelationWithPatient%></td>
		<td align=center><%= Natureofillness%></td>
		<td align=center><%= AmountClaimed%></td>
		<td align=center><%= Place%></td>
		<td align=center><%= PolicyNumber%></td>
		<td align=center><%= ClaimNumber%></td>
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

