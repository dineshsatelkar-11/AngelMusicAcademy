<%@page import="com.accede.angel.admin.model.ExternalAccountSuper"%>
<%@page import="com.accede.angel.admin.dao.ExternalAccountSuperDao"%>
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.Enquiry"%>
<%@page import="com.accede.angel.admin.dao.EnquiryDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <script src="../production/js/Alertajax.js" type="text/javascript"></script>
    <script type="text/javascript">
        $('#document').ready(function() {

            $("#datatable").on("click", ".edit_prd2", function() {
//                                                        $('.edit_prd2').click(function (event) {
                var i = this.id;
                //alert("id==" + this.id)

                // $('#modal_vendor_id').val($('#vendor_id' + i).text());

                $('#modal_Bank_name').val($('#BankName' + i).val());
                $('#modal_Branch_name').val($('#BranchName' + i).val());
                $('#modal_AccountNo').val($('#BankAccount' + i).val());
                $('#modal_IfscCode').val($('#BankIfsc' + i).val());
                $('#modal_PanNO').val($('#PanNumber' + i).val());
                $('#modal_AadharNo').val($('#AdharNo' + i).val());
                $('#modal_Bankaddress').val($('#BankAddress' + i).val());


                document.getElementById("Modal_Bank_Id").value = i;
                //BankName BranchName BankAccount BankIfsc PanNumber AdharNo BankAddress
            });

        });




    </script>

    <script type="text/javascript">
        $('#document').ready(function() {

            $("#datatable").on("click", ".edit_prd1", function() {

                var i = this.id;
                // alert("id==" + this.id)
                //  var j = $('#prd_id' + i).val();


                // $('#modal_vendor_id').val($('#vendor_id' + i).text());
                $('#modal_name').val($('#Company_name' + i).text());
                $('#modal_mobile').val($('#Mobile' + i).text());
                $('#modal_alternateNo').val($('#Email' + i).text());
                $('#modal_email').val($('#AlternateNo' + i).text());
                $('#modal_PermenantNO').val($('#PermanentNo' + i).text());
                $('#modal_qualification').val($('#Qualification' + i).text());
                $('#modal_address').val($('#Address' + i).text());
                $('#modal_permanentAddress').val($('#PermanentAddress' + i).text());
                $('#modal_designation').val($('#Designation' + i).text());
                $('#modal_salary').val($('#Salary' + i).text());
                $('#modal_joinDate').val($('#JoinDate' + i).text());
//                $('#modal_branch').val($('#Branch' + i).val());
                $('#modal_inTime').val($('#InTime' + i).text());
                $('#modal_outTime').val($('#OutTime' + i).text());

                document.getElementById("Modal_Employee_Id").value = i;
                //document.getElementById("Modal_Bank_Id").value = i;
                //BankName BranchName BankAccount BankIfsc PanNumber AdharNo BankAddress
            });


        });

    </script>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/adminSideBarFile.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div role="main">
                    <div class="">

                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Employee Details </h2>   
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
                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Sr No</th>
                                                    <th class="table_center"> Payment </th>
                                                    <th class="table_center">Name</th>
                                                    <th class="table_center">Mobile No</th>
                                                    <th class="table_center">Email</th>
                                                    <th class="table_center">Address</th>





                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% int j = 0;
                                                    // AdminDao aa = new AdminDao();
                                                    ExternalAccountSuperDao bd = new ExternalAccountSuperDao();

                                                    List<ExternalAccountSuper> c = bd.getAllExternalAccountSuper();
                                                    for (ExternalAccountSuper p : c) {
                                                        j++;


                                                %>
                                                <tr>
                                                    <td class="table_center"  ><%=j%>


                                                    </td> 

                                                    <td> <a href="PaiExternalAmount.jsp?asd=<%=p.getId()%>" class="btn btn-round btn-success btn-xs">Payment</a></td>

                                                    <td class="table_center" id="Company_name<%=j%>"><%=p.getAccountHolderName()%></td> 
                                                    <td class="table_center" id="Mobile<%=j%>"><%=p.getMobileno()%></td> 
                                                    <td class="table_center" id="Email<%=j%>"><%=p.getEmail()%></td> 
                                                    <td class="table_center" id="AlternateNo<%=j%>"><%=p.getAddress()%></td> 


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
                <div class="example-modal">
                    <div class="modal" id="UpdateEmployee">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="../../UpdateEmployee" method="post" name="update" class="form-horizontal form-label-left">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">Update Employee</h4>
                                    </div>
                                    <input type="hidden" id="Modal_Employee_Id" name="Modal_Employee_Id">
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_name">Company Name <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_name"  name="modal_name" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_mobile">Mobile<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_mobile"  name="modal_mobile" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_alternateNo">Alternate No<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_alternateNo"  name="modal_alternateNo" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_email">Email<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_email"  name="modal_email" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_PermenantNO">Permanent No<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_PermenantNO"  name="modal_PermenantNO" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_qualification">Qualification<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_qualification"  name="modal_qualification" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_address">Address<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_address"  name="modal_address" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_permanentAddress">Permanent Address<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_permanentAddress"  name="modal_permanentAddress" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_designation">Designation<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_designation"  name="modal_designation" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_salary">Salary<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_salary"  name="modal_salary" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_joinDate">Join Date<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="date" id="modal_joinDate"  name="modal_joinDate" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <!--                                    <div class="form-group">
                                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_branch">Branch<span class="required"></span>
                                                                                </label>
                                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                                                                                            <input type="text" id="modal_branch"  name="modal_branch" required="required" class="form-control col-md-7 col-xs-12">
                                                                                    <select class="form-control" id="modal_branch" name="modal_branch" >
                                                                                                                                                                    <option value="1">Select Branch</option>
                                        <%                                                                                BranchDao ad1 = new BranchDao();
                                            List<Branch> b1 = null;
                                            b1  = ad1.getAllBranch();
                                            if (b1

                                            != null && b1.size () 
                                                > 0) {
                                                for (Branch p1 : b1) {

                                        %>
                                        <option value="<%=p1.getBranchId()%>"><%= p1.getBranchName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>-->
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_inTime">Intime<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_inTime"  name="modal_inTime" readonly="" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_outTime">OutTime<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="time" id="modal_outTime"  name="modal_outTime" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>


                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary" id="updateProduct">Update</button>
                                        </div>
                                </form>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                </div>
            </div>
            <div class="modal fade" id="myModal22" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">

                        <div class="modal-body">
                            <form action="../../UpdateBankDetails" method="post" name="update" class="form-horizontal form-label-left">
                                <%                                          if (session.getAttribute ( 
                                        "i") != null) {
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
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Update Bank Details</h4>
                                </div>
                                <input type="hidden" id="Modal_Bank_Id"  name="Modal_Bank_Id">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_name">Bank Name <span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_Bank_name"  name="modal_Bank_name" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_mobile">Branch Name<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_Branch_name"  name="modal_Branch_name" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group"> 
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_alternateNo">Account No<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_AccountNo"  name="modal_AccountNo" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_email">Ifsc Code<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_IfscCode"  name="modal_IfscCode" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_PermenantNO">PAN No<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_PanNO"  name="modal_PanNO" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_qualification">Aadhar No<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_AadharNo"  name="modal_AadharNo" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_address">Bank Address<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="modal_Bankaddress"  name="modal_Bankaddress" required="required" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>



                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" id="updateProduct">Update</button>
                                    </div>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>

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
<style>

    .table_center{

        text-align: center;
    }

</style>
</body>
</html>