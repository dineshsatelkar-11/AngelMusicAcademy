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

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
              <form action="../../SaveSuperAdmin" method="post">
              <h1>Login Form</h1>
              <div>
                  <input name="adminEmail" type="text" class="form-control" placeholder="adminEmail" required="" />
              </div>
              <div>
                  <input name="adminMobileNo" type="text" class="form-control" placeholder="adminMobileNo" required="" />
              </div>
              <div>
                  <input name="adminName" type="text" class="form-control" placeholder="adminName" required="" />
              </div>
              <div>
                  <input name="adminPassword" type="text" class="form-control" placeholder="adminPassword" required="" />
              </div>
              <div>
                  <input name="otp" type="text" class="form-control" placeholder="otp" required="" />
              </div>
              <div>
                  <input name="receptionPassword" type="text" class="form-control" placeholder="receptionPassword" required="" />
              </div>
              <div>
                  <input type="submit" value="Login" class="btn btn-default submit">
                <a class="reset_pass" href="#">Lost your password?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>

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

        <div id="register" class="animate form registration_form">
          <section class="login_content">
              <form action="#" method="post">
              <h1>Create Account</h1>
              <div>
                <input type="email" class="form-control" id="adminEmail" name="adminEmail" placeholder="Email" required="" />
              </div>
              <div>
                <input type="password" class="form-control" id="adminPassword" name="adminPassword" placeholder="Password" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="index.html">Submit</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                    <input type="submit" class="btn btn-success" value="Submit">
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
                  <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
