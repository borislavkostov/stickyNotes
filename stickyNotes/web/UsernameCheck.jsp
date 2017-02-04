<%-- 
    Document   : UsernameCheck
    Created on : Jan 25, 2017, 5:28:30 PM
    Author     : templars1914
--%>
<%@page import="contracts.userStorage"%>
<%@page import="MySQL.MySQLUserStorage"%>
<%@page import="user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%User user1 = new User(request.getParameter("Username"), request.getParameter("password"));
    String DBMS_CONN_STRING = "jdbc:mysql://localhost:3306/StickyNoteBK?useUnicode=true&characterEncoding=UTF-8";
    String DBMS_USERNAME = "root";
    String DBMS_PASSWORD = "173173";
    Class.forName("com.mysql.jdbc.Driver");
    userStorage userStorage = new MySQLUserStorage(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD);
    User user = userStorage.checkUser(user1);
    System.out.println("USERNAME IS "+user1.getUsername());
    if (user.getUsername()!=null) {
        Cookie ck = new Cookie("username", user.getUsername());
        String username = user.getUsername();
        ck.setComment(username);
        response.addCookie(ck);
        response.sendRedirect("BkStyNotes.jsp");
    } else {
        //response.sendError(1,"Enter valid username password");
        session.setAttribute("usernameError", "Error");
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checking user</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
