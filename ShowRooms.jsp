
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
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val,txt4Val)
{
		var txt = window.opener.document.forms(0).RoomID;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).Category;
		txt1.value = txt1Val;
		var txt2 = window.opener.document.forms(0).ChargesPerDay;
		txt2.value = txt2Val;
		var txt3 = window.opener.document.forms(0).VisitorsAllowed;
		txt3.value = txt3Val;
		var txt4 = window.opener.document.forms(0).visitingHours;
		txt4.value=txt4Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h2 align=center>Rooms List</h2>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String orderby="RoomID";
String RoomID,Category,NoOfBeds,VisitorsAllowed,VisitingHours,Status;
float ChargesPerDay;

System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "RoomID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM RoomsMaster Where Status =\'Empty\'";

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
    <th class=row_title><a class=title href="ShowRooms.jsp?orderby=RoomID">RoomID</a></th>
	<th class=row_title><a class=title href="ShowRooms.jsp?orderby=Category">Category</a></th>
	<th class=row_title><a class=title href="ShowRooms.jsp?orderby=NoOfBeds">NoOfBeds</a></th>
	<th class=row_title><a class=title href="ShowRooms.jsp?orderby=ChargesPerDay">ChargesPerDay</a></th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	
	  RoomID=rs.getString(1);
	  Category=rs.getString(2);
	  NoOfBeds=rs.getString(3);
      ChargesPerDay=rs.getFloat(4);
	  VisitorsAllowed=rs.getString(5);
	  VisitingHours=rs.getString(6);
	
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=RoomID%>','<%=Category%>','<%=ChargesPerDay%>','<%=VisitorsAllowed%>','<%=VisitingHours%>')"><%=RoomID%></a></td>
		<td><%=Category%></td>
		<td><%=NoOfBeds%></td>
		<td><%=ChargesPerDay%></td>
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

