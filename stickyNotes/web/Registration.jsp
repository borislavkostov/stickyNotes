<%-- 
    Document   : Registration
    Created on : Feb 3, 2017, 5:57:26 PM
    Author     : templars1914
--%>

<%@page import="contracts.userStorage"%>
<%@page import="MySQL.MySQLUserStorage"%>
<%@page import="user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>

    <body>
        <%if (request.getParameter("username") != null && request.getParameter("password") != null) {
                String DBMS_CONN_STRING = "jdbc:mysql://localhost:3306/StickyNoteBK?useUnicode=true&characterEncoding=UTF-8";
                String DBMS_USERNAME = "root";
                String DBMS_PASSWORD = "173173";
                Class.forName("com.mysql.jdbc.Driver");
                userStorage userStorage = new MySQLUserStorage(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD);
                User user = new User(request.getParameter("username"), request.getParameter("password"));
                userStorage.newUser(user);
                response.sendRedirect("index.jsp");
            }%>
        <form action="Registration.jsp" method="POST">
            <p>Registration</p>
            <p>Username</p>
            <input type="text" name="username" value="" />
            <p>Password</p>
            <input type="password" name="password" value="" />
            <input type="submit" value="Register" />
        </form>
    </body>
</html>
