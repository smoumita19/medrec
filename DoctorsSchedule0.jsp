<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">	
	<script LANGUAGE="Javascript" SRC="images/validate.js"></script>

    <TITLE> Doctors Schedule</TITLE>
	
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		var DoctorName = document.DoctorForm.DoctorName.value;
		if(DoctorName==""){
			alert("DoctorName is mandatory");
			document.DoctorForm.DoctorName.focus();
			return false;
		}
		
	return true;
	}

	//-->
	</SCRIPT>
  </HEAD>
    <jsp:include page="MultiLevelmenu.htm"/><br><br><br>
  <body Class=SC>

<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth<0){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
<!-- <H1 align =center> Doctors Schedule</H1> -->

  <FORM NAME="DoctorForm" onSubmit="return check()" action="DoctorsSchedule1.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="3"> Doctors Schedule </TH>
	   </TR>
	   <TR class=row_even >
	   <TD>DoctorName *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="DoctorName" SIZE="10" readonly></TD><td><input type="button" value="List Doctors" onclick="fnEmpPopUp('ListDoctors.jsp',300,300)"></TD>
	   </TR>
	   <TR class=row_odd  ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="GetReport" class="form-button" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Clear" class="form-button"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   </HTML>
 <%
  }
  %>