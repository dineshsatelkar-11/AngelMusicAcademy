<%@page import="com.accede.angel.sell.dao.SellPaymentHistoryDao"%>
<%@page import="com.accede.angel.sell.model.SellPaymentHistory"%>
<%@page import="com.accede.angel.sell.model.SellPaymentHistory"%>
<%@page import="com.accede.angel.sell.dao.CustomerSaleDAO"%>
<%@page import="com.accede.angel.sell.model.CustomerSale"%>
<%@page import="com.accede.angel.admin.model.PackageCourse"%>
<%@page import="com.accede.angel.admin.dao.PackageDao"%>
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
                                        <h2>Paid Amount </h2>
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
                                        <form  method="get" action="../../AddPayment" id="demo-form2" onsubmit="return valid();" data-parsley-vdalidate class="form-horizontal form-label-left">

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

                                                String purchaseid = request.getParameter("purchaseid");
                                                System.out.println("purchaseid" + purchaseid);
                                                int saleid = Integer.parseInt(purchaseid);
                                                CustomerSale customersale = new CustomerSale();
                                                CustomerSaleDAO purchase = new CustomerSaleDAO();
                                                customersale = purchase.getpurchaseByID(saleid);


                                            %>
                                            
                                            
                                            <input type="hidden" id="sellid" name="sellid" value="<%=customersale.getId()%>">
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="branchname">Customer Name <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="Package"  readonly name="Package" value="<%=customersale.getCustomername()%>" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>



                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminEmail"> Total Billing Amount <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" readonly value="<%=customersale.getGrandtotal() - customersale.getDiscount_amount() - customersale.getOther_charges()%>" id="Fee" name="Fee" placeholder="Package Fee" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminEmail">Advance Amount <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="Fee" name="Fee" readonly value="<%=customersale.getAdvance_Amount()%>" placeholder="Package Fee" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminEmail">Total Paid Amount <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="Fee" name="Fee" readonly="" value="<%=customersale.getPaidamt()%>" placeholder="Package Fee" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminEmail">Balance Amount <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="Fee" name="Fee" readonly value="<%=customersale.getBalamt()%>" placeholder="Package Fee" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminEmail">Paid Amount <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="PaidAmount" name="PaidAmount"   placeholder="Paid Amount" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                                <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adminEmail">Next Payment Date <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="date" id="nextpaymentdate" name="nextpaymentdate"   placeholder="Paid Amount"   class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                    <!--<button class="btn btn-primary"  type="button">Cancel</button>-->
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button  type="submit" class="btn btn-success"  >Submit</button>
                                                </div>
                                            </div>



                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Payment History Details </h2>   
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
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Sr No</th>
                                                    <th class="table_center">Payment Date</th>
                                                    <th class="table_center">Paid Amount </th>



                                                </tr>
                                            </thead>
                                            <tbody>

                                                <% int j = 0;
                                                  
                                                  
                                                    List<SellPaymentHistory> c = new SellPaymentHistoryDao().getAllSellPaymentHistory(customersale);
                                                    for (SellPaymentHistory p : c) {
                                                        j++;
String date3 = DATE_FORMAT.format(p.getDate());
                                                %>
                                                <tr>
                                            
                                            <td class="table_center"><%=j%> </td>


                                            <td class="table_center" ><%=date3%></td> 
                                            <td class="table_center" ><%=p.getPaidamt()%></td> 
                                         



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


                <!-- footer content -->
                <%@ include file = "../comman_files/BranchFooter.jsp" %>
                <!-- /footer content -->
            </div>
        </div>
        <script src="../production/js/Alertajax.js" type="text/javascript"></script>
        <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
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
            $('#adminMobileNo').blur(function() {

                var contact = $('#adminMobileNo').val().length;
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
                        inputValidator: function(value) {
                            return new Promise(function(resolve, reject) {
                                if (value.length == 10)
                                {

                                    $('#adminMobileNo').val(value);
                                    resolve()
                                } else {
                                    reject('You need to Enter Mobile No :)')
                                }
                            })
                        }
                    }).then(function(result) {
                        swal({
                            type: 'success',
                            html: 'You Enter ' + result
                        })
                    })


                }
            });

            function valid()
            {
                var contact = $('#adminMobileNo').val().length;
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
                        inputValidator: function(value) {
                            return new Promise(function(resolve, reject) {
                                if (value.length == 10)
                                {

                                    $('#adminMobileNo').val(value);
                                    resolve()
                                } else {
                                    reject('You need to Enter Mobile No :)')
                                }
                            })
                        }
                    }).then(function(result) {
                        swal({
                            type: 'success',
                            html: 'You Enter ' + result
                        })
                    })

                    return false;
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
                $('#branch_name').hide();
                $('#branch_Address').hide();
                $('#branch_Address1').hide();
                $('#branch_Address2').hide();
                $('#admin_Name').hide();


