<%-- 
    Document   : AddNote
    Created on : Feb 4, 2017, 11:19:41 AM
    Author     : templars1914
--%>

<%@page import="note.Note"%>
<%@page import="MySQL.MySQLNoteStorage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<%if(request.getParameter("title")!=null){
    String DBMS_CONN_STRING = "jdbc:mysql://localhost:3306/StickyNoteBK?useUnicode=true&characterEncoding=UTF-8";
            String DBMS_USERNAME = "root";
            String DBMS_PASSWORD = "173173";
            Class.forName("com.mysql.jdbc.Driver");
            MySQLNoteStorage ntStorage = new MySQLNoteStorage(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD);
            ntStorage.postNote(new Note(request.getParameter("title"),request.getParameter("description")), username);
            response.sendRedirect("BkStyNotes.jsp");
}%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
