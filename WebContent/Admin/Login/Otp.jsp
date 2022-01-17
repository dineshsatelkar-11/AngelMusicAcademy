<%@page import="com.accede.angel.admin.model.Admin"%>
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
    <body>
        <!--header start here-->
        <div class="header">
            <div class="header-main">
                <h1> OTP Form</h1>
                <div class="header-bottom">
                    <div class="header-right w3agile">

                        <div class="header-left-bottom agileinfo">
                            <%

                                Admin admin = (Admin) session.getAttribute("BRANCH_ADMIN");
                                String adminPassword = (String) session.getAttribute("adminPassword");
                             

                            %>

                            <form action="../../AdminLoginServlet" method="post">
                                <input type="hidden"  value="<%=admin.getAdminEmail() %>" name="email" />
                                <input type="hidden"  value="<%=adminPassword %>" name="password" />
                                <input type="text"  id="otp" placeholder="Enter OTP Here" name="otp" onkeypress='return event.charCode >= 48 && event.charCode <= 57' />
                                <div class="remember">

                                  
                                    <div class="clear"> </div>
                                </div>

                                <input type="submit" value="Submit">
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
    </body>
</html>