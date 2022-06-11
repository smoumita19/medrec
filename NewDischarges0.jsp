<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Discharges</TITLE>
	<script LANGUAGE="Javascript" SRC="images/calender.js"></script>
    <script language="Javascript" src="images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		// var frm = document.forms(0);
		var frm = document.forms[0];
		var NameOfPatient = frm.NameOfPatient.value;
		var PatientID =frm.PatientID.value;
		var Age	= frm.Age.value;	
		var Sex	= frm.Sex.value;
		var Occupation = frm.Occupation.value;
		var Natureofillness=frm.Natureofillness.value;
		var DateOfAdmission = frm.DateOfAdmission.value;
		var DateOfDischarge = frm.DateOfDischarge.value;
		var RoomID = frm.RoomID.value;
		// var ConsultantDoctor = frm.ConsultantDoctor.value;
		var ReferedByDoctor = frm.ReferedByDoctor.value;
		var Insurance = frm.Insurance.value;

	var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
	var wpattern = /^([0-9]{1,2})$/;
	var ADpattern = /^([a-zA-Z0-9\_\. ]{4,20})$/;
	var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;
	var Ipattern = /^([a-zA-Z\_\. ]{1,25})$/;
	var Apattern = /^([0-9]{1,10})$/;


if(!(Npattern.test(NameOfPatient))){
	alert("Invalid NameOfPatient");
    return false;
	}
else
	if(DateOfDischarge==""){
	alert("DateOfDischarge field is manadatory");
    return false;
	}
// else
// if(!(Ipattern.test(ConsultantDoctor))){
// 	alert("Invalid ConsultantDoctor");
//     return false;
// 	}
}

function CalculatePeriod()
	{
		//alert("Hi");
		var DOA = document.DischargeForm.DateOfAdmission.value;
		if(DOA==""){
			alert("Please select Date of Admission");
		}
		var DOD = document.DischargeForm.DateOfDischarge.value;
		YYYYDOA = DOA.substr(0,4);
		YYYYDOD = DOD.substr(0,4);
		MMDOA = DOA.substr(5,2);
		MMDOD = DOD.substr(5,2);
		DDDOA = DOA.substr(8,2);
		DDDOD = DOD.substr(8,2);
	    var AdmDate = new Date(YYYYDOA,MMDOA,DDDOA);
		var DisDate = new Date(YYYYDOD,MMDOD,DDDOD);
		if(DisDate >= AdmDate)
			{
				if(DisDate>AdmDate)
				{
					var Period = (DisDate - AdmDate)/(1000*60*60*24);
					document.DischargeForm.PeriodofStayinHospital.value = Period;
				}
				else
				{
					document.DischargeForm.PeriodofStayinHospital.value = 1;
				}
			}
		else
		{
			alert("Date of Admission should not exceed Date of Discharge");
			document.DischargeForm.DateOfDischarge.value='';
			document.DischargeForm.PeriodofStayinHospital.value = '';

		}
	}
function fnPatientDetails()
			{
		var frm = document.forms(0);
		var PeriodofStayinHospital = frm.PeriodofStayinHospital.value;
		var NameOfPatient = frm.NameOfPatient.value;
		var RoomID = frm.RoomID.value;
		var ReferedByDoctor = frm.ReferedByDoctor.value;

		if (NameOfPatient=='')
		{
			alert("Please Enter NameOfPatient to Proceed");
		}else
				{var URL = "GetBillDetails.jsp?NameOfPatient="+NameOfPatient+"&PeriodofStayinHospital="+PeriodofStayinHospital+"&RoomID="+RoomID+"&ReferedByDoctor="+ReferedByDoctor;
			fnEmpPopUp(URL,300,400);
			}
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

if((auth>0)){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="DischargeForm" onSubmit="return check()" action="NewDischarge.jsp">
   <CENTER>
<!-- NameOfPatient PatientID Age Sex Occupation Natureofillness DateOfAdmission	DateOfDischarge RoomID ConsultantDoctor ReferedByDoctor -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> Discharge Form </TH>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Name Of Patient *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfPatient" SIZE="10"  readonly><input type="button" value="Show InPatients" onclick="fnEmpPopUp('ShowPatients.jsp',300,300)"></td>

	   </TR>

	   <TR class=row_odd >
	   <TD>Patient ID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="PatientID" SIZE="20" readonly></TD>
	   </TR>
	   
	   <TR class=row_even >
	   <TD>Age *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Age" SIZE="5" readonly></TD>
	   </TR>
	  
	   <TR class=row_odd >
	   <TD>Sex *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Sex" SIZE="10" readonly ></TD>
	   </TR>

	  
	   <TR class=row_even >
	   <TD>Occupation *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Occupation" SIZE="10" readonly ></TD>
 	   </TR>

	   
	   <TR class=row_odd >
	   <TD>Nature of illness*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Natureofillness" SIZE="20" readonly></TD>
	   </TR>

	  
	   <TR class=row_even >
	   <TD>Date Of Admission*</TD> <TD><input type="date" size=20 readonly id="DateOfAdmission" name="DateOfAdmission">
	 
   	  </TD>
         </TR>

	   <TR class=row_odd >
	   <TD>Date Of Discharge *</TD>
	   <TD>
		<input type="date" size=20 id="DateOfDischarge"  name="DateOfDischarge" onchange="diffInDates(this)">   

		<!-- <input size=20 readonly id="DateOfDischarge" name="DateOfDischarge">
		 <img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this);if(document.DischargeForm.DateOfAdmission.value==''){alert('Please select Date of Admission');document.DischargeForm.DateOfDischarge.value='';}else{ CalculatePeriod();}" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this);" > -->
   	 </TD>
         </TR>


		   
		<TR class=row_even >
		  <TD>Period of Stay in Hospital *</TD>
		  <TD><INPUT TYPE="TEXT" NAME="PeriodofStayinHospital" ID="PeriodofStayinHospital" SIZE="20" readonly></TD>
		</TR>
	  
	   <TR class=row_even >
	   <TD>Room ID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="RoomID" SIZE="20" readonly ></TD>
	   </TR>

	   <!-- <TR class=row_odd >
	   <TD>ConsultantDoctor *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ConsultantDoctor" SIZE="20" ></TD>
	   </TR> -->

	   <TR class=row_even >
	   <TD>Consultant Doctor *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ReferedByDoctor" SIZE="20" readonly></TD>
	   </TR>

	   <TR class=row_even >
		<TD>Doctor ID *</TD>
		<TD><INPUT TYPE="TEXT" NAME="DoctorID" SIZE="20" readonly></TD>
		</TR>

		<TR class=row_odd style="display: none;" >
			<TD>Insurance *</TD>
			<TD><INPUT TYPE="HIDDEN" NAME="Insurance" SIZE="10" readonly></TD>
		</TR>
	
	   <TR class=row_odd >
	   <TD>Insurance ID*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="InsuranceID" SIZE="10" readonly></TD>
	   </TR>

       	<TR class=row_even ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Submit" class="form-button" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset" class="form-button"></TD>
		</TR>


   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   <script>
	// document.getElementById('DateOfDischarge').valueAsDate = new Date();
	document.getElementById('DateOfDischarge').max = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];

	function diffInDates(DateOfDischarge){
		let date1 = document.getElementById('DateOfAdmission').value;
		//alert(date1);
		let date2 = DateOfDischarge.value;
		//alert(date2);
		let diff = (new Date(date2).getTime() - new Date(date1).getTime())/(1000 * 3600 * 24);
		//alert(diff);
		document.getElementById('PeriodofStayinHospital').value = diff;
	}

   </script>
   </HTML>
<%
  }
  %>