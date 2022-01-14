  


<%@page import="com.accede.angel.admin.model.Admission"%>
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
<html lang="en">
    <%@ include file = "../comman_files/BranchReceptionHeader.jsp" %>

    <link href="New/fSelect.css" rel="stylesheet" type="text/css"/>



    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@ include file = "../comman_files/StudentSideBar.jsp" %>


                <!-- top navigation -->
                <%@ include file = "../comman_files/StudentTopBar.jsp" %>
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
                                        Admission p = cd.getAdmissionByAccount(CustomerAccount);
                                        String days = Integer.toString(p.getPackageCourse().getNoofdays());
                                        String courses = Integer.toString(p.getPackageCourse().getNoofcourse());
                                        String PaymentMode = Integer.toString(p.getPackageCourse().getPaymentMode());
                                        String CourseDuration = Integer.toString(p.getPackageCourse().getCourseDuration());
                                        String fee = Integer.toString(p.getPackageCourse().getFee());
                                        String packagename = "Package Fee=" + fee + "Rs, Days=" + days + " ,No of Course=" + courses + ", Payment Mode=" + PaymentMode + " Month" + ", Course Duration=" + CourseDuration + " Days";
                                        String Coursefee = "Package Fee=" + fee;
                                    %>
                                    <form class="form-horizontal form-label-left input_mask" action="../../StudentAdmissionUpdateServlet" id="StudentAdmissionForm" data-parsley-vdalidate>
                                        <input type="hidden" id="customerAccountid" name="customerAccountid" value="<%=id%>">
                                        <div class="row">
                                            <div class="col-md-8 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="fname" name="fname" value="<%=p.getFirstName()%> " onkeypress="return alpha(event)" placeholder="First Name" class="form-control">

                                            </div>




                                            <!--                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                                                <input type="text" id="lname" name="lname" onkeypress="return alpha(event)" placeholder="Last Name" class="form-control">
                                            
                                                                                            </div>-->
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <input type="text" class="form-control priceup row0" readonly="" value="Admission Fee-100"  id="adfee" name="adfee" placeholder="Enter Fee" required>
                                                <input type="hidden" class="form-control priceup row0" value="100"  id="AdmissionFee" name="AdmissionFee" placeholder="Enter Fee" required>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <input type="text" id="contact" readonly="" value="<%=CustomerAccount.getMobileNo()%>" name="contact" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <input type="email" id="email" name="email" value="<%=CustomerAccount.getEmail()%>" placeholder="Email" class="form-control">
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
                                              
                                                 <input type="email" id="email" name="email" value="<%=p.getPackageCourse().getPackagename() %>" placeholder="Email" class="form-control">
                                        
                                            
                                            </div>
                                            <div id="fetchpackage">
                                                <div class="col-md-8 col-sm-12 col-xs-12 form-group">
                                                    <input type="text" id="email" value="<%=packagename%>" readonly="" name="email" placeholder="Package Description" class="form-control">
                                                </div>

                                            </div>

                                        </div>
                                        <div id="FetchAmount" >


                                            <div class="row">

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group Days" >





                                                    <p><strong>   Select Days:</strong></p>
                                                      <input type="email" id="email" name="email" value="<%=p.getDaysInWeek()%>" placeholder="Email" class="form-control">
                                        
                                                  

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group Courses">





                                                    <p><strong>   Select Course:-</strong></p>
                                                      <input type="email" id="email" name="email" value="<%=p.getCourseName() %>" placeholder="Email" class="form-control">
                                        
                                           
                                                </div>


                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group BatchTime">




                                                    <p><strong>   Select Batch Times:-</strong></p>
 <input type="email" id="email" name="email" value="<%=p.getBatchTimings()%>" placeholder="Email" class="form-control">
                                        
                                                </div>
                                            </div>
                                            <div class="row" id="fetchamountFee">
                                                <input type="hidden" id="coursefee" value="<%=p.getPackageCourse().getFee()%>">
                                                <input type="hidden" id="noofday" value="<%=p.getPackageCourse().getNoofdays()%>">
                                                <input type="hidden" id="noofcours" value="<%=p.getPackageCourse().getNoofcourse()%>">
                                                <input type="hidden" id="noofBatchTimes" value="<%=p.getPackageCourse().getNoofBatchTimes()%>">
                                                <input type="hidden" id="noofcourseselect" name="noofcourseselect" value="<%=p.getNoofcourseselect()%>">
                                                <input type="hidden" id="noofDaysselect" name="noofDaysselect" value="<%=p.getNoofDaysselect()%>">
                                                <input type="hidden" id="noofBatchTimeselect" name="noofBatchTimeselect" value="<%=p.getNoofBatchTimeselect()%>">



                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group " >
                                                    <p><strong>   Package Fee:</strong></p>
                                                    <input value="<%=p.getPackageCourse().getFee()%>" readonly="" type="text" id="fee" name="fee" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group" >
                                                    <div class="col-md-6 col-sm-12 col-xs-12 form-group" style="padding:0px">
                                                        <p><strong>   Discount in %:</strong></p>
                                                        <input value="<%=p.getDiscper()%>"  type="text" id="discper" name="discper" maxlength="10" placeholder="Discount in Per." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12 col-xs-12 form-group"  style="padding:0px">
                                                        <p><strong>   Disc in Amt:</strong></p>
                                                        <input value="<%=p.getDisamount()%>"  type="text" id="discamt" name="discamt" maxlength="10" placeholder="Discount in Amount" class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                    </div>
                                                </div>


                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p><strong>   Final Amt:</strong></p>
                                                    <input value="<%=p.getPackageCourse().getFee() - p.getDisamount()%>" type="text" readonly="" id="FinalAmount" name="FinalAmount" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                </div>


                                            </div>

                                        </div>

                                        <div class="ln_solid"></div>

                                        <div class="form-group">
