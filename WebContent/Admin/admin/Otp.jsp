<%@page import="com.accede.angel.admin.model.Admin"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Angel Music Academy </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="../vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>



<%
 
      
       Admin admin= (Admin) session.getAttribute("BRANCH_ADMIN");
       String adminPassword= (String) session.getAttribute("adminPassword");
 String ImgPath = admin.getImagename();
   System.out.println("ImgPath-"+ImgPath);
   
%>
      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content text-center">
              <form action="../../AdminLoginServlet" method="post">
              <h1>OTP Form</h1>
              <div>
                  <input name="email" type="hidden" value="<%=admin.getAdminEmail() %>" class="form-control" placeholder="Username" required="" />
              </div>
              <div>
                  <input name="password" type="hidden" value="<%=adminPassword %>" class="form-control" placeholder="Password" required="" />
              </div>
              
              <div>
                  <input name="otp" type="text" class="form-control priceup" placeholder="Enter Otp" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required="" />
              </div>
              <div class="text-center">
                  <input type="submit" value="Login" class=" text-center btn btn-default submit">
              
              </div>

              <div class="clearfix"></div>

              <div class="separator">
               

                <div class="clearfix"></div>
                <br />

                <div>
                  <p class="font-12 text-gray m-0 text-center">&copy; 2017 <span class="text-theme-colored"> Angel Music</span>. All rights reserved | Designed by <a href="http://accedesoftwaresolutions.com/" class="text-theme-colored"> Accede Software Solutions </a></p>
                  <!--<p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>-->
                </div>
              </div>
            </form>
          </section>
        </div>

      
      </div>
    </div>
                <script type="text/javascript">
            $('#document').ready(function() {
               

                $(".priceup").keypress(function(event) {
                    var inputCode = event.which;
                    var currentValue = $(this).val();
                    if (inputCode > 0 && (inputCode < 48 || inputCode > 57)) {
                        if (inputCode == 46) {
                            if (getCursorPosition(this) == 0 && currentValue.charAt(0) == '-')
                                return false;
                            if (currentValue.match(/[.]/))
                                return false;
                        }
                        else if (inputCode == 45) {
                            if (currentValue.charAt(0) == '-')
                                return false;
                            if (getCursorPosition(this) != 0)
                                return false;
                        }
                        else if (inputCode == 8)
                            return true;
                        else
                            return false;
                    }
                    else if (inputCode > 0 && (inputCode >= 48 && inputCode <= 57)) {
                        if (currentValue.charAt(0) == '-' && getCursorPosition(this) == 0)
                            return false;
                    }
                });
            });
        </script>
  </body>
</html>
