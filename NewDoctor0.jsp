<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Doctor</TITLE>
	<script LANGUAGE="Javascript" SRC="images/calender.js"></script>
    <script language="Javascript" src="images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">

	function check(){
		// var frm = document.forms(0);
		var frm = document.forms[0];
		var DoctorName = frm.DoctorName.value;
		var DateOfJoin = frm.DateOfJoin.value;
		var DesignationIndex=frm.Designation.options.selectedIndex;
		var Designation = frm.Designation.options[DesignationIndex].value;
		var PhoneNumber=frm.PhoneNumber.value;
		var Experience=frm.Experience.value;
		var HolidayinWeekIndex=frm.HolidayinWeek.options.selectedIndex;
		var HolidayinWeek = frm.HolidayinWeek.options[HolidayinWeekIndex].value;
		var WorkingHours = frm.WorkingHours.value;
		var ChargesPerHour = frm.ChargesPerHour.value;
	
	var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
	var wpattern = /^([0-9]{1,2})$/;
	var ADpattern = /^([a-zA-Z0-9\_\. ]{4,20})$/;
	var Dpattern = /^([a-zA-Z\_\. ]{1,15})$/;
	var Apattern = /^([0-9]{1,10})$/;


if(!(Dpattern.test(DoctorName))){
	alert("Invalid Doctor Name");
    return false;
	}
else
if(DateOfJoin==""){ 
		alert("Date Of Join is mandatory");
		return false;
		}
else
if(DesignationIndex==""){ 
		alert("Designation is mandatory");
		return false;
		}

else
if(!(Apattern.test(PhoneNumber))){
	alert("Invalid PhoneNumber");
    return false;
	}
else
if(!(wpattern.test(Experience))){
	alert("Invalid Experience");
    return false;
	}
else
if(HolidayinWeekIndex==""){ 
		alert("Holiday in Week is mandatory");
		return false;
		}

else

if((!(wpattern.test(WorkingHours))||WorkingHours>24||WorkingHours<=0)){
	alert("Invalid Working Hours");
    return false;
	}
else
if(!(Apattern.test(ChargesPerHour))){
	alert("Invalid Charges Per Hour");
    return false;
	}
	
	}
	
    

	</SCRIPT>

  </HEAD>
   <jsp:include page="MultiLevelmenu.htm"/><br><br><br> 
  <body Class=SC>
	<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if((auth==1)||(auth==3)){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="NewDoctorsForm" onSubmit="return check()" action="NewDoctor.jsp">
   <CENTER>
<!-- DoctorName DoctorID DateOfJoin Designation PhoneNumber Experience  HolidayinWeek WorkingHours ChargesPerHour -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Doctors Entry </TH>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Consultant Doctor Name  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="DoctorName" SIZE="20" ></td>
	   </TR>

	  	   
	   <TR class=row_odd >
	   <TD>Date Of Join  <FONT COLOR="red">*</FONT></TD> <TD><input type="date" size=20 id="DateOfJoin" name="DateOfJoin">

	   <!-- <input type="date" id="birthday" name="birthday"> -->
	 <!-- <img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" > -->
   	 </TD>
         </TR>
	   	  
	   <TR class=row_even >
	   <TD>Designation  <FONT COLOR="red">*</FONT></TD>
	 <TD><select name="Designation">
				<option value="---">---</option>
				<option value="Anesthesiologist">Anesthesiologist</option>
				<option value="Cardiologist">Cardiologist</option>
				<option value="Dentist">Dentist</option>	   
				<option value="Dietitian">Dietitian</option>
				<option value="Dermatologist">Dermatologist</option>
				<option value="GeneralMedicine">GeneralMedicine</option>
				<option value="Gynecologist">Gynecologist</option>
				<option value="Nutritionist">Nutritionist</option>
				<option value="Neurologist">Neurologist</option>
				<option value="Neurosurgeon">Neurosurgeon</option>
				<option value="OrthoPedist">OrthoPedist</option>	   
				<option value="Ophthalmologist">Ophthalmologist</option>
				<option value="Pediatrician">Pediatrician</option>
				<option value="Psychiatrist">Psychiatrist</option>
				<option value="Physiotherapist">Physiotherapist</option>
				<option value="Radiologist">Radiologist</option>
			</select></TD>
	   
	   </TR>

	   <TR class=row_odd >
	   <TD>Phone Number (0-10 Digits) <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="PhoneNumber" SIZE="20" ></TD>
	   </TR>
	   
	   <TR class=row_even >
	   <TD>Experience  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="Experience" SIZE="20" > years</TD>
	   </TR>

	  
	   

	   <TR class=row_odd >
	   <TD>Holiday in Week  <FONT COLOR="red">*</FONT></TD>
	    <TD><select name="HolidayinWeek">
				<option value="---">---</option>	
				<option value="Sunday">Sunday</option>	   
				<option value="Monday">Monday</option>
				<option value="Tuesday">Tuesday</option>
				<option value="Wednesday">Wednesday</option>
				<option value="Thursday">Thursday</option>
				<option value="Friday">Friday</option>
				<option value="Saturday">Saturday</option>
			</select></TD>
	   
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Working Hours (0-24) <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="WorkingHours" SIZE="20" ></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>Charges Per Hour  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="ChargesPerHour" SIZE="20" > rupees</TD>
	   </TR>
   
	   <TR class=row_even  ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Add" class="form-button" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset" class="form-button"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   <script>
	    document.getElementById('DateOfJoin').valueAsDate = new Date();
   </script>
   </HTML>
<%
  }
  %>