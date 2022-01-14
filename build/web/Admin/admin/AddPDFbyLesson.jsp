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
        $('#document').ready(function () {
            $('#branch_name').hide();
            $('#branch_Address').hide();
            $('#branch_Address1').hide();
            $('#branch_Address2').hide();
            $('#admin_Name').hide();
            //                alert("fdsjghb");
            $("#course").change(function (event) {
                //                       alert("fdsjghb");
                var course = $('#course').val();
                //                       alert("fdsjghb");
                $.get("Fetchnooflessonajax.jsp", {course: course}, function (data) {
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
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/adminSideBarFile.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <div class="page-title">
                            <div class="title_left">
                                <h3>PDF Lessons</h3>
                            </div>

                         
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Add PDF Lesson </h2>
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
                                        <form class="form-horizontal form-label-left"  enctype="multipart/form-data" action="../../AddLessonPDF" onsubmit="return validation(this)" method="post">

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
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Course</label>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <select class="form-control" id="course" name="course" style="width:326px;">
                                                        <option value="">-Select Course-</option> 
                                                        <%
                                                            List<Course> course = new CourseDao().getAllCourse();

                                                            for (Course i : course) {

                                                        %>
                                                        <option value="<%=i.getCourseId()%>"><%=i.getCourseName()%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div id="output11">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Lesson</label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <select class="form-control" id="lesson" name="lesson" style="width:326px;">
                                                            <option value="">-Select Lesson-</option> 

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Select PDF File <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="file"  name="file" id="PDFfile" required="" class="form-control">
                                                   <center > <span id="valid_msg" style="color:red"></span></center >

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
                         <div class="row" id="tablefetch">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                        <div class="x_content" id="output11">
                            <!--                                        <p class="text-muted font-13 m-b-30">
                                                                        The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                    </p>-->


                          <table id="datatable" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th class="table_center">Sr No</th>
                                        <th class="table_center">Course Name </th>
                                        <th class="table_center">Lesson No </th>

                                        <th class="table_center">PDF Name</th>
                                        <th class="table_center">Download</th>


                                    </tr>
                                </thead>
                                <tbody>




                                    <%                LessonDao ld = new LessonDao();
                                        LessonPdf lf = new LessonPdf();
                                        List<LessonPdf> lessons = ld.getAllLessonPdf();

                                        int i = 0;
                                        for (LessonPdf l : lessons) {

                                            i++;

                                            Course cr = new CourseDao().getCourseBylongID(l.getCourseid());
                                    %>
                                    <tr class="odd gradeX">
                                        <td class="table_center"><%=i%> </td>
                                        <td class="table_center"><%=cr.getCourseName()%> </td>
                                        <td class="table_center"><%=l.getLessonno()%> </td>
                                        <td class="table_center"> <%=l.getPdfname()%></td>

                                        <td>
                                            <form action="DownloadPDF1.jsp" method="post">
                                                <button type="submit" name="asd" value="<%=l.getLessonid()%>" id="asd" class="btn btn-primary btn-sm">Download</button>
                                            </form></td>

                                    </tr>
                                    <%
                                        }
                                    %>
                                    <!--                                            <tr class="even gradeC">
                                                                                <td>Trident</td>
                                                                                <td >5</td>
                                                                                <td> <textarea class="form-control" style="width: 100%" rows="2"></textarea></td>
                                                                                
                                                                                 <td> <button class="btn btn-primary btn-sm">Comment</button></td>
                                                                            </tr>-->

                                </tbody>
                            </table>

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