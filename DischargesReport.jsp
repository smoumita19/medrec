
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
String NameOfPatient="",Natureofillness="",ConsultantDoctor="";
int PatientID;
Date DateOfAdmission,DateOfDischarge;
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
	String Query = "SELECT * FROM DischargesMaster where (DateOfDischarge between (\'"+strStartDate+"\') and (\'"+strEndDate+"\'))";

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
	<th class=row_title><a class=title href="DischargesReport.jsp?orderby=NameOfPatient">NameOfPatient</a></th>
	<th class=row_title><a class=title href="DischargesReport.jsp?orderby=PatientID">PatientID</a></th>
	<th class=row_title><a class=title href="DischargesReport.jsp?orderby=Natureofillness">Nature of illness</a></th>
	<th class=row_title><a class=title href="DischargesReport.jsp?orderby=DateOfAdmission">Date Of Admission</a></th>
	<th class=row_title><a class=title href="DischargesReport.jsp?orderby=DateOfDischarge">Date Of Discharge</a></th>
	<th class=row_title><a class=title href="DischargesReport.jsp?orderby=ConsultantDoctor">Consultant Doctor</a></th>
	<th class=row_title><a class=title href="DischargesReport.jsp?orderby=BillAmount">Bill Amount </a></th>

<%

int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
 	  NameOfPatient=rs.getString(1);
	  PatientID=rs.getInt(2);
	  Natureofillness=rs.getString(6);
	  DateOfAdmission=rs.getDate(7);
	  DateOfDischarge=rs.getDate(8);   
 	  ConsultantDoctor=rs.getString(11); 
	  BillAmount=rs.getFloat(13);
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center><%= NameOfPatient%></td>
		<td align=center><%= PatientID%></td>
		<td align=center><%= Natureofillness%></td>
		<td align=center><%= DateOfAdmission%></td>
		<td align=center><%= DateOfDischarge%></td>
		<td align=center><%= ConsultantDoctor%></td>
		<td align=center><%= BillAmount%></td>
	<%
	}


	rs.close();
	if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=7>No Records found</th></tr>
		</CENTER>
	<%

}

}
%>



</table>
</form>
</BODY>
</HTML>

