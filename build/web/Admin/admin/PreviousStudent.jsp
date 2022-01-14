
<%@page import="com.accede.angel.admin.model.Branch"%>
<%@page import="com.accede.angel.admin.dao.BranchDao"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.dao.UserDao"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.dao.ProductDao"%>
<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.model.Product"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
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
                        <!--            <div class="page-title">
                                      <div class="title_left">
                                        <h3>Form Elements</h3>
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

                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Add Employee <small> </small></h2>
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
                                <form action="../../AddEmployee" method="get">

                                  
                                    
                                    <div class="row">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="text" placeholder=" Name"  onkeypress="return alpha(event)" id="name" name="name" class="form-control">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="text" placeholder="Mobile" maxlength="10" id="mobile" name="mobile" class="form-control priceup">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="email" placeholder="Email" id="email" name="email" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="text" placeholder=" Alternate No" id="alternateNo" name="alternateNo" class="form-control priceup">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="text" placeholder="Permanent No" id="PermanentNo" name="PermanentNo" class="form-control priceup">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <input type="text" placeholder="Qualification" id="qualification" name="qualification" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                            <textarea id="textarea" required="required" name="addree" placeholder="Address" class="form-control col-md-7 col-xs-12"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                            <textarea id="textarea" required="required" name="paddree" placeholder="Permanent Address" class="form-control col-md-7 col-xs-12"></textarea>
                                        </div>
                                    </div>
                                 
                                    
                            
                                    
                                    
                                    <div class="ln_solid"></div>


                                    
                                    
                                   
                                    
                                    <div class="form-group">
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="button" class="btn btn-primary">Cancel</button>
                                            <button type="submit" class="btn btn-success submitt1" id="">Submit</button>
                                            <button type="reset" class="btn btn-primary">Reset</button>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                      
                            
                        
                    </div>
                </div>
            </div>
            <div class="example-modal">
                <div class="modal" id="myModal2">
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
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="modal_branch">Branch<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <!--                                                                        <input type="text" id="modal_branch"  name="modal_branch" required="required" class="form-control col-md-7 col-xs-12">-->
                                            <select class="form-control" id="modal_branch" name="modal_branch" >
                                                <!--                                                                            <option value="1">Select Branch</option>-->
                                                <%                                                                                BranchDao ad1 = new BranchDao();
                                                    List<Branch> b1 = null;
                                                    b1 = ad1.getAllBranch();
                                                    if (b1 != null && b1.size() > 0) {
                                                        for (Branch p1 : b1) {

                                                %>
                                                <option value="<%=p1.getBranchId()%>"><%= p1.getBranchName()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
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



    <!-- /page content -->

    <!-- footer content -->
    <%@ include file = "../comman_files/BranchFooter.jsp" %>
    <!-- /footer content -->

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
    <script src="../build/js/custom.min.js"></script>
    <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script type="text/javascript">
                                                    $('#document').ready(function () {


                                                        $('.edit_prd2').click(function (event) {
                                                            var i = this.id;
                                                            //alert("id==" + this.id)

                                                            // $('#modal_vendor_id').val($('#vendor_id' + i).text());

                                                            $('#modal_Bank_name').val($('#BankName' + i).text());
                                                            $('#modal_Branch_name').val($('#BranchName' + i).text());
                                                            $('#modal_AccountNo').val($('#BankAccount' + i).text());
                                                            $('#modal_IfscCode').val($('#BankIfsc' + i).text());
                                                            $('#modal_PanNO').val($('#PanNumber' + i).text());
                                                            $('#modal_AadharNo').val($('#AdharNo' + i).text());
                                                            $('#modal_Bankaddress').val($('#BankAddress' + i).text());


                                                            document.getElementById("Modal_Bank_Id").value = i;
                                                            //BankName BranchName BankAccount BankIfsc PanNumber AdharNo BankAddress
                                                        });

                                                   });




    </script>
    
    <script type="text/javascript">
        $('#document').ready(function () {



            $('.edit_prd1').click(function (event) {
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
                $('#modal_branch').val($('#Branch' + i).text());
                $('#modal_inTime').val($('#InTime' + i).text());
                $('#modal_outTime').val($('#OutTime' + i).text());

                document.getElementById("Modal_Employee_Id").value = i;
                //document.getElementById("Modal_Bank_Id").value = i;
                //BankName BranchName BankAccount BankIfsc PanNumber AdharNo BankAddress
            });


        });

    </script>
    <script type="text/javascript">
        $('#document').ready(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });
            $('#datetimepicker3').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });
            $('#datetimepicker4').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });
            $('#datetimepicker5').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });
            $('#datetimepicker6').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });
            $('#datetimepicker7').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });
