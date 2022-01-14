<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
<%@page import="com.accede.angel.admin.model.Employee"%>
<%@page import="com.accede.angel.admin.dao.EmployeeDao"%>
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

                                    <%        
                                    
                                    String Eid1 = request.getParameter("asd");
                                    long Eid = Long.parseLong(Eid1);
                                        int j = 0;
                                        int i = 0;
                                        EmployeeDao bd = new EmployeeDao();
                                        Employee p = bd.getEmployeeByID(Eid);


                                    %>
                                    <form class="form-horizontal form-label-left input_mask" action="../../UpdateEmployeeDetails" id="EmployeeReg" data-parsley-vdalidate>
                                        <div class="row">
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="name" name="name" value="<%=p.getName()%>"  onkeypress="return alpha(event)" required="" placeholder=" Name" class="form-control">
                                                <input type="hidden" id="Modal_Employee_Id" name="Modal_Employee_Id" value="<%=p.getId()%>"  onkeypress="return alpha(event)" required="" placeholder=" Name" class="form-control">

                                            </div>



                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="email" placeholder="Email" value="<%=p.getEmail()%>" id="email" name="email" class="form-control">

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="mobile" name="mobile" value="<%=p.getMobileNo()%>" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required placeholder="Mobile No" class="form-control">

                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder=" Alternate No" value="<%=p.getAlternateNo()%>" onkeypress='return event.charCode >= 48 && event.charCode <= 57' id="alternateNo" required name="alternateNo" class="form-control priceup">
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="hidden" placeholder="Permanent No" value="<%=p.getPermanentNo()%>"  onkeypress='return event.charCode >= 48 && event.charCode <= 57' id="PermanentNo" required name="PermanentNo" class="form-control priceup">
                                                <select class="form-control" required="" id="Working" name="Working" >
                                                    <option value="">Select Working Type</option>
                                                    <%if (p.getWorkingType().equals("Full")) {
                                                    %>
                                                    <option selected="selected" value="Full">Full Time</option>
                                                    <option value="Part">Part Time</option>
                                                    <%} else if (p.getWorkingType().equals("Part")) {%> 
                                                    <option  value="Full">Full Time</option>
                                                    <option selected="selected" value="Part">Part Time</option>
                                                    <%} else {%>

                                                    <option  value="Full">Full Time</option>
                                                    <option value="Part">Part Time</option>
                                                    <%}%>

                                                </select>
                                            </div>




                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" value="<%=p.getQualification()%>" placeholder="Qualification" id="qualification" required name="qualification" class="form-control">

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" value="<%=p.getDesignation()%>" placeholder=" Designation " id="Designation" required name="Designation" class="form-control">

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" value="<%=p.getSalary()%>" placeholder="salary" onkeypress='return event.charCode >= 48 && event.charCode <= 57' id="salary" name="salary" required class="form-control priceup">
                                            </div>
                                        </div>


                                        <div class="row">

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Join Date</label>
                                                <input type="text" readonly="" value="<%=p.getJoiningDate()%>" id="datetimepicker3" name="joinDate" required placeholder="Join Date" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>In Time</label>
                                                <input type="time" placeholder=" In Time " value="<%=p.getIntime()%>" required="" id="intime" name="intime" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Out Time</label>
                                                <input type="time" placeholder="Out Time " value="<%=p.getOuttime()%>" required id="outtime" name="outtime" class="form-control ">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Select Branch</label>
                                                <select class="form-control" required="" id="Branch" name="Branch" >
                                                    <option value="">Select Branch</option>
                                                    <%
                                                        AdminDao ad = new AdminDao();
                                                        List<Admin> b = null;
                                                        b = ad.getAllAdmin();
                                                        if (b != null && b.size() > 0) {
                                                            for (Admin p1 : b) {
                                                                if (p1.getAdminId() == 1) {
                                                                    if (p.getAdmin().getAdminId() == p1.getAdminId()) {
                                                    %>
                                                    <option selected="selected" value="<%=p1.getAdminId()%>">Main Branch</option>
                                                    <%} else {%>
                                                    <option  value="<%=p1.getAdminId()%>">Main Branch</option>

                                                    <%}

                                                    } else {
                                                        if (p.getAdmin().getAdminId() == p1.getAdminId()) {
                                                    %>



                                                    <option selected="selected" value="<%=p1.getAdminId()%>"><%=p1.getAdminOfBranch().getBranchName()%></option>

                                                    <%} else {%>
                                                    <option value="<%=p1.getAdminId()%>"><%=p1.getAdminOfBranch().getBranchName()%></option>
                                                    <%}
                                                                }
                                                            }
                                                        }%>
                                                </select>        </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                <input id="addree" value="<%=p.getAddress()%>" required="required" name="addree" placeholder="Address" class="form-control col-md-7 col-xs-12">
                                            </div>
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                <input id="paddree" value="<%=p.getPermanentAddress()%>" required="required" name="paddree" placeholder="Permanent Address" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>


                                        <div class="x_title">
                                            <h2>Add Bank Details<small> </small></h2>
                                            <div class="clearfix"></div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" value="<%=p.getBankDetailId().getBankName()%>" placeholder=" Bank Name " onkeypress="return alpha(event)" required id="bankName" name="bankName" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" value="<%=p.getBankDetailId().getBranchName()%>" placeholder="Branch Name" id="branchName" required name="branchName" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="accNo" value="<%=p.getBankDetailId().getBankAccountNo()%>" name="accNo"  onkeypress='return event.charCode >= 48 && event.charCode <= 57' placeholder="Account Number" required class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder=" Ifsc Code " value="<%=p.getBankDetailId().getIfscCode()%>" id="ifscCode" name="ifscCode"  required class="form-control">
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" placeholder="PAN Number" value="<%=p.getBankDetailId().getPanNumber()%>" id="panNo" name="panNo" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="aadharNo" name="aadharNo" value="<%=p.getBankDetailId().getAadharNo()%>" onkeypress='return event.charCode >= 48 && event.charCode <= 57' maxlength="12" placeholder="Aadhar Number" class="form-control">
                                            </div>
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="bankAddrss" required="required" value="<%=p.getBankDetailId().getBankAddress()%>" name="bankAddrss" placeholder="Bank Address" class="form-control col-md-7 col-xs-12">

                                            </div>

                                        </div>

                                        <div class="ln_solid"></div>

                                        <div class="form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3" >

                                                <button type="button" class="btn btn-primary">Cancel</button>
                                                <button class="btn btn-primary" type="reset">Reset</button>
                                                <button type="submit" id="EMpSub" class="btn btn-success">Submit</button>
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
                                                                $("#name").change(validateforemp.controls.name);
