<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file = "../comman_files/AdminHeaderFile.jsp" %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/StudentSideBar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/StudentTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
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
                                        <h2>All Course Details </h2>   
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
                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        
                                           <form action="../../UpdateCourse" method="get">
                                            <%
                                            
                                            long id = student.getAdmissionId();
                                            %>
                                            <input type="hidden" id="studentid" name="studentid" value="<%=id%>">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>

                                                    <th class="table_center">Sr No</th>
                                                    <th class="table_center">Course Name</th>
                                                    <th class="table_center">Course Fee</th>

                                                 


                                                </tr>
                                            </thead>
                                           
                                            <tbody>

                                                <%
                                                    

                                                  
                                                    AdmissionDao cd = new AdmissionDao();
                                                    Admission ad = new Admission();
                                                    ad = cd.getAdmissionByID(id);
                                                    int j = 0;
                                                    int noofcourse = ad.getNoofCourse();
                                                    System.out.println(noofcourse);
                                                    int k =0;
                                                    if(noofcourse>0){
                                                    for (int i = 0; i < noofcourse; i++) {
                                                        j++;
                                                        String val = Integer.toString(j);
                                                        String coursename = ad.getCourseName();
                                                        String[] curese = coursename.split(" ");
                                                        int coursefee = 0;
                                                        String  coursename1 = "";
                                                        if (j == 1) {
                                                            coursefee = ad.getCourseFee1();
                                                            coursename1=ad.getCourseName1();
                                                        
                                                         
                                                         
                                                        } else if (j == 2) {
                                                            coursefee = ad.getCourseFee2();
                                                           coursename1=ad.getCourseName2(); 
                                                        } else if (j == 3) {
                                                            coursefee = ad.getCourseFee3();
                                                            coursename1=ad.getCourseName3();
                                                        } else if (j == 4) {
                                                            coursefee = ad.getCourseFee4();
                                                            coursename1=ad.getCourseName4();
                                                        } else {
                                                            coursefee = ad.getCourseFee5();
                                                            coursename1=ad.getCourseName5();
                                                        }


                                                %>
                                            
                                                <tr>

                                                    <td class="table_center"><%=j%> </td>
                                                   
                                                    <td class="table_center"><input type="text" style="border: none" class="text-center" name="CourseName<%=i%>" value="<%=coursename1%>"></td> 
                                                    <td class="table_center"><input type="text" class="text-center" name="Coursefee<%=i%>" value="<%=coursefee%>"></td> 

                                                 






                                                </tr> 
                                                <%
                                                    k++;
                                                    }
                                                    }
                                                %>

                                            </tbody>
                                        </table>
                                        <div class="ln_solid"></div>
                                       
                                        </form>
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
    </body>
</html>