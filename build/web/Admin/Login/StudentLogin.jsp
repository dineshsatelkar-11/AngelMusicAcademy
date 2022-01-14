<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Angel Music Academy </title>
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- for-mobile-apps -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <meta name="keywords" content="Classy Login form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <!-- //for-mobile-apps -->
        <!--Google Fonts-->
        <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700' rel='stylesheet' type='text/css'>
    </head>
    <style>
        .alert {
            padding: 10px;
            background-color: #f44336;
            color: white;
            opacity: 1;
            transition: opacity 0.6s;
            margin-bottom: 15px;
        }

        .alert.success {background-color: #4CAF50;}
        .alert.info {background-color: #2196F3;}
        .alert.warning {background-color: #ff9800;}

        .closebtn {
            margin-left: 15px;
            color: white;
            font-weight: bold;
            float: right;
            font-size: 22px;
            line-height: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

        .closebtn:hover {
            color: black;
        }
    </style>
    <body>
        <!--header start here-->
        <div class="header">
            <div class="header-main">
                <h1> Login Form</h1>
                <% if (session.getAttribute("i") != null) {
                        int i = (Integer) session.getAttribute("i");
                        String msg = (String) session.getAttribute("msg");
                        if (i == 2) {

                            System.out.println("fdgsfd");
                %>
                <div class="alert">
                    <span class="closebtn">&times;</span>  
                    <strong>Danger!</strong> <%=msg%>
                </div>
                <%} else {%>
                <div class="alert success">
                    <span class="closebtn">&times;</span>  
                    <strong>Success!</strong><%=msg%> 
                </div>
                <%
                        }
                        session.removeAttribute("i");
                        session.removeAttribute("msg");
                    }%>
                <div class="header-bottom">
                    <div class="header-right w3agile">

                        <div class="header-left-bottom agileinfo">

                             <form action="../../StudentLogin" method="post">
                                 <input type="text"   name="email" placeholder="Enter user Name" />
                                <input type="password" placeholder="Enter Password"   name="password" />
                                <div class="remember">
                                   
                                    <div class="forgot">
                                        <h6><a href="StudentForgotPassword.jsp">Forgot Password?</a></h6>
                                    </div>
                                    <div class="clear"> </div>
                                </div>

                                <input type="submit" value="Login">
                            </form>	


                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--header end here-->
        <div class="copyright">
            <p class="font-12 text-gray m-0 text-center">&copy; 2017 <span class="text-theme-colored"> Angel Music</span>. All rights reserved | Designed by <a href="http://accedesoftwaresolutions.com/" class="text-theme-colored"> Accede Software Solutions </a></p>
        </div>
        <!--footer end here-->


        <script>
            var close = document.getElementsByClassName("closebtn");
            var i;

            for (i = 0; i < close.length; i++) {
                close[i].onclick = function () {
                    var div = this.parentElement;
                    div.style.opacity = "0";
                    setTimeout(function () {
                        div.style.display = "none";
                    }, 600);
                }
            }
        </script>
    </body>
</html>