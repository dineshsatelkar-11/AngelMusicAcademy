<%@page import="com.accede.angel.admin.model.RepairDetails"%>
<%@page import="com.accede.angel.admin.model.Repair"%>
<%@page import="com.accede.angel.admin.dao.RepairDao"%>
<%@page import="com.accede.angel.admin.model.RentDetails"%>
<%@page import="com.accede.angel.admin.model.RentDetails"%>
<%@page import="com.accede.angel.admin.model.RentDetails"%>
<%@page import="com.accede.angel.admin.model.Rent"%>
<%@page import="com.accede.angel.admin.dao.RentDao"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.dao.PackageDao"%>
<%@page import="com.accede.angel.admin.model.PackageCourse"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.accede.angel.admin.dao.InstrumentDao"%>
<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>

<%@page import="com.accede.angel.admin.dao.UserDao"%>
<%@page import="com.accede.angel.admin.model.Instrument"%>

<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.AdminDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>DataTables | Gentelella</title>

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

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <%    if (session.getAttribute("printInvoiceID") != null) {
            long celloId = (Long) session.getAttribute("printInvoiceID");
            session.removeAttribute("printInvoiceID");
    %>
    <script>
        window.open("Invoice_Cello.jsp?admissionid=<%=celloId%>");</script>
        <%
            }


        %>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">      <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
             

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                    <div class="">



                        <div class="row">



                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                  
                                        <h2>Repair Update Form</h2>


                                  

                                    <div class="x_content">
                                        <%     AdmissionDao cd = new AdmissionDao();
                                            long id = Long.parseLong(request.getParameter("accountid"));
                                            RepairDao RepairDao = new RepairDao();
                                            Repair Repair = RepairDao.getRepairByID(id);


                                        %>
                                        <form class="form-horizontal form-label-left input_mask" action="../../CustRepairUpdate" id="CustRepairUpdate" data-parsley-vdalidate>
                                            <input type="hidden" id="repairid" name="repairid" value="<%=id%>">
                                            <div class="row">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="fname" name="fname" onkeypress="return alpha(event)" value="<%=Repair.getCustomerAccount().getName()%>" placeholder="First Name" class="form-control">

                                                </div>

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="contact" readonly="" value="<%=Repair.getCustomerAccount().getMobileNo()%>" name="contact" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="email" id="email" name="email" value="<%=Repair.getCustomerAccount().getEmail()%>" placeholder="Email" class="form-control">
                                                </div>

                                            </div>





                                            <div id="FetchAmount" >


                                                <table id="datatable-checkbox"  class="table table-striped table-bordered bulk_action  text-center">
                                                    <thead >
                                                        <tr >

                                                            <th>Instrument Name</th>
                                                            <th>Repairing Cost</th>
                                                            <th>Brand</th>
                                                            <th>Model</th>
                                                            <th>Remark</th>

                                                        </tr>
                                                    </thead>

                                                    <tbody>

                                                        <% int j = 0;
                                                            int totalamount = 0;
                                                            int disamount = 0;
                                                            int Finalamount = 0;
                                                            int bal = 0;

                                                            for (RepairDetails p : Repair.getRepairDetails()) {
                                                                j++;

                                                        %>
                                                        <tr  >

                                                            <td ><%=p.getInstrumentName()%></td>
                                                    <input type="hidden" id="amt<%=j%>" name="amt<%=j%>" value="<%=p.getInstrumentRepairCost()%>" >
                                                    <td><input type="text" class="amtchange" id="repaircost-<%=j%>" required="" name="repaircost<%=j%>" value="<%=p.getInstrumentRepairCost()%>" ></td>
                                                    <td><input type="text" id="brand<%=j%>" name="brand<%=j%>" value="<%=p.getInstrumentBrand()%>" ></td>
                                                    <td><input type="text" id="model<%=j%>" name="model<%=j%>" value="<%=p.getInstrumentModel()%>" ></td>
                                                    <td><input type="text" id="remark<%=j%>" name="remark<%=j%>" value="<%=p.getInstrumentModel()%>" ></td>

                                                    </tr>
                                                    <%
                                                            totalamount = totalamount + p.getInstrumentRepairCost();

                                                        }
                                                        disamount = totalamount * Repair.getDiscper() / 100;
                                                        Finalamount = totalamount - disamount;

                                                        bal = Repair.getPaid() - Finalamount;

                                                    %>
                                                    </tbody>

                                                </table>

                                                <div class="row" >
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <p><strong>   Total Amount:</strong></p>
                                                        <input  type="text" value="<%=totalamount%>" readonly="" id="totalamt" name="totalamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Discount in %:</strong></p>
                                                            <input value="<%=Repair.getDiscper()%>"  type="text"  id="discper" name="discper" maxlength="10" placeholder="Discount in Percenatge" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Discount in Amount:</strong></p>
                                                            <input value="<%=disamount%>"  type="text" id="discamt" name="discamt" maxlength="10" placeholder="Discount in Amount" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div>

                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <p><strong>   Final Amount after Discount:</strong></p>
                                                        <input value="<%=Finalamount%>" type="text" readonly="" id="FinalAmount" name="FinalAmount" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                    </div>


                                                </div>
                                                <div class="row" >

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">



                                                        <p><strong>   Payment Type:</strong></p>
                                                        <select class="form-control" required=""  id="paymode" name="paymode">
                                                            <option selected="" value="<%=Repair.getPaymode()%>"><%=Repair.getPaymode()%></option>
                                                            <option value="">Select Payment Type</option>
                                                            <option value="Card">Card</option>
                                                            <option value="Cash">Cash</option>
                                                            <option value="Paytm">Paytm</option>
                                                            <option value="Net Banking">Net Banking</option>
                                                            <option value="Net Banking">Cheque</option>
                                                        </select> 
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Paid By Customer:</strong></p>
                                                            <input value="<%=Repair.getPaid()%>" readonly="" type="text" id="Paid" name="Paid" maxlength="10" placeholder="Contact No." class="form-control" >

                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>  Balance:</strong></p>
                                                            <input value="<%=Repair.getBal()%>" readonly="" type="text" id="Bal" name="Bal" maxlength="10" placeholder="Contact No." class="form-control" >

                                                        </div>

                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <p><strong>   Return Date & Time:</strong></p>
                                                        <input  type="date"  value="<%=Repair.getDuedateSmsdate()%>" id="Return_by_Date" name="Return_by_Date" maxlength="10" placeholder="Contact No." class="form-control" >
                                                    </div>


                                                </div>
                                                <input value="0" readonly="" type="hidden" id="amountinword" name="amountinword"  class="form-control" >

                                            </div>   <div class="ln_solid"></div>
                                            <%
                                                if (Repair.isCloseRequest()) {
                                            %>
                                            <div class="form-group">
<!--                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                    <button type="button" class="btn btn-primary">Cancel</button>
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" id="CustRepairUpdatebtn" class="btn btn-success">Submit</button>
                                                </div>-->
                                            </div>
                                            <%}%>
                                        </form>
                                    </div>
                                    <div class="x_content">

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
        <%@ include file = "../comman_files/BranchFooter.jsp" %>
        <!-- /footer content -->



        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <script src="../production/js/jquery.formError.js" type="text/javascript"></script>
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

        <script type="text/javascript">

                                                            function alpha(e) {
                                                                var k;
                                                                document.all ? k = e.keyCode : k = e.which;
                                                                return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8);
                                                            }



        </script>

          <%@ include file = "JavaScriptFile.jsp" %>
        <script type="text/javascript">
                                                            $(document).ready(
                                                                    function()
                                                                    {

                                                                        $("#paymode").change(validate.controls.paymode);




                                                                        $("#CustRepairUpdatebtn").click(
                                                                                function(event)
                                                                                {


                                                                                    event.preventDefault();

                                                                                    if (validate.all())
                                                                                    {



                                                                                        document.getElementById("CustRepairUpdate").submit();

                                                                                    }
                                                                                });
                                                                    });

                                                            var validate =
                                                                    (function()
                                                                    {
                                                                        var _regex =
                                                                                {
                                                                                    emailAddressIsValid:
                                                                                            function(emailAddress)
                                                                                            {
                                                                                                // http://stackoverflow.com/questions/2855865/jquery-validate-e-mail-address-regex
                                                                                                var pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);

                                                                                                return pattern.test(emailAddress);
                                                                                            },
                                                                                    isWholeNumber:
                                                                                            function(age)
                                                                                            {
                                                                                                var pattern = new RegExp(/^\d+$/);

                                                                                                return pattern.test(age);
                                                                                            }
                                                                                };

                                                                        var all =
                                                                                function()
                                                                                {
                                                                                    var invalidControls = [];

                                                                                    var i = 0;
                                                                                    for (var controlValidationMethod in validate.controls)
                                                                                    {

                                                                                        if (!validate.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
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
                                                                                    paymode:
                                                                                            function()
                                                                                            {

                                                                                                var $input = $(this);
                                                                                                var isValid = true;

                                                                                                if ($input.val() === "")
                                                                                                {
                                                                                                    $input.formError("Please Select Payment Mode");
                                                                                                    isValid = false;
                                                                                                }

                                                                                                else
                                                                                                {
                                                                                                    // Valid, remove any existing form error message for this input
                                                                                                    $input.formError({remove: true});
                                                                                                }

                                                                                                return isValid;
                                                                                            },
                                                                                            
                                                                                           discper:
                                                                                            function()
                                                                                            {

                                                                                                var $input = $(this);
                                                                                                var isValid = true;

                                                                                                if ($input.val() === "")
                                                                                                {
                                                                                                    $input.formError("Please Enter Discount Percentage");
                                                                                                    isValid = false;
                                                                                                }

                                                                                                else
                                                                                                {
                                                                                                    // Valid, remove any existing form error message for this input
                                                                                                    $input.formError({remove: true});
                                                                                                }

                                                                                                return isValid;
                                                                                            }, discamt: function()
                                                                                            {

                                                                                                var $input = $(this);
                                                                                                var isValid = true;

                                                                                                if ($input.val() === "")
                                                                                                {
                                                                                                    $input.formError("Please Enter Discount Amount");
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

        <style>
            .alert {
                padding: 20px;
                background-color: #f44336;
                color: white;
                opacity: 1;
                transition: opacity 0.6s;
                margin-bottom: 15px;
            }

            .alert.success {background-color: #4CAF50;}
            .alert.info {background-color: #2196F3;}
            .alert.warning {background-color: #ff9800;}

            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }




            .validation{
                marging-top:100px;
            }



        </style>


        <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>


        <script type="text/javascript">
                                                            $(document).ready(function() {
                                                                $('.dataTables_length').hide();


                                                                $('.amtchange').keyup(function() {

                                                                    var idd = this.id;
                                                                    var amt = $("#" + idd).val();
                                                                    if(amt != "")
                                                                    {
                                                                    var res = idd.split("-");
                                                                    var repairamt = "amt" + res[1];
                                                                    var totalamt = $('#totalamt').val();
                                                                    var repaircost = $('#' + repairamt).val();
                                                                    var discper = $('#discper').val();
                                                                    totalamt = parseInt(totalamt) - parseInt(repaircost);
                                                                    totalamt = parseInt(totalamt) + parseInt(amt);
                                                                    var discamt = (parseInt(discper) / 100) * parseInt(totalamt);

                                                                    $('#totalamt').val(parseInt(totalamt));
                                                                    $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt));
                                                                    $('#discper').val(parseInt(discper));
                                                                    var Paid = $('#Paid').val();

                                                                    $('#discamt').val(parseInt(discamt));
                                                                    $('#Bal').val(parseInt(totalamt) - parseInt(discamt) - parseInt(Paid));

                                                                    $('#amountinword').val(converAmount(parseInt(Paid)));

                                                                    $('#' + repairamt).val(parseInt(amt));
                                                                    var repaircost = $('#' + repairamt).val();

                                                                    $("#discamt").formError({remove: true});


        }});

                                                                $('#discper').on('keyup change', function() {
                                                                    var discper = $('#discper').val();

                                                                    var isValid = true;

                                                                    if (discper === "")
                                                                    {
                                                                        discper = 0;

                                                                        $("#discper").formError("Enter Correct Discount Percentage ");
                                                                        isValid = false;
                                                                    }
                                                                    else
                                                                    {

                                                                        var totalamt = $('#totalamt').val();
                                                                        if (totalamt == "")
                                                                        {
                                                                            totalamt = 0;
                                                                        }
                                                                        var discamt = (discper / 100) * totalamt;

                                                                        $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt));
                                                                        $('#discamt').val(parseInt(discamt));

                                                                        var Paid = $('#Paid').val();
                                                                        if (Paid == "")
                                                                        {
                                                                            Paid = 0;
                                                                        }
                                                                        $('#discamt').val(parseInt(discamt));
                                                                        $('#Bal').val(parseInt(totalamt) - parseInt(discamt) - parseInt(Paid));

                                                                        $('#amountinword').val(converAmount(parseInt(Paid)));
                                                                        $("#discper").formError({remove: true});
                                                                    }
                                                                    return isValid;
                                                                });
                                                                $('#discamt').on('keyup change', function() {
                                                                    var discamt = $('#discamt').val();

                                                                    var isValid = true;

                                                                    if (discamt === "")
                                                                    {
                                                                        discamt = 0;

                                                                        $("#discamt").formError("Enter Correct Discount Amount ");
                                                                        isValid = false;
                                                                    }
                                                                    else
                                                                    {

                                                                        var totalamt = $('#totalamt').val();
                                                                        if (totalamt == "")
                                                                        {
                                                                            totalamt = 0;
                                                                        }
                                                                        var disper = (discamt / totalamt) * 100;

                                                                        $('#FinalAmount').val(parseInt(totalamt) - parseInt(discamt));
                                                                        $('#discper').val(parseInt(disper));
                                                                        var Paid = $('#Paid').val();
                                                                        if (Paid == "")
                                                                        {
                                                                            Paid = 0;
                                                                        }
                                                                        $('#discamt').val(parseInt(discamt));
                                                                        $('#Bal').val(parseInt(totalamt) - parseInt(discamt) - parseInt(Paid));

                                                                        $('#amountinword').val(converAmount(parseInt(Paid)));
                                                                        $("#discamt").formError({remove: true});
                                                                    }
                                                                    return isValid;
                                                                });
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

                                                            });
        </script>

    </body>
</html>