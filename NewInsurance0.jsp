<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String NameOfPatient = request.getParameter("NameOfPatient");%>
 <% String NameOfApplicant = request.getParameter("NameOfPatient");%>
 <% String Natureofillness = request.getParameter("Natureofillness");%>
 <% String DateOfAdmission = request.getParameter("DateOfAdmission");%>

  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		var NameOfPatient = document.InsuranceForm.NameOfPatient.value;
		var NameOfApplicant = document.InsuranceForm.NameOfApplicant.value;
		var WorkingAtCompany = document.InsuranceForm.WorkingAtCompany.value;
		var EmployeeID =document.InsuranceForm.EmployeeID.value;
		var RelationWithPatient = document.InsuranceForm.RelationWithPatient.value;
		var Natureofillness=document.InsuranceForm.Natureofillness.value;
		var DateOfAdmission = document.InsuranceForm.DateOfAdmission.value;
		var DateOfDischarge = document.InsuranceForm.DateOfDischarge.value;
		var PeriodofStayinHospital = document.InsuranceForm.PeriodofStayinHospital.value;
		var AmountClaimed = document.InsuranceForm.AmountClaimed.value;
		var Place = document.InsuranceForm.Place.value;
		var PolicyNumber = document.InsuranceForm.PolicyNumber.value;
		var ClaimNumber = document.InsuranceForm.ClaimNumber.value;
	var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
	var wpattern = /^([0-9]{1,20})$/;
	var ADpattern = /^([a-zA-Z0-9\_\. ]{4,20})$/;
	var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;
	var Ipattern = /^([a-zA-Z\_\. ]{1,25})$/;
	var Apattern = /^([0-9]{1,10})$/;

if(NameOfPatient==""){
	alert("NameOfPatient field is manadatory");
    return false;
	}
else
	if(!(Ipattern.test(NameOfApplicant))){
	alert("Invalid NameOfApplicant");
    return false;
	}
else
if(!(Ipattern.test(WorkingAtCompany))){
	alert("Invalid WorkingAtCompany");
    return false;
	}
else
if(!(Apattern.test(EmployeeID))){
	alert("Invalid EmployeeID");
    return false;
	}
else
	if(!(Ipattern.test(RelationWithPatient))){
	alert("Invalid RelationWithPatient");
    return false;
	}
else
	if(DateOfDischarge==""){
	alert("DateOfDischarge field is manadatory");
    return false;
	}
else
	if(!(Apattern.test(AmountClaimed))){
	alert("Invalid AmountClaimed");
    return false;
	}
else
	if(!(Ipattern.test(Place))){
	alert("Invalid Place");
    return false;
	}
else
	if(!(wpattern.test(PolicyNumber))){
	alert("Invalid PolicyNumber");
    return false;
	}
else
	if(!(Apattern.test(ClaimNumber))){
	alert("Invalid ClaimNumber");
    return false;
	}

	}
    function CalculatePeriod()
	{
		//alert("Hi");
		var DOA = document.InsuranceForm.DateOfAdmission.value;
		if(DOA==""){
			alert("Please select Date of Admission");
		}
		var DOD = document.InsuranceForm.DateOfDischarge.value;
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
					document.InsuranceForm.PeriodofStayinHospital.value = Period;
				}
				else
				{
					document.InsuranceForm.PeriodofStayinHospital.value = 1;
				}
			}
		else
		{
			alert("Date of Admission should not exceed Date of Discharge");
			document.InsuranceForm.DateOfDischarge.value='';
			document.InsuranceForm.PeriodofStayinHospital.value = '';

		}
	}
	//-->
	</SCRIPT>
	    <TITLE>New Insurance</TITLE>
	<script LANGUAGE="Javascript" SRC="images/calender.js"></script>
    <script language="Javascript" src="images/validate.js"></script>

  </HEAD>
    <jsp:include page="MultiLevelmenu.htm"/><br><br><br> 

  <body Class=SC>
	<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);

if((auth==1)||(auth==2)){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="InsuranceForm" onSubmit="return check()" action="NewInsurance1.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Insurance Form </TH>
	   </TR>
	  
       <TR class=row_even >
	   <TD>Name Of Patient *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfPatient" SIZE="20"  readonly><input type="button" value="Show InPatients" onclick="fnEmpPopUp('ShowInPatients.jsp',300,300)"></td>
	   </TR>
	
	   <TR class=row_odd >
	   <TD>Name Of Applicant *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfApplicant" SIZE="20" ></td>
	   </TR>

	   <TR class=row_even >
	   <TD>Working At Company *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="WorkingAtCompany" SIZE="20" ></TD>
	   </TR>
	   
	   <TR class=row_odd >
	   <TD>Employee ID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EmployeeID" SIZE="5" ></TD>
	   </TR>
	  
	   
	   <TR class=row_even >
	   <TD>Relation With Patient *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="RelationWithPatient" SIZE="20" ></TD>
	   </TR>


	   <TR class=row_odd >
	   <TD>Nature of illness *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Natureofillness" SIZE="20" ></TD>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Date Of Admission *</TD> <TD>
		<input type="date" size=20 id="DateOfAdmission" name="DateOfAdmission">   
   
		<!-- <input size=20 readonly id="DateOfAdmission" name="DateOfAdmission">
	 <img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" > -->
   	 </TD>
         </TR>

		<TR class=row_Odd >
	   <TD>Date Of Discharge *</TD> <TD>
		<input type="date" size=20 id="DateOfDischarge" name="DateOfDischarge" onchange="calculateNoOfDays(this)">   
  
		<!-- <input size=20 readonly id="DateOfDischarge" name="DateOfDischarge" >
	 <img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this);if(document.InsuranceForm.DateOfAdmission.value==''){alert('Please select Date of Admission');document.InsuranceForm.DateOfDischarge.value='';}else{ CalculatePeriod();}" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this);" > -->
   	 </TD>
         </TR>

	   <TR class=row_even >
	   <TD>Period of Stay in Hospital *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="PeriodofStayinHospital" ID="PeriodofStayinHospital" SIZE="20" readonly> days</TD>
	   </TR>
	   
	   <TR class=row_odd >
	   <TD>Amount Claimed *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="AmountClaimed" SIZE="20"></TD>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Place *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Place" SIZE="20"  ></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>Policy Number *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="PolicyNumber" SIZE="20"></TD>
	   </TR>

	   <TR class=row_even >
	   <TD>Claim Number *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ClaimNumber" SIZE="20"  ></TD>
	   </TR>

		<TR class=row_odd ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Submit" class="form-button"></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset" class="form-button"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   <script>
	   function calculateNoOfDays(DateOfDischarge){
		var date1 = new Date(DateOfDischarge.value);
		var date2 = new Date(document.getElementById('DateOfAdmission').value);
		var diffTime = Math.abs(date2 - date1);
		var diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
		document.getElementById('PeriodofStayinHospital').value = diffDays;
	   }

	//    var NoDays = (DateOfDischarge.getTime() -  DateOfAdmission.getTime())/(1000*60*60*24); 
   </script>
   </HTML>
<%
  }
  %>