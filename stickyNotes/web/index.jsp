<%-- 
    Document   : index
    Created on : Jan 25, 2017, 5:27:27 PM
    Author     : templars1914
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="UsernameCheck.jsp">
            <input type="text" name="Username" value="" />
            <input type="password" name="password" value="" />
            <input type="submit" value="Login" />
        </form> 
        <form action="Registration.jsp">
            <input type="submit" value="Register" />
        </form>
    </body>
</html>
