<%-- 
    Document   : BkStyNotes
    Created on : Feb 3, 2017, 6:35:47 PM
    Author     : templars1914
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            Cookie cookie = null;
            Cookie[] cookies = null;
            // Get an array of Cookies associated with this domain
            cookies = request.getCookies();

            String username = "";
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                cookie = cookies[i];
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        %>
        <h1>Hello World!<%=username%> </h1>
    </body>
</html>
