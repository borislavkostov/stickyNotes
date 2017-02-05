<%-- 
    Document   : BkStyNotes
    Created on : Feb 3, 2017, 6:35:47 PM
    Author     : templars1914
--%>

<%@page import="java.util.List"%>
<%@page import="MySQL.MySQLNoteStorage"%>
<%@page import="note.Note"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>*{
                margin:0;
                padding:0;
            }
            body{
                font-family:arial,sans-serif;
                font-size:100%;
                margin:1em;
                background:#666;
                color:#fff;
            }
            h2,p{
                font-size:100%;
                font-weight:normal;
            }
            ul,li{
                list-style:none;
            }
            ul{
                overflow:hidden;
                padding:3em;
            }
            ul li a{
                text-decoration:none;
                color:#000;
                background:#ffc;
                display:block;
                height:10em;
                width:10em;
                padding:1em;
                -moz-box-shadow:5px 5px 7px rgba(33,33,33,1);
                -webkit-box-shadow: 5px 5px 7px rgba(33,33,33,.7);
                box-shadow: 5px 5px 7px rgba(33,33,33,.7);
                -moz-transition:-moz-transform .15s linear;
                -o-transition:-o-transform .15s linear;
                -webkit-transition:-webkit-transform .15s linear;
            }
            ul li{
                margin:1em;
                float:left;
            }
            ul li h2{
                font-size:140%;
                font-weight:bold;
                padding-bottom:10px;
            }
            ul li p{
                font-family:"Reenie Beanie",arial,sans-serif;
                font-size:180%;
            }
            ul li a{
                -webkit-transform: rotate(-6deg);
                -o-transform: rotate(-6deg);
                -moz-transform:rotate(-6deg);
            }
            ul li:nth-child(even) a{
                -o-transform:rotate(4deg);
                -webkit-transform:rotate(4deg);
                -moz-transform:rotate(4deg);
                position:relative;
                top:5px;
                background:#cfc;
            }
            ul li:nth-child(3n) a{
                -o-transform:rotate(-3deg);
                -webkit-transform:rotate(-3deg);
                -moz-transform:rotate(-3deg);
                position:relative;
                top:-5px;
                background:#ccf;
            }
            ul li:nth-child(5n) a{
                -o-transform:rotate(5deg);
                -webkit-transform:rotate(5deg);
                -moz-transform:rotate(5deg);
                position:relative;
                top:-10px;
            }
            ul li a:hover,ul li a:focus{
                box-shadow:10px 10px 7px rgba(0,0,0,.7);
                -moz-box-shadow:10px 10px 7px rgba(0,0,0,.7);
                -webkit-box-shadow: 10px 10px 7px rgba(0,0,0,.7);
                -webkit-transform: scale(1.25);
                -moz-transform: scale(1.25);
                -o-transform: scale(1.25);
                position:relative;
                z-index:5;
            }
            ol{text-align:center;}
            ol li{display:inline;padding-right:1em;}
            ol li a{color:#fff;}</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <ul>
            <li>
                <a href="#">
                    <form action="AddNote.jsp">
                        <h2>Title:<input type="text" name="title" value="" /></h2>
                        <p><input type="text" name="description" value="" /></p>
                        <input type="submit" value="Add note" />
                    </form>
                </a>
            </li>
            <%
                String username = "";
                if (session.getAttribute("username") != null) {
                    username=session.getAttribute("username").toString();
                }
            %>
            <% String DBMS_CONN_STRING = "jdbc:mysql://localhost:3306/StickyNoteBK?useUnicode=true&characterEncoding=UTF-8";
                String DBMS_USERNAME = "root";
                String DBMS_PASSWORD = "173173";
                Class.forName("com.mysql.jdbc.Driver");
                MySQLNoteStorage ntStorage = new MySQLNoteStorage(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD);
                List<Note> notes = ntStorage.getNotes(username);
                for (Note note : notes) {
            %>
            <li>
                <a href="#">
                    <h2>Title:<%=note.getTitle()%></h2>
                    <p><%=note.getDescription()%></p>
                </a>
            </li>
            <%}%>
        </ul>
    </body>
</html>