//
//                $("#datetimepicker1").on("dp.change", function(e) {
//                    var duration = $('#noOfDays1').val();
//                    alert('dfj');
//                    duration = parseInt(duration);
//                    var today = new Date(e.date);
//                    var day = $('#datetimepicker1').val();
//                    //                var currentdate=today.getDate() +duration;
//                    //                alert(currentdate);
//                    //                  alert(today.getDate());
//                    //                var currMonth = today.getMonth() + duration;
//                    //                
//                    //                var secondInstallmentDate = new Date(today.setMonth(currMonth));
//                    //                var month = secondInstallmentDate.getMonth() + 1;
//                    //                var year = new Date(secondInstallmentDate).getFullYear();
//                    //                var date5 = new Date(secondInstallmentDate).getDate();
//                    //                $('.DueDate').val(date5 + "/" + month + "/" + year);
//
//                    //                    alert(' hello' + val);
//                    $.get("fetchduedate.jsp", {q: duration, w: today, v: day}, function(data) {
//                        //   alert('sucess');
//                        $('#datefetch').html(data);
//                    });
//
//                });
//
//                $('#Instumentid').change(function() {
//                    //   alert('hi112');
//
//                });
//                $("#output1").hide();
//                $('#output2').hide();
//                $('#output3').hide();
//                $('#output4').hide();
//
//                $('#quant2').on('keyup change', function() {
//                    var quant1 = $('#quant2').val();
//                    var advancedPaid1 = $('#advancedPaid2').val();
//                    var discou1 = $('#discou2').val();
//                    var unitPrice1 = $('#repcost').val();
//
//
//                    if (unitPrice1 != 0)
//                    {
//                        if (quant1 != 0)
//                        {
//                            var amount = unitPrice1 * quant1;
//                            var disamount = amount * discou1 / 100;
//                            amount = amount - disamount;
//                            amount = parseInt(amount);
//                            $('#total2').val(amount);
//                            amount = amount - advancedPaid1;
//
//                            amount = parseInt(amount);
//                            $('#balanceAmount2').val(amount);
//
//                            $('#amountinwordRepair').val(converAmount(amount));
//                        }
//                        else
//                        {
//
//
//                            $('#total2').val("0");
//
//                        }
//                    }
//                    else
//                    {
//
//
//                        $('#total2').val("0");
//
//                    }
//                });
//                $('#discou2').on('keyup change', function() {
//                    var quant1 = $('#quant2').val();
//
//                    var discou1 = $('#discou2').val();
//                    var unitPrice1 = $('#repcost').val();
//                    var advancedPaid1 = $('#advancedPaid2').val();
//
//                    if (unitPrice1 != 0)
//                    {
//                        if (quant1 != 0)
//                        {
//                            var amount = unitPrice1 * quant1;
//                            var disamount = amount * discou1 / 100;
//                            amount = amount - disamount;
//                            amount = parseInt(amount);
//                            $('#total2').val(amount);
//                            amount = amount - advancedPaid1;
//
//                            amount = parseInt(amount);
//                            $('#balanceAmount2').val(amount);
//                            $('#amountinwordRepair').val(converAmount(amount));
//                        }
//                        else
//                        {
//
//
//                            $('#total2').val("0");
//
//                        }
//                    }
//                    else
//                    {
//
//
//                        $('#total2').val("0");
//
//                    }
//                });
//                $('#quant1').on('keyup change', function() {
//                    var quant1 = $('#quant1').val();
//                    var advancedPaid1 = $('#advancedPaid1').val();
//                    var discou1 = $('#discou1').val();
//                    var unitPrice1 = $('#unitPrice1').val();
//
//
//                    if (unitPrice1 != 0)
//                    {
//                        if (quant1 != 0)
//                        {
//                            var amount = unitPrice1 * quant1;
//                            var disamount = amount * discou1 / 100;
//                            amount = amount - disamount;
//                            amount = parseInt(amount);
//                            $('#total1').val(amount);
//                            amount = amount - advancedPaid1;
//
//                            amount = parseInt(amount);
//                            $('#balanceAmount1').val(amount);
//
//                            $('#amountinwordRent').val(converAmount(amount));
//                        }
//                        else
//                        {
//
//
//                            $('#total1').val("0");
//
//                        }
//                    }
//                    else
//                    {
//
//
//                        $('#total1').val("0");
//
//                    }
//                });
//                $('#discou1').on('keyup change', function() {
//                    var quant1 = $('#quant1').val();
//
//                    var discou1 = $('#discou1').val();
//                    var unitPrice1 = $('#unitPrice1').val();
//                    var advancedPaid1 = $('#advancedPaid1').val();
//
//                    if (unitPrice1 != 0)
//                    {
//                        if (quant1 != 0)
//                        {
//                            var amount = unitPrice1 * quant1;
//                            var disamount = amount * discou1 / 100;
//                            amount = amount - disamount;
//                            amount = parseInt(amount);
//                            $('#total1').val(amount);
//                            amount = amount - advancedPaid1;
//
//                            amount = parseInt(amount);
//                            $('#balanceAmount1').val(amount);
//                            $('#amountinwordRent').val(converAmount(amount));
//                        }
//                        else
//                        {
//
//
//                            $('#total1').val("0");
//
//                        }
//                    }
//                    else
//                    {
//
//
//                        $('#total1').val("0");
//
//                    }
//                });
//                $('#unitPrice1').on('keyup change', function() {
//                    var quant1 = $('#quant1').val();
//
//                    var discou1 = $('#discou1').val();
//                    var unitPrice1 = $('#unitPrice1').val();
//                    var advancedPaid1 = $('#advancedPaid1').val();
//
//                    if (unitPrice1 != 0)
//                    {
//                        if (quant1 != 0)
//                        {
//                            var amount = unitPrice1 * quant1;
//                            var disamount = amount * discou1 / 100;
//                            amount = amount - disamount;
//                            amount = parseInt(amount);
//                            $('#total1').val(amount);
//                            amount = amount - advancedPaid1;
//
//                            amount = parseInt(amount);
//                            $('#balanceAmount1').val(amount);
//                            $('#amountinwordRent').val(converAmount(amount));
//                        }
//                        else
//                        {
//
//
//                            $('#total1').val("0");
//
//                        }
//                    }
//                    else
//                    {
//
//
//                        $('#total1').val("0");
//
//                    }
//                });
//
//                $('#advancedPaid1').on('keyup change', function() {
//                    var quant1 = $('#quant1').val();
//                    var advancedPaid1 = $('#advancedPaid1').val();
//
//                    var discou1 = $('#discou1').val();
//                    var unitPrice1 = $('#unitPrice1').val();
//
//
//                    if (unitPrice1 != 0)
//                    {
//                        if (quant1 != 0)
//                        {
//                            var amount = unitPrice1 * quant1;
//                            var disamount = amount * discou1 / 100;
//                            amount = amount - disamount;
//                            amount = parseInt(amount);
//                            $('#total').val(amount);
//
//                            amount = amount - advancedPaid1;
//
//                            amount = parseInt(amount);
//                            $('#balanceAmount1').val(amount);
//                            $('#amountinwordRent').val(converAmount(amount));
//                        }
//                        else
//                        {
//
//
//                            $('#total1').val("0");
//                            $('#balanceAmount1').val("0");
//
//                        }
//                    }
//                    else
//                    {
//
//
//                        $('#total1').val("0");
//                        $('#balanceAmount1').val("0");
//
//                    }
//                });
//
//                $('#quant').on('keyup change', function() {
//                    var quant = $('#quant').val();
//
//                    var discou = $('#discou').val();
//                    var unitPrice = $('#unitPrice').val();
//
//
//                    if (quant != 0)
//                    {
//                        var amount = quant * unitPrice;
//                        var disamount = amount * discou / 100;
//                        amount = amount - disamount;
//                        amount = parseInt(amount);
//                        $('#total').val(amount);
//                        $('#amountinwordsell').val(converAmount(amount));
//
//                    }
//                    else
//                    {
//
//
//                        $('#total').val("0");
//
//                    }
//                });
//                $('#discou').on('keyup change', function() {
//                    var quant = $('#quant').val();
//
//                    var discou = $('#discou').val();
//                    var unitPrice = $('#unitPrice').val();
//
//
//                    if (quant != 0)
//                    {
//                        var amount = quant * unitPrice;
//                        var disamount = amount * discou / 100;
//                        amount = amount - disamount;
//                        amount = parseInt(amount);
//                        $('#total').val(amount);
//                        $('#amountinwordsell').val(converAmount(amount));
//
//                    }
//                    else
//                    {
//
//
//                        $('#total').val("0");
//
//                    }
//                });
//
//
//
//                function onlyDigit(n)
//                {
//
//                    var units = ['', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'];
//                    var randomer = ['', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'];
//                    var tens = ['', 'Ten', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];
//                    var r = 0;
//                    var num = parseInt(n);
//                    var str = "";
//                    var pl = "";
//                    var tenser = "";
//                    while (num >= 1)
//                    {
//                        r = parseInt(num % 10);
//                        tenser = r + tenser;
//                        if (tenser <= 19 && tenser > 10)
//                        {
//                            str = randomer[tenser - 10];
//                        }
//                        else
//                        {
//                            if (pl == 0)
//                            {
//                                str = units[r];
//                            }
//                            else if (pl == 1)
//                            {
//                                str = tens[r] + " " + str;
//                            }
//                        }
//                        if (pl == 2)
//                        {
//                            str = units[r] + " Hundred " + str;
//                        }
//
//                        num = parseInt(num / 10);
//                        pl++;
//                    }
//                    return str;
//                }
//
//
//
//
//                function converAmount(amount)
//                {
//                    var grandtotal = amount;
//                    var r = 0;
//                    var txter = grandtotal.toString();
//
//                    var sizer = txter.toString().length;
//
//
//                    var numStr = "";
//
//
//                    var n = parseInt(grandtotal);
//
//                    var places = 0;
//
//                    var str = "";
//
//                    var entry = 0;
//
//                    while (n >= 1)
//                    {
//                        r = parseInt(n % 10);
//
//
//                        if (places < 3 && entry == 0)
//                        {
//
//                            numStr = txter.substring(txter.toString().length - 0, txter.toString().length - 3) // Checks for 1 to 999.
//
//                            str = onlyDigit(numStr); //Calls function for last 3 digits of the value.
//
//                            entry = 1;
//                        }
//
//                        if (places == 3)
//                        {
//
//                            var size1 = txter.toString().length - 5;
//                            var size2 = txter.toString().length - 3;
//                            numStr = txter.substring(size1, size2)
//
//                            if (numStr != "")
//                            {
//                                str = onlyDigit(numStr) + " Thousand " + str;
//
//                            }
//                        }
//
//                        if (places == 5)
//                        {
//
//                            numStr = txter.substring(txter.toString().length - 7, txter.toString().length - 5) //Substring for 5 place to 7 place of the string
//
//                            if (numStr != "")
//                            {
//                                str = onlyDigit(numStr) + " Lakhs " + str; //Appends the word lakhs to it
//
//                            }
//                        }
//
//                        if (places == 6)
//                        {
//                            numStr = txter.substring(txter.toString().length - 9, txter.toString().length - 7)  //Substring for 7 place to 8 place of the string
//
//                            if (numStr != "")
//                            {
//                                str = onlyDigit(numStr) + " Crores " + str;
//
//                            }
//                        }
//
//                        n = parseInt(n / 10);
//
//                        places++;
//
//                    }
//
//                    return str;
//                }
//                $('#pname').change(function() {
//                    //   alert('hi112');
//                    var val = $(this).val().trim();
//                    //                alert(val);
//                    $.ajax({
//                        url: "productfetchajax.jsp",
//                        type: "post",
//                        data: {val: val},
//                        success: function(response) {
//                            $("#addproductfetch").html(response);
//                        },
//                        error: function(jqXHR, textStatus, errorThrown) {
//                            console.log(textStatus, errorThrown);
//                            alert("Something Went Wrong...!!!");
//                        }
//                    });
//                });
//                $('#enquiryfor').change(function() {
//                    //   alert('hi112');
//                    var val = $(this).val().trim();
//                    if (val == "MusicClass")
//                    {
//                        $("#output1").hide();
//                        $('#output2').hide();
//                        $('#output3').hide();
//                        $('#output4').show();
//                    }
//                    else if (val == "Sell")
//                    {
//                        $("#output1").show();
//                        $('#output2').hide();
//                        $('#output3').hide();
//                        $('#output4').hide();
//                    }
//                    else if (val == "Repair")
//                    {
//                        $("#output1").hide();
//                        $('#output2').hide();
//                        $('#output3').show();
//                        $('#output4').hide();
//                    }
//                    else
//                    {
//                        $("#output1").hide();
//                        $('#output2').show();
//                        $('#output3').hide();
//                        $('#output4').hide();
//                    }
//
//                });


            $(".priceup").keypress(function (event) {
                var inputCode = event.which;
                var currentValue = $(this).val();
                if (inputCode > 0 && (inputCode < 48 || inputCode > 57)) {
                    if (inputCode == 46) {
                        if (getCursorPosition(this) == 0 && currentValue.charAt(0) == '-')
                            return false;
                        if (currentValue.match(/[.]/))
                            return false;
                    }
                    else if (inputCode == 45) {
                        if (currentValue.charAt(0) == '-')
                            return false;
                        if (getCursorPosition(this) != 0)
                            return false;
                    }
                    else if (inputCode == 8)
                        return true;
                    else
                        return false;

                }
                else if (inputCode > 0 && (inputCode >= 48 && inputCode <= 57)) {
                    if (currentValue.charAt(0) == '-' && getCursorPosition(this) == 0)
                        return false;
                }
            });
        });



    </script>
    <script type="text/javascript">


        function alpha(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32);
        }
        function alpha1(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 47 && k < 58) || (k > 96 && k < 123) || k == 8 || k == 32);
        }
        $('#mobile').blur(function () {

            var contact = $('#mobile').val().length;
            if (contact == 10)
            {
            }
            else
            {
                swal({
                    title: 'Enter Correct Mobile No',
                    input: 'number',
                    showCancelButton: true,
                    animation: false,
                    inputValidator: function (value) {
                        return new Promise(function (resolve, reject) {
                            if (value.length == 10)
                            {

                                $('#mobile').val(value);
                                resolve()
                            } else {
                                reject('You need to Enter Mobile No :)')
                            }
                        })
                    }
                }).then(function (result) {
                    swal({
                        type: 'success',
                        html: 'You Enter ' + result
                    })
                })


            }
        });

        function valid()
        {
            var contact = $('#mobile').val().length;
            var rollno = /^[0-9]*$/;
            // var phoneno = /^\d{10}$/; 
            var branchname = document.getElementById('branchname').value;
            var adminName = document.getElementById('adminName').value;
            var branchAddress = document.getElementById('branchAddress').value;
            var branchAddress1 = document.getElementById('branchAddress1').value;
            var branchAddress2 = document.getElementById('branchAddress2').value;

            var letters = /^[A-Za-z]+$/;


            if (contact == 10)
            {
            }
            else
            {
                swal({
                    title: 'Enter Correct Mobile No',
                    input: 'number',
                    showCancelButton: true,
                    animation: false,
                    inputValidator: function (value) {
                        return new Promise(function (resolve, reject) {
                            if (value.length == 10)
                            {

                                $('#mobile').val(value);
                                resolve()
                            } else {
                                reject('You need to Enter Mobile No :)')
                            }
                        })
                    }
                }).then(function (result) {
                    swal({
                        type: 'success',
                        html: 'You Enter ' + result
                    })
                })

                return false;
            }





        }

    </script>
    <script>
        var close = document.getElementsByClassName("closebtn");
        var i;

        for (i = 0; i < close.length; i++) {
            close[i].onclick = function () {
                var div = this.parentElement;
                div.style.opacity = "0";
                setTimeout(function () {
                    div.style.display = "none";
                }, 600);
            }
        }
    </script>
</body>
</html>

