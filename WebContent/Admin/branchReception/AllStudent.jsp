<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
    <%    if (session.getAttribute("printInvoiceID2") != null) {
            long celloId = (Long) session.getAttribute("printInvoiceID2");
            session.removeAttribute("printInvoiceID");
            session.removeAttribute("printInvoiceID2");
    %>
    <script>
        window.open("Class_invoice.jsp?admissionid=<%=celloId%>");</script>
        <%
            }


        %>

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

                                    <div class="x_title">
                                        <div class="btn-group">
                                            <a href="AllStudent.jsp?Students=Regular">    <button class="btn btn-default user_buttons12" data="Today" id="Today" type="button">Regular Student</button>
                                            </a> <a href="AllStudent.jsp?Students=Old">  <button class="btn btn-default user_buttons12" data="Yesterday" id="Yesterday" type="button">Old Student</button>

                                            </a> 


                                        </div>
                                        <label class="col-md-offset-6" id="position">All Student List</label>
                                        <div class="clearfix"></div>

                                    </div>
                                    <input type="hidden" id="adminidd" name="adminidd" value="<%=admin.getAdminId()%>">
                                    <div id="studentfetch">
                                        <div class="x_content">

                                            <table id="datatable" class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>

                                                        <th class="table_center">Admission Date</th>
                                                        <th class="table_center">Profile Pic</th>
                                                        <th class="table_center">Name</th>
                                                        <th class="table_center">Admission No</th>
                                                        <th class="table_center">Password</th>
                                                        <th class="table_center">Due Date</th>
                                                        <th class="table_center">Mobile No.</th>
                                                        <th class="table_center">Date of Birth</th>
                                                        <th class="table_center">Course</th>
                                                        <th class="table_center">Balance Fee</th>
                                                        <th class="table_center">Profile</th>
                                                            <%
                                                                AdmissionDao cd = new AdmissionDao();
                                                                String Students = request.getParameter("Students");
                                                                List<Admission> cl = null;
                                                                if (Students != null) {
                                                                    if (Students.equals("Old")) {
                                                            %>

                                                        <th class="table_center">Shift</th>
                                                            <%
                                                                        cl = cd.getStudentListOld(admin);
                                                                    } else {
                                                                        cl = cd.getStudentListRegular(admin);
                                                                    }
                                                                } else {
                                                                    cl = cd.getStudentListRegular(admin);
                                                                }


                                                            %>



                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%                                                        int i = 0;

                                                        if (cl != null && cl.size() > 0) {
                                                            for (Admission p : cl) {

                                                                i++;

                                                                String ImgPath1 = p.getCustomerAccount().getImage();

                                                                String date1 = DATE_FORMAT.format(p.getJoiningDate());
                                                                String date2 = DATE_FORMAT.format(p.getNextPaymentDate());
                                                                String date3 = DATE_FORMAT.format(p.getDateofBirth());

                                                    %>
                                                    <tr>
                                                        <td class="table_center"><%=date1%></td> 

                                                        <td class="table_center"> <img onclick="openmodel(this.id)" id="myImg<%=i%>" width="40" height="40" src="../../StudentImages/<%=ImgPath1%>" alt="..." class="myImg" ></td>
                                                        <td class="table_center"><%=p.getFirstName()%> </td>
                                                        <td class="table_center"><%=p.getAdmissionNo()%></td> 
                                                        <td class="table_center"><%=p.getStudentPassword()%></td> 
                                                        <td class="table_center"><%=date2%></td> 
                                                        <td class="table_center"><%=p.getContactNo()%></td> 
                                                        <td class="table_center"><%=date3%></td> 
                                                        <td class="table_center"><%=p.getCourseName()%></td> 
                                                        <td class="table_center"><%=p.getRemaininFee()%></td> 
                                                        <td class="table_center"><a href="StudentProfileDetails.jsp?accountid=<%=p.getCustomerAccount().getId()%>" class="btn btn-round btn-success btn-xs">Profile</a></td>


                                                        <%
                                                            if (!p.isShiftToOldStudent()) {
                                                        %>
                                                <form class="form-horizontal form-label-left"  action="../../ConvertStudent1" method="get">
                                                    <input type="hidden" value="<%=p.getAdmissionId()%>" id="studentidd" name="studentidd">
                                                    <input type="hidden" value="<%=p.getCustomerAccount().getId()%>" id="custid" name="custid">
                                                    <td class="table_center"><input type="submit" class="btn btn-round btn-success btn-xs" value="Shift To Regular Student"></td>
                                                </form>

                                                <%}%>

                                                </tr> 
                                                <%}

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


        <%@ include file = "JavaScriptFile.jsp" %>


        <script>
                                                            $(document).ready(function() {

                                                                $('.user_buttons').click(function(event) {
                                                                    var UID = this.id;
                                                                    var adminidd = $("#adminidd").val();
                                                                    if (UID !== "")
                                                                    {
                                                                        var pos = $(this).attr("data");
                                                                        $("#position").text("" + pos + " Due Date Student");
                                                                        $.ajax({
                                                                            url: "FetchStudent.jsp",
                                                                            type: "post",
                                                                            data: {userID: UID, adminidd: adminidd},
                                                                            success: function(response) {
                                                                                $("#studentfetch").html(response);
                                                                            },
                                                                            error: function(jqXHR, textStatus, errorThrown) {
                                                                                console.log(textStatus, errorThrown);
                                                                                alert("Something Went Wrong...!!!");
                                                                            }
                                                                        });
                                                                    } else
                                                                    {
                                                                        alert("No Users Added...!!!");
                                                                    }
                                                                });



                                                            });
        </script>
    </body>
</html>