//                $("#sub").click(function(event) {
//                    var branchname = $('#branchname').val();
//                    var branchAddress = $('#branchAddress').val();
//                    var branchAddress1 = $('#branchAddress1').val();
//                    var branchAddress2 = $('#branchAddress2').val();
//                    var format = /[ !@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
//                    if ((format.test(branchname))) {
//
//                        var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                        jPrompt('You Entered:', branchname, msg, function(r) {
//
//                            if (r) {
////                            alert('You entered ' + branchname);
//                                $('#branchname').val(r);
//                                if ((format.test(r))) {
//
//                                    var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                                    jPrompt('You Entered:', branchname, msg, function(s) {
//
//                                        if (s) {
//                                            $('#branchname').val(r);
//                                            document.getElementById('demo-form2').submit();
//                                        }
//                                    })
//                                }
//                                else
//                                {
//                                    document.getElementById('demo-form2').submit();
//                                }
//
//
//                            }
//                        })
//                    } else {
//
//
//                        if (branchAddress.matches(".*[a-z].*")) {
//                            if (branchAddress1.matches(".*[a-z].*")) {
//                                if (branchAddress2.matches(".*[a-z].*")) {
//
//                                    document.getElementById('demo-form2').submit();
//                                }
//                                else
//                                {
//                                    var msg = "The Branch Address  has No characters. \nThese are not allowed.\n"
//
//                                    jPrompt('You Entered:', branchAddress2, msg, function(r) {
//
//                                        if (r) {
////                            alert('You entered ' + branchname);
//                                            $('#branchAddress2').val(r);
//                                            if (r.matches(".*[a-z].*")) {
//                                                document.getElementById('demo-form2').submit();
//
//                                            }
//                                            else
//                                            {
//                                                var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                                                jPrompt('You Entered:', r, msg, function(s) {
//
//                                                    if (s) {
//                                                        $('#branchAddress2').val(s);
//                                                        document.getElementById('demo-form2').submit();
//                                                    }
//                                                })
//                                            }
//
//
//
//                                        }
//                                    })
//                                }
//
//                            }
//                            else
//                            {
//                                var msg = "The Branch Address  has No characters. \nThese are not allowed.\n"
//
//                                jPrompt('You Entered:', branchAddress1, msg, function(r) {
//
//                                    if (r) {
////                            alert('You entered ' + branchname);
//                                        $('#branchAddress1').val(r);
//                                        if (r.matches(".*[a-z].*")) {
//                                            document.getElementById('demo-form2').submit();
//
//                                        }
//                                        else
//                                        {
//                                            var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                                            jPrompt('You Entered:', r, msg, function(s) {
//
//                                                if (s) {
//                                                    $('#branchAddress1').val(s);
//                                                    document.getElementById('demo-form2').submit();
//                                                }
//                                            })
//                                        }
//
//
//
//                                    }
//                                })
//                            }
//                        }
//                        else
//                        {
//                            var msg = "The Branch Address  has No characters. \nThese are not allowed.\n"
//
//                            jPrompt('You Entered:', branchAddress, msg, function(r) {
//
//                                if (r) {
////                            alert('You entered ' + branchname);
//                                    $('#branchAddress').val(r);
//                                    if (r.matches(".*[a-z].*")) {
//                                        document.getElementById('demo-form2').submit();
//
//                                    }
//                                    else
//                                    {
//                                        var msg = "The Branch Name has special characters. \nThese are not allowed.\n"
//
//                                        jPrompt('You Entered:', r, msg, function(s) {
//
//                                            if (s) {
//                                                $('#branchAddress').val(s);
//                                                document.getElementById('demo-form2').submit();
//                                            }
//                                        })
//                                    }
//
//
//
//                                }
//                            })
//                        }
//
//                    }
//                });
                $(".priceup").keypress(function(event) {
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
    </body>
</html>