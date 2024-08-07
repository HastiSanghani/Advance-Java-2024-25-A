<%-- 
    Document   : update
    Created on : Jul 31, 2024, 11:50:21 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource"  driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root" />
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from productdetails_25 where pid=?;
            <sql:param value="${param.pid}"/>
        </sql:query>
                <form action="updateDB.jsp" method="post">
                    <table border="1" width="40%">
                        <tr>
                            <th>Product Name:</th> 
                             <th>Product Quantity:</th>
                        </tr>
                        <c:forEach var="row" items="${result.rows}">
                            <tr>
                                <td>
                                    <input type="hidden" name="pid" value="${param.pid}"/> 
                                    <input type="text" name="pname" value="${row.pname}"/>
                                </td>
                                <td><input type="text" name="quantity" value="${row.quantity}"/></td>
                                <td><input type="submit" value="Update"></tr>
                            </tr>
                        </c:forEach>
                    </table>
                    <a href="index.html">Go back</a>
                </form>    
                                
    </body>
</html>
