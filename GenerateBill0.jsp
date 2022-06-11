<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% String NameOfPatient = request.getParameter("NameOfPatient");%>
 <% String PatientID = request.getParameter("PatientID");%>
 <% String PeriodofStayinHospital = request.getParameter("PeriodofStayinHospital");%>
 <% String RoomID = request.getParameter("RoomID");%>
 <% String ReferedByDoctor = request.getParameter("ReferedByDoctor");%>
 <% String Insurance = request.getParameter("Insurance");%>

<HTML>
<HEAD>
		  <script LANGUAGE="Javascript" SRC="images/validate.js"></script>
		  <LINK href="styles.css" type="text/css" rel="stylesheet">
	 	  <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	      <script LANGUAGE="Javascript" SRC="">

		
	

	</script>
	
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<Body class=SC><%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=0){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>
<H2 align=center>Add BillDetails</H2>
<FORM Action="GenerateBill1.jsp" onsubmit="return validate()">
<CENTER>	
   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2">Add BillDetails</TH>
	   </TR>

	    <TR class=row_even><td>NameOfPatient
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='NameOfPatient' value='<%=NameOfPatient%> 'readonly>
		</TR>

		<TR class=row_even style="display: none;"><td>PatientID
			<FONT COLOR="red">*</td>
			<TD><Input type=text name='PatientID' value='<%=PatientID%> 'readonly>
		</TR>

		
		
		<TR class=row_odd><td>AdmissionFee
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='AdmissionFee' value=''>
		</TR>
		
		<TR class=row_even><td>PeriodofStayinHospital
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='PeriodofStayinHospital' value='<%=PeriodofStayinHospital%>' readonly>
		</TR>
		
		<TR class=row_odd><td>RoomID
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='RoomID' value='<%=RoomID%>' readonly>
		</TR>
		
			
		<TR class=row_even><td>RoomRent
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='RoomRent' value=''size=7 readonly ><input type="button" ID='Item' value="GetRentDetails" onclick="fnRoomDetails()" >PerDay
		</TR>
		
		
		<TR class=row_odd><td>ReferedByDoctor
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='ReferedByDoctor' value='<%=ReferedByDoctor%>' readonly>
		</TR>

		<TR class=row_even><td>DoctorFee
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='DoctorFee' value=''size=7 readonly ><input type="button" ID='Item' value="GetFeeDetails" onclick="fnDoctorDetails()" >PerDay
		</TR>
		
		<Input type=hidden name='Insurance' value='<%=Insurance%>' size=7 readonly >
		
		<TR class=row_odd><td>TotalCharge
		<FONT COLOR="red">*</td>
		<TD><Input type=text name='TotalCharge' value='' readonly>
		</TR>

		<TR class=row_even>
		<TH><INPUT TYPE="submit" value='Submit'></TH>
		<TH><INPUT TYPE="reset" value='Clear' ></TH></TR>
</TABLE>
		<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>

</FORM>
</BODY>
<script>
	function fnRoomDetails()
			{
		var frm = document.forms[0];
		var RoomID = frm.RoomID.value;
		if (RoomID=='')
		{
			alert("Please Enter RoomID to Proceed");
		}else
		 {
			var URL = "ShowRoomDetails.jsp?RoomID="+RoomID;
		    //alert(RoomID);
			fnEmpPopUp(URL,300,400);
			}
		}
function fnDoctorDetails()
			{
		var frm = document.forms[0];
		var ReferedByDoctor = frm.ReferedByDoctor.value;
		if (ReferedByDoctor=='')
		{
			alert("Please Specify ReferedByDoctor name to Proceed");
		}else
				{var URL = "ShowDoctorDetails.jsp?ReferedByDoctor="+ReferedByDoctor;
			fnEmpPopUp(URL,300,400);
			}
		}
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function ChkNameField(F,T){
			var val = F.value;
			var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;

			if(Npattern.test(val)) 
			return true
				{alert("Please enter valid name for "+T);
			 	return false;}
		}
		function validate()
		{
			calcCharge();
			var frm = document.forms[0];
			if(ChkMandatoryField(frm.NameOfPatient,'NameOfPatient')==false) return false;
			if(ChkNameField(frm.NameOfPatient,'NameOfPatient')==false) return false;
			if(ChkMandatoryField(frm.AdmissionFee,'AdmissionFee')==false) return false;
			if(ChkNumField(frm.AdmissionFee,'AdmissionFee')==false) return false;
			if(ChkMandatoryField(frm.PeriodofStayinHospital,'PeriodofStayinHospital')==false) return false;
            if(ChkNumField(frm.PeriodofStayinHospital,'PeriodofStayinHospital')==false) return false;
			if(ChkMandatoryField(frm.RoomID,'RoomID')==false) return false;
			if(ChkNumField(frm.RoomID,'RoomID')==false) return false;
			if(ChkMandatoryField(frm.RoomRent,'RoomRent')==false) return false;
			if(ChkNumField(frm.RoomRent,'RoomRent')==false) return false;
			
			if(ChkMandatoryField(frm.ReferedByDoctor,'ReferedByDoctor')==false) return false;
			if(ChkNameField(frm.ReferedByDoctor,'ReferedByDoctor')==false) return false;
			if(ChkMandatoryField(frm.DoctorFee,'DoctorFee')==false) return false;
			if(ChkNumField(frm.DoctorFee,'DoctorFee')==false) return false;
			if(ChkMandatoryField(frm.TotalCharge,'TotalCharge')==false) return false;
			if(ChkNumField(frm.TotalCharge,'TotalCharge')==false) return false;

		}
	function calcCharge(){
			F = document.forms[0];

			AF = F.AdmissionFee.value;
			if (AF=='')
			{
			alert("Please Enter AdmissionFee to Proceed");
			}
			else
			{
			//alert(AF);
			PS= F.PeriodofStayinHospital.value;
			//alert(PS);
			DF=parseInt(F.DoctorFee.value);
			//alert(DF);
			RR=parseInt(F.RoomRent.value);
			//alert(RR);
			Chrg = parseFloat(AF)+parseFloat(PS*RR)+parseFloat(PS*DF);
			//alert("Charge"+Chrg);
			F.TotalCharge.value =Chrg;
			}
		}

</script>
<%
}
%>
