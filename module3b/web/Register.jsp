<%-- 
    Document   : Register
    Created on : Jul 12, 2024, 12:40:43 PM
    Author     : Admin
--%>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
            String s3 = request.getParameter("repass");
            String s4 = request.getParameter("email");
            String s5 = request.getParameter("country");
            
            if(s2.equals(s3)){
                //database connectivity code
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                    PreparedStatement pst = conn.prepareStatement("Insert into registration_22 values(?,?,?,?)");
                    pst.setString(1,s1);
                    pst.setString(2,s2);
                    pst.setString(3,s4);
                    pst.setString(4,s5);
                    
                    int rows = pst.executeUpdate();
                    if(rows==1)
                    {
                        out.println("Registration Successful!!!");
                    }
                    else
                    {
                        out.println("Registration Failed....! Try Again");
                     %>
                     <jsp:include page="Register.html"></jsp:include>
                     <%
                    }
                }
                catch(Exception e){
                    out.write("Exception"+e);
                }
            }
            else
            {
                out.print("Password Mismatch!!!");
                out.print("Re-Enter all Details again.");
                %>
                        <jsp:include page="Register.html"></jsp:include>   
            <%
            }
            %>
    </body>
</html>
