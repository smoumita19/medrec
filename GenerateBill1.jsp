<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<% String Insurance=request.getParameter("Insurance"); %>
<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="images/validate.js"></script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<BODY class=SC>
<h2 align=center>Add BillDetails </h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null,stmt1=null;
		String NameOfPatient = request.getParameter("NameOfPatient");
		String PatientID = request.getParameter("PatientID");	
		String AdmissionFee = request.getParameter("AdmissionFee");	
		String PeriodofStayinHospital = request.getParameter("PeriodofStayinHospital");	
		String RoomID = request.getParameter("RoomID");	
		String RoomRent = request.getParameter("RoomRent");	
		String ReferedByDoctor = request.getParameter("ReferedByDoctor");	
		String DoctorFee = request.getParameter("DoctorFee");	
		String TotalCharge = request.getParameter("TotalCharge");	
				
		System.out.println("ins"+Insurance);
				
		System.out.println("TotalCharge"+TotalCharge);
	try{
			con = (Connection)session.getAttribute("connection"); 
			stmt =  con.createStatement();
				
			String Query = "Insert into billingmaster (PatientID,NameOfPatient,AdmissionFee,PeriodofStayinHospital,RoomID,RoomRent,ReferedByDoctor,DoctorFee,TotalCharge) values ("+PatientID+",'"+NameOfPatient+"',"+AdmissionFee+","+PeriodofStayinHospital+","+RoomID+","+RoomRent+",'"+ReferedByDoctor+"',"+DoctorFee+","+TotalCharge+")";
			int result = stmt.executeUpdate(Query);
			System.out.println(Query);

			if( result > 0)	{
				stmt1 =  con.createStatement();
				if(Insurance.equals("Yes")){
				String Query1="UPDATE insurancemaster SET insurancemaster.AmountClaimed = "+TotalCharge+"  WHERE NameOfPatient=\'"+NameOfPatient+"\'" ;
				System.out.println(Query1);
				int rowsAffect1=stmt1.executeUpdate(Query1);	
				System.out.println("Rows Affected = " + rowsAffect1);
				}
				%><h3 align=center>The patient discharge information has been added sucessfully!</h3>
				<center>
				<A href="ViewBill.jsp"> Generate Bill </A><br>
				<A href="NewDischarges0.jsp"> Discharge another Patient</A>
				</center>
				<%
			}
			else{
				%><h3 align=center>Error in updating..please try again</h3><% 
			}
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


