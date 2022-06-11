
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String NameOfPatient = request.getParameter("NameOfPatient");%>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Bill Details</title>
<SCRIPT LANGUAGE="JavaScript">

</SCRIPT>
</HEAD>

 <jsp:include page="MultiLevelmenu.htm"/><br><br>

<BODY class=SC>
<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h1 align=center>Bill Details</h1>
<form name=cons>

<% 

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="BillID";
String ReferedByDoctor;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "BillID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);
String Condition = (String)request.getParameter("NameOfPatient");
int billID = Integer.parseInt(Condition);
int BillID,PeriodofStayinHospital,RoomID;
float AdmissionFee,RoomRent,DoctorFee,TotalCharge;
try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "select * from billingmaster where billID=\'"+billID+"\'";
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

	
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{	BillID=rs.getInt(1);
		AdmissionFee=rs.getFloat(4);
		PeriodofStayinHospital=rs.getInt(5);
		RoomID=rs.getInt(6);
	    RoomRent=rs.getFloat(7);
		ReferedByDoctor=rs.getString(8);
		DoctorFee=rs.getFloat(9);
		TotalCharge=rs.getFloat(10);
		DisRow++;
	%>
	<table width="100%" align=right class="printTable" id="printTable" border="1" cellpadding="1">
				<tr><td class=row_title><b>BillID</b></a></td><td class=row_title><b><%=BillID%></b></td></tr>
				<tr><td class=row_title><b>AdmissionFee</b></a></td><td class=row_title><b>Rs.<%=AdmissionFee%></b></td></tr>
				<tr><td class=row_title><b>PeriodofStayinHospital</b></a></td><td class=row_title><b><%=PeriodofStayinHospital%> days</b></td></tr>
				<tr><td class=row_title><b>RoomID</b></a></td><td class=row_title><b><%=RoomID%></b></td></tr>
				<tr><td class=row_title><b>RoomRent Perday</b></a></td><td class=row_title><b>Rs.<%=RoomRent%></b></td></tr>
				<tr><td class=row_title><b>ReferedByDoctor</b></a></td><td class=row_title><b><%=ReferedByDoctor%></b></td></tr>
				<tr><td class=row_title><b>DoctorFee Perday</b></a></td><td class=row_title><b>Rs.<%=DoctorFee%></b></td></tr>
				<tr class=row_odd><td><b>Total Charge</b></a></td><td class=row_odd><font  color="red"><b>Rs.<%=TotalCharge%></b></td></tr>
	</table>	

	<%
	}


	rs.close();
	
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=6>No records found</th></tr><br><br>
		</CENTER>
		

	<%

}
}
%>

</table>
</form>
</BODY>
</HTML>

