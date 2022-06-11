
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Doctors List</title>
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

if(auth==3){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

<P align=right><a class=title onclick="printTable()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h1 align=Center>Doctors List</h1>
<form name=cons>
<table width="20%" align=Left>

<%
/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
   
String orderby="DoctorName";
String DoctorName,Designation,PhoneNumber;
String HolidayinWeek,WorkingHours;
String DateOfJoin;
float ChargesPerHour;
int DoctorID,Experience;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "DoctorName":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);

try
{

	/*Getting the connection variable from session*/

	con=(Connection)session.getAttribute("connection");
	stmt =  con.createStatement();
	String Query = "SELECT * FROM DoctorsMaster order by "+orderby;


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
 

	<table width="100%" align=right class="printTable" id="printTable" border="1" cellpadding="1" >

	<tr class=row_title>
        <th class=row_title><a class=title href="ViewDoctors.jsp?orderby=DoctorName">Doctor Name</a></th>
	<th class=row_title><a class=title href="ViewDoctors.jsp?orderby=DoctorID">Doctor ID</a></th>
	<th class=row_title><a class=title href="ViewDoctors.jsp?orderby=DateOfJoin">Date Of Join</a></th>
	<th class=row_title><a class=title href="ViewDoctors.jsp?orderby=Designation">Designation</a></th>
	<th class=row_title><a class=title href="ViewDoctors.jsp?orderby=PhoneNumber">PhoneNumber</a></th>
	<th class=row_title><a class=title href="ViewDoctors.jsp?orderby=Experience">Experience</a></th>
	<th class=row_title><a class=title href="ViewDoctors.jsp?orderby=HolidayinWeek">Holiday in Week</a></th>
	<th class=row_title><a class=title href="ViewDoctors.jsp?orderby=WorkingHours">Working Hours</a></th>
	<th class=row_title><a class=title href="ViewDoctors.jsp?orderby=ChargesPerHour">Charges Per Hour</a></th>
	
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	  DoctorName=rs.getString(1);
	  DoctorID=rs.getInt(2);
	  DateOfJoin=rs.getString(3);
          Designation=rs.getString(4);
	  PhoneNumber=rs.getString(5);
	  Experience=rs.getInt(6);
	  HolidayinWeek=rs.getString(7);
	  WorkingHours=rs.getString(8);
	  ChargesPerHour=rs.getFloat(9);
 	  
	DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align=center class="tblData"><%= DoctorName%></td>
		<td align=center class="tblData"><%= DoctorID%></td>
		<td align=center class="tblData"><%= DateOfJoin%></td>
		<td align=center class="tblData"><%= Designation%></td>
		<td align=center class="tblData"><%= PhoneNumber%></td>
		<td align=center class="tblData"><%= Experience%></td>
		<td align=center class="tblData"><%= HolidayinWeek%></td>
		<td align=center class="tblData"><%= WorkingHours%></td>
		<td align=center class="tblData"><%= ChargesPerHour%></td>
		
	<%
	}


	rs.close();
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=9>No Records found</th></tr>

		</CENTER>
	<%

}

}
%>

</table>
</form>
</BODY>
<script>
	function printTable(){

	 //let dontPrintContents = document.querySelector("dontPrint");

     //let dontPrintContents =
	 document.getElementById("dontPrint").style.display = "none";
	 var titles = document.getElementsByClassName("title");
		for (var i = 0; i < titles.length; i++) {
		//Distribute(slides.item(i));
		titles.item(i).style.fontSize = "8pt";

	 }

	 var tblDataAll = document.getElementsByClassName("tblData");
		for (var i = 0; i <  tblDataAll.length; i++) {
		//Distribute(slides.item(i));
		tblDataAll.item(i).style.fontSize = "8pt";

	 }


	//  if(dontPrintContents != null) {
	// 	dontPrintContents.style.display = none;

	//  }

	//document.getElementById("printTable").style.width = "200px";
    //Change the font size

	//  document.body.innerHTML = 
    //       "<html><head><title></title></head><body>" + 
	// 		printContents + "</body>";

     //document.body.innerHTML = printContents;


     window.print();

     //document.body.innerHTML = originalContents;
	 document.getElementById("dontPrint").style.display = "block";

	 var titles = document.getElementsByClassName("title");
		for (var i = 0; i < titles.length; i++) {
		//Distribute(slides.item(i));
		titles.item(i).style.fontSize = "11pt";

	 }

	 var tblDataAll = document.getElementsByClassName("tblData");
		for (var i = 0; i <  tblDataAll.length; i++) {
		//Distribute(slides.item(i));
		tblDataAll.item(i).style.fontSize = "11pt";

	 }


	 //dontPrintContents.style.display = "block";


		//javascipt:window.print()
	}
</script>
</HTML>
<%
  }
  %>
