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
        <%Cookie ck[] = request.getCookies();%>
        <h1>Hello World!<%=ck[0].getComment()%></h1>
    </body>
</html>
