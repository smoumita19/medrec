<!--
	File : Report.jsp
	Purpose : This jsp displays the home page containing link to change user's password
			
-->

<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
<Head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br>
<body Class=SC>

<Title>Reports</Title>
<font face="Times New ROman" color=blue >
<center>




<!--Retreiving user id using Session-->

<% String Userid=(String)session.getAttribute("userr");%>

<h1 class=report style="font-size:20pt;"><FONT COLOR="#330000">Welcome</FONT> <u><FONT  COLOR="#FF0000"><%=Userid%></FONT></u><FONT  COLOR="#330000"> to medRec!</FONT></h1><br>

<p align="right" class="text-center">
	<div  class="options-button">
		<A href="ChangePassword1.jsp">Change Password </A><BR>

	</div>
	
<%
/* Verifying wether the user is authorised to edit emp details
	if user is authorised he can edit the details if not he can
	only view the details */
	Integer EmpAuth = (Integer)session.getAttribute("auth");
	int Auth = EmpAuth.intValue();
	System.out.println(Auth);
			/*If authorised show Download data to Excel */
		if(Auth==0){
		%><div  class="options-button">
			<A href="AddUser.html">Add new user </A><BR> 

		  </div>
		<%
		}

%>

</p>

</center>
</font>

</body>
</html>