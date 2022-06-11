<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String NameOfPatient = request.getParameter("NameOfPatient");%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="images/validate.js"></script>


</HEAD>
 <jsp:include page="MultiLevelmenu.htm"/><br><br>
<BODY class=SC>
<P align=right><a class=title onclick="javascipt:window.print()" onmouseover="this.style.cursor='hand'" ><img src="images/printer1.jpg" width="37" height="38" border=0 alt=""></a></P>
<h1 align=center>Bill Details</h1>

<%
	
	Connection con;
String orderby="BillID";
String ReferedByDoctor;
System.out.println("--1---");
orderby=((String)request.getParameter("orderby")==null) ? "BillID":(String)request.getParameter("orderby");
System.out.println("--2--"+orderby);
String Condition = (String)request.getParameter("NameOfPatient");
int BillID,PeriodofStayinHospital,RoomID;
float AdmissionFee,RoomRent,DoctorFee,TotalCharge;
	ResultSet rs=null,rs1=null;
	Statement stmt=null,stmt1=null;
	try{
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			stmt1 =  con.createStatement();
			String Query1 = "select max(BillID) from  billingmaster ";
			rs1 = stmt1.executeQuery(Query1);
			if(rs1==null){
				BillID = 0;
			}
			if(rs1.next()){
				BillID = rs1.getInt(1);
			}
			else{
				BillID = 0;
			}
			System.out.println(BillID);		
			String Query = "select * from billingmaster where BillID="+BillID;

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
		NameOfPatient=rs.getString(3);
		AdmissionFee=rs.getFloat(4);
		PeriodofStayinHospital=rs.getInt(5);
		RoomID=rs.getInt(6);
	    RoomRent=rs.getFloat(7);
		ReferedByDoctor=rs.getString(8);
		DoctorFee=rs.getFloat(9);
		TotalCharge=rs.getFloat(10);
		DisRow++;
	%>
	<table width="40%" align=center class="printTable" id="printTable" border="1" cellpadding="1">
				<tr><td class=row_title><b>BillID</b></a></td><td class=row_title><b><%=BillID%></b></td></tr>
				<tr><td class=row_title><b>NameOfPatient</b></a></td><td class=row_title><b><%=NameOfPatient%></b></td></tr>
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
	
if(DisRow>0)
{         %><center><br>		
				<h3 align=center><th colspan=10><A href="NewDischarges0.jsp"> Discharge another Patient</A><br>
				<h3 align=center><A href="Report.jsp"> Back</A></center><%
	/*To write to the server if the resultset is null*/
	

}
}
%>

</table>
</form>
</BODY>
</HTML>




