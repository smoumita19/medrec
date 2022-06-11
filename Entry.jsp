<!--
     File : Validate.jsp

 -->

 <HTML>

    <%@ page language="java" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.lang.*" %>
    
    <%@ page session="true" %>
    <head>
        <LINK href="styles.css" type="text/css" rel="stylesheet">
    
    <head>
    <jsp:include page="MultiLevelmenu.htm"/><br><br><br>
    <body Class=SC>
    <%@ include file = "Header.html" %>
    <BR><BR><BR>
    <FONT FACE="Century Gothic">
    
    <%! String user_id; %>
    <%! String pass_word; %>
    <%! int flag=0;  %>
    
    
    <%
    
    /*Declaration of variables*/
    
    Connection con=null;
    Statement stmt=null;
    ResultSet rs=null;
    
    %>
    
    <%-- Retrieve parameters from Session --%>
    
    
    <% user_id = request.getParameter("uid");
       pass_word = request.getParameter("pwd");
      
      System.out.println("user_id = "+user_id+"\t"+"pass_word = "+pass_word);
    %>
    
    <%
    
    /*Checking for userid and password*/
    
    if(pass_word.equals("") || user_id.equals(""))
    {
        //System.out.println("Redirecting to login to fill all credentials..");
    %>
        <jsp:forward page="signup.jsp">
            <jsp:param name="error" value="blankfields" />
                 </jsp:forward>
    <%
    }
    %>
    
    
    <%
    try
    {
        /*Connection to MS Acess database is made with JDBC class one driver*/
        
    
    
        /*Connection to MYSQL*/
        String url = "jdbc:mysql://localhost:3306/meditracker";
        String username = "root";
        String password = "QQQ2348QQQ";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url,username,password);
        stmt =  con.createStatement();
    
    
        /*Retrives data from the database*/
        rs = stmt.executeQuery("SELECT * from Login ");
        System.out.println(rs);
  
	
        String Query = "Insert into Login values(\'"+user_id+"\',\'"+pass_word+"\','0')";
        System.out.println(Query);
        int rowsAffected=stmt.executeUpdate(Query);		
        System.out.println("Rows Affected = " + rowsAffected);
        //If data is updated then an entry is added to Activity log 
        if(rowsAffected==1)
        {
            
            %>
                <H3 align="center">Signed Up Successfully </H3>
            <BR>
            <center>
                <A href="signup.jsp"> Add another </A>
            </center>
            <%
        }
    
    }
    
    catch(Exception e)
    {
        System.out.println("Exception"+e);
    }
    %>
    
    
    
    
    
    </BODY>
    </HTML>
    