<%-- 
    Document   : Login
    Created on : Jul 12, 2024, 12:41:09 PM
    Author     : Admin
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String s1 = request.getParameter("name");
            String s2 = request.getParameter("pass");
            try
            {
                //database connectivity
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                 PreparedStatement pst = conn.prepareStatement(" select * from registration_22 where username=?");
                 pst.setString(1,s1);
                 ResultSet rs = pst.executeQuery();
                 if(rs.next())
                 {
                     //check for password
                     if(rs.getString(2).equals(s2))
                     {
                         out.print("Login Successful");
                     }
                     else
                     {
                         out.print("Wrong Password !!! Login Again");
                         %>
                         <jsp:include page="Login.html"></jsp:include>
                         <%
                     }
                     
                 }
                 else
                 {
                     out.print("User name doesn't exist. Please Register..");
                     %>
                        <jsp:include page="Register.html"></jsp:include>
                     <%
                 }
                
            }
            catch(Exception e)
            {
                out.print("Exception: "+e);
            }
            
        %>
    </body>
</html>
