<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.model.BatchTimings"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
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
                        <!--                        <div class="page-title">
                                                    <div class="title_left">
                                                        <h3>All Client Details </h3>                               
                        
                                                    </div>
                        
                                                    <div class="title_right">
                                                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control" placeholder="Search for...">
                                                                <span class="input-group-btn">
                                                                    <button class="btn btn-default" type="button">Go!</button>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Student Details </h2>   
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

                                        <%                                            if (session.getAttribute("i") != null) {
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
                                    </div>


                                    <div class="x_content">

                                        <div class="form-group">

                                            <!--                                                <div class=" col-md-3 col-sm-3 col-xs-12"></div>-->
                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                <select class="form-control search " id="Days" name="Days" >
                                                    <option value="">Select Day</option>

                                                    <option value="Monday">Monday</option>
                                                    <option value="Tuesday">Tuesday</option>
                                                    <option value="Wednesday">Wednesday</option>
                                                    <option value="Thursday">Thursday</option>
                                                    <option value="Friday">Friday</option>
                                                    <option value="Saturday">Saturday</option>
                                                    <option value="Sunday">Sunday</option>

                                                </select>

                                            </div>

                                            <input type="hidden" id="Branch" name="Branch"  value="<%=admin.getAdminId()%>">

                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                <select class="form-control search" id="Course" name="Course" >
                                                    <option value="">Select Course</option>
                                                    <%                                                                                List<Course> cs1 = new CourseDao().getAllCourse();
                                                        for (Course c : cs1) {

                                                    %>
                                                    <option value="<%=c.getCourseName()%>"><%=c.getCourseName()%></option>
                                                    <%
                                                        }%>

                                                </select>

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                <select class="form-control search" id="BatchTime" name="BatchTime" >
                                                    <option value="">-Select Batch Timings-</option> 
                                                    <%

                                                        List<BatchTime> batch = new BatchTimeDa0().getAllBatchTimeByGroup();

                                                        for (BatchTime c12 : batch) {
                                                            if (c12.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                    %>
                                                    <option value="<%=c12.getBatchTiming()%>"><%=c12.getBatchTiming()%></option> 
                                                    <%}
                                                        }
                                                    %>
                                                </select>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12 ">
                                        <div class="x_panel" id="output5">

                                            <div class="x_content"  >

                                                <table id="datatable-buttons" class="table table-striped table-bordered ">
                                                    <thead>
                                                        <tr>

                                                            <th class="table_center">Sr No</th>

                                                            <th class="table_center">Name</th>

                                                            <th class="table_center">Mobile No.</th>

                                                            <th class="table_center">Course</th>
                                                            <th class="table_center">Days</th>
                                                            <th class="table_center">Batch Time</th>


                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <%
                                                            AdmissionDao cd = new AdmissionDao();

                                                            int i = 0;
                                                            List<Admission> cl = null;
                                                            cl = cd.getAllAdmission();
                                                            if (cl != null && cl.size() > 0) {
                                                                for (Admission p : cl) {

                                                                    boolean studentype = p.isShiftToOldStudent();

                                                                    if (studentype) {

                                                                        if (p.getAdminOfBranch().getAdminId() == admin.getAdminId()) {

                                                                            String Days = p.getDaysInWeek();
                                                                            String[] d = Days.split(" ");

                                                                            i++;


                                                        %>
                                                        <tr>
                                                            <td class="table_center"><%=i%></td> 
                                                            <td class="table_center"><%=p.getFirstName()%> </td>

                                                            <td class="table_center"><%=p.getContactNo()%></td> 

                                                            <td class="table_center"><%=p.getCourseName()%></td> 
                                                            <td class="table_center"><%=p.getDaysInWeek()%></td> 

                                                            <td class="table_center"><%=p.getBatchTimings()%></td> 




                                                        </tr> 
                                                        <%}
                                                                    }
                                                                }
                                                            }%>

                                                    </tbody>
                                                </table>
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
                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
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
        <!-- iCheck -->
        <script src="../vendors/iCheck/icheck.min.js"></script>
        <!-- Datatables -->
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

        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <style>

            .table_center{

                text-align: center;
            }

        </style>


        <script>

            $('#document').ready(function()
            {

                $('.search').change(function()
                {
                    var Branch = $("#Branch").val();
                    var Day = $("#Days").val();
                    var Course = $("#Course").val();
                    var BatchTime = $("#BatchTime").val();
                  
                    $.ajax({
                        url: "FilterStudentAjax.jsp",
                        type: "post",
                        data: {Day: Day, Branch: Branch, Course: Course, BatchTime: BatchTime},
                        success: function(response) {

                            $("#output5").html(response);
                           
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(textStatus, errorThrown);
                        }
                    });
                });
            });
        </script>

        <script type="text/javascript">




            $('.search22').change(function() {
                var Branch = $("#Branch").val();
                var Day = $("#Days").val();
                var Course = $("#Course").val();
                var BatchTime = $("#BatchTime").val();
//                    alert(Day);
                $.ajax({
                    url: "FilterStudentAjax.jsp",
                    type: "post",
                    data: {Day: Day, Branch: Branch, Course: Course, BatchTime: BatchTime},
                    success: function(response) {
//                              alert('success1');
                        $("#output5").html(response);
//                              alert('success2');
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }
                });
            }

            });





        </script>
        <%@ include file = "JavaScriptFile.jsp" %>
    </body>
</html>