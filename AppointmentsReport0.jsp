<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Appointments Report</TITLE>
	<LINK href="styles.css" type="text/css" rel="stylesheet">


<script LANGUAGE="Javascript" SRC="images/calender.js"></script>
<script language="Javascript" src="images/validate.js"></script>
</HEAD>
<SCRIPT LANGUAGE="JavaScript">
<!--
function Validate()
{
	var DoctorName="";
	var Obj = document.calform;
	DoctorName = Obj.DoctorName.value;
	if(DoctorName=="" || DoctorName==null) 
	{
		alert("DoctorName is mandatory");
		Obj.DoctorName.focus();
		return false;
	}
	var retvalue = validatePeriod(document.calform.Start,document.calform.End);
	if(retvalue==false){ alert("Start date should not exceed End date"); return retvalue; }
	else { return retvalue; }


return true;
}
//-->
</SCRIPT>


 <jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<BODY Class=SC>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if(auth<0){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
<!-- <H1 align =center> Appointments Report</H1> -->



<form name='calform' action="AppointmentsReport01.jsp" 
onsubmit="return Validate();">
<center>

<Table width="40%" align=center>
 <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> Appointments Report </TH>
	   </TR>
<TR class="row_even">
<Td><B>Start Date</B> <FONT COLOR="red">*</FONT></Td>
<TD>
	<input type="date" size=20 id="Start" name="Start">   

<!-- <input type=text name="Start" size=15 readonly ><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" > -->
</TD>
</TR>
<TR class="row_odd">
<Td><B>End Date</B> <FONT COLOR="red">*</FONT></Td>
<TD>
	<input type="date" size=20 id="End" name="End">   

<!-- <input type=text name="End" size=15 readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" > -->
</TD>
<TR class="row_even">
<Td><B>Doctor Name</B> <FONT COLOR="red">*</FONT></Td>
<td><input type="text" name="DoctorName" size=5 readonly><input type="button" value="List Doctors" onclick="fnEmpPopUp('ListDoctors.jsp',300,300)"></td>

<TR class="row_odd" >
<TD align=center><INPUT TYPE="submit" id=SUB class="form-button" Value="Get Report" ></TD>
<TD align=center><INPUT id='RES' TYPE="RESET" class="form-button" ></TD>
</TR>
</TABLE>
</form>

 <%
  }
  %>
