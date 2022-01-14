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
    </head>

    <body class="login">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>

            <div class="login_wrapper">
                <div class="animate form login_form">
                    <section class="login_content">
                        <form action="../../AdminLoginServlet1" method="post">
                           
                            <h1>Login Form</h1>
                            <%                                          if (session.getAttribute("i") != null) {
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


                            <div>
                                <input name="email" type="text" class="form-control" placeholder="Username" required="" />
                            </div>
                            <div>
                                <input name="password" type="password" class="form-control" placeholder="Password" required="" />
                            </div>
                            <div>
                                <input type="submit" value="Login" class="btn btn-default submit">
                                <a class="reset_pass" href="#">Lost your password?</a>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">


                                <div class="clearfix"></div>
                                <br />
 
                                <div>
                                    <h1><i class="fa fa-paw"></i>Angel Music Academy</h1>
                                    <!--<p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>-->
                                </div>
                            </div>
                        </form>
                    </section>
                </div>


            </div>
        </div>
                                
<script>
    var close = document.getElementsByClassName("closebtn");
    var i;

    for (i = 0; i < close.length; i++) {
        close[i].onclick = function() {
            var div = this.parentElement;
            div.style.opacity = "0";
            setTimeout(function() {
                div.style.display = "none";
            }, 600);
        }
    }
</script>
    </body>
</html>
