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
               
                    <%@ include file = "../comman_files/branchReceptionSidebar.jsp" %>
          

                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">
                


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
                                        <form class="form-horizontal form-label-left input_mask" action="../../StudentAdmissionServlet" id="StudentAdmissionForm" data-parsley-vdalidate>
                                            <input type="hidden" id="customerAccountid" name="customerAccountid" value="<%=id%>">
                                           
                                            <div class="row">
                                                <div class="col-md-8 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="fname" name="fname" value="<%=CustomerAccount.getName()%>" onkeypress="return alpha(event)" placeholder="First Name" class="form-control">

                                                </div>




<!--                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="lname" name="lname" onkeypress="return alpha(event)" placeholder="Last Name" class="form-control">

                                                </div>-->
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" class="form-control priceup row0" readonly="" value="Admission Fee-300"  id="adfee" name="adfee" placeholder="Enter Fee" required>
                                                    <input type="hidden" class="form-control priceup row0" value="300"  id="AdmissionFee" name="AdmissionFee" placeholder="Enter Fee" required>
                                                </div>
                                            </div>
                                            <div class="row">

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="contact" readonly="" value="<%=CustomerAccount.getMobileNo()%>" name="contact" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <input type="email" id="email" name="email" value="<%=CustomerAccount.getEmail()%>" placeholder="Email" class="form-control">
                                                </div>
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
                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                    <textarea id="address" placeholder="Address" required="required" class="form-control" name="address" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                              data-parsley-validation-threshold="10"><%=CustomerAccount.getAddress()%></textarea>
                                                </div>
                                            </div>

                                            <div class="row">

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <select class="form-control" id="Package" name="Package">
                                                        <option value="">Select Package</option>
                                                        <%

                                                            List<PackageCourse> allPackageCourse = new PackageDao().getPackageCourseForAdmission(admin);
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

                                                <div class="row">

                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group Days disable" >
                                                        
                                                           <p><strong>   Select Days:</strong></p>
                                                           
                                                           <select readonly id="Days" class="form-control">
                                                               <option value="">Select Days</option>
                                                           </select>
                                                        
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group Days" >
                                                         <p><strong>   Select Course:</strong></p>
                                                           
                                                         <select id="Days" class="form-control" >
                                                               <option value="">Select Course</option>
                                                         </select>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group Days" >
                                                         <p><strong>   Select Batch Time:</strong></p>
                                                           
                                                         <select id="Days" class="form-control">
                                                               <option value="">Select Batch Time</option>
                                                         </select>
                                                    </div></div>
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
                                                            <p><strong>   Disc in Amt:</strong></p>
                                                            <input value="0" readonly="" type="text" id="discamt" name="discamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div>

                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <p><strong>   Final Amt:</strong></p>
                                                        <input value="0" type="text" readonly="" id="discamt" name="discamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong>  Paid Amt:</strong></p>
                                                            <input value="0" readonly="" type="text" id="PaidAmount" name="PaidAmount" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 " style="padding: 0px">
                                                            <p><strong> Bal  Amt:</strong></p>
                                                            <input value="0"  readonly=""type="text" id="discamt" name="discamt" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                        </div> </div>

                                                </div>

                                            </div>

                                            <div class="ln_solid"></div>
                                             <input value="0" readonly="" type="hidden" id="amountinword" name="amountinword"  class="form-control" >

                                            <div class="form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3" >
                                               
                                                    <button type="button" class="btn btn-primary">Cancel</button>
                                                    <button class="btn btn-primary" type="reset">Reset</button>
                                                    <button type="submit" id="StdAdmbtn" class="btn btn-success">Submit</button>
                                                </div>
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



        <link href="New/fSelect.css" rel="stylesheet" type="text/css"/>

    
        <script src="New/fSelect.js" type="text/javascript"></script>

  
       
        <script type="text/javascript">
                                                                $(document).ready(
                                                                        function()
                                                                        {
                                                                            $("#fname").change(validate.controls.fname);
//                                                                            $("#lname").change(validate.controls.lname);
                                                                            $("#age").change(validate.controls.age);
                                                                            $("#email").change(validate.controls.email);
                                                                            $("#gender").change(validate.controls.gender);
                                                                            $("#contact").change(validate.controls.contact);
                                                                            $("#paymode").change(validate.controls.paymode);
                                                                            $("#PaidAmount").change(validate.controls.PaidAmount);
                                                                         
                                                                            $("#joindate").change(validate.controls.joindate);
                                                                            $("#address").change(validate.controls.address);
                                                                            $("#StdAdmbtn").click(
                                                                                    function(event)
                                                                                    {

                                                                                        event.preventDefault();

                                                                                        if (validate.all())
                                                                                        {



                                                                                            document.getElementById("StudentAdmissionForm").submit();

                                                                                        }
                                                                                    });
                                                                        })
                                                                        
    
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
    
    ;

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
                                                                                                           $('#amountinword').val(converAmount(parseInt($input.val())));
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
                                                                                                    else if ($input.val().length > 50)
                                                                                                    {
                                                                                                        $input.formError("Name cannot be greater than 50 characters long");
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
                                        var isValid = true;
                                        var $input = $(this);
                                        var currentYear = new Date().getFullYear() - 1;
                                        var currentMonth = new Date().getMonth();
                                        var currentDay = new Date().getDate();
                                        var joindate = $input.val();
                                        var res = joindate.split("-");
                                        if (res[0] > currentYear)
                                        {
                                            if (res[1] > currentMonth)
                                            {
                                                if (res[1] == currentMonth + 1)
                                                {

                                                    if (res[2] > currentDay-1)
                                                    {
                                                        $input.formError({remove: true});
                                                    } else {
                                                        $input.formError("Please Select Upcoming Date");
                                                        isValid = false;
                                                    }

                                                } else {
                                                    $input.formError({remove: true});
                                                }


                                            }


                                        }



                                        else {
                                            $input.formError("Please Select Upcoming Date");
                                            isValid = false;
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
//                                                                                        lname:
//                                                                                                function()
//                                                                                                {
//                                                                                                    var $input = $(this);
//                                                                                                    var isValid = true;
//
//                                                                                                    if ($input.val() === "")
//                                                                                                    {
//                                                                                                        $input.formError("Please enter a Last Name");
//                                                                                                        isValid = false;
//                                                                                                    }
//                                                                                                    else if ($input.val().length > 15)
//                                                                                                    {
//                                                                                                        $input.formError("Last Name cannot be greater than 15 characters long");
//                                                                                                        isValid = false;
//                                                                                                    }
//                                                                                                    else
//                                                                                                    {
//                                                                                                        // Valid, remove any existing form error message for this input
//                                                                                                        $input.formError({remove: true});
//                                                                                                    }
//
//                                                                                                    return isValid;
//                                                                                                },
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
                                                                                                        $(".Days").formError("Please Select " + noofday + " Days");
                                                                                                        isValid = false;
                                                                                                    }


                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $(".Days").formError({remove: true});
                                                                                                    }

                                                                                                    return isValid;
                                                                                                },
                                                                                        noofcours:
                                                                                                function()
                                                                                                {


                                                                                                    var isValid = true;
                                                                                                    var noofcours = $('#noofcours').val();

                                                                                                    var noofcourseselect = $('#noofcourseselect').val();

//                                                                                                    noofcours = parseInt(noofcours) + 1;
                                                                                                    if (noofcourseselect != noofcours)
                                                                                                    {
//                                                                                                        noofcours = parseInt(noofcours) - 1;
                                                                                                        $(".Courses").formError("Please Select " + noofcours + " Course");
                                                                                                        isValid = false;
                                                                                                    }


                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $(".Courses").formError({remove: true});
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
                                                                                                        $(".BatchTime").formError("Please Select " + noofBatchTimes + " Batch Times");
                                                                                                        isValid = false;
                                                                                                    }


                                                                                                    else
                                                                                                    {
                                                                                                        // Valid, remove any existing form error message for this input
                                                                                                        $(".BatchTime").formError({remove: true});
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
                                                                                                }
                                                                                       
                                                                                    };

                                                                            return {
                                                                                "all": all,
                                                                                "controls": controls};
                                                                        })();






        </script>
      <script type="text/javascript">

                                                                function alpha(e) {
                                                                    var k;
                                                                    document.all ? k = e.keyCode : k = e.which;
                                                                    return ((k > 64 && k < 91) || (k > 96 && k < 123) );
                                                                }



        </script>

   


      
   <%@ include file = "JavaScriptFile.jsp" %>


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