
<% String Userid=(String)session.getAttribute("userr");%>

<HTML>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body Class=SC>
<!-- To display Menu --Start -->
<!-- <script language="JavaScript1.2" src="coolfunctions.js"></script>
<script language="JavaScript1.2" src="coolmenus.js"></script> -->
<!-- To display Menu --End -->
<center>

<BR><BR><br>
<FONT FACE="Century Gothic">



<FONT size="2" color="blue" FACE="Century Gothic">

<FORM NAME="LOGIN" ACTION="ChangePassword.jsp" METHOD="POST">


<TABLE Border=0 align=center>
<TR class=row_title ALIGN="center">
	   <TH COLSPAN="2"> Enter new password</TH>
</TR>

<TR class=row_even>
	<TD>User Id</TD>
	<TD><input TYPE=text name=uid size="8" value="<%=Userid%>" readonly></TD>
</TR>
<TR class=row_odd>
	<TD>Old Password</TD>
	<TD><input TYPE=password name=pwd size="8"  maxlength="8"></TD>
</TR>
<TR class=row_even>
	<TD>New Password </TD>
	<TD><input TYPE=password name=newpwd size="8"  maxlength="8"> max 8 digits</TD>
</TR>
<TR class=row_odd>
	<TD><INPUT TYPE=submit name=submit value="Submit" class="form-button" >
</TD>
	<TD><INPUT TYPE=reset name=resett value="Reset" class="form-button" > 
</TD>
</TR>
</TABLE>


</FORM>
<div style="margin: 20px;">
	<A HREF="./Report.jsp">BACK</A>
</div>
</BODY>
</HTML>




