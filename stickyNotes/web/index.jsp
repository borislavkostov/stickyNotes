<%-- 
    Document   : index
    Created on : Jan 25, 2017, 5:27:27 PM
    Author     : templars1914
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="http://icons.iconarchive.com/icons/umar123/mantra-v2/32/Sticky-Notes-icon.png" />
        <style>body{ font-family:"Comic Sans MS", cursive, sans-serif}
            .page-bg{
                background:url('http://simpledeveloper.com/wp-content/uploads/2013/06/sticky-note-using-html5-web-storage.jpg');
                -webkit-filter: blur(5px);
                -moz-filter: blur(5px);
                -o-filter: blur(5px);
                -ms-filter: blur(5px);
                filter: blur(5px);
                position:fixed;
                width:100%;
                height:100%;
                top:0;
                left:0;
                z-index:-1;}
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
            .enterForm{width: auto;margin-right: auto;margin-left: 15px;margin-top: 10px}
            .regForm{width: auto;margin-right: auto;margin-left: 15px;margin-bottom: 5px}
            .enter{width: 280px;margin-left:45%;background-color: white;height: 130px;border-radius: 25px; }
            .header{margin-left: 45%;margin-top: 10%;color: whitesmoke;}

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body background="http://simpledeveloper.com/wp-content/uploads/2013/06/sticky-note-using-html5-web-storage.jpg">
       <h1 class="header">BK Sticky Notes</h1>
        <div class="enter">         
            <form class="enterForm" action="UsernameCheck.jsp">
                <%if (session.getAttribute("usernameError") != null) {%>
                <p>Enter valid username and password</p>
                <%}%>
                <label>Username</label></br>
                <input  type="text" name="Username" value="" /></br>
                <label>Password</label></br>
                <input type="password" name="password" value="" />
                <input class="myButton" type="submit" value="Login" />
            </form> 
            <form class="regForm" action="Registration.jsp">
                <input class="myButton" type="submit" value="Register" />
            </form>
        </div>
        <div class="page-bg">
        </div>
    </body>
</html>
