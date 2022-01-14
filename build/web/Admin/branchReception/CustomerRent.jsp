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
   
     <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>
 

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
               
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
            

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div role="main">
                    <div class="">



                        <div class="row">



                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Rent Form<small>new Customer</small></h2>


                                    </div>


                                    <div class="x_content">
                                        <%     AdmissionDao cd = new AdmissionDao();
                                            int id = Integer.parseInt(request.getParameter("accountid"));
                                            CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                                            CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(id);


                                        %>
                                        <form class="form-horizontal form-label-left input_mask" action="../../CustomerRentServlet" id="CustRentForm" data-parsley-vdalidate>
                                            <input type="hidden" id="customerAccountid" name="customerAccountid" value="<%=id%>">
                                            <input type="hidden" id="sessionidd" name="sessionidd" value="<%=sessionidd%>">

                                            <div class="row">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="fname" name="fname" onkeypress="return alpha(event)" value="<%=CustomerAccount.getName()%>" placeholder="First Name" class="form-control">

                                                </div>

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="contact" readonly="" value="<%=CustomerAccount.getMobileNo()%>" name="contact" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="email" id="email" name="email" value="<%=CustomerAccount.getEmail()%>" placeholder="Email" class="form-control">
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                    <textarea id="address" placeholder="Address" required="required" class="form-control" name="address" data-parsley-trigger="keyup" data-parsley-minlength="4" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                              data-parsley-validation-threshold="4"><%=CustomerAccount.getAddress()%></textarea>
                                                </div>
                                            </div>



                                            <div class="row">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <%
                                                     if( CustomerAccount.getIdProofType() != null)
                                                     {
                                                  if(CustomerAccount.getIdProofType().equals("NA") )
                                                   {
                                                    %>
                                                    <select class="form-control" required="" id="proof" name="proof">
                                                        <option value="">Type Of Id proof</option>
                                                        <option value="Pan Card">Pan Card</option>
                                                        <option value="Adhar Card">Adhar Card</option>
                                                        <option value="Driving License">Driving License</option>
                                                        <option value="Election Card">Election Card</option>
                                                    </select>
                                                    <%}else{%>
                                                    
                                                    <input type="text" id="proof" name="proof" required="" value="<%=CustomerAccount.getIdProofType()%>" readonly placeholder="ID Number" class="form-control">
<%}}else{%>
    <select class="form-control" required="" id="proof" name="proof">
                                                        <option value="">Type Of Id proof</option>
                                                        <option value="Pan Card">Pan Card</option>
                                                        <option value="Adhar Card">Adhar Card</option>
                                                        <option value="Driving License">Driving License</option>
                                                        <option value="Election Card">Election Card</option>
                                                    </select><%}%>
                                                    
                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <%
                                                     if( CustomerAccount.getIdProofType() != null)
                                                     {
                                                   if(CustomerAccount.getIdProofType().equals("NA") )
                                                   {
                                                    %>
                                                    <input type="text" id="idnumber" name="idnumber" required="" placeholder="ID Number" class="form-control">
                                                    <%}else{%><input type="text" id="idnumber" name="idnumber" value="<%=CustomerAccount.getCustomerIdProof()%>" readonly="" required="" placeholder="ID Number" class="form-control">
<%}}else{%>
  <input type="text" id="idnumber" name="idnumber" required="" placeholder="ID Number" class="form-control">
                                                  <%}%>
                                                </div>

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="noofdays" name="noofdays"  placeholder="No. of Days" class="form-control">

                                                </div>
                                            </div>
                                            <div id="FetchAmount" >


                                                <table id="datatable-checkbox"  class="table table-striped table-bordered bulk_action">
                                                    <thead >
                                                        <tr>
                                                            <th>
                                                            <th><input type="checkbox" id="check-all"  class="flat"></th>
                                                            </th>
                                                            <th>Instrument Name</th>
                                                            <th>Instrument Cost</th>
                                                            <th>No of Days</th>
                                                            <th>Total</th>

                                                        </tr>
                                                    </thead>


                                                </table>

                                                <div class="row" >
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <p><strong>   Total Amount:</strong></p>
                                                        <input value="0" type="text" readonly="" id="totalamt" name="totalamt" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Discount in %:</strong></p>
                                                            <input value="0"  type="text" readonly id="discper" name="discper" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Discount in Amount:</strong></p>
                                                            <input value="0" readonly type="text" id="discamt" name="discamt" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div>

                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <p><strong>   Final Amount after Discount:</strong></p>
                                                        <input value="0" type="text" readonly="" id="FinalAmount" name="FinalAmount" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                    </div>


                                                </div>
                                                <div class="row" >

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Deposit Amount:</strong></p>
                                                            <input value="0" type="text" readonly id="Deposit" name="Deposit" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Payment Type:</strong></p>
                                                            <select class="form-control" required=""  id="paymode" name="paymode">
                                                                <option value="">Select Payment Type</option>
                                                                <option value="Card">Card</option>
                                                                <option value="Cash">Cash</option>
                                                                <option value="Paytm">Paytm</option>
                                                                <option value="Net Banking">Net Banking</option>
                                                                <option value="Net Banking">Cheque</option>
                                                            </select> </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Paid By Customer:</strong></p>
                                                            <input value="0" readonly="" type="text" id="Paid_ByCust" name="Paid_ByCust" class="form-control" >

                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Return By Shop:</strong></p>
                                                            <input value="0" readonly="" type="text" id="Return_by_Shop" name="Return_by_Shop" class="form-control" >

                                                        </div>

                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <p><strong>   Return Date & Time:</strong></p>
                                                        <input  type="date" readonly="" id="Return_by_Date" name="Return_by_Date" class="form-control" >
                                                    </div>


                                                </div>
                                                <input value="0" readonly="" type="hidden" id="amountinword" name="amountinword"  class="form-control" >
  <input value="0" type="hidden" id="selectedchekbox" name="selectedchekbox"  class="form-control" >
                                              
                                            </div>   <div class="ln_solid"></div>

                                            <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                    <button type="button" class="btn btn-primary">Cancel</button>
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" id="CustRentFormbtn" class="btn btn-success">Submit</button>
                                                </div>
                                            </div>

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

        
        
      
   <%@ include file = "JavaScriptFile.jsp" %>
        
        <script type="text/javascript">

                                                                function alpha(e) {
                                                                    var k;
                                                                    document.all ? k = e.keyCode : k = e.which;
                                                                    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8);
                                                                }



        </script>
        <script type="text/javascript">
                                                                $(document).ready(
                                                                        function()
                                                                        {
                                                                            $("#fname").change(validate.controls.fname);
                                                                            $("#idnumber").change(validate.controls.idnumber);
                                                                            $("#paymode").change(validate.controls.paymode);
                                                                            $("#proof").change(validate.controls.proof);
                                                                            $("#noofdays").change(validate.controls.noofdays);
                                                                            $("#Deposit").change(validate.controls.Deposit);
                                                                            $("#Address").change(validate.controls.Address);
                                                                            $("#email").change(validate.controls.email);
                                                                            $("#totalamt").change(validate.controls.totalamt);

                                                                            $("#CustRentFormbtn").click(
                                                                                    function(event)
                                                                                    {


                                                                                        event.preventDefault();

                                                                                        if (validate.all())
                                                                                        {



                                                                                            document.getElementById("CustRentForm").submit();

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
                                                                                        noofdays:
                                                                                                function()
                                                                                                {
                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "")
                                                                                                    {
                                                                                                        $input.formError("Please enter a No of Days");
                                                                                                        isValid = false;
                                                                                                    }
                                                                                                    else if ($input.val() == 0)
                                                                                                    {

                                                                                                        $input.formError("Enetr No of Days ");
                                                                                                        isValid = false;
                                                                                                    }

                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $input.formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        Deposit:
                                                                                                function()
                                                                                                {
                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "")
                                                                                                    {
                                                                                                        $input.formError("Please enter a name");
                                                                                                        isValid = false;
                                                                                                    }
                                                                                                    else if ($input.val() == 0)
                                                                                                    {

                                                                                                        $input.formError("Enetr Deposit Amount");
                                                                                                        isValid = false;
                                                                                                    }

                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $input.formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        totalamt:
                                                                                                function()
                                                                                                {
                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                  if ($input.val() == 0)
                                                                                                    {

                                                                                                        $input.formError("Select Atleast One Instrument");
                                                                                                        isValid = false;
                                                                                                    }

                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $input.formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        fname:
                                                                                                function()
                                                                                                {

                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "" || $input.val() == undefined)
                                                                                                    {

                                                                                                        $input.formError("Please enter a name");
                                                                                                        isValid = false;
                                                                                                    }
                                                                                                    else if ($input.val().length > 15)
                                                                                                    {
                                                                                                        $input.formError("Name cannot be greater than 15 characters long");
                                                                                                        isValid = false;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $input.formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        idnumber:
                                                                                                function()
                                                                                                {

                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "" || $input.val() == undefined)
                                                                                                    {

                                                                                                        $input.formError("Please enter a ID Number");
                                                                                                        isValid = false;
                                                                                                    }
                                                                                                  
                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $input.formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
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
                                                                                        proof:
                                                                                                function()
                                                                                                {

                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "")
                                                                                                    {
                                                                                                        $input.formError("Select ID Proof");
                                                                                                        isValid = false;
                                                                                                    }

                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $input.formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        address:
                                                                                                function()
                                                                                                {

                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "")
                                                                                                    {
                                                                                                        $input.formError("Please enter Address");
                                                                                                        isValid = false;
                                                                                                    }

                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $input.formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        email:
                                                                                                function()
                                                                                                {
                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "")
                                                                                                    {
                                                                                                        $input.formError("Please enter an email address");
                                                                                                        isValid = false;
                                                                                                    }
                                                                                                    else if (!_regex.emailAddressIsValid($input.val()))
                                                                                                    {
                                                                                                        $input.formError("Please enter a valid email address<br /> eg; name@example.com");
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




        <script type="text/javascript">
                                                                $(document).ready(function() {
                                                                    $('.dataTables_length').hide();

                                                                    $('#noofdays').keyup(function() {

                                                                        var noofdays = $('#noofdays').val();


                                                                        if (noofdays != "")
                                                                        {
                                                                            $.get("AjaxPages/RentInstrumentFetch.jsp", {noofdays: noofdays}, function(data) {
                                                                                //   alert('sucess');
                                                                                $('#FetchAmount').html(data);

                                                                            });
                                                                        }
                                                                    });





                                                                });
        </script>

    </body>
</html>