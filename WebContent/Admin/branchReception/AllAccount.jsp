<%@page import="com.accede.angel.admin.model.ExternalAccount"%>
<%@page import="com.accede.angel.admin.dao.ExternalAccountDao"%>
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
                <div class="">
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="" role="main">
                    <div class="">

                        <div class="page-title">
                            <div class="title_left">
                                <h3>Account Details </h3>
                            </div>

                            <!--                            <div class="title_right">
                                                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control" placeholder="Search for...">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-default" type="button">Go!</button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>

                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Account Details </h2>   
                                      <ul class="nav navbar-right panel_toolbox">
                                           
                                            
                                            <li> <p><button type="button" class="btn btn-round btn-sm btn-info "  data-toggle="modal" data-target="#myModal">Create Account</button></p>
                                            </li>
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
                                                    <th class="table_center">Edit Branch </th>
                                                    <th class="table_center">Status </th>
                                                    <th class="table_center">Active/Deactive </th><!--
                                                    <th class="table_center">Branch Added Date</th>-->
                                                    <th class="table_center"> Name </th>
                                                    <th class="table_center">Designation </th>
                                                    <th class="table_center">Email  </th>

                                                    <th class="table_center">Mobile No</th>
                                                    <th class="table_center">Address</th>


                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% int j = 0;
                                                    AdminDao aa = new AdminDao();
                                                    ExternalAccountDao bd = new ExternalAccountDao();
                                                    Branch b = new Branch();
                                                    List<ExternalAccount> c = bd.getAccountList(admin);
                                                    for (ExternalAccount p : c) {
                                                        j++;

                                                %>
                                                <tr>
                                            <input type="hidden" value="<%=p.getId()%>" id="prd_id<%=j%>">
                                            <input type="hidden" value="<%=p.getAddress()%>" id="prd_add<%=j%>">
                                            <td class="table_center"><%=j%> </td>
                                            <td class="table_center"><a href="#myModal2" role="button" data-toggle="modal" data-id="<%=j%>"><i id="<%=j%>" class="fa-2x glyphicon glyphicon-edit edit_prd1"></i></a></td>

                                            <%
                                                if (p.getActive().equals("1")) {
                                            %>
                                            <td class="table_center">Active </td>
                                            <form action="../../AccountAcive" method="post">
                                                <input type="hidden" name="adminid" name="adminid" value="<%=p.getId()%>">
                                                <input type="hidden" name="status" name="status" value="1" >


                                                <td class="table_center"><button type="submit" class="btn btn-round btn-danger btn-xs">Deactivate</button></td>
                                            </form>
                                            <%} else {%>
                                            <td class="table_center">Deactive </td>
                                            <form action="../../AccountAcive" method="post">
                                                <input type="hidden" name="adminid" name="adminid" value="<%=p.getId()%>">
                                                <input type="hidden" name="status" name="status" value="2" >

                                                <td class="table_center"><button type="submit" class="btn btn-round btn-success btn-xs">Activate</button></td>
                                            </form>
                                            <% }%>



                                            <td class="table_center" id="prd_name<%=j%>"><%=p.getAccountHolderName()%></td> 

                                            <td class="table_center" id="admin_designation<%=j%>"><%=p.getDesignation()%></td> 
                                            <td class="table_center" id="admin_email<%=j%>"><%=p.getEmail()%></td> 
                                            <td class="table_center" id="admin_mob<%=j%>"><%=p.getMobileno()%></td> 
                                            <td class="table_center" ><%=p.getAddress()%></td> 



                                            </tr> 
                                            <%}
                                            %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="example-modal">
                    <div class="modal" id="myModal2">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="../../UpdateExternalAcount" name="update" class="form-horizontal form-label-left">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">Edit Account</h4>
                                    </div>
                                    <input type="hidden" id="modal_prd_id1" name="modal_prd_id1">
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Account Holder Name<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_prd_name"  name="modal_prd_name" readonly="" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Designation <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_admin_name"  name="modal_admin_name" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname"> Email<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="email" id="modal_admin_email"  name="modal_admin_email" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Mobile No<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_admin_mob" maxlength="10" onkeypress="return alpha2(event)"  name="modal_admin_mob" required="required" class="form-control col-md-7 col-xs-12 priceup">
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Address  <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="modal_prd_add"  name="modal_prd_add" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>




                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" id="updateProduct"   >Update</button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                </div>
                <!-- /page content -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" style="margin-right: -240px" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Create Employee Account</h4>
                            </div>
                            <form class="form-horizontal form-label-left input_mask" action="../../ExternalAccountSave" id="myFormForAccount" data-parsley-vdalidate>

                                
                                
                                <div class="modal-body">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Account Holder Name<span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="First_Name" name="First_Name" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                    <br>
                                    <!--          <p>Some text in the modal.</p>-->
                                </div>
                                <div class="modal-body">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">Mobile No. <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="Account_Mobile_No" name="Account_Mobile_No" required="required" class="form-control col-md-7 col-xs-12" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                    </div>
                                    <!--          <p>Some text in the modal.</p>-->
                                </div>
                                <br>
                                <div class="modal-body">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email-id">Email Id <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="Account_Email_Id"  name="Account_Email_Id" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                                    </div>
                                    <!--          <p>Some text in the modal.</p>-->
                                </div>
                                  <br>
                                <div class="modal-body">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email-id">Designation <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="Account_Email_Id"  name="Account_Email_Id" class="form-control col-md-7 col-xs-12" type="email" name="middle-name">
                                    </div>
                                    <!--          <p>Some text in the modal.</p>-->
                                </div>
                                <br>
                                <div class="modal-body">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Address <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <textarea id="AccountAddress" name="AccountAddress" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text"></textarea>
                                    </div>
                                    <br>
                                    <br>
                                    <br>
                                    <!--          <p>Some text in the modal.</p>-->
                                </div>

                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <!--                          <p><button class="btn btn-primary" type="button">Cancel</button></p>-->
                                        <table>
                                            <tr>
                                                <td> <button class="btn btn-primary" type="reset">Reset</button></td>
                                                <td> <button type="submit" id="accbtn" class="btn btn-success">Submit</button></td>


                                            </tr>
                                        </table>



                                    </div>
                                </div>
                            </form>
                            <br>
                            <br>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" style="width:20%" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>
          <script src="../production/js/jquery.formError.js" type="text/javascript"></script>
     
        <script type="text/javascript">
                                            $('#document').ready(function() {



                                                $('.edit_prd1').click(function(event) {
                                                    var i = this.id;
                                                    var j = $('#prd_id' + i).val();


                                                    $('#modal_prd_id1').val($('#prd_id' + i).val());


                                                    $('#modal_prd_add').val($('#prd_add' + i).val());

                                                    $('#modal_prd_name').val($('#prd_name' + i).text());

                                                    $('#modal_admin_name').val($('#admin_designation' + i).text());


                                                    $('#modal_admin_mob').val($('#admin_mob' + i).text());


                                                    $('#modal_admin_email').val($('#admin_email' + i).text());



                                                });


                                            });

        </script>
        
        
            <script type="text/javascript">
            $(document).ready(
                    function()
                    {

                        $("#AccountAddress").change(validate1.controls.AccountAddress);
                        $("#First_Name").change(validate1.controls.First_Name);
                        $("#Account_Mobile_No").keyup(validate1.controls.Account_Mobile_No);
                      
      
                        
                        
                        $("#accbtn").click(
                                function(event)
                                {
                                    event.preventDefault();

                                    if (validate1.all())
                                    {
                                        document.getElementById("myFormForAccount").submit();
                                    }
                                });
                                
                                  
                   



                    });

            var validate1 =
                    (function()
                    {


                        var all =
                                function()
                                {
                                    var invalidControls = [];

                                    var i = 0;
                                    for (var controlValidationMethod in validate1.controls)
                                    {


                                        if (!validate1.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
                                        {
                                            invalidControls.push(controlValidationMethod);
                                        }
                                    }

                                    if (invalidControls.length > 0)
                                    {
                                        // Set focus on the first erroneous control
                                        $("#" + invalidControls[0]).focus();
                                    }
                                    return invalidControls.length == 0;
                                };

                        var controls =
                                {
                                    Account_Mobile_No:
                                            function()
                                            {
//                                                                                 
                                                var $input = $(this);
                                                var isValid = true;
                                                var s = $input.val();
                                                if ($input.val() === "")
                                                {
                                                    $input.formError("Please enter a Contact Number");
                                                    isValid = false;
                                                }
                                                else if ($input.val().length > 10)
                                                {
                                                    $input.formError("Contact Number cannot be greater than 10 Digit");
                                                    isValid = false;
                                                }
                                                else if (s[0] != 6 && s[0] != 7 && s[0] != 8 && s[0] != 9)
                                                {




                                                    $input.formError("Mobile No Start From 6, 7, 8, 9");
                                                    isValid = false;
                                                }
                                                else
                                                {
                                                    // Valid, remove any existing form error message for this input
                                                    $input.formError({remove: true});
                                                }

                                                return isValid;
                                            },
                                    First_Name:
                                            function()
                                            {
//                                                                                    alert("3");
                                                var $input = $(this);
                                                var isValid = true;

                                                if ($input.val() === "")
                                                {
                                                    $input.formError("Please Enter First Name ");
                                                    isValid = false;
                                                }

                                                else
                                                {
                                                    // Valid, remove any existing form error message for this input
                                                    $input.formError({remove: true});
                                                }

                                                return isValid;
                                            },
                                    AccountAddress:
                                            function()
                                            {
//                                                                                    alert("4");
                                                var $input = $(this);
                                                var isValid = true;

                                                if ($input.val() === "")
                                                {
                                                    $input.formError("Please Enter Address ");
                                                    isValid = false;
                                                }

                                                else
                                                {
                                                    // Valid, remove any existing form error message for this input
                                                    $input.formError({remove: true});
                                                }

                                                return isValid;
                                            }









                                };

                        return {
                            "all": all,
                            "controls": controls};
                    })();


         








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