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
    <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('#document').ready(function() {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                viewMode: "years"
            });



        })
    </script>

    <script>
        function valid()
        {


            var paymenttype = document.getElementById('paymenttype').value;


            var paymode = document.getElementById('paymode').value;
            var paidAmount = document.getElementById('paidAmount').value;
            var datetimepicker1 = document.getElementById('datetimepicker1').value;

            $('#payment_mode_hide').hide();
            $('#payment_hide').hide();
            $('#payment_paid_hide').hide();
            $('#followupdate').hide();

            if (paymenttype == 0)
            {

                $('#payment_hide').show();
                $('#payment_mode_hide').hide();
                $('#payment_paid_hide').hide();
                $('#followupdate').hide();

                document.getElementById('paymenttype').focus();
                return false;
            }



            else if (paymode == 0)
            {

                $('#payment_hide').hide();
                $('#payment_mode_hide').show();
                $('#payment_paid_hide').hide();
                $('#followupdate').hide();

                document.getElementById('paymode').focus();
                return false;
            }

            else if (paidAmount == 0)
            {

                $('#payment_hide').hide();
                $('#payment_mode_hide').hide();
                $('#payment_paid_hide').show();
                $('#followupdate').hide();

                document.getElementById('paidAmount').focus();
                return false;
            }

            else if (datetimepicker1 == "")
            {

                $('#payment_hide').hide();
                $('#payment_mode_hide').hide();
                $('#payment_paid_hide').hide();
                $('#followupdate').show();

                document.getElementById('datetimepicker1').focus();
                return false;
            }
            else
            {
                $('#payment_mode_hide').hide();
                $('#payment_hide').hide();
                $('#payment_paid_hide').hide
                $('#followupdate').hide();


            }



        }

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
                        <div class="x_content">
                            <form action="../../UpdateStudentPayment" onsubmit="return valid()" class="form-horizontal form-label-left" novalidate method="get">


                                <%                                    long id = Long.parseLong(request.getParameter("asd"));
                                    AdmissionDao cd = new AdmissionDao();
                                    Admission admission = cd.getAdmissionByID(id);
                                    int i = 0;
                                    int j = admission.getNoofCourse();
                                    int l = admission.getPaymentmodecount();
                                    int coursefee = 0;
                                    for (int k = 0; k < j; k++) {
                                        if (k == 0) {
                                            int fee = admission.getCourseFee1();
                                            fee = fee * l;
                                            coursefee = coursefee + fee;
                                        } else if (k == 1) {
                                            int fee = admission.getCourseFee2();
                                            fee = fee * l;
                                            coursefee = coursefee + fee;
                                        } else if (k == 2) {
                                            int fee = admission.getCourseFee3();
                                            fee = fee * l;
                                            coursefee = coursefee + fee;
                                        } else if (k == 3) {
                                            int fee = admission.getCourseFee4();
                                            fee = fee * l;
                                            coursefee = coursefee + fee;
                                        } else if (k == 4) {
                                            int fee = admission.getCourseFee5();
                                            fee = fee * l;
                                            coursefee = coursefee + fee;
                                        }
                                    }
                                %>

                                <span class="section">Payment Info</span>
                                <input type="hidden" value="<%=admission.getAdmissionId()%>" id="studentid" name="studentid">
                                <div class="row">
                                    <div class="col-md-3">
                                        <center >Name</center>
                                        <input id="name" class="form-control col-md-7 col-xs-12" style="text-align: center;background-color: aqua" value="<%=admission.getFirstName()%>" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="both name(s) e.g Jon Doe" required="required" type="text"> 
                                    </div>
                                    <div class="col-md-3">
                                        <center >Previous Balance</center>
                                        <input type="text" id="pbal" name="pbal" readonly="" style="text-align: center;background-color: aqua" value="<%=admission.getRemaininFee()%>" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                    <div class="col-md-3">
                                        <center >Course Fee</center>
                                        <input type="text" id="Course_fee" readonly=""  style="text-align: center;background-color: aqua" value="<%=coursefee%>"  name="Course_fee"  class="form-control col-md-7 col-xs-12">
                                    </div>

                                    <div class="col-md-3">
                                        <center > <span id="payment_hide" style="color:red">Select Payment Type</span></center >
                                        <center >Select Payment Type</center>
                                        <select class="form-control row0" style="text-align: center" required="required" id="paymenttype" name="paymenttype">
                                            <option value="0">Select Payment Type</option>
                                            <option value="1">Class Fee</option>
                                            <option value="2">Previous Balance Fee</option>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <div class="row">

                                    <div class="col-md-3">
                                        <center >Total Amount</center>
                                        <input type="number" readonly="" style="text-align: center;background-color: aqua "  id="beforedisc" value="0" name="beforedisc" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                    </div>
                                    <div class="col-md-3">
                                        <center >Discount</center>
                                        <input type="number" style="text-align: center"  id="Discount" value="0" name="Discount" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12 row0">
                                    </div>
                                    <div class="col-md-3">
                                        <center >Discount Amount</center>
                                        <input type="number" readonly="" style="text-align: center;background-color: aqua" id="discAmount" value="0" name="discAmount" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12 row0">
                                    </div>
                                    <div class="col-md-3">
                                        <center >Final Amount </center>
                                        <input type="number" readonly="" style="text-align: center;background-color: aqua" id="totalAmount" value="0" name="totalAmount" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>


                                <br>
                                <div class="row">

                                    <div class="col-md-3">
                                        <center > <span id="payment_paid_hide" style="color:red">Enter Paid Amount</span></center >
                                        <center >Paid Amount</center>
                                        <input type="number" id="paidAmount" style="text-align: center"   value="0" name="paidAmount" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12 row0">
                                    </div>
                                    <div class="col-md-3">
                                        <center >Remaining Amount</center>
                                        <input type="number" readonly="" id="remaining_amount" style="text-align: center;background-color: aqua"  value="0" name="remaining_amount" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12">
                                    </div>
                                    <div class="col-md-3">
                                        <center > <span id="payment_mode_hide" style="color:red">Select Payment Type</span></center >
                                        <center >Select Payment Type</center>
                                        <select class="form-control" style="text-align: center" required="required" id="paymode" name="paymode">
                                            <option value="0">Select Payment Type</option>
                                            <option value="Card">Card</option>
                                            <option value="Cash">Cash</option>
                                            <option value="Paytm">Paytm</option>
                                            <option value="Net Banking">Net Banking</option>
                                            <option value="Net Banking">Cheque</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <div id="chequeno">
                                        <center >Cheque No/Transction No  </center>
                                        <input type="text" style="text-align: center"  placeholder="Cheque No/Transction No" name="chequeno" class="form-control"     id=""  required>
                                    </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">

                                        <input type="text" placeholder="Bank Name"  style="text-align: center"  name="bankname" class="form-control"   id="bankname"  required>   
                                    </div>
                                    <div class="col-md-6">
                                        <center > <span id="followupdate" style="color:red">Select Next Followup Date</span></center >
                                        <input type="text" id="datetimepicker1" required="" style="text-align: center"  name="duedate" placeholder="Next Follow Up Date" class="form-control">
                                    </div>
                                </div>


                                <div class="ln_solid"></div>
                              
                                <input type="hidden" value="" placeholder="Bank Name" name="amountinword" class="form-control"   id="amountinword"  required>
                            </form>
                        </div>
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

                                    </div>
                                    <div class="x_content">
                                        <!--                                        <p class="text-muted font-13 m-b-30">
                                                                                    The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                                                                                </p>-->
                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="table_center">Payment Date</th>
                                                    <th class="table_center">Print Details</th> 
                                                    <th class="table_center">Due Date</th> 
                                                    <th class="table_center">Payment Mode</th>
                                                    <th class="table_center">No of Course </th>
                                                    <th class="table_center">Admission Fee</th>
                                                    <th class="table_center">Previous Balance</th>
                                                    <th class="table_center">Total Course Fee</th>
                                                    <th class="table_center">Total Fee</th>
                                                    <th class="table_center">Discount Percentage</th>
                                                    <th class="table_center">Discount Amount</th>
                                                    <th class="table_center">Final Amount</th>
                                                    <th class="table_center">Advance Fee</th>
                                                    <th class="table_center">Remaining Amount</th>
                                                    <th class="table_center">Bank Name</th>
                                                    <th class="table_center">Cheque/Transction No</th>

                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%

                                                    for (StudentAccount p : admission.getStudentAccount()) {
                                                        i++;

                                                %>
                                                <tr>

                                                    <td class="table_center"><%=p.getPaymentDate()%> </td>
                                                    <%
                                                        if (i == 1) {
                                                    %>
                                                    <td class="table_center"><a href="Invoice_Cello.jsp?admissionid=<%=id%>" target="blank"><i class="glyphicon glyphicon-print"></i></a></td> 
                                                            <%} else {
                                                            %>
                                                    <td class="table_center"><a href="Perticular_invoice.jsp?admissionid=<%=id%>&invoiceid=<%=p.getAccountId()%>" target="blank"><i class="glyphicon glyphicon-print"></i></a></td> 
                                                            <%
                                                        }%>

                                                    <td class="table_center"><%=p.getDueDate()%></td> 
                                                    <td class="table_center"><%=p.getPaymentMode()%></td> 
                                                    <td class="table_center"><%=p.getCourse()%></td> 
                                                    <td class="table_center"><%=p.getAdmissonnfee()%></td> 
                                                    <td class="table_center"><%=p.getPreviousBalance()%></td> 
                                                    <td class="table_center"><%=p.getCoursetotalfee()%></td> 
                                                    <td class="table_center"><%=p.getTotalfee()%></td> 
                                                    <td class="table_center"><%=p.getDiscper()%></td> 
                                                    <td class="table_center"><%=p.getDisamount()%></td> 
                                                    <td class="table_center"><%=p.getFinalamount()%></td> 
                                                    <td class="table_center"><%=p.getTotaladvancedfee()%></td> 
                                                    <td class="table_center"><%=p.getTotalremfee()%></td> 
                                                    <td class="table_center"><%=p.getBankname()%></td> 
                                                    <td class="table_center"><%=p.getChequeno()%></td> 


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
        <script type="text/javascript">
                                $(document).ready(function() {
                                    $('#payment_mode_hide').hide();
                                    $('#payment_hide').hide();
                                    $('#payment_paid_hide').hide();
                                    $('#followupdate').hide();
                                    function onlyDigit(n)
                                    {

                                        var units = ['', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine'];
                                        var randomer = ['', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'];
                                        var tens = ['', 'Ten', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];
                                        var r = 0;
                                        var num = parseInt(n);
                                        var str = "";
                                        var pl = "";
                                        var tenser = "";
                                        while (num >= 1)
                                        {
                                            r = parseInt(num % 10);
                                            tenser = r + tenser;
                                            if (tenser <= 19 && tenser > 10)
                                            {
                                                str = randomer[tenser - 10];
                                            }
                                            else
                                            {
                                                if (pl == 0)
                                                {
                                                    str = units[r];
                                                }
                                                else if (pl == 1)
                                                {
                                                    str = tens[r] + " " + str;
                                                }
                                            }
                                            if (pl == 2)
                                            {
                                                str = units[r] + " Hundred " + str;
                                            }

                                            num = parseInt(num / 10);
                                            pl++;
                                        }
                                        return str;
                                    }




                                    function converAmount(amount)
                                    {
                                        var grandtotal = amount;

                                        var r = 0;
                                        var txter = grandtotal.toString();
                                        var sizer = txter.toString().length;
                                        var numStr = "";
                                        var n = parseInt(grandtotal);
                                        var places = 0;
                                        var str = "";
                                        var entry = 0;
                                        while (n >= 1)
                                        {
                                            r = parseInt(n % 10);
                                            if (places < 3 && entry == 0)
                                            {

                                                numStr = txter.substring(txter.toString().length - 0, txter.toString().length - 3) // Checks for 1 to 999.

                                                str = onlyDigit(numStr); //Calls function for last 3 digits of the value.

                                                entry = 1;
                                            }

                                            if (places == 3)
                                            {

                                                var size1 = txter.toString().length - 5;
                                                var size2 = txter.toString().length - 3;
                                                numStr = txter.substring(size1, size2)

                                                if (numStr != "")
                                                {
                                                    str = onlyDigit(numStr) + " Thousand " + str;
                                                }
                                            }

                                            if (places == 5)
                                            {

                                                numStr = txter.substring(txter.toString().length - 7, txter.toString().length - 5) //Substring for 5 place to 7 place of the string

                                                if (numStr != "")
                                                {
                                                    str = onlyDigit(numStr) + " Lakhs " + str; //Appends the word lakhs to it

                                                }
                                            }

                                            if (places == 6)
                                            {
                                                numStr = txter.substring(txter.toString().length - 9, txter.toString().length - 7)  //Substring for 7 place to 8 place of the string

                                                if (numStr != "")
                                                {
                                                    str = onlyDigit(numStr) + " Crores " + str;
                                                }
                                            }

                                            n = parseInt(n / 10);
                                            places++;
                                        }

                                        return str;

                                    }
                                    $('.row0').on('keyup change', function() {

                                        var paymenttype = $('#paymenttype').val();

                                        var Course_fee = $('#Course_fee').val();
                                        var pbal = $('#pbal').val();
                                        var totalAmount = $('#totalAmount').val();
                                        var paidAmount = $('#paidAmount').val();
                                        var Discount = $('#Discount').val();
                                        var beforedisc = $('#beforedisc').val();
                                        var discAmount = $('#discAmount').val();
                                        var remaining_amount = $('#remaining_amount').val();

                                        if (paymenttype == 1)
                                        {
                                            totalAmount = parseInt(Course_fee) + parseInt(pbal);
                                            $('#beforedisc').val(totalAmount);
                                            discAmount = parseInt(totalAmount) * Discount / 100;
                                            $('#discAmount').val(discAmount);
                                            totalAmount = parseInt(totalAmount) - parseInt(discAmount);

                                            $('#totalAmount').val(totalAmount);
                                            remaining_amount = parseInt(totalAmount) - parseInt(paidAmount);
                                            $('#remaining_amount').val(remaining_amount);
                                            $('#amountinword').val(converAmount(parseInt(paidAmount)));
                                        }
                                        else if (paymenttype == 2)
                                        {
                                            totalAmount = parseInt(pbal);
                                            $('#beforedisc').val(totalAmount);
                                            discAmount = parseInt(totalAmount) * Discount / 100;
                                            $('#discAmount').val(discAmount);
                                            totalAmount = parseInt(totalAmount) - parseInt(discAmount);

                                            $('#totalAmount').val(totalAmount);
                                            remaining_amount = parseInt(totalAmount) - parseInt(paidAmount);
                                            $('#remaining_amount').val(remaining_amount);
                                            $('#amountinword').val(converAmount(parseInt(paidAmount)));

                                        }
                                        else
                                        {

                                        }

                                    })
                                })

        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".hide_gst").hide();
                $(".hide_price").hide();
                $(".hideall").hide();
                $(".hide_qnt").hide();
                $(".hide_ship").hide();
                $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    viewMode: "years"
                });
                
                
                 $('#paymode').change(function () {

                    var paymode = $('#paymode').val();
                    $('#chequeno').show();
                    $('#bankname').show();
                    if (paymode == "Cash")
                    {
                        $('#chequeno').hide();
                        $('#bankname').hide();
                    }
                });

            })
        </script>>
        <style>

            .table_center{

                text-align: center;
            }

        </style>
    </body>
</html>