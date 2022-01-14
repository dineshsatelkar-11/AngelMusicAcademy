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
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
                </div>

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">



                        <div class="row">
                            <div class="col-md-12 col-xs-12 col-sm-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Admission Form<small>new Student</small></h2>


                                    </div>
                                    <div class="x_content">
                                        <%     AdmissionDao cd = new AdmissionDao();
                                            int id = Integer.parseInt(request.getParameter("accountid"));
                                            CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                                            CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(id);


                                        %>
                                        <form class="form-horizontal form-label-left input_mask" action="../../StudentAdmissionServlet" id="myForm1" data-parsley-vdalidate>
                                            <input type="hidden" id="customerAccountid" name="customerAccountid" value="<%=id%>">
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
                                                    <textarea id="address" placeholder="Address" required="required" value="<%=CustomerAccount.getAddress()%>" class="form-control" name="address" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                              data-parsley-validation-threshold="10"></textarea>
                                                </div>
                                            </div>
                                            <div class="row">

                                              
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <select class="form-control" required="" id="gender" name="gender">
                                                        <option value="">Select Gender</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                </div>


                                            </div>

                                            <div class="row">


                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group" id="BirthDate">
                                                    <p ><strong>   Birth Date:</strong></p>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 " style="padding: 0px">
                                                        <select class="form-control" id="day" name="day">
                                                            <option value="">Day</option>
                                                            <%                                                                            for (int q = 1; q < 32; q++) {%>
                                                            <option value="<%=q%>"><%=q%></option>
                                                            <%}%>

                                                        </select>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 " style="padding: 0px">
                                                        <select class="form-control" id="Month" name="Month">
                                                            <option value="">Month</option>
                                                            <option value="Jan">Jan</option>
                                                            <option value="Feb">Feb</option>
                                                            <option value="Mar">Mar</option>
                                                            <option value="Apr">Apr</option>
                                                            <option value="May">May</option>
                                                            <option value="Jun">Jun</option>
                                                            <option value="Jul">Jul</option>
                                                            <option value="Aug">Aug</option>
                                                            <option value="Sep">Sep</option>
                                                            <option value="Oct">Oct</option>
                                                            <option value="Nov">Nov</option>
                                                            <option value="Dec">Dec</option>

                                                        </select>
                                                    </div>

                                                    <div class="col-md-4 col-sm-12 col-xs-12 " style="padding: 0px">
                                                        <select class="form-control" id="Year" name="Year">
                                                            <option value="">Year</option>

                                                            <%

                                                                Date date = new Date();
                                                                Calendar calendar = new GregorianCalendar();
                                                                calendar.setTime(date);
                                                                int year = calendar.get(Calendar.YEAR);
                                                                year = year - 3;
                                                                for (int k = 1; k < 65; k++) {

                                                            %>

                                                            <option value="<%=year%>"><%=year%></option>
                                                            <%year = year - 1;
                                                                }%>

                                                        </select>
                                                    </div>

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p><strong>   Join Date:</strong></p>
                                                    <input type="date" id="joindate" name="joindate"  placeholder="Joining Date" class="form-control">
                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p><strong>   Payment Type:</strong></p>
                                                    <select class="form-control" required="" id="paymode" name="paymode">
                                                        <option value="">Select Payment Type</option>
                                                        <option value="Card">Card</option>
                                                        <option value="Cash">Cash</option>
                                                        <option value="Paytm">Paytm</option>
                                                        <option value="Net Banking">Net Banking</option>
                                                        <option value="Net Banking">Cheque</option>
                                                    </select>
                                                    <center > <span id="Pay_mode" style="color:red"> </span></center >
                                                </div>

                                            </div>
                                           

                                            <div class="row">

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <select class="form-control" id="Package" name="Package">
                                                        <option value="">Select Package</option>
                                                        <%

                                                            List<PackageCourse> allPackageCourse = new PackageDao().getPackageCourseByAdmin(admin);
                                                            for (PackageCourse p : allPackageCourse) {


                                                        %>

                                                        <option value="<%=p.getId()%>"><%=p.getPackagename()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div id="fetchpackage">
                                                    <div class="col-md-8 col-sm-12 col-xs-12 form-group">
                                                        <input type="text" id="email" readonly="" name="email" placeholder="Package Description" class="form-control">
                                                    </div>

                                                </div>

                                            </div>
                                            <div id="FetchAmount" >
                                                <div class="row" >
                                                    <input type="hidden" id="coursefee" value="0">
                                                    <input type="hidden" id="noofday" value="0">
                                                    <input type="hidden" id="noofcours" value="0">
                                                    <input type="hidden" id="noofBatchTimes" value="0">
                                                    <input type="hidden" id="noofcourseselect" name="noofcourseselect" value="0">
                                                    <input type="hidden" id="noofDaysselect" name="noofDaysselect" value="0">
                                                    <input type="hidden" id="noofBatchTimeselect" name="noofBatchTimeselect" value="0">

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Discount in %:</strong></p>
                                                            <input value="0" readonly="" type="text" id="discper" name="discper" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>   Discount in Amount:</strong></p>
                                                            <input value="0" readonly="" type="text" id="discamt" name="discamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div>

                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <p><strong>   Final Amount:</strong></p>
                                                        <input value="0" type="text" readonly="" id="discamt" name="discamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>  Paid Amount:</strong></p>
                                                            <input value="0" readonly="" type="text" id="PaidAmount" name="PaidAmount" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong> Balance  Amount:</strong></p>
                                                            <input value="0"  readonly=""type="text" id="discamt" name="discamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div> </div>

                                                </div>

                                            </div>

                                            <div class="ln_solid"></div><br><br><br><br><br>

                                            <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                    <button type="button" class="btn btn-primary">Cancel</button>
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" id="SubmitButton2" class="btn btn-success">Submit</button>
                                                </div>
                                            </div>

                                        </form>
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


        <!-- bootstrap-daterangepicker -->
        <script src="../vendors/moment/min/moment.min.js"></script>
        <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <script src="../production/js/jquery.formError.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- jQuery Smart Wizard -->
        <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
        <!-- Multiple Select Script -->
        <script src="../production/js/multipleselect.js" type="text/javascript"></script>
        <link href="../production/js/multiple_select.css" rel="stylesheet" type="text/css"/>
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
        <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

        <script type="text/javascript">

                                                                function alpha(e) {
                                                                    var k;
                                                                    document.all ? k = e.keyCode : k = e.which;
                                                                    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8);
                                                                }



        </script>

        <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
                                                                $(document).ready(
                                                                        function()
                                                                        {
                                                                            $("#fname").change(validate.controls.fname);
                                                                            $("#lname").change(validate.controls.lname);
                                                                            $("#age").change(validate.controls.age);
                                                                            $("#email").change(validate.controls.email);
                                                                            $("#gender").change(validate.controls.gender);
                                                                            $("#contact").change(validate.controls.contact);
                                                                            $("#paymode").change(validate.controls.paymode);
                                                                            $("#PaidAmount").change(validate.controls.PaidAmount);
                                                                            $("#Package").change(validate.controls.Package);
                                                                            $("#joindate").change(validate.controls.joindate);
                                                                            $("#address").change(validate.controls.address);
                                                                            $("#SubmitButton2").click(
                                                                                    function(event)
                                                                                    {

                                                                                        event.preventDefault();

                                                                                        if (validate.all())
                                                                                        {

                                                                                         

                                                                                              document.getElementById("myForm1").submit();

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
                                                                                        PaidAmount:
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

                                                                                                        $input.formError("Enetr Paid Amount");
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
                                                                                        gender:
                                                                                                function()
                                                                                                {
                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "")
                                                                                                    {
                                                                                                        $input.formError("Please Select Gender");
                                                                                                        isValid = false;
                                                                                                    }

                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $input.formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        joindate:
                                                                                                function()
                                                                                                {
                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;
                                                                                                    var currentYear = new Date().getFullYear() - 1;
                                                                                                    var currentMonth = new Date().getMonth();
                                                                                                    var currentDay = new Date().getDate() - 1;
                                                                                                    var joindate = $input.val();
                                                                                                    var res = joindate.split("-");

                                                                                                    if (!(res[0] > currentYear && res[1] > currentMonth && res[2] > currentDay))

                                                                                                    {
                                                                                                        $input.formError("Please Select Future Date");
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
                                                                                        Package:
                                                                                                function()
                                                                                                {
                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "")
                                                                                                    {
                                                                                                        $input.formError("Please Select Package");
                                                                                                        isValid = false;
                                                                                                    }

                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $input.formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        lname:
                                                                                                function()
                                                                                                {
                                                                                                    var $input = $(this);
                                                                                                    var isValid = true;

                                                                                                    if ($input.val() === "")
                                                                                                    {
                                                                                                        $input.formError("Please enter a Last Name");
                                                                                                        isValid = false;
                                                                                                    }
                                                                                                    else if ($input.val().length > 15)
                                                                                                    {
                                                                                                        $input.formError("Last Name cannot be greater than 15 characters long");
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
                                                                                        contact:
                                                                                                function()
                                                                                                {
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
                                                                                        noofday:
                                                                                                function()
                                                                                                {


                                                                                                    var isValid = true;
                                                                                                    var noofDaysselect = $('#noofDaysselect').val();
//                                                                                                    alert("noofDaysselect="+noofDaysselect);
                                                                                                    var noofday = $('#noofday').val();
//                                                                                                     alert("noofday="+noofday);
//                                                                                                    noofday = parseInt(noofday) + 1;
//                                                                                                       alert("noofday="+noofday);
                                                                                                    if (noofDaysselect != noofday)
                                                                                                    {
//                                                                                                        noofday = parseInt(noofday) - 1;
                                                                                                        $("#DropDownDays").formError("Please Select " + noofday + " Days");
                                                                                                        isValid = false;
                                                                                                    }


                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $("#DropDownDays").formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        noofcours:
                                                                                                function()
                                                                                                {


                                                                                                    var isValid = true;
                                                                                                    var noofcours = $('#noofcours').val();
                                                                                                    alert();
                                                                                                    var noofcourseselect = $('#noofcourseselect').val();
                                                                                                      alert("noofcours="+noofcours);
                                                                                                      alert("noofcourseselect="+noofcourseselect);
                                                                                                        alert();
//                                                                                                    noofcours = parseInt(noofcours) + 1;
                                                                                                    if (noofcourseselect != noofcours)
                                                                                                    {
//                                                                                                        noofcours = parseInt(noofcours) - 1;
                                                                                                        $("#DropDownCourse").formError("Please Select " + noofcours + " Course");
                                                                                                        isValid = false;
                                                                                                    }


                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $("#DropDownCourse").formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        noofBatchTimes:
                                                                                                function()
                                                                                                {


                                                                                                    var isValid = true;
                                                                                                    var noofBatchTimes = $('#noofBatchTimes').val();
                                                                                                    var noofBatchTimeselect = $('#noofBatchTimeselect').val();
//                                                                                                    noofBatchTimes = parseInt(noofBatchTimes) + 1;
                                                                                                    if (noofBatchTimeselect != noofBatchTimes)
                                                                                                    {
//                                                                                                        noofBatchTimes = parseInt(noofBatchTimes) - 1;
                                                                                                        $("#DropDownBatch").formError("Please Select " + noofBatchTimes + " Batch Times");
                                                                                                        isValid = false;
                                                                                                    }


                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $("#DropDownBatch").formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        BirthDate:
                                                                                                function()
                                                                                                {


                                                                                                    var isValid = true;

                                                                                                    var Year = $('#Year').val();
                                                                                                    var Month = $('#Month').val();
//                                                                                                    alert(Month);
                                                                                                    var day = $('#day').val();
                                                                                                    $("#day").formError({remove: true});
                                                                                                    $("#Year").formError({remove: true});
                                                                                                    $("#Month").formError({remove: true});
                                                                                                    $("#BirthDate").formError({remove: true});
                                                                                                    if (day == "")
                                                                                                    {
                                                                                                        $("#day").formError("Please Select Day ");

                                                                                                        isValid = false;
                                                                                                    }
                                                                                                    else if (Month == "")
                                                                                                    {
                                                                                                        $("#Month").formError("Please Select Month ");
                                                                                                        isValid = false;

                                                                                                    }
                                                                                                    else if (Year == "")
                                                                                                    {
                                                                                                        $("#Year").formError("Please Select Year ");
                                                                                                        isValid = false;
                                                                                                    }
                                                                                                    else if (Month === "Apr" || Month === "Jun" || Month === "Sep" || Month === "Nov")
                                                                                                    {

                                                                                                        if (day > 30)
                                                                                                        {

                                                                                                            $("#BirthDate").formError("Please Select Correct BirthDate ");
                                                                                                            isValid = false;
                                                                                                        }
                                                                                                    }
                                                                                                    else if (Month === "Feb")
                                                                                                    {
//                                                                                                        alert("Dinesh");
                                                                                                        if (day > 28)
                                                                                                        {
                                                                                                            var x = Year % 4;
                                                                                                            if (x == 0)
                                                                                                            {
                                                                                                                if (day != 29)
                                                                                                                {
                                                                                                                    $("#BirthDate").formError("Please Select Correct BirthDate ");
                                                                                                                    isValid = false;
                                                                                                                }
                                                                                                            } else
                                                                                                            {

                                                                                                                $("#BirthDate").formError("Please Select Correct BirthDate ");
                                                                                                                isValid = false;
                                                                                                            }
                                                                                                        }
                                                                                                    }


                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $("#Year").formError({remove: true});
                                                                                                        $("#Month").formError({remove: true});
                                                                                                        $("#day").formError({remove: true});

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




            .dropdown {
                position: absolute;
                top:50%;
                transform: translateY(-50%);
            }


            .dropdown  {
                margin-top: 15px ;
            }

            .dropdown dd ul {
                background-color: #fff;
                border: 0;
                color: #000000;
                /*display: none;*/
                left: 0px;
                padding: 2px 0px 2px 5px;
                position: absolute;
                /*                top: 2px;*/
                width: 280px;
                /*list-style: none;*/
                height: 100px;
                overflow: auto;
            }
            .validation{
                marging-top:100px;
            }



        </style>


        <script src="../production/js/Swal.js" type="text/javascript"></script>
        <link href="../production/css/SwalCss.css" rel="stylesheet" type="text/css"/>


        <script type="text/javascript">
                                                                $(document).ready(function() {

                                                                    $('#mob_email').blur(function() {

                                                                        var studEmail = $('#mob_email').val();
                                                                        $.get("StudentEnquiryAjax.jsp", {studEmail: studEmail}, function(data) {
                                                                            //   alert('sucess');
                                                                            $('#output').html(data);
                                                                        });
                                                                    });
                                                                    $('#Package').change(function() {

                                                                        var Package = $('#Package').val();
                                                                        var AdmissionFee = $('#AdmissionFee').val();
                                                                        if (Package != "")
                                                                        {
                                                                            $.get("AjaxPages/FetchPackage.jsp", {Package: Package}, function(data) {
                                                                                //   alert('sucess');
                                                                                $('#fetchpackage').html(data);

                                                                                $.get("AjaxPages/FetchAmount.jsp", {Package: Package, AdmissionFee: AdmissionFee}, function(data) {
                                                                                    //   alert('sucess');
                                                                                    $('#FetchAmount').html(data);
                                                                                });
                                                                            });
                                                                        }
                                                                    });





                                                                });
        </script>

    </body>
</html>