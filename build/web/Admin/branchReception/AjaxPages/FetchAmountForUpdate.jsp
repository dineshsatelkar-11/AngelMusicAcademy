



<%@page import="com.accede.angel.admin.dao.CourseDao"%>
<%@page import="com.accede.angel.admin.dao.BatchTimeDa0"%>
<%@page import="com.accede.angel.admin.model.BatchTime"%>
<%@page import="com.accede.angel.admin.model.Course"%>
<%@page import="com.accede.angel.admin.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.accede.angel.admin.model.Admission"%>
<%@page import="com.accede.angel.admin.model.CustomerAccount"%>
<%@page import="com.accede.angel.admin.dao.CustomerAccountDao"%>
<%@page import="com.accede.angel.admin.dao.AdmissionDao"%>
<%@page import="com.accede.angel.admin.dao.PackageDao"%>
<%@page import="com.accede.angel.admin.model.Admin"%>
<%@page import="com.accede.angel.admin.model.PackageCourse"%>
<%
    int id = Integer.parseInt(request.getParameter("Package"));
   
    PackageCourse PackageCourse = new PackageDao().getPackageCourseByID(id);
     Admin asq = (Admin) session.getAttribute("BRANCH_ADMIN");
    int q = asq.getAdminId();

    AdmissionDao cd = new AdmissionDao();
    int idd = Integer.parseInt(request.getParameter("customerAccountid"));
    CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
    CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(idd);
    Admission p = cd.getAdmissionByAccount(CustomerAccount);

%>



                                            <div class="row">

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group Days" >





                                                    <p><strong>   Select Days:</strong></p>
                                                    <select id="Days" name="Days" class="multi-select-dd " style="font-size:16px" multiple="multiple">

                                                        <%                                  List<String> Days = new UserDao().initDaysList();
                                                            String Daysinweek = p.getDaysInWeek();
                                                            for (String b : Days) {
                                                                if (Daysinweek.contains(b)) {
                                                        %>
                                                        <option selected="selected" value="<%=b.toString()%>" ><%=b.toString()%></option>
                                                        <%} else {%>
                                                        <option value="<%=b.toString()%>" ><%=b.toString()%></option>
                                                        <%   }
                                                            }

                                                        %>


                                                    </select>

                                                </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group Courses">





                                                    <p><strong>   Select Course:-</strong></p>
                                                    <select id="Courses" name="Courses" class="multi-select-dd1 form-control" multiple="multiple">
                                                        <%                                                                                List<Course> cs1 = new CourseDao().getAllCourse();

                                                            String Coursess = p.getCourseName();
                                                            for (Course c : cs1) {
                                                                if (Coursess.contains(c.getCourseName())) {
                                                        %>

                                                        <option  selected="selected" value="<%=c.getCourseName()%>" ><%=c.getCourseName()%></option>
                                                        <%} else {%>
                                                        <option value="<%=c.getCourseName()%>" ><%=c.getCourseName()%></option>

                                                        <%                                                                               }
                                                            }
                                                        %>
                                                    </select>
                                                </div>


                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group BatchTime">




                                                    <p><strong>   Select Batch Times:-</strong></p>

                                                    <select id="BatchTime" name="BatchTime" class="multi-select-dd2 form-control" multiple="multiple">
                                                        <%                               List<BatchTime> batch = new BatchTimeDa0().getAllBatchTime();
                                                            String BatchTiming = p.getBatchTimings();
                                                            for (BatchTime b : batch) {
                                                                if (b.getAdminOfBranch().getAdminId() == asq.getAdminId()) {

                                                                    if (BatchTiming.contains(b.getBatchTiming())) {
                                                        %>
                                                        <option selected="selected" value="<%=b.getBatchTiming()%>" ><%=b.getBatchTiming()%></option>

                                                        <%} else {%>
                                                        <option value="<%=b.getBatchTiming()%>" ><%=b.getBatchTiming()%></option>

                                                        <%                                                                               }
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row" id="fetchamountFee">
                                                <input type="hidden" id="coursefee" value="<%=PackageCourse.getFee()%>">
                                                <input type="hidden" id="noofday" value="<%=PackageCourse.getNoofdays()%>">
                                                <input type="hidden" id="noofcours" value="<%=PackageCourse.getNoofcourse()%>">
                                                <input type="hidden" id="noofBatchTimes" value="<%=PackageCourse.getNoofBatchTimes()%>">
                                                <input type="hidden" id="noofcourseselect" name="noofcourseselect" value="<%=p.getNoofcourseselect()%>">
                                                <input type="hidden" id="noofDaysselect" name="noofDaysselect" value="<%=p.getNoofDaysselect()%>">
                                                <input type="hidden" id="noofBatchTimeselect" name="noofBatchTimeselect" value="<%=p.getNoofBatchTimeselect()%>">



                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group " >
                                                    <p><strong>   Package Fee:</strong></p>
                                                    <input value="<%=PackageCourse.getFee()%>" readonly="" type="text" id="fee" name="fee" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>

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
                                                    <input value="<%=PackageCourse.getFee() - p.getDisamount()%>" type="text" readonly="" id="FinalAmount" name="FinalAmount" maxlength="10" placeholder="Contact No." class="form-control" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
                                                </div>


                                            </div>
                                                
                                                
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
            $('#document').ready(function() {


 $('#Package').change(function() {

                                                                        var Package = $('#Package').val();
                                                                        var discamt = $('#discamt').val();
                                                                        var customerAccountid = $('#customerAccountid').val();
                                                                        var discper = $('#discper').val();
                                                                        if (Package != "")
                                                                        {
                                                                            $.get("AjaxPages/FetchPackage.jsp", {Package: Package}, function(data) {
                                                                                //   alert('sucess');
                                                                                $('#fetchpackage').html(data);

                                                                                $.get("AjaxPages/FetchAmountForUpdate.jsp", {Package: Package, discper: discper , discamt:discamt , customerAccountid:customerAccountid}, function(data) {
                                                                                    //   alert('sucess');
                                                                                    $('#FetchAmount').html(data);
                                                                                });
                                                                            });
                                                                        }
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
                        FinalAmount = parseInt(coursefee) - (parseInt(discamt)) ;
                      
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
                    if (noofcourseselect > noofcours)
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
                    if (noofBatchTimeselect > noofBatchTimes)
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
                    if (noofDaysselect > noofday)
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