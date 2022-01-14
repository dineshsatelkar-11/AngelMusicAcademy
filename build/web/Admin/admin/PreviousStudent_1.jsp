<%@page import="com.accede.angel.admin.model.LessonPdf"%>
<%@page import="com.accede.angel.admin.dao.LessonDao"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.model.StudentAccount"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.EnquiryDetail"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <script src="../production/js/Alertajax.js" type="text/javascript"></script>

    <script type="text/javascript">



        function valid()
        {

            var rollno = /^[0-9]*$/;
            // var phoneno = /^\d{10}$/;
            var letters = /^[A-Za-z]+$/;


            document.getElementById("Upload_file").innerHTML = "";

            var nme = document.getElementById("uploadFile");


            if (nme.value.length < 4) {
                document.getElementById("Upload_file").innerHTML = "Must Select any of your photo for upload!";

                nme.focus();
                return false;
            }
            else
            {
                return true;
            }





        }



        function validation(thisform)
        {

            with (thisform)
            {
                if (validateFileExtension(file, "valid_msg", "PDF File  only allowed!",
                        new Array("jpg", "wmv", "ogg", "avi", "mov", "webm", "flv", "vob", "ogv", "gif", "gifv", "3gp", "mpeg", "jpeg", "gif", "png", "doc", "docx", "xls", "xlsx", "ppt", "txt", "mp4")) == false)
                {
                    return false;

                }
                if (validateFileSize(file, 20000000, "valid_msg", "PDF size should be less than 30MB !") == false)
                {
                    return false;
                }
            }
        }
        function validateFileExtension(component, msg_id, msg, extns)
        {

            var flag = 0;
            with (component)
            {
                var ext = value.substring(value.lastIndexOf('.') + 1);


                for (i = 0; i < extns.length; i++)
                {


                    if (ext == extns[i])
                    {

                        flag = 0;

                        break;
                    }
                    else
                    {
                        flag = 1;
                    }
                }

                if (flag == 0)
                {

                    document.getElementById(msg_id).innerHTML = msg;
                    component.value = "";
                    component.style.backgroundColor = "#eab1b1";
                    component.style.border = "thin solid #000000";
                    component.focus();
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }



        function validateFileSize(component, maxSize, msg_id, msg)
        {
            if (navigator.appName == "Microsoft Internet Explorer")
            {
                if (component.value)
                {
                    var oas = new ActiveXObject("Scripting.FileSystemObject");
                    var e = oas.getFile(component.value);
                    var size = e.size;
                }
            }
            else
            {
                if (component.files[0] != undefined)
                {
                    size = component.files[0].size;
                }
            }
            if (size != undefined && size > maxSize)
            {

                document.getElementById(msg_id).innerHTML = msg;
                component.value = "";
                component.style.backgroundColor = "#eab1b1";
                component.style.border = "thin solid #000000";
                component.focus();

                return false;



            }
            else
            {
                return true;
            }
        }
    </script>

    <script type="text/javascript">
        $('#document').ready(function() {
            $('#branch_name').hide();
            $('#branch_Address').hide();
            $('#branch_Address1').hide();
            $('#branch_Address2').hide();
            $('#admin_Name').hide();
            //                alert("fdsjghb");
            $("#course").change(function(event) {
                //                       alert("fdsjghb");
                var course = $('#course').val();
                //                       alert("fdsjghb");
                $.get("Fetchnooflessonajax.jsp", {course: course}, function(data) {
                    //                           alert('sucess');
                    $('#output11').html(data);
                });
            });


        });
    </script>
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
              
                    <%@ include file = "../comman_files/adminSideBarFile.jsp" %>
          

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                    <div class="">

                        <div class="page-title">
                            <div class="title_left">
                                <h3>Old Student</h3>
                            </div>


                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Add Previous Student <small> </small></h2>
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

                                        <form class="form-horizontal form-label-left"   action="../../PreviousStudentServlet"  method="post">

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
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Student Name</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" placeholder="Student Name"  onkeypress="return alpha(event)" id="name" name="name" class="form-control">

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Course</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <select class="form-control priceup" id="coursename" name="coursename">
                                                        <option >Select Course</option>
                                                        <%
                                                            List<Course> cs1 = new CourseDao().getAllCourse();
                                                            for (Course c : cs1) {

                                                        %>
                                                        <option value="<%=c.getCourseName()%>"><%=c.getCourseName()%></option>
                                                        <%}%>
                                                    </select>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Mobile Number</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="text" maxlength="10" onkeyup="checkLength(this)"  placeholder="  Mobile Number" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required="" id="mobilenumber" name="mobilenumber" class="form-control priceup">
                                                    <p id="errormsg" style="color:red" ></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Joining Date</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <input type="date" placeholder="Joining Date" required="" id="joinigdate" name="joinigdate" class="form-control priceup">

                                                </div>
                                            </div>


                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                    <!--<button class="btn btn-primary"  type="button">Cancel</button>-->
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <input  type="submit" class="btn btn-success" value="Upload" >
                                                </div>
                                            </div>



                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                </div>
                <!-- /page content -->


                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>

                <script>
                    
                    
                    function checkLength(el) {
  if (el.value.length != 10) {
      document.getElementById("errormsg").innerHTML = "Mobile No must be exactly 10 Digit";
  
  }
  else
  {
    document.getElementById("errormsg").innerHTML = "";  
  }
}
                    
                </script>

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
        <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
        <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
        <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
        <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
        <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
        <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
        <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
        <script src="../vendors/jszip/dist/jszip.min.js"></script>
        <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
        <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

        <style>

            .table_center{

                text-align: center;
            }

        </style>


    </body>
</html>