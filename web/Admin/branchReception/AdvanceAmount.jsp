<%@page import="com.accede.angel.sell.model.AdvanceAmount"%>
<%@page import="com.accede.angel.sell.dao.AdvanceAmountDao"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.BatchTimings"%>
<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
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
    <head>
        <link href="../comman_files/favicon.png" rel="shortcut icon" type="image/png">

    </head>

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


                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2> Advance Amount </h2>
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
                                        <form method="post" action="../../AdvanceAmountSave" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

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



                                            <%
                                                int id = Integer.parseInt(request.getParameter("accountid"));
                                                CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                                                CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(id);


                                            %>
                                            <input type="hidden" id="customerAccountid" name="customerAccountid" value="<%=id%>">

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="batchtime">Customer Name<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">

                                                    <input class="form-control" type="text" name="custname" id="custname" value="<%=CustomerAccount.getName()%>">



                                                </div>
                                            </div>



                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="batchtime">Reason<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">

                                                    <input class="form-control" type="text" name="Reason" id="Reason" >



                                                </div>
                                            </div>



                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="batchtime">Amount<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">

                                                    <input class="form-control" type="text" name="amount" id="amount" >



                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="batchtime">Due Date <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">

                                                    <input class="form-control" type="date" name="DueDate" id="DueDate" >



                                                </div>
                                            </div>

                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">

                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" class="btn btn-success">Submit</button>
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

                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>All Advance Details </h2>   
                                <ul class="nav navbar-right panel_toolbox">


                                  
                                </ul>
                                <div class="clearfix"></div>

                            </div>
                            <div class="x_content">
                                <!--                                        <p class="text-muted font-13 m-b-30">
                                                                            The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                        </p>-->
                                <table id="datatable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="table_center">Sr No</th>
                                            <th class="table_center">Payment Date</th>
                                            <th class="table_center">Payment Time</th>
                                            <th class="table_center">Amount</th>
                                            <th class="table_center">Reason </th>
                                            <th class="table_center">Due Date </th>



                                        </tr>
                                    </thead>
                                    <tbody>

                                        <% int j = 0;
                                            AdminDao aa = new AdminDao();
                                            AdvanceAmountDao bd = new AdvanceAmountDao();
                                            AdvanceAmount b = new AdvanceAmount();
                                            List<AdvanceAmount> c = bd.getAllAccountList(CustomerAccount);
                                            if (c != null && c.size() > 0) {
                                                for (AdvanceAmount p : c) {
                                                    j++;
 String date1 = DATE_FORMAT.format(p.getPaymentDate());
 String date2 = DATE_FORMAT.format(p.getDueDate());
                                        %>
                                        <tr>

                                            <td class="table_center"><%=j%> </td>


                                            <td class="table_center" id="prd_name<%=j%>"><%=date1%></td> 
                                            <td class="table_center" id="prd_name<%=j%>"><%=p.getPaymentTime()%></td> 
                                            <td class="table_center" id="prd_name<%=j%>"><%=p.getAmount()%></td> 

                                            <td class="table_center" id="admin_designation<%=j%>"><%=p.getReason()%></td> 

 <td class="table_center" id="prd_name<%=j%>"><%=date2%></td>


                                        </tr> 
                                        <%}}
                                        %>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
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
        <style>

            .table_center{

                text-align: center;
            }




        </style>


        <%@ include file = "JavaScriptFile.jsp" %>

        <script type="text/javascript">
            $('#document').ready(function() {

                $('.edit_prd').click(function(event) {
                    var i = this.id;
                    $('#modal_prd_id').val($('#prd_id' + i).val());


                    $('#modal_prd_name').val($('#prd_name' + i).text());

                });



                $('#from').change(function(event) {
//        alert("dsfhvg");                                                               
                    var i = this.value;
//                 alert("dsfhvg"+i);    
                    $.get("FetchBatchTimeAjax.jsp", {i: i}, function(data) {
//                           alert('sucess');
                        $('#endbatchtimefetch').html(data);
//                          alert('sucess');
                    });
                });


            });

        </script>


    </body>
</html>