<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Appointment</TITLE>
	<script LANGUAGE="Javascript" SRC="images/calender.js"></script>
    <script language="Javascript" src="images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	
	function check(){
		var DoctorName = document.AppointmentForm.DoctorName.value;
		var DoctorID =document.AppointmentForm.DoctorID.value;
		// var DoctorRate =document.AppointmentForm.DoctorRate.value;
		var Designation = document.AppointmentForm.Designation.value;
		var AppointmentGiventoIndex=document.AppointmentForm.AppointmentGivento.options.selectedIndex;
		var AppointmentGivento = document.AppointmentForm.AppointmentGivento.options[AppointmentGiventoIndex].value;
		var PatientID = document.AppointmentForm.PatientID.value;
		var NameOfCharity = document.AppointmentForm.NameOfCharity.value;
		var DateOfAppointment = document.AppointmentForm.DateOfAppointment.value;
		var NoOfHours = document.AppointmentForm.NoOfHours.value;
		var Cost = document.AppointmentForm.Cost.value;

		var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
		var wpattern = /^([0-9]{1,2})$/;
		var ADpattern = /^([a-zA-Z0-9\_\. ]{4,20})$/;
		var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;
		var Ipattern = /^([a-zA-Z\_\. ]{1,25})$/;
		var Apattern = /^([0-9]{1,10})$/;


		if(DoctorName==""){
			alert("DoctorName field is manadatory");
			return false;
			}
		else
		if(DoctorID==""){
			alert("DoctorID field is manadatory");
			return false;
			}
		else
		if(Designation==""){
			alert("Designation field is manadatory");
			return false;
			}
		else
		if(AppointmentGiventoIndex==""){
			alert("Appointment Given to field is manadatory");
			return false;
			}
		else
		if(PatientID==""){
			alert("PatientID field is manadatory");
			return false;
			}
		else
		if(NameOfCharity==""){
			alert("NameOfCharity field is manadatory");
			return false;
			}
		else
		if(DateOfAppointment==""){
			alert("DateOfAppointment field is manadatory");
			return false;
			}
		else
		
		if(!(wpattern.test(NoOfHours))||NoOfHours>24||NoOfHours<=0){
			alert("Invalid NoOfHours");
			return false;
			}


	}
    function MapAppointment()
	{
		/*****
		AppointmentGivento == "Patient"
			NameOfCharity="NA";
		AppointmentGivento == "Charity"
			PatientID="NA";
			NameOfPatient="NA";
		*****/
		var frm = document.AppointmentForm;
		var Ap = frm.AppointmentGivento.options[frm.AppointmentGivento.options.selectedIndex].value;
		
		if(Ap=="Patient")
		{
				frm.NameOfCharity.value="NA";
				frm.NameOfCharity.disabled=true;
				frm.InpBtn.disabled=false;
				frm.NameOfPatient.disabled=false;
				frm.PatientID.disabled=false;
				frm.NameOfPatient.value="";
				frm.PatientID.value="";

		}
		if(Ap=="Charity")
		{
				frm.NameOfCharity.disabled=false;
				frm.NameOfCharity.value="";
				frm.InpBtn.disabled=true;
				frm.NameOfPatient.disabled=true;
				frm.PatientID.disabled=true;
				frm.NameOfPatient.value="NA";
				frm.PatientID.value="NA";

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
if(auth>1){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="AppointmentForm" onSubmit="return check()" action="AddAppointments1.jsp">
   <CENTER>
   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Appointments </TH>
	   </TR>

	  
	   <TR class=row_even >
	   <TD>Consultant Doctor Name  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="DoctorName" SIZE="20"  readonly><input type="button" value="Show Doctors" onclick="fnEmpPopUp('ShowDoctors.jsp',300,300)"></td>
	   </TR>

	   <TR class=row_odd >
	   <TD>Doctor ID  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="DoctorID" SIZE="20" ></TD>
	   </TR>

	   <TR class=row_even >
		<TD>Doctor Rate  <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="TEXT" NAME="DoctorRate" SIZE="20" ID="DoctorRate" ></TD>
		</TR>
	   
	   	  
	   <TR class=row_odd >
	   <TD>Designation  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="Designation" SIZE="20" ></TD>
	   </TR>


	   <TR class=row_even >
	   <TD>Appointment Given to  <FONT COLOR="red">*</FONT></TD>
	    <TD><select name="AppointmentGivento" onchange="MapAppointment()">
				<option value="---">---</option>	
				<option value="Patient">Patient</option>	   
				<option value="Charity">Charity</option>
			</select></TD>
	   
	   </TR>
	  
	   <TR class=row_odd >
	   <TD>PatientID  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="PatientID" SIZE="20" readonly><input type="button" value="Show InPatients" Name="InpBtn" ID="InpBtn" onclick="fnEmpPopUp('ListPatients.jsp',300,300)"></td>

	   </TR>
	
		<TR class=row_even >
	   <TD>Name Of Patient  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfPatient" SIZE="20" Value=""></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>Name Of Charity  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfCharity" SIZE="20" Value=""></TD>
	   </TR>
	
	 	<TR class=row_even >
	   <TD>Date Of Appointment <FONT COLOR="red">*</FONT></TD> <TD>
		<input type="date" size=20 id="DateOfAppointment" name="DateOfAppointment">   
		<!-- <input size=20 readonly id="DateOfAppointment" name="DateOfAppointment">
	 <img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" > -->
   	 	</TD>
         </TR>
	  

	   <TR class=row_odd >
	   <TD>No Of Hours (0-24) <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="NoOfHours" SIZE="20" ID="NoOfHours" onchange="calculateCost(this)"></TD>
	   </TR>

	   
	   <TR class=row_even >
		<TD>Cost  <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="TEXT" NAME="Cost" ID="Cost" SIZE="20" ></TD>
		</TR>
   
	   <TR class=row_odd  ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Add" class="form-button"></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset" class="form-button"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   <script>
	   document.getElementById('DateOfAppointment').valueAsDate = new Date();
	   function calculateCost(hours){
		   let rate = parseInt(document.getElementById('DoctorRate').value);
		   let hour = parseInt(hours.value);
		   let cost = document.getElementById('Cost');
		   let allCost = rate*hour;
		   cost.value = allCost;
	   }
   </script>
   </HTML>
<%
  }
  %>