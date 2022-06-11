<!--
	File : Logout.jsp
	

-->
<html>
<%@ page language="java" %>
<%@ page session="false" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<Head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript">

history.go(+1);


</SCRIPT>
<Title>Reports</Title>
<body Class=SC>
<font face="Times New Roman" color=blue >
<center>

<BR><BR><BR>

<h1 style="font-size:30px; color: rgb(55 145 229)">You have successfully logged out!</h1>
<BR><BR>

<!--Link to relogin again-->
<h1 class=Heading><U><A href="Login.html" target=_top style="font-size: 20px;color: rgb(55 145 229)">Click here</font></A></U> to login in again.</h1>
<br><br>

<h1 class=Heading>Have a nice day!</h1>




</center>
</font>
</body>
</html>