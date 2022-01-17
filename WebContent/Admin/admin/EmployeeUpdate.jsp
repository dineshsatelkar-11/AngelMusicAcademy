<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Update Employee</title>

        <!-- Bootstrap -->
        <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
        <!-- Datatables -->
        <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
        <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
        <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
        <script src="../Alertajax.js" type="text/javascript"></script>
        <!-- Custom Theme Style -->
        <link href="../build/css/custom.min.css" rel="stylesheet">
    </head>

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

                            </div>


                        </div>

                        <div class="clearfix"></div>                       
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Update Employee</h2>
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
                                    <div class="x_content table-responsive" id="output">
                                        <p class="text-muted font-13 m-b-30">
                                        </p>                                       
                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Sr No</th>
                                                    <th class="table_center">Delete</th>
                                                    <th class="table_center">Edit</th>
                                                    <th class="table_center">Employee NO</th>
                                                    <th class="table_center">Employee Name </th>
                                                    <th class="table_center">Designation</th>
                                                    <th class="table_center">Mobile No</th>
                                                    <th class="table_center">Email Id</th>
                                                    <th class="table_center">Permanent Address</th>
                                                    <th class="table_center">Qualification</th>
                                                    <th class="table_center">Branch</th>
                                                    <th class="table_center">Joining date</th>
                                                    <th class="table_center">Salary</th>
                                                    <th class="table_center">Address</th>
                                                    <th class="table_center">In Time</th>
                                                    <th class="table_center">Out Time</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%                                                    int j = 0;
                                                    Employee EMP = new Employee();
                                                    EmployeeDao EMP1 = new EmployeeDao();
                                                    List<Employee> c = EMP1.getAllEmployee();
                                                    for (Employee p : c) {
                                                        j++;

                                                        int branchid = p.getBranchid();
                                                        System.out.println("branchid==="+branchid);
                                                        BranchDao bd = new BranchDao();
                                                        Admin e1 = bd.getAdminByID(branchid);
                                                        System.out.println("branchid123==="+e1.getAdminOfBranch().getBranchName() );
                                                %>
                                                <tr>
                                                    <td class="table_center"><%=j%></td>
                                                    <td class="table_center"><i id="<%=p.getId()%>"  class="fa fa-remove remove_prd text-danger "></i></td>
                                                    <td class="table_center"><a href="EmployeeEdit.jsp?EmpID=<%=p.getId()%>"><i  class="fa fa-edit"></i></a></td>
                                                    <td class="table_center"><%=p.getEmplyeeNo()%></td>
                                                    <td class="table_center"><%=p.getName()%></td>
                                                    <td class="table_center"><%=p.getDesignation()%></td>
                                                    <td class="table_center"><%=p.getPermanentNo()%></td>
                                                    <td class="table_center"><%=p.getEmail()%></td>
                                                    <td class="table_center"><%=p.getPermanentAddress()%></td>
                                                    <td class="table_center"><%=p.getQualification()%></td>
                                                    <td class="table_center"><%=e1.getAdminOfBranch().getBranchName() %></td>
                                                    <td class="table_center"><%=p.getJoiningDate()%></td>
                                                    <td class="table_center"><%=p.getSalary()%></td>
                                                    <td class="table_center"><%=p.getAddress()%></td>
                                                    <td class="table_center"><%=p.getInTime()%></td>
                                                    <td class="table_center"><%=p.getOutTime()%></td>

                                                </tr>
                                                <%
                                                    }
                                                %>
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
        <script>
            $(document).ready(function() {
                // alert('adsjhfgadsf');          
                $('.remove_prd').click(function(event) {
                    alert("Are you want to delete this product...!");
                    var EmpID = this.id;
                    // alert(prdID);
                    $.ajax({
                        url: "EmployeedeleteAjax.jsp",
                        type: "post",
                        data: {EmpID: EmpID},
                        success: function(response) {
                            //// alert("aaaaaaaaaaaaaaaaaaa1");
                            $("#output").html(response);
                            //  alert("aaaaaaaaaaaaaaaaaaa1");

                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(textStatus, errorThrown);
                        }
                    });
                });
            });
        </script>
    </body>
</html>