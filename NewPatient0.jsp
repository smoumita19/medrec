<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Patient</TITLE>
	<script LANGUAGE="Javascript" SRC="images/calender.js"></script>
    <script language="Javascript" src="images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		var frm = document.forms[0];
		var NameOfPatient = frm.NameOfPatient.value;
		var Age	= frm.Age.value;	
		var SexIndex=frm.Sex.options.selectedIndex;
		var Sex = frm.Sex.options[SexIndex].value;
		var OccupationIndex=frm.Occupation.options.selectedIndex;
		var Occupation = frm.Occupation.options[OccupationIndex].value;
		var ContactNumbers=frm.ContactNumbers.value;
		var Natureofillness=frm.Natureofillness.value;
		var DateOfAdmission = frm.DateOfAdmission.value;
		var AdmissionAsIndex=frm.AdmissionAs.options.selectedIndex;
		var AdmissionAs = frm.AdmissionAs.options[AdmissionAsIndex].value;
		var InsuranceIndex=frm.Insurance.options.selectedIndex;
		var Insurance = frm.Insurance.options[InsuranceIndex].value;
		var GaurdianName = frm.GaurdianName.value;
		var RelationWithPatient = frm.RelationWithPatient.value;
		var ReferedByDoctor = frm.ReferedByDoctor.value;
		var RoomID = frm.RoomID.value;
	var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
	var wpattern = /^([0-9]{1,3})$/;
	var ADpattern = /^([a-zA-Z0-9\_\. ]{4,20})$/;
	var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;
	var Ipattern = /^([a-zA-Z\_\. ]{1,25})$/;
	var Apattern = /^([0-9]{1,10})$/;
    var numpattern=/^([0-9\_\. ]{1,10})$/;

if(!(Npattern.test(NameOfPatient))){
	alert("Invalid NameOfPatient");
    return false;
	}
else
if(!(wpattern.test(Age))||(Age>200||Age<=0)){
	alert("Invalid Age");
    return false;
	}
else
if(SexIndex==""){
	alert("Sex field is manadatory");
    return false;
	}
else
if(OccupationIndex==""){
	alert("Occupation field is manadatory");
    return false;
	}
else
if(!(numpattern.test(ContactNumbers))){
	alert("Invalid ContactNumber");
    return false;
	}
else
if(!(Ipattern.test(Natureofillness))){
	alert("Invalid Natureofillness");
    return false;
	}
else
if(DateOfAdmission==""){
	alert("DateOfAdmission field is manadatory");
    return false;
	}
else
if(AdmissionAsIndex==""){
	alert("AdmissionAs field is manadatory");
    return false;
	}
else
if(InsuranceIndex==""){
	alert("Insurance field is manadatory");
    return false;
	}
else
if(!(Ipattern.test(GaurdianName))){
	alert("Invalid GaurdianName");
    return false;
	}
else
if(!(Ipattern.test(RelationWithPatient))){
	alert("Invalid RelationWithPatient");
    return false;
	}
else
if(!(Ipattern.test(ReferedByDoctor))){
	alert("Invalid ReferedByDoctor");
    return false;
	}
if(AdmissionAs=="InPatient"){
	if(RoomID==0||RoomID==""){
		alert("Please select room for admission as inpatient");
		frm.AdmissionAs.options.selectedIndex=0;
		return false;
	}
}
}

	function fnCheckAdmissionAs(S)
	{
		var NameOfPatient = document.AdmissionForm.NameOfPatient.value;
		var i = S.options.selectedIndex;
		var Value  = S.options[i].value;
		if(Value=="InPatient" && NameOfPatient!=null)
		{
			var URL = "ListEmptyRooms.jsp?NameOfPatient="+NameOfPatient;
			fnEmpPopUp(URL,350,350);
		}
		else
		{
			document.AdmissionForm.RoomID.value=0;
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

if(auth>0){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="AdmissionForm" onSubmit="return check()" action="NewPatient.jsp">
   <CENTER>
<!-- NameOfPatient  Age Sex Occupation ContactNumbers	Natureofillness DateOfAdmission	AdmissionAs Insurance GaurdianName RelationWithPatient ReferedByDoctor -->

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> Admission Form </TH>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Name Of Patient  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="NameOfPatient" SIZE="20" ></td>
	   </TR>

	     
	   <TR class=row_odd >
	   <TD>Age  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="Age" SIZE="10" > years</TD>
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Sex  <FONT COLOR="red">*</FONT></TD>
	    <TD><select name="Sex">
				<option value="---">---</option>	
				<option value="Male">Male</option>	   
				<option value="Female">Female</option>
			</select></TD>
	   
	   </TR>

	  
	   <TR class=row_odd >
	   <TD>Occupation  <FONT COLOR="red">*</FONT></TD>
	 <TD><select name="Occupation">
				<option value="---">---</option>	
				<option value="Working">Working</option>	   
				<option value="NotWorking">Not Working</option>
			</select></TD>
	   
	   </TR>

	   <TR class=row_even >
	   <TD>Contact Number (0-10 Digits) <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="ContactNumbers" SIZE="20" ></TD>
	   </TR>
	   
	   <TR class=row_odd >
	   <TD>Nature of illness <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="Natureofillness" SIZE="20" ></TD>
	   </TR>

	  
	   <TR class=row_even >
	   <TD>Date Of Admission <FONT COLOR="red">*</FONT></TD> <TD>
		<input type="date" size=20 id="DateOfAdmission" name="DateOfAdmission">
		<!-- <input size=20 readonly id="DateOfAdmission" name="DateOfAdmission">
	 <img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" > -->
   	 </TD>
         </TR>

	   <TR class=row_odd >
	   <TD>AdmissionAs  <FONT COLOR="red">*</FONT></TD>
		   <TD><select name="AdmissionAs" onchange="fnCheckAdmissionAs(this)">

				<option value="---">---</option>	
				<option value="InPatient">InPatient</option>	   
				<option value="OutPatient">OutPatient</option>
			</select></TD>
	   
	   </TR>
	  
	   <TR class=row_even >
	   <TD>Insurance  <FONT COLOR="red">*</FONT></TD>
	   <TD><select name="Insurance" onchange="var x=document.AdmissionForm.AdmissionAs.value; if(x=='OutPatient' && this.value=='Yes'){alert('Insurance cannot be claimed for out patients');this.value='No';}">
				<option value="---">---</option>	
				<option value="Yes">Yes</option>	   
				<option value="No">No</option>
			</select></TD>
	   
	   </TR>

 	   <TR class=row_odd >
	   <TD>GaurdianName  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="GaurdianName" SIZE="20" ></TD>
	   </TR>
	   <TR class=row_even >
	   <TD>Relation With Patient  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="RelationWithPatient" SIZE="20"  ></TD>
	   </TR>
	   <TR class=row_odd >
	   <TD>Refered By Doctor  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="ReferedByDoctor" SIZE="10"  readonly><input type="button" value="Show Doctors" onclick="fnEmpPopUp('ListAvailableDoctors.jsp',300,300)"></td>
	   </TR>
	   <TR class=row_odd style="display: none;">
		<TD>Doctor Id  <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="TEXT" NAME="DoctorID" SIZE="10"  readonly></td>
		</TR>

	  
	   <TR class=row_even >
	   <TD>RoomID  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="RoomID" SIZE="20"></TD>
	   </TR>

		<TR class=row_odd ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Add" class="form-button"></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset" class="form-button"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   <script>
	   	document.getElementById('DateOfAdmission').valueAsDate = new Date();
   </script>
   </HTML>
<%
  }
  %>