<!--                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3" >

                                                <button type="button" class="btn btn-primary">Cancel</button>
                                                <button class="btn btn-primary" type="reset">Reset</button>
                                                <button type="submit" id="StdAdmbtn" class="btn btn-success">Submit</button>
                                            </div>-->
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
        <script src="New/fSelect.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- jQuery Smart Wizard -->

        <script src="../build/js/custom.min.js"></script>
        <link href="../src/js/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../src/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>





        <script>
                                                        (function($) {
                                                            $(function() {
                                                                $('.multi-select-dd').fSelect();
                                                                $('.multi-select-dd1').fSelect();
                                                                $('.multi-select-dd2').fSelect();

                                                            });
                                                        })(jQuery);
        </script>


        <script type="text/javascript">
            $(document).ready(
                    function()
                    {
                        $("#fname").change(validate.controls.fname);
//                                                                         

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
                                                else if ($input.val().length > 30)
                                                {
                                                    $input.formError("Name cannot be greater than 30 characters long");
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
                                                var Package = $('#Package').val();

                                                var isValid = true;

                                                if (Package === "")
                                                {
                                                    $("#Package").formError("Please Select Package");
                                                    isValid = false;
                                                }

                                                else
                                                {
                                                    // Valid, remove any existing form error message for this input
                                                    $("#Package").formError({remove: true});
                                                }

                                                return isValid;
                                            },
//                                                                                     
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
                                            }


                                };

                        return {
                            "all": all,
                            "controls": controls};
                    })();






        </script>


        <script type="text/javascript">
            $('#document').ready(function() {

 
                $('#Package').change(function() {
                    var isValid = true;
                    var Package = $('#Package').val();
                    var discamt = $('#discamt').val();
                    var customerAccountid = $('#customerAccountid').val();
                    var discper = $('#discper').val();
                    if (Package != "")
                    {
                        $("#Package").formError({remove: true});

                        $.get("AjaxPages/FetchPackage.jsp", {Package: Package}, function(data) {
                            //   alert('sucess');
                            $('#fetchpackage').html(data);

                            $.get("AjaxPages/FetchAmountForUpdate.jsp", {Package: Package, discper: discper, discamt: discamt, customerAccountid: customerAccountid}, function(data) {
                                //   alert('sucess');
                                $('#FetchAmount').html(data);
                            });
                        });
                    } else {


                        $("#Package").formError("Select Package");
                        isValid = false;


                    }
                    return isValid;
                });

                $('#discper').on('keyup change', function() {


                    var discper = $('#discper').val();


                    var isValid = true;
                    if (discper == "")
                    {
                        discper = 0;
                        $("#discper").formError("Enter Correct Discount Percentage ");
                        isValid = false;
                    }
                    else {

                        $("#discper").formError({remove: true});
                        var coursefee = $('#coursefee').val();



                        var FinalAmount = $('#FinalAmount').val();

                        FinalAmount = parseInt(coursefee) - (parseInt(coursefee) * parseInt(discper) / 100);


                        $('#discamt').val(parseInt(parseInt(coursefee) * parseInt(discper) / 100));
                        $('#FinalAmount').val(parseInt(FinalAmount));


                    }
                    return isValid;

                });
                $('#discamt').on('keyup change', function() {
                    var discamt = $('#discamt').val();
                    var isValid = true;
                    if (discamt == "")
                    {
                        discamt = 0;
                        $("#discamt").formError("Enter Correct Discount Amount ");
                        isValid = false;
                    }
                    else
                    {
                        $("#discamt").formError({remove: true});
                        var coursefee = $('#coursefee').val();



                        var FinalAmount = $('#FinalAmount').val();
                        var disper = (discamt / coursefee) * 100;
                        FinalAmount = parseInt(coursefee) - (parseInt(discamt));

                        $('#discper').val(parseInt(disper));
                        $('#FinalAmount').val(parseInt(FinalAmount));

                    }
                    return isValid;
                });
                $('#Courses').change(function() {


                    var noofcourseselect = $(this).val().length;
                    var noofcours = $('#noofcours').val();
                    var isValid = true;

                    noofcourseselect = parseInt(noofcourseselect);
                    if (noofcourseselect != noofcours)
                    {


                        $("#Courses").formError("Select Only " + noofcours + " Course");
                        isValid = false;


                        $('#noofcourseselect').val(parseInt(noofcourseselect));



                    } else
                    {
                        // Valid, remove any existing form error message for this input
                        $("#Courses").formError({remove: true});
                        $('#noofcourseselect').val(parseInt(noofcourseselect));
                    }


                });


                $('#BatchTime').change(function() {


                    var noofBatchTimeselect = $(this).val().length;
                    var noofBatchTimes = $('#noofBatchTimes').val();
                    var isValid = true;

                    noofBatchTimeselect = parseInt(noofBatchTimeselect);
                    if (noofBatchTimeselect != noofBatchTimes)
                    {

                        $(".BatchTime").formError("Select Only " + noofBatchTimes + " Batch Time");
                        isValid = false;


                        $('#noofBatchTimeselect').val(parseInt(noofBatchTimeselect));



                    } else
                    {
                        // Valid, remove any existing form error message for this input
                        $(".BatchTime").formError({remove: true});
                        $('#noofBatchTimeselect').val(parseInt(noofBatchTimeselect));
                    }

                    return isValid;
                });

                $('#Days').change(function() {


                    var noofDaysselect = $(this).val().length;
                    var noofday = $('#noofday').val();
                    var isValid = true;

                    noofDaysselect = parseInt(noofDaysselect);
                    if (noofDaysselect != noofday)
                    {

                        $(".Days").formError("Select Only " + noofday + " Days");
                        isValid = false;


                        $('#noofDaysselect').val(parseInt(noofDaysselect));



                    } else
                    {
                        // Valid, remove any existing form error message for this input
                        $(".Days").formError({remove: true});
                        $('#noofDaysselect').val(parseInt(noofDaysselect));
                    }

                    return isValid;
                });



            });




        </script> 



        <%@ include file = "JavaScriptFile.jsp" %>
    </body>
</html>