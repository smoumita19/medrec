
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Insurance Details</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if((auth==1)){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

<P align=right><a class=title onclick="printTable()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h1 align=Center>Insurance Details</h1>
<form name=cons>
<table width="20%" align=Left>

<%
/*Declaration of variables*/


Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="InsuranceID";
String NameOfApplicant,WorkingAtCompany,EmployeeID,NameOfPatient,Natureofillness;
String PeriodofStayinHospital,Place,PolicyNumber,ClaimNumber,RelationWithPatient;
float AmountClaimed;
int PatientID,InsuranceID;
String DateOfAdmission,DateOfDischarge;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "NameOfApplicant":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM InsuranceMaster order by "+orderby;


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
    <th class=row_title><a class=title href="ViewInsurances.jsp?orderby=InsuranceID">Insurance ID</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=NameOfPatient">Name of Patient</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=NameOfApplicant">Name of Applicant</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=WorkingAtCompany">Working At Company</a></th>
    <th class=row_title><a class=title href="ViewInsurances.jsp?orderby=EmployeeID">EmployeeID</a></th>
    <th class=row_title><a class=title href="ViewInsurances.jsp?orderby=RelationWithPatient">Relation With Patient</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=Natureofillness">Nature of illness</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=DateOfAdmission">Date Of Admission</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=DateOfDischarge">Date Of Discharge</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=PeriodofStayinHospital">Period of Stay in Hospital</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=AmountClaimed">Amount Claimed</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=Place">Place</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=PolicyNumber">Policy Number</a></th>
	<th class=row_title><a class=title href="ViewInsurances.jsp?orderby=ClaimNumber">Claim Number</a></th>

<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  InsuranceID=rs.getInt(1);
	  NameOfPatient=rs.getString(2);
	  NameOfApplicant=rs.getString(3);
	  WorkingAtCompany=rs.getString(4);
	  EmployeeID=rs.getString(5);
 	  RelationWithPatient=rs.getString(6);
	  Natureofillness=rs.getString(7);
	  DateOfAdmission=rs.getString(8);
	  DateOfDischarge=rs.getString(9);
	  if(DateOfDischarge==null||DateOfDischarge.trim().equalsIgnoreCase("0000-00-00")||DateOfDischarge.trim().equalsIgnoreCase("null")){
			DateOfDischarge = "Not Applicable";
	  }
	  PeriodofStayinHospital=rs.getString(10);
	  AmountClaimed=rs.getFloat(11);
	  Place=rs.getString(12);
	  PolicyNumber=rs.getString(13);
	  ClaimNumber=rs.getString(14);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center class="tblData"><%= InsuranceID%></td>
		<td align=center class="tblData"><%= NameOfPatient%></td>
		<td align=center class="tblData"><%= NameOfApplicant%></td>
		<td align=center class="tblData"><%= WorkingAtCompany%></td>
		<td align=center class="tblData"><%= EmployeeID%></td>
		<td align=center class="tblData"><%= RelationWithPatient%></td>
		<td align=center class="tblData"><%= Natureofillness%></td>
		<td align=center class="tblData"><%= DateOfAdmission%></td>
		<td align=center class="tblData"><%= DateOfDischarge%></td>
		<td align=center class="tblData"><%= PeriodofStayinHospital%></td>
		<td align=center class="tblData"><%= AmountClaimed%></td>
		<td align=center class="tblData"><%= Place%></td>
		<td align=center class="tblData"><%= PolicyNumber%></td>
		<td align=center class="tblData"><%= ClaimNumber%></td>
	<%
	}


	rs.close();

if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=14>No Records found</th></tr>
		</CENTER>
	<%

}

}
%>


</table>
</form>
</BODY>
</HTML>
<%
  }
  %>

