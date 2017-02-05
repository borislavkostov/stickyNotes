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
            ol li a{color:#fff;}
            .inputN{border: #fff;color: #ffc}
            .myButton {
                -moz-box-shadow: 0px 10px 14px -7px #3e7327;
                -webkit-box-shadow: 0px 10px 14px -7px #3e7327;
                box-shadow: 0px 10px 14px -7px #3e7327;
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #77b55a), color-stop(1, #72b352));
                background:-moz-linear-gradient(top, #77b55a 5%, #72b352 100%);
                background:-webkit-linear-gradient(top, #77b55a 5%, #72b352 100%);
                background:-o-linear-gradient(top, #77b55a 5%, #72b352 100%);
                background:-ms-linear-gradient(top, #77b55a 5%, #72b352 100%);
                background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77b55a', endColorstr='#72b352',GradientType=0);
                background-color:#77b55a;
                -moz-border-radius:4px;
                -webkit-border-radius:4px;
                border-radius:4px;
                border:1px solid #4b8f29;
                display:inline-block;
                cursor:pointer;
                color:#ffffff;
                font-family:Arial;
                font-size:13px;
                font-weight:bold;
                padding:6px 12px;
                text-decoration:none;
                text-shadow:0px 1px 0px #5b8a3c;
            }
            .myButton:hover {
                background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #72b352), color-stop(1, #77b55a));
                background:-moz-linear-gradient(top, #72b352 5%, #77b55a 100%);
                background:-webkit-linear-gradient(top, #72b352 5%, #77b55a 100%);
                background:-o-linear-gradient(top, #72b352 5%, #77b55a 100%);
                background:-ms-linear-gradient(top, #72b352 5%, #77b55a 100%);
                background:linear-gradient(to bottom, #72b352 5%, #77b55a 100%);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#72b352', endColorstr='#77b55a',GradientType=0);
                background-color:#72b352;
            }
            .myButton:active {
                position:relative;
                top:1px;
            }
            .addN {
                background-color:#d8e0ac;
                -moz-border-radius:28px;
                -webkit-border-radius:28px;
                border-radius:28px;
                border:1px solid #e0ddd0;
                display:inline-block;
                cursor:pointer;
                color:#242424;
                font-family:Arial;
                font-size:17px;
                padding:16px 31px;
                text-decoration:none;
                text-shadow:0px 1px 0px #c7be5a;
            }
            .addN:hover {
                background-color:#d3d6af;
            }
            .addN:active {
                position:relative;
                top:1px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="http://icons.iconarchive.com/icons/umar123/mantra-v2/32/Sticky-Notes-icon.png" />
        <title></title>
    </head>
    <body>
        <form action="index.jsp" method="POST">
            <input type="hidden" name="logout" value="logout" />
            <input class="myButton" type="submit" value="LogOut" />
        </form>
        <ul>
            <li>
                <a href="#">
                    <form action="AddNote.jsp">
                        <h2>Title:<input class="inputN" type="text" name="title" value="" /></h2>
                        <p><input class="inputN" type="text" name="description" value="" /></p>
                        <input class="addN" type="submit" value="Add note" />
                    </form>
                </a>
            </li>
            <%
                String username = "";
                if (session.getAttribute("username") != null) {
                    username = session.getAttribute("username").toString();
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
