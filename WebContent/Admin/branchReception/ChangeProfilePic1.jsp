

<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.model.SmsModel"%>
<%@page import="com.accede.angel.admin.dao.SmsDao"%>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>


    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->
                <!-- page content -->
                <div  role="main">
                    <div class="">


                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>upload Image <small>different form elements</small></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <br />

                                        <%   
                                            int id = Integer.parseInt(request.getParameter("accountid"));
                                              AdmissionDao ad = new AdmissionDao();
            CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();

                                            CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(id);
                                            Admission a = ad.getAdmissionByAccount(CustomerAccount);
                                        %>

 <div class="item form-group smsport">

                                            <div class="row form-group">
                                              <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <!--                          <button class="btn btn-primary" type="button">Cancel</button>
                                                                          <button class="btn btn-primary" type="reset">Reset</button>-->
                                                <div class="col-md-4 " >
                                                    <button id="snap" class="sexyButton">Snap Photo</button></div>
                                                     <div class="col-md-8 " >
                                                         <div class="col-md-6 " >
                                                     <button  id="captureimage" class="btn btn-success sumittt1">Confirm Photo</button> </div>
                                                <div class="col-md-6 " >       <form class="form-horizontal form-label-left"  action="../../UpdateProfileByCamera"  method="post">
                                                    <input type="hidden" id="studentid" value="<%=a.getAdmissionId() %>" name="studentid">
                                                  
                                                  <input type="submit" value="Submit" class="btn btn-success sumittt">   </form> </div>
                                                     </div>
                                            </div>
                                        </div>
                                               
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 " >
                                                  <video id="video" width="640" height="480" autoplay></video>
                                                </div>
                                                <div class="col-md-6 " >
                                                    <canvas id="canvas" width="640" height="480"></canvas>

	<script>

		// Put event listeners into place
		window.addEventListener("DOMContentLoaded", function() {
			// Grab elements, create settings, etc.
            var canvas = document.getElementById('canvas');
            var context = canvas.getContext('2d');
            var video = document.getElementById('video');
            var mediaConfig =  { video: true };
            var errBack = function(e) {
            	console.log('An error has occurred!', e)
            };

			// Put video listeners into place
            if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
                navigator.mediaDevices.getUserMedia(mediaConfig).then(function(stream) {
					//video.src = window.URL.createObjectURL(stream);
					video.srcObject = stream;
                    video.play();
                });
            }

            /* Legacy code below! */
            else if(navigator.getUserMedia) { // Standard
				navigator.getUserMedia(mediaConfig, function(stream) {
					video.src = stream;
					video.play();
				}, errBack);
			} else if(navigator.webkitGetUserMedia) { // WebKit-prefixed
				navigator.webkitGetUserMedia(mediaConfig, function(stream){
					video.src = window.webkitURL.createObjectURL(stream);
					video.play();
				}, errBack);
			} else if(navigator.mozGetUserMedia) { // Mozilla-prefixed
				navigator.mozGetUserMedia(mediaConfig, function(stream){
					video.src = window.URL.createObjectURL(stream);
					video.play();
				}, errBack);
			}

			// Trigger photo take
			document.getElementById('snap').addEventListener('click', function() {
				context.drawImage(video, 0, 0, 640, 480);
                                  $(".sumittt1").show();
			});
		}, false);

	</script>


                                                </div>








                                            </div>
                                        </div>


                                       









                                       

                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>

                <!-- /page content -->


                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>

        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap-wysiwyg -->
        <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
        <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
        <script src="../vendors/google-code-prettify/src/prettify.js"></script>
        <!-- jQuery Tags Input -->
        <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
        <!-- Switchery -->
        <script src="../vendors/switchery/dist/switchery.min.js"></script>
        <!-- Select2 -->
        <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
        <!-- Parsley -->
        <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
        <!-- Autosize -->
        <script src="../vendors/autosize/dist/autosize.min.js"></script>
        <!-- jQuery autocomplete -->
        <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
        <!-- starrr -->
        <script src="../vendors/starrr/dist/starrr.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <script type="text/javascript">
                                                        $(document).ready(function() {
//                     alert('fsdfsdf');
                                                            $(".sumittt").hide();
                                                            $(".sumittt1").hide();
                                                            $('#captureimage').click(function() {
//  alert('fsdfsdf');
                                                                $(".sumittt").hide();
                                                                var dataURL = canvas.toDataURL("image/png");
                                                                formdata = dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
                                                                $.ajax({
                                                                    url: '../../signupcanvasdopost',
                                                                    type: 'POST',
                                                                    data: formdata,
                                                                    processData: false,
                                                                    contentType: "text/html",
                                                                    success: function(data) {
                                                                        $(".sumittt").show();
                                                                    }
                                                                });
                                                            });


                                                        });
        </script>


        <script type="text/javascript">
            $(document).ready(function() {







            });
        </script>

        <script type="text/javascript">
            $('#document').ready(function() {

            });
        </script>
    </body>
</html>
