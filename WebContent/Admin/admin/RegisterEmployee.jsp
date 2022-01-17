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

                <%@ include file = "../comman_files/adminSideBarFile.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/adminTopBar.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div  role="main">



                    <div class="row">
                        <div class="col-md-12 col-xs-12 col-sm-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Employee Form<small>new Student</small></h2>


                                </div>
                                <div class="x_content">

                                    <form class="form-horizontal form-label-left input_mask" action="../../AddEmployee"  data-parsley-vdalidate>
                                        <div class="row">
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="name" name="name"  onkeypress="return alpha(event)" placeholder="First Name" class="form-control">

                                            </div>




                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="mobile" name="mobile" onkeypress="return alpha(event)" placeholder="Mobile No" class="form-control">

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="email" placeholder="Email" id="email" name="email" class="form-control">

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder=" Alternate No" id="alternateNo" name="alternateNo" class="form-control priceup">
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder="Permanent No" id="PermanentNo" name="PermanentNo" class="form-control priceup">

                                            </div>




                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder="Qualification" id="qualification" name="qualification" class="form-control">

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder=" Designation " id="Designation" name="Designation" class="form-control">

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder="salary" id="salary" name="salary" class="form-control priceup">
                                            </div>
                                        </div>

<!--                                        <div class="row">
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder="Permanent No" id="PermanentNo" required name="PermanentNo" class="form-control priceup">

                                            </div>




                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder="Qualification" id="qualification"required name="qualification" class="form-control">

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder=" Designation " id="Designation" required name="Designation" class="form-control">

                                            </div>
                                            
                                        </div>-->
                                        <div class="row">

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Join Date</label>
                                                <input type="date" id="datetimepicker3" name="joinDate" required placeholder="Join Date" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>In Time</label>
                                                <input type="time" placeholder=" In Time " required="" id="intime" name="intime" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Out Time</label>
                                                <input type="time" placeholder="Out Time " required id="outtime" name="outtime" class="form-control ">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Select Branch</label>
                                                <select class="form-control" required="" id="Branch" name="Branch" >
                                                    <option >Select Branch</option>
                                                    <%                                                    AdminDao ad = new AdminDao();
                                                        List<Admin> b = null;
                                                        b = ad.getAllAdmin();
                                                        if (b != null && b.size() > 0) {
                                                            for (Admin p : b) {
                                                                if (p.getAdminId() == 1) {

                                                    %>
                                                    <option value="<%=p.getAdminId()%>">Main Branch</option>


                                                    <%

                                                    } else {
                                                    %>
                                                    <option value="<%=p.getAdminId()%>"><%=p.getAdminOfBranch().getBranchName()%></option>
                                                    <%}
                                                            }
                                                        }%>
                                                </select>        </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                <textarea id="textarea" required="required" name="addree" placeholder="Address" class="form-control col-md-7 col-xs-12"></textarea>
                                            </div>
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                <textarea id="textarea" required="required" name="paddree" placeholder="Permanent Address" class="form-control col-md-7 col-xs-12"></textarea>
                                            </div>
                                        </div>
                                                
                                                  <div class="x_title">
                                        <h2>Add Bank Details<small> </small></h2>
                                        <div class="clearfix"></div>
                                    </div>
                                                 <div class="row">
                                             <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder=" Bank Name " onkeypress="return alpha(event)" id="bankName" name="bankName" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder="Branch Name" id="branchName" name="branchName" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="accNo" name="accNo" placeholder="Account Number" class="form-control">
                                            </div>
                                                       <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder=" Ifsc Code " id="ifscCode" name="ifscCode" class="form-control">
                                            </div>
                                        </div>
                                                 <div class="row">
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder="PAN Number" id="panNo" name="panNo" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="aadharNo" name="aadharNo" maxlength="12" placeholder="Aadhar Number" class="form-control">
                                            </div>
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                <textarea id="bankAddrss" required="required" name="bankAddrss" placeholder="Bank Address" class="form-control col-md-7 col-xs-12"></textarea>
                                           
                                            </div>
                                            
                                        </div>
                                       
                                        <div class="ln_solid"></div>

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



<!--        <script type="text/javascript">
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






        </script>-->
        <script type="text/javascript">

            function alpha(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;
                return ((k > 64 && k < 91) || (k > 96 && k < 123));
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