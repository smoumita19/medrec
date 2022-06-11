<HTML>

    <%@ page language="java" %>
    <%@ page session="true" %>
    <%@ page import="java.util.*" %>
    <head>
    <SCRIPT LANGUAGE="JavaScript">
    <!--
    history.go(+1);
    
    //-->
    </SCRIPT>
        <LINK href="styles.css" type="text/css" rel="stylesheet">
    
    </head>
    <BODY CLASS=SC onload="document.LOGIN.uid.focus();">
    <center>
    <BR><BR>
    <FONT FACE="Century Gothic">
    
    
    <!--Declaration of varaibles-->
    
    <%! String errormsg ;%>
    <%! String disluserid ;%>
    <%! String dislpwd ;%>
    
        
    
    <% 
       /*Retreiving user id and password*/
    
        disluserid = request.getParameter("uid");
        if(disluserid == null)
        disluserid = "";
        dislpwd = request.getParameter("pwd");
        if(dislpwd == null)
        dislpwd = "";
    
    %>
    
    <!--Retrieve the error from request and display on screen-->
    
    <%  errormsg = request.getParameter("error") ;
        //System.out.println("errormsg = "+errormsg);
        if (errormsg == null)
        {
            //System.out.println("Error messages was null so clearing it..");
            errormsg = " ";
        }
        if(errormsg.equals("blankfields"))
        {
          %>
           <FONT COLOR="Red">
           Both the fields are Mandatory.Please fill up both fields.<BR><BR>
          <%
        }  
        if(errormsg.equals("invalid"))
        {
          %>
            <FONT COLOR="Red">
            Invalid Username and/or Password. Please re-enter. <BR><BR>
            <%
        } 
    %>
    
    <%-- ***** SIGNUP SCREEN ***** --%>
    <style>
    
    
    
    </style>
    <div class="login-div">
      <table width="100%">
        <tr>
          <!-- <th align=left><font size="-2" color="" face="verdana">V&nbsp;1.0</font></th> -->
          <th align=center><img src="./images/logo-3.png" border=0 alt=""></th>
        </tr>
        </table>
    
      <FORM NAME="LOGIN" ACTION="Entry.jsp" METHOD="POST" >
    
      <FONT COLOR="black" >
        <h1>
          Signup as Admin!
        </h1>
      <BR><BR>
      &nbsp;&nbsp;&nbsp;&nbsp;
    
      Userid   :&nbsp;<input TYPE=text id = "usr" name=uid size="8" maxlength="8" class="form-group"> <BR><BR>
      Password : <input TYPE=password name=pwd size="8"  maxlength="8" class="form-group"><BR><BR>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
      <BR>
      <INPUT TYPE=submit name=submit value="Sign-Up" class="form-button">
      <INPUT TYPE=reset name=resett value="Reset" class="form-button"> 
    
    
      </center>
    
      </FORM>
      <div class="signup-div text-center">
        <br><br><br><br>
        Already have an account? <br><br>
         <A href="./Login.jsp">LOGIN!</A> 
      </div>
    </div>
    </BODY>
    </HTML>
    