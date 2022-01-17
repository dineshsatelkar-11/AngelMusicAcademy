<%-- 
    Document   : demotest
    Created on : Apr 18, 2018, 3:36:08 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--<h1>Hello World!</h1>-->
        <!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
<!--  <h2>Click to fill details</h2>-->
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Create Account</h4>
        </div>
        <div class="modal-body">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">First Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="name" name="fname" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
            <br>
<!--          <p>Some text in the modal.</p>-->
        </div>
          <div class="modal-body">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">Mobile No. <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="name" name="mobile" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
<!--          <p>Some text in the modal.</p>-->
        </div>
          <br>
          <div class="modal-body">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email-id">Email Id <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="middle-name"  name="email" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                        </div>
<!--          <p>Some text in the modal.</p>-->
        </div>
          <br>
          <div class="modal-body">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Address <span class="required">*</span>
                        </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="birthday" name="address" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text"></textarea>
                        </div>
              <br>
              <br>
              <br>
<!--          <p>Some text in the modal.</p>-->
        </div>
          <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
<!--                          <p><button class="btn btn-primary" type="button">Cancel</button></p>-->
<button type="submit" class="btn btn-success">Submit</button>
						  <button class="btn btn-primary" type="reset">Reset</button>
                          
                        </div>
                      </div>
          <br>
          <br>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</body>
</html>

    </body>
</html>