//                                                                        
                                                                $("#mobile").change(validateforemp.controls.mobile);
                                                                $("#email").change(validateforemp.controls.email);
                                                                $("#alternateNo").change(validateforemp.controls.alternateNo);

                                                                $("#qualification").change(validateforemp.controls.qualification);
                                                                $("#Designation").change(validateforemp.controls.Designation);

                                                                $("#salary").change(validateforemp.controls.salary);
//                                                                $("#joinDate").change(validateforemp.controls.joinDate);
//                                                                $("#intime").change(validateforemp.controls.intime);
//                                                                $("#outtime").change(validateforemp.controls.outtime);
                                                                $("#Branch").change(validateforemp.controls.Branch);
                                                                $("#addree").change(validateforemp.controls.addree);
                                                                $("#paddree").change(validateforemp.controls.paddree);
                                                                $("#bankName").change(validateforemp.controls.bankName);
                                                                $("#branchName").change(validateforemp.controls.branchName);
                                                                $("#ifscCode").change(validateforemp.controls.ifscCode);
                                                                $("#panNo").change(validateforemp.controls.panNo);
                                                                $("#aadharNo").change(validateforemp.controls.aadharNo);
                                                                $("#bankAddrss").change(validateforemp.controls.bankAddrss);
                                                                $("#EMpSub").click(
                                                                        function(event)
                                                                        {

                                                                            event.preventDefault();

                                                                            if (validateforemp.all())
                                                                            {



                                                                                document.getElementById("EmployeeReg").submit();

                                                                            }
                                                                        });
                                                            });

                                                    var validateforemp =
                                                            (function()
                                                            {
                                                                var _regex =
                                                                        {
                                                                            emailAddressIsValid:
                                                                                    function(emailAddress)
                                                                                    {
                                                                                        // http://stackoverflow.com/questions/2855865/jquery-validateforemp-e-mail-address-regex
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
                                                                            for (var controlValidationMethod in validateforemp.controls)
                                                                            {


                                                                                if (!validateforemp.controls[controlValidationMethod].call($("#" + controlValidationMethod)))
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
                                                                            name:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a Name");
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
                                                                            mobile:
                                                                                    function()
                                                                                    {
                                                                                        var $input = $(this);
                                                                                        var isValid = true;
                                                                                        var s = $input.val();
                                                                                        if ($input.val() === "")
                                                                                        {
                                                                                            $input.formError("Please Enter a Contact Number");
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
                                                                            alternateNo:
                                                                                    function()
                                                                                    {
                                                                                        var $input = $(this);
                                                                                        var isValid = true;
                                                                                        var s = $input.val();
                                                                                        if ($input.val() === "")
                                                                                        {
                                                                                            $input.formError("Please Enter a Alternate No: Number");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 10)
                                                                                        {
                                                                                            $input.formError("Alternate Number cannot be greater than 10 Digit");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if (s[0] != 6 && s[0] != 7 && s[0] != 8 && s[0] != 9)
                                                                                        {




                                                                                            $input.formError("Alternate No Start From 6, 7, 8, 9");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            qualification:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a  Qualification");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 50)
                                                                                        {
                                                                                            $input.formError("Qualification cannot be greater than 50 characters long");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            Designation:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a Designation");
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
                                                                            Branch:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Select   Branch");
                                                                                            isValid = false;
                                                                                        }

                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            addree:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a Addreess");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 100)
                                                                                        {
                                                                                            $input.formError("Addreess cannot be greater than 50 characters long");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            paddree:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a Permanent Address");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 100)
                                                                                        {
                                                                                            $input.formError("Permanent Address cannot be greater than 50 characters long");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            bankName:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a  Bank Name");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 50)
                                                                                        {
                                                                                            $input.formError("Bank Name cannot be greater than 50 characters long");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            branchName:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a Branch Name");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 50)
                                                                                        {
                                                                                            $input.formError("Branch Name cannot be greater than 50 characters long");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            ifscCode:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a IFSC Code");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 50)
                                                                                        {
                                                                                            $input.formError("IFSC Code cannot be greater than 50 characters long");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            panNo:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a Pan No");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 50)
                                                                                        {
                                                                                            $input.formError("Pan No cannot be greater than 50 characters long");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            aadharNo:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a Aadhar No");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 50)
                                                                                        {
                                                                                            $input.formError("Aadhar No cannot be greater than 50 characters long");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            bankAddrss:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;

                                                                                        if ($input.val() === "" || $input.val() == undefined)
                                                                                        {

                                                                                            $input.formError("Please Enter a Bank Addrss");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val().length > 50)
                                                                                        {
                                                                                            $input.formError("Bank Addrss cannot be greater than 50 characters long");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // Valid, remove any existing form error message for this input
                                                                                            $input.formError({remove: true});
                                                                                        }

                                                                                        return isValid;
                                                                                    },
                                                                            salary:
                                                                                    function()
                                                                                    {

                                                                                        var $input = $(this);
                                                                                        var isValid = true;


                                                                                        if ($input.val() === "")
                                                                                        {
                                                                                            $input.formError("Please Enter a Salary");
                                                                                            isValid = false;
                                                                                        }
                                                                                        else if ($input.val() == 0)
                                                                                        {

                                                                                            $input.formError("Enetr Salary Amount");
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
        <script type="text/javascript">

            function alpha(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;
                return ((k > 64 && k < 91) || (k > 96 && k < 123) || k = 32);
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