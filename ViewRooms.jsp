
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Rooms List</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);


//-->
</SCRIPT>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body class="SC">
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if((auth==1)||(auth==3)){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

<P align=right><a class=title onclick="printTable()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h1 align=Center>Rooms List</h1>
<form name=cons>
<table width="20%" align=Left>

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
	String Query = "SELECT * FROM RoomsMaster order by "+orderby;


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
    <th class=row_title><a class=title href="ViewRooms.jsp?orderby=RoomID">Room ID</a></th>
	<th class=row_title><a class=title href="ViewRooms.jsp?orderby=Category">Category</a></th>
	<!-- <th class=row_title><a class=title href="ViewRooms.jsp?orderby=NoOfBeds">No Of Beds</a></th> -->
	<th class=row_title><a class=title href="ViewRooms.jsp?orderby=ChargesPerDay">Charges Per Day</a></th>
	<th class=row_title><a class=title href="ViewRooms.jsp?orderby=VisitorsAllowed">Visitors Allowed</a></th>
	<th class=row_title><a class=title href="ViewRooms.jsp?orderby=VisitingHours">Visiting Hours</a></th>
	<th class=row_title><a class=title href="ViewRooms.jsp?orderby=Status">Status</a></th>
	
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  RoomID=rs.getString(1);
	  Category=rs.getString(2);
      ChargesPerDay=rs.getFloat(3);
	  VisitorsAllowed=rs.getString(4);
	  VisitingHours=rs.getString(5);
	  Status=rs.getString(6);
 	  
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center class="tblData"><%= RoomID%></td>
		<td align=center class="tblData"><%= Category%></td>
		<td align=center class="tblData"><%= ChargesPerDay%></td>
		<td align=center class="tblData"><%= VisitorsAllowed%></td>
		<td align=center class="tblData"><%= VisitingHours%></td>
		<td align=center class="tblData"><%= Status%></td>
		
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
<%
  }
  %>
