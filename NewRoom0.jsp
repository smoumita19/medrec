<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
  <HTML>
  <HEAD>
  	<LINK href="styles.css" type="text/css" rel="stylesheet">

    <TITLE>New Room</TITLE>
	<script LANGUAGE="Javascript" SRC="images/calender.js"></script>
    <script language="Javascript" src="images/validate.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
		
		//var RoomID = document.NewRoomForm.RoomID.value;
		var CategoryIndex=document.NewRoomForm.Category.options.selectedIndex;
		var Category = document.NewRoomForm.Category.options[CategoryIndex].value;
		// var NoOfBeds =document.NewRoomForm.NoOfBeds.value;
		var ChargesPerDay = document.NewRoomForm.ChargesPerDay.value;	
		var VisitorsAllowedIndex=document.NewRoomForm.VisitorsAllowed.options.selectedIndex;
		var VisitorsAllowed = document.NewRoomForm.VisitorsAllowed.options[VisitorsAllowedIndex].value;
		var VisitingHours = document.NewRoomForm.VisitingHours.value;

	var pattern = /^([a-zA-Z0-9\_\. ]{1,15})$/;
	var wpattern = /^([0-9]{1,2})$/;
	var ADpattern = /^([a-zA-Z0-9\_\. ]{4,20})$/;
	var Npattern = /^([a-zA-Z\_\. ]{1,15})$/;
	var Ipattern = /^([a-zA-Z\_\. ]{1,25})$/;
	var Apattern = /^([0-9]{1,10})$/;


// if(RoomID==""){
// 	alert("Invalid RoomID");
//     return false;
// 	}
// else
if(CategoryIndex=="")
		{
		alert("Category field is mandatory");
		return false;
		}
	else
// if(!(wpattern.test(NoOfBeds))||(NoOfBeds>15)||NoOfBeds<=0){
// 	alert("Invalid NoOfBeds");
//     return false;
// 	}
// else
if(!(Apattern.test(ChargesPerDay))||ChargesPerDay<=0){
	alert("Invalid ChargesPerDay");
    return false;
	}
else

	if(VisitorsAllowedIndex=="")
		{
		alert("VisitorsAllowed field is mandatory");
		return false;
		}
	else
if((!(wpattern.test(VisitingHours)))||(VisitingHours < 10) || (VisitingHours > 14)){
	alert("Invalid VisitingHours");
    return false;
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

if((auth==1)||(auth==3)){
	%><H3 align=center><IMG SRC="images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	

  <FORM NAME="NewRoomForm" onSubmit="return check()" action="NewRoom1.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR class=row_title  ALIGN="center">
	   <TH COLSPAN="2"> New Room Form </TH>
	   </TR>
<!-- 	  
	   <TR class=row_even >
	   <TD>RoomID  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="RoomID" SIZE="20" ></td>
	   </TR> -->

	   <TR class=row_odd >
	   <TD>Category  <FONT COLOR="red">*</FONT></TD>
	   <TD><select name="Category">
				<option value="---">---</option>
				<option value="General">General</option>
				<option value="SpecialNonAC">SpecialNonAC</option>
				<option value="SpecialAC">SpecialAC</option>
				<option value="SuperSpecialAC">SuperSpecialAC</option>
				<option value="ICU">ICU</option>
			</select></TD>
	  
	   </TR>
	   
	   <!-- <TR class=row_even >
	   <TD>No Of Beds  <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="NoOfBeds" SIZE="5" ></TD>
	   </TR> -->
	  
	   <!-- <TR class=row_odd > -->
		<TR class=row_even >
	   <TD>Charges Per Day <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="ChargesPerDay" SIZE="20" ></TD>
	   </TR>
	   
	   <!-- <TR class=row_even > -->
		<TR class=row_odd >
	   <TD>Visitors Allowed  <FONT COLOR="red">*</FONT></TD>
	   <TD><select name="VisitorsAllowed">
				<option value="---">---</option>
				<option value="1Member">1Member</option>
				<option value="2Members">2Members</option>
				<option value="3Members">3Members</option>
				<option value="4Members">4Members</option>
			</select></TD>

	   </TR>

	   <!-- <TR class=row_odd > -->
	   <TR class=row_even >
	   <TD>Visiting Period (Between 10 to 14) <FONT COLOR="red">*</FONT></TD>
	   <TD><INPUT TYPE="TEXT" NAME="VisitingHours" SIZE="20" > hours</TD>
	   </TR>

		<TR class=row_odd ALIGN="CENTER">
			<TD><INPUT TYPE="SUBMIT" VALUE="Submit" class="form-button"></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset" class="form-button"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   </HTML>
<%
  }
  %>