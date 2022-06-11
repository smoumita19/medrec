<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String NameOfPatient = request.getParameter("NameOfPatient");%>
 <% String DateOfAdmission = request.getParameter("DateOfAdmission");%>
<% String GaurdianName = request.getParameter("GaurdianName");%>
<% String RelationWithPatient = request.getParameter("RelationWithPatient");%>
<% String Natureofillness = request.getParameter("Natureofillness");%>
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
 /*   function CalculatePeriod()
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
	}*/
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

if(auth==1||auth==2){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="InsuranceForm" onSubmit="return check()" action="Insurance1.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> NewInsuranceForm </TH>
	   </TR>
	  
       <TR class=row_even >
	   <TD>NameOfPatient*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfPatient" SIZE="20" value="<%=NameOfPatient%>" readonly></TD>
	   </TR>
	
	   <TR class=row_odd >
	   <TD>NameOfApplicant *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfApplicant" SIZE="20" value="<%=GaurdianName%>" ></td>
	   </TR>

	   <TR class=row_even >
	   <TD>WorkingAtCompany *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="WorkingAtCompany" SIZE="20" ></TD>
	   </TR>
	   
	   <TR class=row_odd >
	   <TD>EmployeeID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EmployeeID" SIZE="20" ></TD>
	   </TR>
	  
	   
	   <TR class=row_even >
	   <TD>RelationWithPatient*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="RelationWithPatient" SIZE="20" value="<%=RelationWithPatient%>"></TD>
	   </TR>


	   <TR class=row_odd >
	   <TD>Natureofillness*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Natureofillness" SIZE="20" value="<%=Natureofillness%>"></TD>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>DateOfAdmission*</TD> <TD><input type="date" size=20 readonly id="DateOfAdmission" name="DateOfAdmission" value="<%=DateOfAdmission%>" >
	  	 </TD>
         </TR>

			   
	   <TR class=row_odd >
	   <TD>AmountClaimed*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="AmountClaimed" SIZE="20"></TD>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Place*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="Place" SIZE="20"  ></TD>
	   </TR>

	   <TR class=row_odd >
	   <TD>PolicyNumber*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="PolicyNumber" SIZE="20"></TD>
	   </TR>

	   <TR class=row_even >
	   <TD>Claim Number*</TD>
	   <TD><INPUT TYPE="TEXT" NAME="ClaimNumber" SIZE="20"  ></TD>
	   </TR>

		<TR class=row_even ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Submit" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset"></TD>
		</TR>

   </TABLE>
   </CENTER>

   </FORM>
   </BODY> 
   </HTML>
<%
  }
  %>