

<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.model.SmsModel"%>
<%@page import="com.accede.angel.admin.dao.SmsDao"%>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>


    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchAdminSideBar.jsp" %>
                </div>
                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->
                <!-- page content -->
                <div class="right_col" role="main">
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


                                        <%     long celloId = 0;
                                            if (session.getAttribute("printInvoiceID") != null) {
                                                celloId = (Long) session.getAttribute("printInvoiceID");

                                            }


                                        %>

                                        <div class="item form-group smsport">

                                            <div class="row form-group">
                                                <button onclick="snap();" id="captureimage">Capture Photo</button>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 " >
                                                    <video id="video"></video>
                                                </div>
                                                <div class="col-md-6 " >
                                                    <canvas id="canvas" name="image"></canvas><script type="text/javascript">
                                                        var video = document.getElementById('video');
                                                        var canvas = document.getElementById('canvas');
                                                        var context = canvas.getContext('2d');

                                                        navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia;

                                                        if (navigator.getUserMedia) {
                                                            navigator.getUserMedia({video: true}, streamWebCam, throwError);
                                                        }

                                                        function streamWebCam(stream) {
                                                            video.src = window.URL.createObjectURL(stream);
                                                            video.play();
                                                        }

                                                        function throwError(e) {
                                                            alert(e.name);
                                                        }

                                                        function snap() {
                                                            canvas.width = video.clientWidth;
                                                            canvas.height = video.clientHeight;
                                                            context.drawImage(video, 0, 0);
                                                        }









                                                    </script>


                                                </div>








                                            </div>
                                        </div>









                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <!--                          <button class="btn btn-primary" type="button">Cancel</button>
                                                                          <button class="btn btn-primary" type="reset">Reset</button>-->
                                                <form class="form-horizontal form-label-left"  action="../../UploadImage1"  method="post">
                                                    <input type="hidden" id="studentid" value="<%=celloId%>" name="studentid">
                                                    <input type="submit" value="Submit" class="btn btn-success sumittt"></form>
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
